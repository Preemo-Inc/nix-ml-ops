topLevel@{ inputs, ... }: {
  flake.nixosModules.nixLd = { pkgs, ... }: {
    programs.nix-ld = {
      enable = true;
      libraries = [
        pkgs.stdenv.cc.cc
      ];
      # Use `nix-ld-rs` instead of `nix-ld`, because Azure's waagent can execute scripts in non-login non-interactive shell, which is not supported by `nix-ld`, while `nix-ld-rs` works in non-login non-interactive shells.
      package = inputs.nix-ld-rs.packages.${pkgs.system}.nix-ld-rs;
    };
  };
}
