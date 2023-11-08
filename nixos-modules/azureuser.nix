{
  flake.nixosModules.azureuser = {
    users.users.azureuser = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
    security.sudo.wheelNeedsPassword = false;
    nix.settings.trusted-users = [ "azureuser" ];
  };
}
