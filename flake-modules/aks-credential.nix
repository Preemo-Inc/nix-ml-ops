topLevel@{ flake-parts-lib, inputs, lib, ... }: {
  imports = [
    ./kubernetes.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.aksCredential = {
    imports = [
      topLevel.config.flake.flakeModules.kubernetes
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption
      (perSystem@{ lib, pkgs, ... }: {
        ml-ops.runtime = runtime: {
          config.launcher = launcher: {
            options.kubernetes = lib.mkOption {
              type = lib.types.submoduleWith {
                modules = [
                  (kubernetes:
                    let
                      authModule = {
                        pipe =
                          lib.mkIf (kubernetes.config.aks != null)
                            (lib.mkDerivedConfig kubernetes.options.aks (aks:
                              [
                                (previousPackage: previousPackage.overrideAttrs
                                  (previousAttrs: {
                                    aksCluster = aks.cluster;
                                    aksResourceGroup = aks.resourcegroup;
                                    buildCommand = ''
                                      # TODO(bo@preemo.io, 11/09/2023): Supports credentials other than managed identity. See https://nixos.wiki/wiki/Comparison_of_secret_managing_schemes
                                      az login --identity
                                      az aks get-credentials \
                                        --name "$aksCluster" \
                                        --resource-group "$aksResourceGroup"

                                      ${previousAttrs.buildCommand}
                                    '';
                                    nativeBuildInputs = previousAttrs.nativeBuildInputs ++ [
                                      # pkgs.cacert
                                      pkgs.azure-cli
                                    ];
                                  })
                                )
                              ]
                            ));
                      };
                    in
                    {
                      options.aks = lib.mkOption {
                        description = lib.mdDoc ''
                          The Azure Kubernetes Service (AKS) options.

                          When `aks` is `null`, the AKS options are disabled.
                          When `aks` is `{}`, the AKS options are enabled with default values.
                        '';
                        default = null;
                        type = lib.types.nullOr (lib.types.submoduleWith {
                          modules = [
                            (aks:
                              {
                                options = {
                                  resourcegroup = lib.mkOption {
                                    type = lib.types.str;
                                    default = "ml-solutions";
                                    description = lib.mdDoc ''
                                      The name of the Azure Resource Group (ARG) to use.
                                    '';
                                  };
                                  cluster = lib.mkOption {
                                    type = lib.types.str;
                                    default = "ml-aks";
                                    description = lib.mdDoc ''
                                      The name of the Azure Kubernetes Service (AKS) cluster to use.
                                    '';
                                  };
                                  registryName = lib.mkOption {
                                    type = lib.types.str;
                                    default = "mlsolutionregistry";
                                    description = lib.mdDoc ''
                                      The name of the Azure Container Registry (ACR) to use.
                                    '';
                                  };
                                };
                              }
                            )
                          ];
                        });
                      };


                      config.imageRegistry.host =
                        lib.mkIf (kubernetes.config.aks != null)
                          (lib.mkDerivedConfig
                            kubernetes.options.aks
                            (aks:
                              "${aks.registryName}.azurecr.io"
                            )
                          );

                      config.pushImage.pipe =
                        lib.mkIf (kubernetes.config.aks != null)
                          (lib.mkDerivedConfig kubernetes.options.aks (aks: [
                            (previousPackage: previousPackage.overrideAttrs
                              (previousAttrs: {
                                aksRegistryName = aks.registryName;

                                buildCommand = ''
                                  # TODO(bo@preemo.io, 11/09/2023): Supports credentials other than managed identity. See https://nixos.wiki/wiki/Comparison_of_secret_managing_schemes
                                  az login --identity

                                  export skopeoCopyArgs="$(printf "%q " --dest-username 00000000-0000-0000-0000-000000000000 --dest-password "$(az acr login --name "$aksRegistryName" --expose-token --output tsv --query accessToken)")"

                                  ${previousAttrs.buildCommand}
                                '';
                                nativeBuildInputs = previousAttrs.nativeBuildInputs ++ [
                                  # pkgs.cacert
                                  pkgs.azure-cli
                                ];
                              })
                            )
                          ]));

                      config.helmUpgrade.imports = [
                        authModule
                      ];
                      config.helmDelete.imports = [
                        authModule
                      ];
                    })
                ];
              };
            };
          };
        };
      });
  };
}

