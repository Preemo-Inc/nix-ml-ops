topLevel@{ flake-parts-lib, inputs, ... }: {
  imports = [
    ./services.nix
    ./kubernetes.nix
    ./nixpkgs.nix
    ./devcontainer.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.kubernetesService = flakeModule: {
    imports = [
      topLevel.config.flake.flakeModules.services
      topLevel.config.flake.flakeModules.kubernetes
      topLevel.config.flake.flakeModules.nixpkgs
      topLevel.config.flake.flakeModules.devcontainer
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption (perSystem@{ lib, pkgs, ... }: {
      ml-ops.service = service: {
        launcher = launcher: {
          options.kubernetes = lib.mkOption {
            type = lib.types.submoduleWith {
              modules = [
                (kubernetes: {
                  options.helmTemplates = lib.mkOption {
                    type = lib.types.submoduleWith {
                      modules = [
                        {
                          options = lib.attrsets.mapAttrsRecursive
                            (path: value: lib.mkOption { default = value; })
                            {
                              service = {
                                apiVersion = "v1";
                                kind = "Service";
                                spec.selector."app.kubernetes.io/name" = "${service.config._module.args.name}-${launcher.config._module.args.name}";
                                spec.type = "LoadBalancer";
                              };
                              deployment = {
                                apiVersion = "apps/v1";
                                kind = "Deployment";
                                spec.selector.matchLabels."app.kubernetes.io/name" =
                                  "${service.config._module.args.name}-${launcher.config._module.args.name}";
                                spec.template.metadata.labels."app.kubernetes.io/name" = "${service.config._module.args.name}-${launcher.config._module.args.name}";
                                spec.template.spec.volumes = kubernetes.config.volumes;
                              };
                            };
                        }
                        {
                          options.deployment.metadata.name = lib.mkOption {
                            default = "${service.config._module.args.name}-${launcher.config._module.args.name}";
                            defaultText = lib.literalExpression ''
                              "''${service.config._module.args.name}-''${launcher.config._module.args.name}"
                            '';
                          };
                          options.service.metadata.name = lib.mkOption {
                            default = "${service.config._module.args.name}-${launcher.config._module.args.name}-${flakeModule.self.lastModifiedDate}-${builtins.substring 0 8 flakeModule.self.rev or "dirty"}";
                            defaultText = lib.literalExpression ''
                              "''${service.config._module.args.name}-''${launcher.config._module.args.name}-''${flakeModule.self.lastModifiedDate}-''${builtins.substring 0 8 flakeModule.self.rev or "dirty"}"
                            '';
                          };

                          config.deployment.spec.template.spec.containers =
                            lib.mapAttrs
                              (containerName: container: container.manifest)
                              kubernetes.config.containers;

                          options.deployment.spec.template.spec.containers = lib.mkOption {
                            type = lib.types.attrsOf (lib.types.submoduleWith {
                              modules = [
                                kubernetes.config.containerManifest
                              ];
                            });
                            apply = lib.attrsets.mapAttrsToList (name: value:
                              value // {
                                inherit name;
                              }
                            );
                          };
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

      ml-ops.devcontainer.devenvShellModule = {
        packages = lib.mkAfter [
          pkgs.kubernetes-helm
        ];
      };

      packages =
        topLevel.config.flake.lib.findKubernetesPackages
          perSystem.config.ml-ops.services;
    });
  };
}
