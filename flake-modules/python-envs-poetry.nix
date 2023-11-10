topLevel@{ inputs, flake-parts-lib, ... }: {
  imports = [
    ./common.nix
    ./vscode.nix
    ./python-vscode.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.pythonEnvsPoetry = flakeModule: {
    imports = [
      topLevel.config.flake.flakeModules.common
      topLevel.config.flake.flakeModules.vscode
      topLevel.config.flake.flakeModules.pythonVscode
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption ({ lib, system, pkgs, ... }:
      let
        poetry2nix = (inputs.poetry2nix.lib.mkPoetry2Nix { inherit pkgs; });

        poetry-add-requirements-txt = poetry2nix.mkPoetryApplication {
          projectDir = inputs.poetry-add-requirements-txt;
          preferWheels = true;
        };
      in
      {
        ml-ops.devcontainer = {
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
            projectDir = lib.mkDefault "${flakeModule.self}";
            groups = [ ];
          };
          options.poetryEnv = lib.mkOption {
            default = poetry2nix.mkPoetryEnv config.poetryEnvArgs;
          };
          config.devenvShellModule.packages = lib.mkIf (builtins.pathExists "${flakeModule.self}/poetry.lock") [
            config.poetryEnv
          ];
        };
      });
  };
}
