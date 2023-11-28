{
  inputs = {
    call-flake.url = "github:divnix/call-flake";

    # We don't want to lock the `nix-ml-ops` flake here, because we want to
    # use the latest version of `nix-ml-ops` in this example project.
    # 
    # For a real project, you should lock the `nix-ml-ops` flake by uncommenting
    # the following line.
    # nix-ml-ops.url = "github:Preemo-Inc/nix-ml-ops";
  };
  outputs =
    lockedInputs:
    let
      unlockedInputs = {
        # In this example project, nix-ml-ops is loaded from a relative path,
        # so that it would not be included in the lock file.
        #
        # For a real project, `unlockedInputs` should be removed in favor of
        # locked inputs.
        nix-ml-ops = lockedInputs.call-flake ./../..;
      };
      inputs = unlockedInputs // lockedInputs;
    in
    inputs.nix-ml-ops.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.nix-ml-ops.flakeModules.cuda
        inputs.nix-ml-ops.flakeModules.devcontainer
        inputs.nix-ml-ops.flakeModules.nixIde
        inputs.nix-ml-ops.flakeModules.nixLd
        inputs.nix-ml-ops.flakeModules.pythonEnvsPoetry
        inputs.nix-ml-ops.flakeModules.kubernetesJob
        inputs.nix-ml-ops.flakeModules.gkeCredential
      ];
      perSystem = { pkgs, config, lib, ... }: {
        ml-ops.jobs.my-job.launchers.my-launcher.kubernetes = {
          gke = {
            region = "us-central1";
            cluster = "my-cluster";
          };
          imageRegistry = {
            host = "us-central1-docker.pkg.dev";
            path = "my-workspace/my-image";
          };
          helmTemplates.job.spec.template.spec.containers.master-node.args = [
            "python"
            "-c"
            "print('Hello, World!')"
          ];
        };
      };
    };
}
