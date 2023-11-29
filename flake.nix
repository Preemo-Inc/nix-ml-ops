{
  inputs = {
    poetry-add-requirements-txt = {
      url = "github:tddschn/poetry-add-requirements.txt";
      flake = false;
    };
    poetry2nix = {
      url = "github:nix-community/poetry2nix";
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
    nixpkgs.url = "github:Preemo-Inc/nixpkgs/nix-ml-ops";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";
    systems.url = "github:nix-systems/default";
    devenv = {
      # TODO: Switch to `github:cachix/devenv` when https://github.com/cachix/devenv/pull/718, https://github.com/cachix/devenv/pull/820, https://github.com/cachix/devenv/pull/872 and https://github.com/cachix/devenv/pull/873 get merged
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
    nix-ld-rs.url = "github:nix-community/nix-ld-rs";
  };
  outputs = inputs:
    let
      bootstrap = inputs.flake-parts.lib.mkFlake { inherit inputs; moduleLocation = ./flake.nix; } ({ lib, ... }: {
        imports = [
          ./flake-modules/nix-ide.nix
          ./flake-modules/devserver.nix
          ./flake-modules/devcontainer-gcp-cli-tools.nix
          ./flake-modules/devcontainer-azure-cli-tools.nix
          ./flake-modules/nix-ld.nix
          ./flake-modules/options-document.nix
          ./flake-modules/lib.nix
        ];

      });
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs; } ({ lib, ... }: {
      imports = [
        bootstrap.flakeModules.lib
        bootstrap.flakeModules.nixIde
        bootstrap.flakeModules.devserver
        bootstrap.flakeModules.devcontainerGcpCliTools
        bootstrap.flakeModules.devcontainerAzureCliTools
        bootstrap.flakeModules.nixLd
        bootstrap.flakeModules.optionsDocument
      ] ++
      # import all nix files under ./flake-modules/
      (lib.trivial.pipe ./flake-modules [
        builtins.readDir
        (lib.attrsets.filterAttrs (name: type: type == "regular" && lib.strings.hasSuffix ".nix" name))
        builtins.attrNames
        (builtins.map (name: ./flake-modules/${name}))
      ]);
    });
}
