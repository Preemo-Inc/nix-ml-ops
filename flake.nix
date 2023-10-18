{
  inputs = {
    poetry-add-requirements-txt = {
      url = "github:tddschn/poetry-add-requirements.txt";
      flake = false;
    };
    poetry2nix = {
      # TODO: Use nix-community/poetry2nix when https://github.com/nix-community/poetry2nix/pull/1128 get merged
      # url = "github:nix-community/poetry2nix";
      url = "github:Preemo-Inc/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    conda-channels = {
      url = "github:davhau/conda-channels";
      flake = false;
    };
    pypi-deps-db = {
      url = "github:DavHau/pypi-deps-db";
      flake = false;
    };
    mach-nix = {
      url = "github:Preemo-Inc/mach-nix";
      flake = false;
    };
    nixpkgs_22_05.url = "nixpkgs/nixos-22.05";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    systems.url = "github:nix-systems/default";
    devenv = {
      # TODO: Use cachix/devenv when https://github.com/cachix/devenv/pull/718 gets merged
      # url = "github:cachix/devenv";
      url = "github:Preemo-Inc/devenv";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mk-shell-bin = {
      url = "github:rrbutani/nix-mk-shell-bin";
    };
    nix2container = {
      url = "github:nlewo/nix2container";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixago = {
      url = "github:Preemo-Inc/nixago?ref=no-gitignore";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    imports = [
      ./lib.nix
      ./flake-modules.nix
      ./flake-modules/nix-ide.nix
      ./flake-modules/devserver.nix
      ./flake-modules/devcontainer-gcp-cli-tools.nix
      ./flake-modules/nix-ld.nix
      ./flake-modules/options-document.nix
    ];
  };
}
