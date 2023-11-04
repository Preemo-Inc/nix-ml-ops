topLevel@{ inputs, flake-parts-lib, ... }: {
  imports = [
    ./devcontainer.nix
    ./nix-ld.nix
    ./vscode.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.nixIde = {
    imports = [
      topLevel.config.flake.flakeModules.devcontainer
      topLevel.config.flake.flakeModules.nixLd
      topLevel.config.flake.flakeModules.vscode
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption ({ config, pkgs, lib, system, ... }: {
      ml-ops.devcontainer = {
        nixago.requests = {
          ".vscode/settings.json".data = {
            "nix.enableLanguageServer" = true;
          };
          ".vscode/extensions.json".data = {
            "recommendations" = [
              "jnoortheen.nix-ide"
              "mkhl.direnv"
            ];
          };
        };
        devenvShellModule = {
          packages = lib.mkAfter [ pkgs.rnix-lsp ];
        };
      };

      # TODO: Other IDE settings
    });
  };
}
