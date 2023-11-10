topLevel@{ flake-parts-lib, inputs, lib, ... }: {
  imports = [
    ./kubernetes.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.gkeCredential = {
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
                        overrideAttrs = [
                          (old: {
                            gkeCluster = kubernetes.config.gke.cluster;
                            gkeRegion = kubernetes.config.gke.region;
                            USE_GKE_GCLOUD_AUTH_PLUGIN = "True";
                            buildCommand = ''
                              gcloud container clusters get-credentials \
                                "$gkeCluster" \
                                --region "$gkeRegion"

                              ${old.buildCommand}
                            '';
                            nativeBuildInputs = old.nativeBuildInputs ++ [
                              pkgs.cacert
                              (
                                pkgs.google-cloud-sdk.withExtraComponents [
                                  pkgs.google-cloud-sdk.components.gke-gcloud-auth-plugin
                                  pkgs.google-cloud-sdk.components.kubectl
                                ]
                              )
                            ];
                          })
                        ];
                      };
                    in
                    {

                      options.gke.region = lib.mkOption {
                        type = lib.types.str;
                      };

                      options.gke.cluster = lib.mkOption {
                        type = lib.types.str;
                      };


                      config.pushImage.overrideAttrs = [
                        (old: {
                          buildCommand = ''
                            export skopeoCopyArgs="$(printf "%q " --dest-registry-token "$(gcloud auth print-access-token)")"
                            ${old.buildCommand}
                          '';
                          nativeBuildInputs = old.nativeBuildInputs ++ [
                            pkgs.cacert
                            pkgs.google-cloud-sdk
                          ];
                        })
                      ];

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

