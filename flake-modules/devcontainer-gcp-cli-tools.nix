{ flake-parts-lib, ... }: {
  imports = [
    ./devcontainer.nix
  ];
  options.perSystem = flake-parts-lib.mkPerSystemOption ({ lib, config, pkgs, ... }: {
    ml-ops.devcontainer = {
      config.devenvShellModule.packages = lib.mkAfter [
        pkgs.go-containerregistry
        config.ml-ops.devcontainer.gcp.sdk.package
      ];
      options.gcp.sdk = lib.mkOption {
        default = { };
        type = lib.types.submoduleWith {
          modules = [
            ({ config, ... }: {
              options = {
                extraComponents = lib.mkOption {
                  default = [
                    config.basePackage.components.gke-gcloud-auth-plugin
                    config.basePackage.components.kubectl
                  ];
                };
                basePackage = lib.mkOption {
                  default = pkgs.google-cloud-sdk;
                };
                package = lib.mkOption {
                  default =
                    config.basePackage.withExtraComponents config.extraComponents;
                };
              };
            })
          ];
        };
      };
    };
  });
}
