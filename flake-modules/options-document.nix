topLevel@{ inputs, lib, flake-parts-lib, ... }: {

  imports = [
    ./devcontainer.nix
  ];
  options.perSystem = flake-parts-lib.mkPerSystemOption (
    perSystem@{ pkgs, system, inputs', self', ... }:
    {
      packages = rec {
        copy-options-document-to-current-directory = (inputs.nixago.lib.${system}.make {
          output = options-document.name;
          data = options-document;
          engine = { data, ... }: data;
          hook.mode = "copy";
        }).install;

        options-document = (pkgs.nixosOptionsDoc {
          options = (
            inputs.flake-parts.lib.evalFlakeModule
              { inherit inputs; }
              {
                imports = [
                  ./common.nix
                  ./jobs.nix
                  ./services.nix
                  ./runtime.nix
                  ./kubernetes.nix
                  ./kubernetes-job.nix
                  ./kubernetes-service.nix
                  ./python-envs-pep508.nix
                  ./python-envs-poetry.nix
                  ./devcontainer-gcp-cli-tools.nix
                  ./cuda.nix
                  ./volume-mount-nfs.nix
                  ./volume-mount-empty-dir.nix
                  ./runtime-mount-dev-shm.nix
                  ./devserver.nix
                  ./link-nvidia-drivers.nix
                  ./nix-ide.nix
                  ./nix-ld.nix
                  ./gke-credential.nix
                  ./python-vscode.nix
                ];

                options.perSystem = flake-parts-lib.mkPerSystemOption {
                  config._module.args = {
                    system = lib.mkDefault system;
                    pkgs = lib.mkDefault pkgs;
                    inputs' = lib.mkDefault inputs';
                    self' = lib.mkDefault self';
                  };
                };
              }
          ).options;
          documentType = "none";
          markdownByDefault = true;
          warningsAreErrors = false;
          transformOptions = option: option // rec {
            declarations = lib.concatMap
              (declaration:
                if lib.hasPrefix "${inputs.self}/flake-modules/" declaration
                then
                  [
                    rec {
                      name = lib.removePrefix "${inputs.self}/flake-modules/" declaration;
                      url = "flake-modules/${builtins.head (builtins.split "," name)}";
                    }
                  ]
                else [ ])
              option.declarations;
            visible = declarations != [ ];
          };
        }).optionsCommonMark;
      };
    }
  );
}
