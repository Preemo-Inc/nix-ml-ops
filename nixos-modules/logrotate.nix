{ pkgs, lib, ... }: {
  # See https://nixos.org/manual/nixos/stable/options.html#opt-services.logrotate.checkConfig
  services.logrotate.checkConfig = false;
}
