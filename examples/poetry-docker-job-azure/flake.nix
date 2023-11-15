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
      debug = true;

      imports = [
        inputs.nix-ml-ops.flakeModules.cuda
        inputs.nix-ml-ops.flakeModules.devcontainer
        inputs.nix-ml-ops.flakeModules.nixIde
        inputs.nix-ml-ops.flakeModules.nixLd
        inputs.nix-ml-ops.flakeModules.pythonEnvsPoetry
        inputs.nix-ml-ops.flakeModules.kubernetesJob
        inputs.nix-ml-ops.flakeModules.aksCredential
        inputs.nix-ml-ops.flakeModules.devcontainerAzureCliTools
        inputs.nix-ml-ops.flakeModules.devenvPythonWithLibstdcxx
      ];

      perSystem = perSystem@{ pkgs, inputs', ... }: {
        ml-ops.common.pythonPackage.base-package = pkgs.python310;
        ml-ops.jobs.my-job.launchers.my-launcher.kubernetes = {
          aks = { };
          imageRegistry = { };
          helmTemplates.job.spec.template.spec = {
            tolerations = [
              {
                key = "sku";
                operator = "Equal";
                value = "gpu";
                effect = "NoSchedule";
              }
              {
                key = "kubernetes.azure.com/scalesetpriority";
                operator = "Equal";
                value = "spot";
                effect = "NoSchedule";
              }
            ];
            containers.master-node = {
              resources.limits."nvidia.com/gpu" = 1;
              args = [
                "python"
                "-c"
                ''
                  import sys
                  import torch
                  print("sys.version =", sys.version)
                  print("torch.cuda.is_available() = ", torch.cuda.is_available())
                ''
              ];
            };
          };
        };

        # Set maxLayers to a large number to reuse layers from previous builds.
        # Docker image layers limit is 127 by default, while containerd does not have such limit.
        # See https://grahamc.com/blog/nix-and-layered-docker-images/
        ml-ops.common.devenvShellModule.containers.processes.maxLayers = 1000;

        ml-ops.devcontainer.devenvShellModule.packages = [
          pkgs.kubectl
        ];
      };
    };
}
