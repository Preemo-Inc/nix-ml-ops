topLevel@{ flake-parts-lib, inputs, lib, ... }: {
  imports = [
    ./runtime.nix
    ./nixpkgs.nix
    ./overridable-package.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];

  options.flake = lib.mkOption {
    type = lib.types.submoduleWith {
      modules = [{
        options = {
          lib.findKubernetesPackages = lib.mkOption {
            type = lib.types.functionTo (lib.types.attrsOf lib.types.package);
            default = lib.attrsets.concatMapAttrs
              (runtimeName: runtime:
                lib.attrsets.concatMapAttrs
                  (launcherName: launcher:
                    lib.attrsets.concatMapAttrs
                      (packageName: package:
                        if package.type or null == "derivation" then {
                          "${runtimeName}-${launcherName}-${packageName}" =
                            package;
                        } else if (package.overridden-package or { }).type or null == "derivation" then {
                          "${runtimeName}-${launcherName}-${packageName}" =
                            package.overridden-package;
                        } else { }
                      )
                      launcher.kubernetes or { }
                  )
                  runtime.launchers
              );
          };

          lib.pathToKubernetesName = lib.mkOption {
            type = lib.types.functionTo lib.types.string;
            default = path: lib.trivial.pipe path [
              (builtins.split "/")
              (builtins.filter (s: builtins.isString s && s != ""))
              (builtins.concatStringsSep "-")
            ];
          };
        };

        config.flakeModules.kubernetes = {
          imports = [
            topLevel.config.flake.flakeModules.overridablePackage
            topLevel.config.flake.flakeModules.runtime
            topLevel.config.flake.flakeModules.nixpkgs
          ];
          options.perSystem = flake-parts-lib.mkPerSystemOption (
            perSystem@{ pkgs, system, ... }: {
              ml-ops.runtime = runtime: {
                config.launcher = launcher: {
                  options.kubernetes = lib.mkOption {
                    type = lib.types.submoduleWith {
                      modules = [
                        (kubernetes:
                          let
                            hostPath =
                              "${
                                kubernetes.config.imageRegistry.host
                              }${
                                if kubernetes.config.imageRegistry.path != null
                                then "/${kubernetes.config.imageRegistry.path}"
                                else ""
                              }";
                          in
                          {
                            # TODO: support namespace
                            # namespace = lib.mkOption {
                            #   default = "default";
                            # };}
                            options.imageRegistry.host = lib.mkOption {
                              type = lib.types.str;
                              default = "registry.hub.docker.com";
                            };
                            options.imageRegistry.path = lib.mkOption {
                              type = lib.types.nullOr lib.types.str;
                              default = null;
                            };
                            options.volumeMounts = lib.mkOption {
                              type = lib.types.listOf (lib.types.attrsOf lib.types.anything);
                            };
                            config.volumeMounts = builtins.concatMap
                              (lib.attrsets.mapAttrsToList
                                (mountPath: protocolConfig: {
                                  inherit mountPath;
                                  name = topLevel.config.flake.lib.pathToKubernetesName mountPath;
                                })
                              )
                              (builtins.attrValues runtime.config.volumeMounts or { });

                            options.volumes = lib.mkOption {
                              type = lib.types.listOf (lib.types.attrsOf lib.types.anything);
                            };
                            config.volumes = builtins.concatMap
                              (lib.attrsets.mapAttrsToList
                                (mountPath: protocolConfig:
                                  protocolConfig.kubernetesVolume // {
                                    name = topLevel.config.flake.lib.pathToKubernetesName mountPath;
                                  }
                                )
                              )
                              (builtins.attrValues runtime.config.volumeMounts or { });
                            options.containers = lib.mkOption {
                              default = { };
                              type = (lib.types.attrsOf (lib.types.submoduleWith {
                                modules = [
                                  {
                                    options.manifest = lib.mkOption {
                                      default = { };
                                      type = lib.types.deferredModule;
                                    };
                                  }
                                ];
                              })) // {
                                deprecationMessage = ''
                                  Use `ml-ops.services.<name>.launchers.<name>.kubernetes.helmTemplates.deployment.spec.template.spec.containers` or  `ml-ops.jobs.<name>.launchers.<name>.kubernetes.helmTemplates.job.spec.template.spec.containers`  instead.
                                '';
                              };
                            };

                            options.containerManifest = lib.mkOption {
                              default = { };
                              type = lib.types.deferredModuleWith {
                                staticModules = [
                                  (container: {
                                    config._module.freeformType = lib.types.attrsOf lib.types.anything;
                                    options = {
                                      name = lib.mkOption {
                                        type = lib.types.str;
                                      };
                                      image = lib.mkOption { default = kubernetes.config.pushImage.overridden-package.remoteImage; };
                                      env = lib.mkOption {
                                        default = lib.attrsets.mapAttrsToList
                                          lib.attrsets.nameValuePair
                                          container.config._module.environmentVariables;
                                      };
                                      volumeMounts = lib.mkOption { default = kubernetes.config.volumeMounts; };
                                      _module.environmentVariables = lib.mkOption { default = launcher.config.environmentVariables; };
                                    };
                                  })
                                ];
                              };
                            };
                            options.pushImage = lib.mkOption {
                              default = { };
                              type = lib.types.submoduleWith {
                                modules = [
                                  {
                                    imports = [ perSystem.config.ml-ops.overridablePackage ];
                                    config.base-package = pkgs.runCommand "${runtime.config._module.args.name}-push-image.txt"
                                      {
                                        __impure = true;
                                        nativeBuildInputs = [
                                          pkgs.cacert
                                        ];
                                        HOME = ".";
                                        remoteImage =
                                          "${
                                            hostPath
                                          }/${
                                            runtime.config._module.args.name
                                          }-${
                                            launcher.config._module.args.name
                                          }:${
                                            builtins.replaceStrings ["+"] ["_"] runtime.config.version
                                          }";

                                        specification = perSystem.config.devenv.shells.${runtime.config.name}.containers.processes.derivation;
                                      }
                                      ''
                                        read -a skopeoCopyArgsArray <<< "$skopeoCopyArgs"
                                        ${lib.escapeShellArgs [
                                          "${pkgs.findutils}/bin/xargs"
                                          "${inputs.nix2container.packages.${system}.skopeo-nix2container}/bin/skopeo"
                                          "--insecure-policy"
                                          "copy"
                                        ]} "''${skopeoCopyArgsArray[@]}" "nix:$specification" "docker://$remoteImage" &&
                                        printf "%s" "$remoteImage" > "$out"
                                      '';
                                  }
                                ];
                              };
                            };

                            options.helmTemplates = lib.mkOption {
                              type = lib.types.submoduleWith {
                                modules = [
                                  {
                                    _module.freeformType = lib.types.attrsOf (lib.types.attrsOf lib.types.anything);
                                  }
                                ];
                              };
                              default = { };
                            };

                            options.helmChartYaml = lib.mkOption {
                              type = lib.types.attrsOf lib.types.anything;
                            };

                            config.helmChartYaml = {
                              apiVersion = "v2";
                              name = "${runtime.config._module.args.name}-${launcher.config._module.args.name}";
                              version = runtime.config.version;
                            };

                            options.helm-chart = lib.mkOption {
                              type = lib.types.package;
                              default =
                                pkgs.symlinkJoin {
                                  name = "helm-chart";
                                  paths = [
                                    (
                                      pkgs.writeTextDir
                                        "Chart.yaml"
                                        (builtins.toJSON kubernetes.config.helmChartYaml)
                                    )
                                  ] ++ (
                                    lib.mapAttrsToList
                                      (name: content: pkgs.writeTextDir
                                        "templates/${name}.yaml"
                                        (builtins.toJSON content))
                                      kubernetes.config.helmTemplates
                                  );
                                };
                            };

                            options.helmReleaseName = lib.mkOption {
                              default = "${runtime.config._module.args.name}-${launcher.config._module.args.name}";
                            };

                            options.helmUpgrade = lib.mkOption {
                              default = { };
                              type = lib.types.submoduleWith {
                                modules = [
                                  {
                                    imports = [ perSystem.config.ml-ops.overridablePackage ];
                                    config.base-package = pkgs.runCommand
                                      "${runtime.config._module.args.name}-helm-upgrade.txt"
                                      {
                                        __impure = true;

                                        nativeBuildInputs = [
                                          pkgs.cacert
                                          pkgs.kubernetes-helm
                                        ];
                                        HOME = ".";
                                        inherit (kubernetes.config) helmReleaseName;

                                        HELM_CHART = toString kubernetes.config.helm-chart;

                                        pushImage = kubernetes.config.pushImage.overridden-package;
                                      }
                                      ''
                                        helm upgrade --install --force "$helmReleaseName" "$HELM_CHART" &&
                                        printenv helmReleaseName > "$out"
                                      '';
                                  }
                                ];

                              };
                            };

                            options.helmDelete = lib.mkOption {
                              default = { };
                              type = lib.types.submoduleWith {
                                modules = [
                                  {
                                    imports = [ perSystem.config.ml-ops.overridablePackage ];
                                    config.base-package = pkgs.runCommand
                                      "${runtime.config._module.args.name}-helm-delete.txt"
                                      {
                                        __impure = true;

                                        nativeBuildInputs = [
                                          pkgs.cacert
                                          pkgs.kubernetes-helm
                                        ];
                                        HOME = ".";
                                        inherit (kubernetes.config)
                                          helmReleaseName
                                          helm-chart;
                                      }
                                      ''
                                        helm delete "$helmReleaseName" &&
                                        printenv helmReleaseName > "$out"
                                      '';
                                  }
                                ];
                              };
                            };
                          })
                      ];
                    };
                  };
                };
              };
            }
          );
        };
      }];
    };
  };
}
