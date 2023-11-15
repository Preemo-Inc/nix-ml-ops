topLevel@{ flake-parts-lib, lib, inputs, ... }: {
  imports = [
    inputs.flake-parts.flakeModules.flakeModules
    ./python-package.nix
  ];
  flake.flakeModules.devenvPythonWithLibstdcxx = {
    imports = [
      topLevel.config.flake.flakeModules.pythonPackage
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption
      (perSystem@{ pkgs, system, ... }: {
        ml-ops.common.pythonPackage = {
          pipe = [
            (python:
              if python.stdenv.isLinux then
                python.overrideAttrs
                  (self: super: {
                    env = super.env // {
                      # Link libstdc++ to python interpreter so that packages in manylinux ABI can find it out-of-the-box without LD_LIBRARY_PATH
                      # TODO: Add more libraries here when encountering an ImportError
                      NIX_LDFLAGS = "--no-as-needed -lstdc++ --as-needed ${super.env.NIX_LDFLAGS}";
                    };
                  })
              else
                python)
          ];
        };
      });
  };
}
