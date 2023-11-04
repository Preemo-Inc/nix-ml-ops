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
              options.overridden-package = lib.mkOption {
                type = lib.types.package;
                defaultText = lib.literalMD "applied `base-package` with `override` and `overrideAttrs`";
                default =
                  builtins.foldl'
                    (package: package.overrideAttrs)
                    (
                      builtins.foldl'
                        (package: package.override)
                        overridablePackage.config.base-package
                        overridablePackage.config.override
                    )
                    overridablePackage.config.overrideAttrs;
              };
              options.override = lib.mkOption {
                type = lib.types.listOf lib.types.anything;
                default = [ ];
              };
              options.overrideAttrs = lib.mkOption {
                type = lib.types.listOf lib.types.anything;
                default = [ ];
              };
            })
          ];
        };
      };
    });
  };
}
