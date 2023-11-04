topLevel@{ self, inputs, flake-parts-lib, ... }: {
  imports = [
    ./devcontainer.nix
    ./kubernetes.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.volumeMountEmptyDir = {
    imports = [
      topLevel.config.flake.flakeModules.devcontainer
      topLevel.config.flake.flakeModules.kubernetes
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption (perSystem@{ lib, config, pkgs, ... }: {
      ml-ops.common = {
        options.volumeMounts.emptyDir = lib.mkOption {
          default = { };
          type = lib.types.attrsOf (lib.types.submoduleWith {
            modules = [{
              options.medium = lib.mkOption {
                type = lib.types.nullOr (lib.types.enum [ "Memory" ]);
                default = null;
              };
            }];
          });
        };
      };

      ml-ops.runtime = {
        options.volumeMounts.emptyDir = lib.mkOption {
          type = lib.types.attrsOf (lib.types.submoduleWith {
            modules = [
              ({ config, ... }: {
                options.kubernetesVolume = lib.mkOption {
                  default = {
                    emptyDir = {
                      medium = config.medium;
                    };
                  };
                };
              })
            ];
          });
        };
      };
      ml-ops.devcontainer = {
        options.volumeMounts.emptyDir = lib.mkOption {
          type = lib.types.attrsOf (lib.types.submoduleWith {
            modules = [
              ({ config, ... }: {
                options.mountScript = lib.mkOption {
                  type = lib.types.lines;
                  default =
                    if config.medium == null then
                      lib.strings.escapeShellArgs [
                        "mkdir"
                        "-p"
                        config._module.args.name
                      ]
                    else if config.medium == "Memory" then
                      ''
                        ln -s -f -T "$(mktemp -d -p /dev/shm)" \
                          ${lib.strings.escapeShellArg config._module.args.name}
                      ''
                    else builtins.throw "Unsupported medium: ${config.medium}";
                };
              })
            ];
          });
        };
      };
    });
  };
}
