{
  inputs.ml-ops.url = "git+file:./../..?ref=HEAD&shallow=1";
  outputs = inputs @ { ml-ops, ... }:
    ml-ops.lib.mkFlake { inherit inputs; } {
      imports = [
        ml-ops.flakeModules.devenvPythonWithLibstdcxx
        ml-ops.flakeModules.devcontainer
      ];
      perSystem = { pkgs, ... }: {
        ml-ops.devcontainer = {
          pythonPackage.base-package = pkgs.python310;
          devenvShellModule.languages.python = {
            enable = true;
            venv.enable = true;
          };
        };
      };
    };
}
