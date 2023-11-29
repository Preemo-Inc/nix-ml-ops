{ flake-parts-lib, inputs, lib, ... }: {
  imports = [
    inputs.flake-parts.flakeModules.flakeModules
  ];

  flake.flakeModules.lib = {
    options.flake = lib.mkOption {
      type = lib.types.submoduleWith {
        modules = [{
          options.lib.mkFlake = lib.mkOption {
            type = lib.types.functionTo (lib.types.functionTo (lib.types.attrsOf lib.types.anything));
            default = args: flake-parts-lib.mkFlake (
              lib.recursiveUpdate { inherit inputs; } args
            );
          };
        }];
      };
    };
  };

}
