{ inputs, flake-parts-lib, ... }: {
  imports = [
    inputs.devenv.flakeModule
    ./nixpkgs.nix
  ];
  options.perSystem = flake-parts-lib.mkPerSystemOption ({ lib, ... }: {
    config.nixpkgs.config.allowUnsupportedSystem = true;

    options.ml-ops.common = lib.mkOption {
      default = { };
      type = lib.types.deferredModuleWith {
        staticModules = [
          ({ config, ... }: {
            options.version = lib.mkOption {
              type = lib.types.str;
              defaultText = lib.literalMD "1.0.0+<lastModifiedDate>.<hash>";
              default = "1.0.0+${inputs.self.lastModifiedDate}.${builtins.substring 0 8 inputs.self.rev or "dirty"}";
            };
            options.LD_LIBRARY_PATH = lib.mkOption {
              type = lib.types.envVar;
              default = "";
            };
            options.environmentVariables = lib.mkOption {
              type = lib.types.lazyAttrsOf lib.types.str;
            };
            options.devenvShellModule = lib.mkOption {
              description = lib.mdDoc ''
                Common config that will be copied to `config.devenv.shells.`*<shell_name>*`.config` for each shell
              '';
              default = { };
              type = lib.types.deferredModule;
            };
            config.devenvShellModule.env = config.environmentVariables;
            config.devenvShellModule.devenv.root = ".";
            config.devenvShellModule.enterShell = ''
              export LD_LIBRARY_PATH=${config.LD_LIBRARY_PATH}:''$LD_LIBRARY_PATH
            '';
          })
        ];
      };
      description = lib.mdDoc ''
        Settings shared between devcontainer and all jobs.
      '';
    };
  });
}
