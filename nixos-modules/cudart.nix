{
  flake.nixosModules.cudart = { pkgs, lib, ... }: {
    environment.sessionVariables.LD_LIBRARY_PATH = [
      "${pkgs.cudaPackages.cuda_cudart}/lib"
    ];
  };
}
