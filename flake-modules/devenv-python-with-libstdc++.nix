topLevel@{ flake-parts-lib, inputs, ... }: {
  imports = [
    inputs.flake-parts.flakeModules.flakeModules
    ./common.nix
  ];
  flake.flakeModules.devenvPythonWithLibstdcxx = {
    imports = [
      topLevel.config.flake.flakeModules.common
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption ({ lib, pkgs, ... }: {

      ml-ops.common.devenvShellModule.languages.python.package =
        pkgs.python3.override (old: lib.attrsets.optionalAttrs pkgs.stdenv.isLinux {
          self = old.self.overrideAttrs
            (self: super: {
              env = super.env // {
                # Link libstdc++ to python interpreter so that packages in manylinux ABI can find it out-of-the-box without LD_LIBRARY_PATH
                # TODO: Add more libraries here when encountering an ImportError
                NIX_LDFLAGS = "--no-as-needed -lstdc++ --as-needed ${super.env.NIX_LDFLAGS}";
              };
            });
        });
    });
  };
}
