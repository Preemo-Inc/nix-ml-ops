topLevel@{ config, flake-parts-lib, inputs, ... }: {
  imports = [
    ./nixpkgs.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.nixosModules.devserver = ../nixos-modules/devserver.nix;

  flake.flakeModules.devserver = {
    imports = [
      topLevel.config.flake.flakeModules.nixpkgs
    ];

    config.flake = {

      nixosConfigurations.devserverGce = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          config.flake.nixosModules.devserver
          "${inputs.nixpkgs}/nixos/modules/virtualisation/google-compute-image.nix"
        ];
        system = "x86_64-linux";
      };
    };

    options.perSystem = flake-parts-lib.mkPerSystemOption
      ({ lib, config, pkgs, system, ... }: {
        options.ml-ops.devserver.gce.image-bucket = lib.mkOption rec {
          type = lib.types.str;
          default = "ml-ops-vm-images";
          defaultText = default;
        };
        options.ml-ops.devserver.gce.image-name = lib.mkOption {
          type = lib.types.str;
        };
        options.ml-ops.devserver.gce.image-uri = lib.mkOption rec {
          type = lib.types.str;
        };
        config = {
          ml-ops.devserver.gce =
            {
              image-name = "devserver-${builtins.baseNameOf config.packages.devserver-gce}";
              image-uri = "gs://${config.ml-ops.devserver.gce.image-bucket}/${config.ml-ops.devserver.gce.image-name}.tar.gz";
            };
          packages = {
            devserver-gce = inputs.nixos-generators.nixosGenerate {
              inherit system;
              format = "gce";
              modules = [ topLevel.config.flake.nixosModules.devserver ];
            };
            devserver-amazon = inputs.nixos-generators.nixosGenerate {
              inherit system;
              format = "amazon";
              modules = [ topLevel.config.flake.nixosModules.devserver ];
            };
            upload-devserver-gce-image = pkgs.writeShellApplication {
              name = "upload-devserver-gce-image.sh";
              runtimeInputs = [
                pkgs.google-cloud-sdk
              ];
              text = ''
                set -ex
                ${
                  lib.strings.escapeShellArgs [
                    "gsutil" "cp" "-r"
                    "${config.packages.devserver-gce}/*.tar.gz"
                    config.ml-ops.devserver.gce.image-uri
                  ]
                }
                ${
                  lib.strings.escapeShellArgs [
                    "gcloud" "compute" "images" "create"
                    config.ml-ops.devserver.gce.image-name
                    "--source-uri=${config.ml-ops.devserver.gce.image-uri}"
                  ]
                }
              '';
            };
          };

        };
      });
  };
}
