topLevel@{ flake-parts-lib, inputs, ... }: {
  imports = [
    ./systems.nix
    ./jobs.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.skypilot = {
    imports = [
      topLevel.config.flake.flakeModules.systems
      topLevel.config.flake.flakeModules.jobs
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption ({ lib, config, pkgs, system, ... }: {
      ml-ops.job.launcher = {
        options.skypilot = {
          options.todo-placeholder = lib.mkOption {
            default = "blah blah";
          };
        };
      };
    });
  };
}
