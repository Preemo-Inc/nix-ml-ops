{
  flake.nixosModules.direnv = { pkgs, lib, ... }: {
    programs.direnv.enable = true;
  };
}

