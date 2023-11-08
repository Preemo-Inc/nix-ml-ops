{
  flake.nixosModules.swap = {
    swapDevices = [{
      device = "/var/lib/swapfile";

      # 50GB
      size = 50 * 1024;
    }];
  };
}
