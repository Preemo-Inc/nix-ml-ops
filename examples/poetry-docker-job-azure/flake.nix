{
  inputs = {
    # ml-ops.url = "git+file:./../..?ref=HEAD&shallow=1";
    ml-ops.url = "path:./../..";
  };
  outputs =
    inputs @ { ml-ops, ... }:
    ml-ops.lib.mkFlake { inherit inputs; } {
      imports = [
        ml-ops.flakeModules.cuda
        ml-ops.flakeModules.devcontainer
        ml-ops.flakeModules.nixIde
        ml-ops.flakeModules.nixLd
        ml-ops.flakeModules.pythonEnvsPoetry
        ml-ops.flakeModules.kubernetesJob
        ml-ops.flakeModules.aksCredential
        ml-ops.flakeModules.devcontainerAzureCliTools
      ];

      perSystem = { pkgs, config, lib, ... }: {
        ml-ops.devcontainer.nixDirenvFlakeFlags = lib.mkAfter [
          "--no-write-lock-file"
        ];
        ml-ops.jobs.my-job.launchers.my-launcher.kubernetes = {
          aks = {
            # region = "us-central1";
            # cluster = "my-cluster";
          };
          imageRegistry = {
            # host = "us-central1-docker.pkg.dev";
            # path = "my-workspace/my-image";
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
