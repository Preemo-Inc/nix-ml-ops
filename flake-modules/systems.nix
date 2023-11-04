topLevel@{ inputs, ... }: {
  imports = [
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.systems = {
    systems = import inputs.systems;
  };
}
