topLevel@{ flake-parts-lib, lib, ... }: {
  imports = [
    ./common.nix
    ./systems.nix
    ./nixpkgs.nix
  ];
  options.perSystem = flake-parts-lib.mkPerSystemOption (perSystem@{ pkgs, ... }: {
    options.ml-ops.runtime = lib.mkOption {
      description = lib.mdDoc ''
        Common config shared between ml-ops.jobs and ml-ops.services
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
}
