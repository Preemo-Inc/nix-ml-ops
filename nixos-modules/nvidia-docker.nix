{ config, pkgs, ... }: {
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.setLdLibraryPath = true;
  # hardware.nvidia.modesetting.enable = true;                                    
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia.nvidiaPersistenced = true;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.cudaSupport = true;
  virtualisation.docker.enableNvidia = true;
  virtualisation.docker.enable = true;

  # See https://github.com/NixOS/nixpkgs/issues/109389#issue-786213418
  networking.dhcpcd.denyInterfaces = [ "veth*" ];

}
