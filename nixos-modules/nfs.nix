{
  flake.nixosModules.nfs = {
    # See https://github.com/NixOS/nixpkgs/issues/76671#issuecomment-1399044941
    boot.supportedFilesystems = [ "nfs" ];
    services.rpcbind.enable = true;
  };
}
