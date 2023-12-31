topLevel@{ inputs, flake-parts-lib, ... }: {
  imports = [
    ./devcontainer.nix
    ./kubernetes.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.volumeMountNfs = {
    imports = [
      topLevel.config.flake.flakeModules.devcontainer
      topLevel.config.flake.flakeModules.kubernetes
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption (perSystem@{ lib, config, pkgs, ... }: {
      ml-ops.common = {
        options.volumeMounts.nfs = lib.mkOption {
          default = { };
          type = lib.types.attrsOf (lib.types.submoduleWith {
            modules = [{
              options.mountOptions = lib.mkOption {
                default = [ "rw" "intr" "nolock" ];
                type = lib.types.listOf lib.types.str;
              };
              options.path = lib.mkOption {
                example = "/ml_data";
                type = lib.types.str;
              };
              options.server = lib.mkOption {
                example = "nfs.example.com";
                type = lib.types.str;
              };
            }];
          });
        };
      };
      ml-ops.runtime = {
        options.volumeMounts.nfs = lib.mkOption {
          type = lib.types.attrsOf (lib.types.submoduleWith {
            modules = [
              ({ config, ... }: {
                options.kubernetesVolume = lib.mkOption {
                  defaultText = lib.literalMD "";
                  default = {
                    nfs = {
                      inherit (config) server path;
                    };
                    mountOptions = config.mountOptions;
                  };
                };
              })
            ];
          });
        };
      };
      ml-ops.devcontainer = {
        options.volumeMounts.nfs = lib.mkOption {
          type = lib.types.attrsOf (lib.types.submoduleWith {
            modules = [
              ({ config, ... }: {
                options.mountScript = lib.mkOption {
                  type = lib.types.lines;
                  default = ''
                    ${
                      lib.strings.escapeShellArgs [
                        "mkdir"
                        "-p"
                        config._module.args.name
                      ]
                    }
                    ${
                      lib.strings.escapeShellArgs (
                        [
                          "mount.nfs"
                        ] ++ lib.lists.optionals (config.mountOptions != []) [
                          "-o"
                          (lib.strings.concatStringsSep "," config.mountOptions)
                        ] ++ [
                          "${config.server}:${config.path}"
                          config._module.args.name
                        ]
                      )
                    }
                  '';
                };
              })
            ];
          });
        };
      };
    });
  };
}
