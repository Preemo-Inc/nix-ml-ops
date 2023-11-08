{
  flake.nixosModules.sudo = {
    security.sudo.wheelNeedsPassword = false;
  };
}
