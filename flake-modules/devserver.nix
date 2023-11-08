topLevel@{ flake-parts-lib, inputs, ... }: {
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
          topLevel.config.flake.nixosModules.devserver
          "${inputs.nixpkgs}/nixos/modules/virtualisation/google-compute-image.nix"
        ];
        system = "x86_64-linux";
      };
    };

    options.perSystem = flake-parts-lib.mkPerSystemOption
      (perSystem@{ lib, pkgs, system, ... }: {
        options.ml-ops.devserver.azure.stgaccountname = lib.mkOption rec {
          type = lib.types.str;
          default = "mlsolutionimages";
          defaultText = default;
        };
        options.ml-ops.devserver.azure.containername = lib.mkOption rec {
          type = lib.types.str;
          default = "images";
          defaultText = default;
        };
        options.ml-ops.devserver.azure.blobname = lib.mkOption rec {
          type = lib.types.str;
        };
        options.ml-ops.devserver.hyperv.stgaccountname = lib.mkOption rec {
          type = lib.types.str;
          default = "mlsolutionimages";
          defaultText = default;
        };
        options.ml-ops.devserver.hyperv.containername = lib.mkOption rec {
          type = lib.types.str;
          default = "images";
          defaultText = default;
        };
        options.ml-ops.devserver.hyperv.blobname = lib.mkOption rec {
          type = lib.types.str;
        };
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
          ml-ops.devserver.azure.blobname = "devserver-${builtins.baseNameOf perSystem.config.packages.devserver-azure}.vhd";
          ml-ops.devserver.hyperv.blobname = "devserver-${builtins.baseNameOf perSystem.config.packages.devserver-azure}.vhdx";
          ml-ops.devserver.gce =
            {
              image-name = "devserver-${builtins.baseNameOf perSystem.config.packages.devserver-gce}";
              image-uri = "gs://${perSystem.config.ml-ops.devserver.gce.image-bucket}/${perSystem.config.ml-ops.devserver.gce.image-name}.tar.gz";
            };
          packages = {
            devserver-azure = inputs.nixos-generators.nixosGenerate {
              inherit system;
              format = "azure";
              modules = [ topLevel.config.flake.nixosModules.devserver ];
            };
            devserver-hyperv = inputs.nixos-generators.nixosGenerate {
              inherit system;
              format = "hyperv";
              modules = [ topLevel.config.flake.nixosModules.devserver ];
            };
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
            upload-devserver-azure-image = pkgs.writeShellApplication {
              name = "upload-devserver-azure-image.sh";
              runtimeInputs = [ pkgs.azure-cli ];
              text = ''
                ${
                  lib.strings.escapeShellArgs [
                    "az" "storage" "blob" "upload" 
                    "--account-name" perSystem.config.ml-ops.devserver.azure.stgaccountname
                    "--container-name" perSystem.config.ml-ops.devserver.azure.containername
                    "--name" perSystem.config.ml-ops.devserver.azure.blobname
                    "--type" "page"
                    "--file" "${perSystem.config.packages.devserver-azure}/disk.vhd"
                  ]
                }
              '';
            };
            upload-devserver-hyperv-image = pkgs.writeShellApplication {
              name = "upload-devserver-hyperv-image.sh";
              runtimeInputs = [ pkgs.azure-cli ];
              text = ''
                ${
                  lib.strings.escapeShellArgs [
                    "az" "storage" "blob" "upload" 
                    "--account-name" perSystem.config.ml-ops.devserver.hyperv.stgaccountname
                    "--container-name" perSystem.config.ml-ops.devserver.hyperv.containername
                    "--name" perSystem.config.ml-ops.devserver.hyperv.blobname
                    "--type" "page"
                    "--file" perSystem.config.packages.devserver-hyperv
                  ]
                }/*.vhdx
              '';
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
                    "${perSystem.config.packages.devserver-gce}/*.tar.gz"
                    perSystem.config.ml-ops.devserver.gce.image-uri
                  ]
                }
                ${
                  lib.strings.escapeShellArgs [
                    "gcloud" "compute" "images" "create"
                    perSystem.config.ml-ops.devserver.gce.image-name
                    "--source-uri=${perSystem.config.ml-ops.devserver.gce.image-uri}"
                  ]
                }
              '';
            };
          };

        };
      });
  };
}
