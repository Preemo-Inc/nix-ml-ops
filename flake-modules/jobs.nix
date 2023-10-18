{ flake-parts-lib, inputs, ... }: {
  imports = [
    ./systems.nix
    ./runtime.nix
  ];
  options.perSystem = flake-parts-lib.mkPerSystemOption (perSystem@{ lib, config, ... }: {
    options.ml-ops.job = lib.mkOption {
      type = lib.types.deferredModule;
    };
    config.ml-ops.job = { config, ... }: {
      imports = [ perSystem.config.ml-ops.runtime ];
      options.launchers = lib.mkOption {
        type = lib.types.attrsOf (lib.types.submoduleWith {
          modules = [ config.launcher ];
        });
        default = {};
      };
    };
    options.ml-ops.jobs = lib.mkOption {
      default = { };
      # TODO: Switch to `lazyAttrsOf` if `attrsOf` resulted in issues
      type = lib.types.attrsOf (lib.types.submoduleWith {
        modules = [
          config.ml-ops.job
        ];
      });
    };
    config.devenv.shells = lib.mapAttrs
      (name: job: {
        imports = [ job.devenvShellModule ];
      })
      config.ml-ops.jobs;
  });
}
