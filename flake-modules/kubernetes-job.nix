topLevel@{ flake-parts-lib, inputs, ... }: {
  imports = [
    ./jobs.nix
    ./kubernetes.nix
    ./nixpkgs.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.kubernetesJob = {
    imports = [
      topLevel.config.flake.flakeModules.jobs
      topLevel.config.flake.flakeModules.kubernetes
      topLevel.config.flake.flakeModules.nixpkgs
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption (perSystem@{ lib, config, pkgs, system, ... }: {

      ml-ops.job = job: {
        launcher = launcher: {
          options.kubernetes = lib.mkOption {
            type = lib.types.submoduleWith {
              modules = [
                (
                  kubernetes: {
                    options.helmTemplates = lib.mkOption {
                      type = lib.types.submoduleWith {
                        modules = [
                          {
                            options.job = lib.attrsets.mapAttrsRecursive
                              (path: value: lib.mkOption { default = value; })
                              {
                                apiVersion = "batch/v1";
                                kind = "Job";
                                metadata.name = "${job.config._module.args.name}-${launcher.config._module.args.name}-${builtins.replaceStrings ["+"] ["-"] job.config.version}";
                                spec.backoffLimit = 0;
                                spec.template.metadata.labels."app.kubernetes.io/name" = "${job.config._module.args.name}-${launcher.config._module.args.name}";
                                spec.template.spec.restartPolicy = "Never";
                                spec.template.spec.volumes = kubernetes.config.volumes;
                              };
                          }
                          {
                            config.job.spec.template.spec.containers =
                              lib.mapAttrs
                                (containerName: container: container.manifest)
                                kubernetes.config.containers;
                            options.job.spec.template.spec.containers = lib.mkOption {
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
                  }
                )
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
          perSystem.config.ml-ops.jobs;

    });
  };
}
