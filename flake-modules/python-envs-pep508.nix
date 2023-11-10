topLevel@{ inputs, flake-parts-lib, ... }: {
  imports = [
    ./jobs.nix
    ./common.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.pythonEnvsPep508 = flakeModule: {
    imports = [
      topLevel.config.flake.flakeModules.jobs
      topLevel.config.flake.flakeModules.common
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption ({ lib, system, ... }: {
      ml-ops.devcontainer.pythonEnvArgs.requirements = ''
        ${
          lib.strings.optionalString
            (builtins.pathExists "${flakeModule.self}/requirements.txt")
            (builtins.readFile "${flakeModule.self}/requirements.txt")
        }
        ${
          lib.strings.optionalString
            (builtins.pathExists "${flakeModule.self}/requirements-dev.txt")
            (builtins.readFile "${flakeModule.self}/requirements-dev.txt")
        }
      '';
      ml-ops.job.pythonEnvArgs.requirements =
        lib.strings.optionalString
          (builtins.pathExists "${flakeModule.self}/requirements.txt")
          (builtins.readFile "${flakeModule.self}/requirements.txt");
      ml-ops.common = { config, ... }: {
        options.mkPython = lib.mkOption {
          default = (inputs.nixpkgs_22_05.legacyPackages.${system}.callPackage inputs.mach-nix {
            pypiData = inputs.pypi-deps-db;
            condaDataRev = inputs.conda-channels.rev;
            condaDataSha256 = builtins.hashFile "sha256" "${inputs.conda-channels}/sha256.json";
          }).mkPython;
        };
        options.pythonEnvArgs = lib.mkOption {
          type = lib.types.attrsOf lib.types.anything;
        };
        config.pythonEnvArgs = {
          python = lib.mkDefault "python39";
          ignoreCollisions = lib.mkDefault true;
        };
        options.pythonEnv = lib.mkOption {
          type = lib.types.package;
          default = config.mkPython config.pythonEnvArgs;
        };
        config.devenvShellModule.packages = [
          config.pythonEnv
        ];
      };
      # options.pythonEnvs.pep508
    });
  };
}
