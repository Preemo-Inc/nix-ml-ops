{ self, inputs, flake-parts-lib, ... }: {
  imports = [
    ./jobs.nix
    ./common.nix
    ./vscode.nix
  ];
  options.perSystem = flake-parts-lib.mkPerSystemOption ({ lib, inputs', pkgs, ... }:
    let
      poetry-add-requirements-txt = inputs'.poetry2nix.legacyPackages.mkPoetryApplication {
        projectDir = inputs.poetry-add-requirements-txt;
        preferWheels = true;
      };
    in
    {
      ml-ops.devcontainer = {
        nixago.requests.".vscode/extensions.json".data = {
          "recommendations" = [
            "ms-python.python"
          ];
        };
        devenvShellModule.scripts.import-requirements-to-poetry.exec = ''
          if [ ! -f ./pyproject.toml ]
          then
            poetry init --no-interaction
          fi
          if [ ! -f ./poetry.lock ]
          then
            if [ -f ./requirements.txt ]
            then
              ${poetry-add-requirements-txt}/bin/poeareq ./requirements.txt
            fi
            if [ -f ./requirements-dev.txt ]
            then
              ${poetry-add-requirements-txt}/bin/poeareq -D ./requirements-dev.txt
            fi
          fi
        '';
        devenvShellModule.languages.python.enable = true;
        devenvShellModule.languages.python.poetry.enable = true;
      };
      ml-ops.runtime = { config, ... }: {
        options.poetryEnvArgs = lib.mkOption {
          type = lib.types.attrsOf lib.types.anything;
        };
        config.poetryEnvArgs = {
          preferWheels = lib.mkDefault true;
          projectDir = lib.mkDefault "${self}";
          groups = [ ];
        };
        options.poetryEnv = lib.mkOption {
          default = inputs'.poetry2nix.legacyPackages.mkPoetryEnv config.poetryEnvArgs;
        };
        config.devenvShellModule.packages = lib.mkIf (builtins.pathExists "${self}/poetry.lock") [
          config.poetryEnv
        ];
      };
    });
}
