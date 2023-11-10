{
  inputs = {
    call-flake.url = "github:divnix/call-flake";
  };
  outputs =
    lockedInputs:
    let
      unlockedInputs = {
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
