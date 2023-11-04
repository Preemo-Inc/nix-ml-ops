topLevel@{ flake-parts-lib, inputs, ... }: {
  imports = [
    ./services.nix
    ./kubernetes.nix
    ./nixpkgs.nix
    ./devcontainer.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.kubernetesService = {
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
                                metadata.name = "${service.config._module.args.name}-${launcher.config._module.args.name}-${inputs.self.lastModifiedDate}-${builtins.substring 0 8 inputs.self.rev or "dirty"}";
                                spec.selector."app.kubernetes.io/name" = "${service.config._module.args.name}-${launcher.config._module.args.name}";
                                spec.type = "LoadBalancer";
                              };
                              deployment = {
                                apiVersion = "apps/v1";
                                kind = "Deployment";
                                metadata.name = "${service.config._module.args.name}-${launcher.config._module.args.name}";
                                spec.selector.matchLabels."app.kubernetes.io/name" =
                                  "${service.config._module.args.name}-${launcher.config._module.args.name}";
                                spec.template.metadata.labels."app.kubernetes.io/name" = "${service.config._module.args.name}-${launcher.config._module.args.name}";
                                spec.template.spec.volumes = kubernetes.config.volumes;
                              };
                            };
                        }
                        {
                          config.deployment.spec.template.spec.containers =
                            lib.mapAttrs
                              (containerName: container: {
                                imports = [ container.manifest ];
                                name = containerName;
                              })
                              kubernetes.config.containers;

                          options.deployment.spec.template.spec.containers = lib.mkOption {
                            type = lib.types.attrsOf (lib.types.submoduleWith {
                              modules = [
                                kubernetes.config.containerManifest
                              ];
                            });
                            apply = builtins.attrValues;
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
