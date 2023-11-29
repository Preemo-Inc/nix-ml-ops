topLevel@{ flake-parts-lib, inputs, ... }: {
  imports = [
    ./systems.nix
    ./runtime.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.services = {
    imports = [
      topLevel.config.flake.flakeModules.systems
      topLevel.config.flake.flakeModules.runtime
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption (perSystem@{ lib, config, ... }: {
      options.ml-ops.service = lib.mkOption {
        type = lib.types.deferredModule;
        description = lib.mdDoc ''
          The shared options among all services.

          For example, config of `perSystem.ml-ops.service.xxx` will be copied to all `perSystem.ml-ops.services.<name>.xxx`.
        '';
      };
      config.ml-ops.service = { config, ... }: {
        imports = [ perSystem.config.ml-ops.runtime ];
        options.launchers = lib.mkOption {
          type = lib.types.attrsOf (lib.types.submoduleWith {
            modules = [ config.launcher ];
          });
          default = { };
        };
      };
      options.ml-ops.services = lib.mkOption {
        default = { };
        # TODO: Switch to `lazyAttrsOf` if `attrsOf` resulted in issues
        type = lib.types.attrsOf (lib.types.submoduleWith {
          modules = [
            config.ml-ops.service
          ];
        });
      };
      config.devenv.shells = lib.mapAttrs
        (name: service: {
          imports = [ service.devenvShellModule ];
        })
        config.ml-ops.services;
    });
  };
}
