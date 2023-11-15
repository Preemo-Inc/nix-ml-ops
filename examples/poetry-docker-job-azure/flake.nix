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
    inputs.nix-ml-ops.lib.mkFlake
      {
        inherit inputs;
      }
      {
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

        perSystem = { pkgs, config, lib, ... }: {
          ml-ops.common.pythonPackage.base-package = pkgs.python310;
          ml-ops.jobs.my-job.launchers.my-launcher.kubernetes = {
            aks = { };
            imageRegistry = { };
            helmTemplates.job.spec.template.spec.containers.master-node = {
              resources.limits."nvidia.com/gpu" = 1;
              tolerations = [
                {
                  key = "sku";
                  operator = "Equal";
                  value = "gpu";
                  effect = "NoSchedule";
                }
              ];
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
          ml-ops.devcontainer.devenvShellModule.packages = [
            pkgs.kubectl
          ];
        };
      };
}
