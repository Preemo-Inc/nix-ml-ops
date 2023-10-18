{ inputs, flake-parts-lib, ... }: {
  imports = [
    ./devcontainer.nix
    ./vscode.nix
  ];
  options.perSystem = flake-parts-lib.mkPerSystemOption ({ config, pkgs, lib, system, ... }: {
    ml-ops.devcontainer = {
      nixago.requests = {
        ".vscode/settings.json".data = {
          # Don't let VS Code activate the environment because it should has been activated by devenv already
          "python.terminal.activateEnvironment" = false;
          "[python]"."editor.defaultFormatter" = "ms-python.black-formatter";
        };
        ".vscode/extensions.json".data = {
          "recommendations" = [
            "ms-python.black-formatter"
            "ms-python.python"
          ];
        };
      };
    };

    # TODO: Other IDE settings
  });
}
