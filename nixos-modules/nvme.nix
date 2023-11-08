{
  flake.nixosModules.nvme = {
    boot.initrd.availableKernelModules = [ "nvme" ];
  };
}
