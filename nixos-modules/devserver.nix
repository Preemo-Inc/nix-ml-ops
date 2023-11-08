topLevel: {
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
    ./nvme.nix
  ];

  flake.nixosModules.devserver = {
    imports = [
      topLevel.config.flake.nixosModules.nixSettings
      topLevel.config.flake.nixosModules.packages
      topLevel.config.flake.nixosModules.logrotate
      topLevel.config.flake.nixosModules.direnv
      topLevel.config.flake.nixosModules.nfs
      topLevel.config.flake.nixosModules.nixLd
      topLevel.config.flake.nixosModules.nvidiaDocker
      topLevel.config.flake.nixosModules.stateVersion
      topLevel.config.flake.nixosModules.cudart
      topLevel.config.flake.nixosModules.nvme
    ];
  };
}
