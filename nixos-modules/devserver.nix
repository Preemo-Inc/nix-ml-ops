{
  imports = [
    ./nix-settings.nix
    ./packages.nix
    ./logrotate.nix
    ./direnv.nix
    ./nfs.nix
    ./nix-ld.nix
    ./nvidia-docker.nix
    ./state-version.nix
    ./swap.nix
    ./cudart.nix
  ];
}
