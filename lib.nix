{ inputs, ... }: {
  flake.lib.mkFlake = args: inputs.flake-parts.lib.mkFlake (
    inputs.nixpkgs.lib.recursiveUpdate
      { inherit inputs; }
      args
  );
}
