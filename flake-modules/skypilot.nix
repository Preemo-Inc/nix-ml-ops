{ flake-parts-lib, ... }: {
  imports = [
    ./systems.nix
    ./jobs.nix
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
}
