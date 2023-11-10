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
                        overrideAttrs =
                          lib.mkIf (kubernetes.config.aks != null)
                            (lib.mkDerivedConfig kubernetes.options.aks (aks:
                              [
                                (old: {
                                  aksCluster = kubernetes.config.aks.cluster;
                                  aksResourceGroup = kubernetes.config.aks.resourcegroup;
                                  buildCommand = ''
                                    # TODO(bo@preemo.io, 11/09/2023): Supports credentials other than managed identity. See https://nixos.wiki/wiki/Comparison_of_secret_managing_schemes
                                    az login --identity
                                    az aks get-credentials \
                                      --name "$aksCluster" \
                                      --resource-group "$aksResourceGroup"

                                    ${old.buildCommand}
                                  '';
                                  nativeBuildInputs = old.nativeBuildInputs ++ [
                                    # pkgs.cacert
                                    pkgs.azure-cli
                                  ];
                                })
                              ]
                            ));
                      };
                    in
                    {
                      options.aks = lib.mkOption {
                        default = null;
                        type = lib.types.nullOr (lib.types.submoduleWith {
                          modules = [
                            (aks:
                              {
                                options = {
                                  resourcegroup = lib.mkOption {
                                    type = lib.types.str;
                                    default = "ml-solutions";
                                  };
                                  cluster = lib.mkOption {
                                    type = lib.types.str;
                                    default = "ml-aks";
                                  };
                                  registryName = lib.mkOption {
                                    type = lib.types.str;
                                    default = "mlsolutionregistry";
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

                      config.pushImage.overrideAttrs =
                        lib.mkIf (kubernetes.config.aks != null)
                          (lib.mkDerivedConfig
                            kubernetes.options.aks
                            (aks: [
                              (old: {
                                aksRegistryName = aks.registryName;

                                buildCommand = ''
                                  # TODO(bo@preemo.io, 11/09/2023): Supports credentials other than managed identity. See https://nixos.wiki/wiki/Comparison_of_secret_managing_schemes
                                  az login --identity

                                  export skopeoCopyArgs="$(printf "%q " --dest-username 00000000-0000-0000-0000-000000000000 --dest-password "$(az acr login --name "$aksRegistryName" --expose-token --output tsv --query accessToken)")"
                                  ${old.buildCommand}
                                '';
                                nativeBuildInputs = old.nativeBuildInputs ++ [
                                  # pkgs.cacert
                                  pkgs.azure-cli
                                ];
                              })
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

