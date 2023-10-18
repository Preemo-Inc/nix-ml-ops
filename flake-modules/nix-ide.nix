{ inputs, flake-parts-lib, ... }: {
  imports = [
    ./devcontainer.nix
    ./nix-ld.nix
    ./vscode.nix
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
}
