topLevel@{ inputs, ... }: {
  imports = [
    ./volume-mount-empty-dir.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.volumeMountDevShm = {
    imports = [
      topLevel.config.flake.flakeModules.volumeMountEmptyDir
    ];
    perSystem.ml-ops.runtime.volumeMounts.emptyDir."/dev/shm" = {
      medium = "Memory";
    };
  };
}
