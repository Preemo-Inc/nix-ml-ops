topLevel@{ inputs, flake-parts-lib, ... }: {
  imports = [
    ./common.nix
    ./vscode.nix
    ./python-vscode.nix
    ./python-package.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.pythonEnvsPoetry = flakeModule: {
    imports = [
      topLevel.config.flake.flakeModules.common
      topLevel.config.flake.flakeModules.vscode
      topLevel.config.flake.flakeModules.pythonVscode
      topLevel.config.flake.flakeModules.pythonPackage
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption
      ({ lib, system, pkgs, ... }: {
        ml-ops.common = common: {
          options.poetry2nix.pkgs = lib.mkOption {
            defaultText = lib.literalMD ''
              pkgs.appendOverlays [
                (self: super: {
                  ''${common.config.pythonPackage.base-package.pythonAttr} = lib.pipe super.''${common.config.pythonPackage.base-package.pythonAttr} common.config.pythonPackage.pipe;
                })
              ]
            '';
            default = pkgs.appendOverlays [
              (self: super: {
                # Set the config.pythonPackage to poetry2nix's `pkgs` so that Python's dependents are rebuilt against the custom Python specified in config.pythonPackage.
                ${common.config.pythonPackage.base-package.pythonAttr} = lib.pipe super.${common.config.pythonPackage.base-package.pythonAttr} common.config.pythonPackage.pipe;
              })
            ];
          };
          options.poetry2nix.python = lib.mkOption {
            default = common.config.poetry2nix.pkgs.${common.config.pythonPackage.base-package.pythonAttr};
          };
          options.poetry2nix.poetry2nixLib = lib.mkOption {
            default = (inputs.poetry2nix.lib.mkPoetry2Nix {
              pkgs = common.config.poetry2nix.pkgs;
            });
          };
        };
        ml-ops.devcontainer = devcontainer: {
          options.poetry-add-requirements-txt = lib.mkOption {
            type = lib.types.package;
            default = devcontainer.config.poetry2nix.poetry2nixLib.mkPoetryApplication {
              projectDir = inputs.poetry-add-requirements-txt;
              preferWheels = true;
            };
          };
          config.devenvShellModule = {
            scripts.import-requirements-to-poetry.exec = ''
              if [ ! -f ./pyproject.toml ]
              then
                poetry init --no-interaction
              fi
              if [ ! -f ./poetry.lock ]
              then
                if [ -f ./requirements.txt ]
                then
                  ${devcontainer.config.poetry-add-requirements-txt}/bin/poeareq ./requirements.txt
                fi
                if [ -f ./requirements-dev.txt ]
                then
                  ${devcontainer.config.poetry-add-requirements-txt}/bin/poeareq -D ./requirements-dev.txt
                fi
              fi
            '';
            languages.python.enable = true;
            languages.python.poetry.enable = true;
          };
        };

        ml-ops.runtime = runtime: {
          options.poetryEnvArgs = lib.mkOption {
            type = lib.types.attrsOf lib.types.anything;
            default = { };
          };
          config.poetryEnvArgs = {
            preferWheels = lib.mkDefault true;
            projectDir = lib.mkDefault "${flakeModule.self}";
            python = runtime.config.poetry2nix.python;
            groups = [ ];
          };
          options.poetryEnv = lib.mkOption {
            type = lib.types.package;
            default = runtime.config.poetry2nix.poetry2nixLib.mkPoetryEnv runtime.config.poetryEnvArgs;
          };
          config.devenvShellModule.packages = lib.mkIf (builtins.pathExists "${flakeModule.self}/poetry.lock") [
            runtime.config.poetryEnv
          ];
        };
      });
  };
}
