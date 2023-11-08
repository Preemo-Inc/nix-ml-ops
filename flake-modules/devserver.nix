topLevel@{ flake-parts-lib, inputs, ... }: {
  imports = [
    ./nixpkgs.nix
    ../nixos-modules/devserver.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];

  flake.flakeModules.devserver = {
    imports = [
      topLevel.config.flake.flakeModules.nixpkgs
    ];

    config.flake.nixosConfigurations = {
      devserverGce = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          topLevel.config.flake.nixosModules.devserver
          "${inputs.nixpkgs}/nixos/modules/virtualisation/google-compute-image.nix"
        ];
        system = "x86_64-linux";
      };
      devserverAzure = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          topLevel.config.flake.nixosModules.devserver
          "${inputs.nixpkgs}/nixos/modules/virtualisation/azure-image.nix"
        ];
        system = "x86_64-linux";
      };
    };

    options.perSystem = flake-parts-lib.mkPerSystemOption
      (perSystem@{ lib, pkgs, system, ... }: {
        options.ml-ops.devserver.azure.imageName = lib.mkOption {
          type = lib.types.str;
        };
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
          ml-ops.devserver.azure.imageName = "devserver-${builtins.baseNameOf perSystem.config.packages.devserver-azure}";
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
              modules = [
                topLevel.config.flake.nixosModules.devserver
              ];
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
              runtimeInputs = [
                pkgs.azure-cli
                (
                  pkgs.buildGoModule {
                    name = "azure-vhd-utils";
                    vendorSha256 = "sha256-KumgBgBI0oBJMKQX8d6z37fd5cxE+B+5ytFYqsFqbfo=";
                    src = pkgs.fetchFromGitHub {
                      owner = "microsoft";
                      repo = "azure-vhd-utils";
                      rev = "7c30a3748a1bf172fec4c41ae7cd398f6206baaf";
                      sha256 = "sha256-WFhrZeuWiKnwPW50MURQLtBRqM4r68Bvobkwzjqm888=";
                    };
                  }
                )
              ];
              text = ''
                ${
                  lib.strings.escapeShellArgs [
                    "azure-vhd-utils" "upload"
                    "--stgaccountname" perSystem.config.ml-ops.devserver.azure.stgaccountname
                    "--containername" perSystem.config.ml-ops.devserver.azure.containername
                    "--blobname" perSystem.config.ml-ops.devserver.azure.blobname
                    "--localvhdpath" "${perSystem.config.packages.devserver-azure}/disk.vhd"
                    "--stgaccountkey"
                  ]
                } "$(${
                  lib.strings.escapeShellArgs [
                    "az" "storage" "account" "keys" "list"
                    "--query" "[0].value"
                    "--output" "tsv"
                    "--account-name" perSystem.config.ml-ops.devserver.azure.stgaccountname
                  ]
                })"
                ${
                  lib.strings.escapeShellArgs [
                    "az" "image" "create"
                    "--name" perSystem.config.ml-ops.devserver.azure.imageName
                    "--os-type" "Linux"
                    "--source" "https://${perSystem.config.ml-ops.devserver.azure.stgaccountname}.blob.core.windows.net/${perSystem.config.ml-ops.devserver.azure.containername}/${perSystem.config.ml-ops.devserver.azure.blobname}"
                    "--resource-group"
                  ]
                } "$(${
                  lib.strings.escapeShellArgs [
                    "az" "storage" "account" "show"
                    "--name" perSystem.config.ml-ops.devserver.azure.stgaccountname
                    "--query" "resourceGroup"
                    "--output" "tsv"
                  ]
                })"
              '';
            };
            upload-devserver-hyperv-image = pkgs.writeShellApplication {
              name = "upload-devserver-hyperv-image.sh";
              runtimeInputs = [
                pkgs.azure-cli
              ];
              text = ''
                ${
                  lib.strings.escapeShellArgs [
                    "az" "storage" "blob" "upload" 
                    "--account-name" perSystem.config.ml-ops.devserver.hyperv.stgaccountname
                    "--container-name" perSystem.config.ml-ops.devserver.hyperv.containername
                    "--name" perSystem.config.ml-ops.devserver.hyperv.blobname
                    "--file" "${perSystem.config.packages.devserver-hyperv}/*.vhdx"
                  ]
                }
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
