{
  inputs = {
    call-flake.url = "github:divnix/call-flake";
  };
  outputs =
    lockedInputs:
    let
      unlockedInputs = {
        nix-ml-ops = lockedInputs.call-flake ./../..;
      };
      inputs = unlockedInputs // lockedInputs;
    in
    inputs.nix-ml-ops.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.nix-ml-ops.flakeModules.devenvPythonWithLibstdcxx
        inputs.nix-ml-ops.flakeModules.devcontainer
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
