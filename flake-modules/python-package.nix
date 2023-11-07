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
        options.ml-ops.common = flake-parts-lib.mkDeferredModuleOption (common: {
          options.pythonPackage = lib.mkOption
            {
              default = { };
              type = lib.types.submoduleWith {
                modules = [
                  perSystem.config.ml-ops.overridablePackage
                ];
              };
            };
          options.devenvShellModule = flake-parts-lib.mkPerSystemOption {
            languages.python.package = common.config.pythonPackage.overridden-package;
          };
        });
      });
  };
}
