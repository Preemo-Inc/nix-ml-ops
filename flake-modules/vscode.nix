topLevel@{ flake-parts-lib, lib, ... }: {
  imports = [
    ./devcontainer.nix
    topLevel.inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.vscode = flakeModule:{
    imports = [
      topLevel.config.flake.flakeModules.devcontainer
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption {
      config.ml-ops.devcontainer.nixago.requests = {
        options = {
          ".vscode/extensions.json".data.recommendations = lib.mkOption {
            type = lib.types.listOf lib.types.str;
            default = [ ];
          };
          ".vscode/settings.json" = {
            data = lib.mkOption {
              type = lib.types.attrsOf lib.types.anything;
              default = { };
            };
            hook.mode = lib.mkOption {
              type = lib.types.str;
              default = "copy";
            };
          };
        };

        config =
          let
            settingsJson = ".vscode/settings.json";

            mkRecursiveDefault = value:
              if builtins.isList value
              then builtins.map mkRecursiveDefault value
              else if builtins.isAttrs value
              then lib.attrsets.mapAttrs (name: mkRecursiveDefault) value
              else lib.mkDefault value;
          in
          {
            "${settingsJson}".data =
              if builtins.pathExists "${flakeModule.self}/${settingsJson}"
              then mkRecursiveDefault (builtins.fromJSON (builtins.readFile "${flakeModule.self}/${settingsJson}"))
              else { }
            ;
          };
      };
    };
  };
}
