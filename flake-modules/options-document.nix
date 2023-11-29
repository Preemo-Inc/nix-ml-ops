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
                  imports =
                    builtins.attrValues flakeModule.config.flake.flakeModules ++
                    (lib.trivial.pipe "${flakeModule.inputs.self}/flake-modules" [
                      builtins.readDir
                      (lib.attrsets.filterAttrs (name: type: type == "regular" && lib.strings.hasSuffix ".nix" name))
                      builtins.attrNames
                      (builtins.map (name: "${flakeModule.inputs.self}/flake-modules/${name}"))
                    ]);

                  options.perSystem = flake-parts-lib.mkPerSystemOption {
                    config._module.args = {
                      # Generate document for Linux so that the document includes CUDA related options, which are not available on Darwin.
                      system = lib.mkDefault "x86_64-linux";
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
