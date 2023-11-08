{
  flake.nixosModules.azureuser = {
    users.users.azureuser = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };
}
