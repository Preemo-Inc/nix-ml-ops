{
  inputs = {
    call-flake.url = "github:divnix/call-flake";

    # We don't want to lock the `nix-ml-ops` flake here, because we want to
    # use the latest version of `nix-ml-ops` in this example project.
    # 
    # For a real project, you should lock the `nix-ml-ops` flake by uncommenting
    # the following line.
    # nix-ml-ops.url = "github:Preemo-Inc/nix-ml-ops";
  };
  outputs =
    lockedInputs:
    let
      unlockedInputs = {
        # In this example project, nix-ml-ops is loaded from a relative path,
        # so that it would not be included in the lock file.
        #
        # For a real project, `unlockedInputs` should be removed in favor of
        # locked inputs.
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
        ml-ops.common.pythonPackage.base-package = pkgs.python310;

        ml-ops.devcontainer = {
          devenvShellModule.languages.python = {
            enable = true;
            venv.enable = true;
          };
        };
      };
    };
}
