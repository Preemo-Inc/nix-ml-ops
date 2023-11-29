topLevel@{ flake-parts-lib, inputs, lib, ... }: {
  imports = [
    ./common.nix
    ./systems.nix
    ./nixpkgs.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.runtime = {
    imports = [
      topLevel.config.flake.flakeModules.common
      topLevel.config.flake.flakeModules.systems
      topLevel.config.flake.flakeModules.nixpkgs
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption (perSystem@{ pkgs, ... }: {
      options.ml-ops.runtime = lib.mkOption {
        description = lib.mdDoc ''
          Common config shared among all `ml-ops.jobs.<name>` and `ml-ops.services.<name>`.
        '';
        type = lib.types.deferredModuleWith {
          staticModules = [
            (runtime: {
              imports = [ perSystem.config.ml-ops.common ];
              options.name = lib.mkOption {
                type = lib.types.str;
                default = runtime.config._module.args.name;
              };
              config.devenvShellModule.name = runtime.config.name;
              options.launcher = lib.mkOption {
                type = lib.types.deferredModuleWith {
                  staticModules = [
                    {
                      options.environmentVariables = lib.mkOption {
                        type = lib.types.attrsOf lib.types.str;
                      };
                      config.environmentVariables = runtime.config.environmentVariables;
                    }
                  ];
                };
                default = { };
              };
            })
          ];
        };
        default = { };

      };
    });
  };
}
