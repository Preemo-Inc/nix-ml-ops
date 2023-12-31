topLevel@{ flake-parts-lib, inputs, lib, ... }: {
  imports = [
    inputs.flake-parts.flakeModules.flakeModules
    ./common.nix
  ];
  flake.flakeModules.devcontainer = {
    imports = [
      topLevel.config.flake.flakeModules.common
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption (perSystem @{ system, pkgs, ... }: {
      options.ml-ops.devcontainer = lib.mkOption {
        description = lib.mdDoc ''
          Configuration for the development environment.
        '';
        default = { };
        type = lib.types.submoduleWith {
          modules = [
            (devcontainer: {
              imports = [ perSystem.config.ml-ops.common ];
              options.nixago.requests = lib.mkOption {
                type = lib.types.submoduleWith {
                  modules = [{
                    _module.freeformType = lib.types.attrsOf lib.types.deferredModule;
                  }];
                };
                default = { };
              };
              options.nixDirenvFlakeFlags = lib.mkOption {
                type = lib.types.listOf lib.types.str;
              };
              config.nixDirenvFlakeFlags = [
                # Disable Nix's eval-cache so that we can always see error messages if any.
                "--no-eval-cache"

                # Environment variables are cached by direnv, so we don't need Nix's eval-cache.
                "--show-trace"
              ];
              config.nixago.requests.".envrc" = {
                data = ''
                  if ! has nix_direnv_version || ! nix_direnv_version 2.3.0; then
                    source_url "https://raw.githubusercontent.com/nix-community/nix-direnv/2.3.0/direnvrc" "sha256-Dmd+j63L84wuzgyjITIfSxSD57Tx7v51DMxVZOsiUD8="
                  fi

                  use flake . ${
                    lib.escapeShellArgs devcontainer.config.nixDirenvFlakeFlags
                  }
                '';
                hook.mode = "copy";
                engine = { data, output, ... }: pkgs.writeTextFile {
                  name = output;
                  text = data;
                };
              };
              options.mountVolumeWithSudo = lib.mkOption {
                default = true;
              };
              config.devenvShellModule = {
                name = "devcontainer";
                packages = [
                  pkgs.git
                  pkgs.openssh
                ];
                devenv.skipLibraryPathEnv = true;
                enterShell =
                  lib.mkMerge
                    ([
                      (inputs.nixago.lib.${system}.makeAll (
                        lib.attrsets.mapAttrsToList
                          (output: request: {
                            imports = [ request ];
                            inherit output;
                          })
                          devcontainer.config.nixago.requests
                      )).shellHook
                    ] ++ (
                      builtins.concatMap
                        (lib.attrsets.mapAttrsToList
                          (mountPath: protocolConfig:
                            if devcontainer.config.mountVolumeWithSudo then
                              lib.escapeShellArgs [
                                "sudo"
                                "bash"
                                "-c"
                                protocolConfig.mountScript
                              ]
                            else
                              protocolConfig.mountScript)
                        )
                        (builtins.attrValues (devcontainer.config.volumeMounts or { }))
                    ));
              };
            })
          ];
        };
      };

      config = {
        devenv.shells.default = {
          imports = [ perSystem.config.ml-ops.devcontainer.devenvShellModule ];
          devcontainer.enable = true;
          devcontainer.settings.updateContentCommand = "direnv allow";
        };
      };
    });
  };
}
