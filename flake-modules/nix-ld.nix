topLevel@{ flake-parts-lib, inputs, ... }: {
  imports = [
    ./common.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.nixLd = {
    imports = [
      topLevel.config.flake.flakeModules.common
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption ({ system, lib, config, pkgs, ... }: {
      ml-ops.common = { config, ... }: {
        options.nixLdLibraries = lib.mkOption {
          type = lib.types.listOf lib.types.path;
        };
        config.nixLdLibraries = builtins.filter (package: !package.meta.unsupported) [
          pkgs.zlib
          pkgs.zstd
          pkgs.stdenv.cc.cc
          pkgs.curl
          pkgs.openssl
          pkgs.attr
          pkgs.libssh
          pkgs.bzip2
          pkgs.libxml2
          pkgs.acl
          pkgs.libsodium
          pkgs.util-linux
          pkgs.xz
          pkgs.systemd
        ];

        config.environmentVariables = {
          NIX_LD =
            toString (pkgs.runCommand "ld.so" { } ''
              ln -s "$(cat '${pkgs.stdenv.cc}/nix-support/dynamic-linker')" $out
            '');
          NIX_LD_LIBRARY_PATH = lib.makeLibraryPath config.nixLdLibraries;
        };

      };

    });
  };
}
