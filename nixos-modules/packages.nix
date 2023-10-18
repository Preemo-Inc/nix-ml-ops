{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.asdf-vm
    pkgs.gh
    pkgs.git
    pkgs.git-lfs
  ];
}
