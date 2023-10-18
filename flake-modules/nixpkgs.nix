{ self, inputs, flake-parts-lib, ... }: {
  imports = [
    ./systems.nix
  ];
  options.perSystem = flake-parts-lib.mkPerSystemOption({ lib, config, pkgs, system, ... }: {
    imports = [
      "${inputs.nixpkgs}/nixos/modules/misc/nixpkgs.nix"
    ];
    nixpkgs.hostPlatform = system;
  });
}
