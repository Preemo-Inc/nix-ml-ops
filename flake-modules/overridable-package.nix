topLevel@{ flake-parts-lib, inputs, lib, ... }: {
  flake.flakeModules.overridablePackage = {
    options.perSystem = flake-parts-lib.mkPerSystemOption ({ pkgs, ... }: {
      options.ml-ops.overridablePackage = lib.mkOption {
        default = { };
        type = lib.types.deferredModuleWith {
          staticModules = [
            (overridablePackage: {
              options.base-package = lib.mkOption {
                type = lib.types.package;
                example = pkgs.hello;
              };
              options.overridden-package = lib.mkOption
                {
                  type = lib.types.package;
                  defaultText = lib.literalMD "applied `base-package` with `pipe`";
                  default = lib.trivial.pipe overridablePackage.config.base-package overridablePackage.config.pipe;
                };
              options.pipe = lib.mkOption {
                type = lib.types.listOf (lib.types.functionTo lib.types.package);
                default = [ ];
              };
            })
          ];
        };
      };
    });
  };
}
