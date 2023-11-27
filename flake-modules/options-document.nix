topLevel@{ inputs, lib, flake-parts-lib, ... }: {

  imports = [
    ./devcontainer.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.optionsDocument = flakeModule: {
    imports = [
      topLevel.config.flake.flakeModules.devcontainer
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
                  imports = builtins.attrValues flakeModule.config.flake.flakeModules;

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
                  if lib.hasPrefix "${flakeModule.self}/flake-modules/" declaration
                  then
                    [
                      rec {
                        name = lib.removePrefix "${flakeModule.self}/flake-modules/" declaration;
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
  };
}
