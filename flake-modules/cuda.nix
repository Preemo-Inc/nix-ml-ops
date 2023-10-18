{ flake-parts-lib, ... }: {
  imports = [
    ./common.nix
    ./link-nvidia-drivers.nix
  ];
  options.perSystem = flake-parts-lib.mkPerSystemOption ({ lib, pkgs, system, ... }: {
    config = lib.mkIf (system != "aarch64-darwin") {
      nixpkgs.config.allowUnfree = true;
      nixpkgs.config.cudaSupport = true;

      ml-ops.common = { config, ... }: {
        config.LD_LIBRARY_PATH = lib.mkMerge [
          "/run/opengl-driver/lib"
          # bitsandbytes need to search for CUDA libraries
          "${config.environmentVariables.CUDA_HOME}/lib"
        ];
        config.devenvShellModule.packages = [
          config.cuda.home
        ];

        config.environmentVariables.CUDA_HOME = toString (config.cuda.home);
        options.cuda.home = lib.mkOption {
          type = lib.types.package;
          default = pkgs.symlinkJoin {
            name = "cuda-home";
            paths = config.cuda.packages;
          };
        };
        options.cuda.packages = lib.mkOption {
          type = lib.types.listOf lib.types.package;
        };
        config.cuda.packages = [
          pkgs.cudaPackages.cuda_nvcc
          pkgs.cudaPackages.cudatoolkit
          pkgs.cudaPackages.cuda_cudart
          pkgs.cudaPackages.cudnn
          pkgs.cudaPackages.libcublas
        ];
      };
    };
  });
}
