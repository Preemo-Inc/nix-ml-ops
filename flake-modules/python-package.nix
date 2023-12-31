topLevel@{ flake-parts-lib, lib, inputs, ... }: {
  imports = [
    inputs.flake-parts.flakeModules.flakeModules
    ./common.nix
    ./overridable-package.nix
  ];
  flake.flakeModules.pythonPackage = {
    imports = [
      topLevel.config.flake.flakeModules.common
      topLevel.config.flake.flakeModules.overridablePackage
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption
      (perSystem@{ pkgs, system, ... }: {
        options.ml-ops.common = lib.mkOption {
          type = lib.types.deferredModuleWith {
            staticModules = [
              (common: {
                options.pythonPackage = lib.mkOption {
                  default = { };
                  type = lib.types.submoduleWith {
                    modules = [
                      {
                        imports = [ perSystem.config.ml-ops.overridablePackage ];
                        config.base-package = lib.mkDefault pkgs.python3;
                      }
                    ];
                  };
                };
                config.devenvShellModule.languages.python.package =
                  let
                    self = common.config.pythonPackage.overridden-package.override {
                      inherit self;
                    };
                  in
                  self;
              })
            ];
          };
        };
      });
  };
}
