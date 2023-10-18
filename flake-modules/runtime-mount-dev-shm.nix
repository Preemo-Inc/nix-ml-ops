{
  imports = [
    ./volume-mount-empty-dir.nix
  ];
  perSystem.ml-ops.runtime.volumeMounts.emptyDir."/dev/shm" = {
    medium = "Memory";
  };
}
