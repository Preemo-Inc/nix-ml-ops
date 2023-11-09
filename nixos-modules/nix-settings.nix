{
  flake.nixosModules.nixSettings = { pkgs, ... }: {
    nix.package = pkgs.nixVersions.nix_2_15;
    nix.settings.auto-optimise-store = true;
    nix.settings.experimental-features = [
      "impure-derivations"
      "ca-derivations"
      "nix-command"
      "flakes"
      "repl-flake"
    ];
    nix.settings.trusted-users = [
      "@users" # Trust all normal users
    ];
  };
}
