topLevel@{ flake-parts-lib, inputs, ... }: {
  imports = [
    ./devcontainer.nix
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.devcontainerAzureCliTools = {
    imports = [
      topLevel.config.flake.flakeModules.devcontainer
    ];
    options.perSystem = flake-parts-lib.mkPerSystemOption ({ lib, config, pkgs, ... }: {
      ml-ops.devcontainer = {
        config.devenvShellModule.packages = lib.mkAfter [
          pkgs.azure-cli
          pkgs.azure-storage-azcopy
        ];
      };
    });
  };
}
