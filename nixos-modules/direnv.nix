{ pkgs, lib, ... }: {
  environment.systemPackages = [ pkgs.direnv pkgs.nix-direnv ];
  nix.settings = {
    keep-outputs = true;
    keep-derivations = true;
  };
  environment.pathsToLink = [
    "/share/nix-direnv"
  ];
  nixpkgs.overlays = [
    (self: super: { nix-direnv = super.nix-direnv.override { enableFlakes = true; }; })
  ];
  programs.bash.interactiveShellInit = lib.mkAfter ''
    eval "$(direnv hook bash)"
  '';

}
