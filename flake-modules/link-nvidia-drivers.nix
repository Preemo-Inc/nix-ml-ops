{ flake-parts-lib, ... }: {
  imports = [
    ./common.nix
    ./nix-ld.nix
  ];
  options.perSystem = flake-parts-lib.mkPerSystemOption ({ lib, config, pkgs, options, ... }: {
    ml-ops.common = lib.attrsets.optionalAttrs pkgs.stdenv.isLinux {
      nixLdLibraries = lib.mkAfter [
        "/run/opengl-driver"
        "/run/opengl-driver-32"
      ];
      devenvShellModule.enterShell = ''
        # Link drivers if the script is either known to be in a container, or
        # it cannot detect if it is in a container
        if 
          (
            ! command -v systemd-detect-virt > /dev/null &&
            >&2 echo "Trying to link Nvidia drivers to /run/opengl-driver/lib because we cannot detect if we are in a devcontainer"
          ) || (
            # Clear LD_LIBRARY_PATH previously set by devenv because it could result in error in systemd-detect-virt
            LD_LIBRARY_PATH= systemd-detect-virt --container > /dev/null &&
            >&2 echo "Trying to link Nvidia drivers to /run/opengl-driver/lib because we are in a devcontainer..."
          )
        then
          # Create the symbolic links to drivers when running the container
          # with --gpu=all
          mkdir -p /run/opengl-driver/lib

          (
            shopt -s nullglob

            # Note that nvidia-docker will mounts drivers to different
            # directories according to the Linux distribution. For example,
            # on Alpine Linux it's under /usr/lib64/ and on Debian it's
            # under /usr/lib/x86_64-linux-gnu.
            if \
              ! ln -sf -t /run/opengl-driver/lib \
                /usr/lib/x86_64-linux-gnu/libnvidia* \
                /usr/lib/x86_64-linux-gnu/libcuda* \
                /usr/lib64/libnvidia* \
                /usr/lib64/libcuda* \
                /usr/local/nvidia/lib64/libnvidia* \
                /usr/local/nvidia/lib64/libcuda*
            then
              >&2 echo "Cannot find Nvidia drivers when trying to create symbolic links to Nvidia drivers"
            fi
          )
        fi
      '';
    };

  });
}
