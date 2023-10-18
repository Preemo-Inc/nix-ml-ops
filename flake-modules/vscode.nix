{ flake-parts-lib, lib, inputs, ... }: {
  options.perSystem = flake-parts-lib.mkPerSystemOption {
    config.ml-ops.devcontainer.nixago.requests = {
      options.".vscode/extensions.json".data.recommendations = lib.mkOption
        {
          type = lib.types.listOf lib.types.str;
          default = [ ];
        };
    };
  };
}
