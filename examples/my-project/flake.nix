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
        inputs.nix-ml-ops.flakeModules.common
        inputs.nix-ml-ops.flakeModules.skypilot
        inputs.nix-ml-ops.flakeModules.kubernetesJob
        inputs.nix-ml-ops.flakeModules.kubernetesService
        inputs.nix-ml-ops.flakeModules.devcontainer
        inputs.nix-ml-ops.flakeModules.linkNvidiaDrivers
        inputs.nix-ml-ops.flakeModules.volumeMountNfs
        inputs.nix-ml-ops.flakeModules.devcontainerGcpCliTools
        inputs.nix-ml-ops.flakeModules.gkeCredential
        inputs.nix-ml-ops.flakeModules.pythonVscode
      ];
      perSystem = { pkgs, config, lib, ... }: {
        ml-ops.common.volumeMounts.nfs."/mnt/ml-data/" = {
          server = "my-server.example.com";
          path = "/ml_data";
        };
        ml-ops.common.environmentVariables.MY_VAR = "Hello, World!";
        ml-ops.devcontainer.environmentVariables.MY_VAR_2 = "Hello, Preemo!";
        ml-ops.services.my-service.environmentVariables.MY_VAR_4 = "Hello, Inference!";
        ml-ops.services.my-service.launchers.my-launcher.kubernetes.imageRegistry = {
          host = "us-central1-docker.pkg.dev";
          path = "my-workspace/my-image";
        };
        ml-ops.services.my-service.launchers.my-launcher.kubernetes.gke = {
          region = "us-central1";
          cluster = "my-cluster";
        };
        ml-ops.services.my-service.launchers.my-launcher.kubernetes.helmTemplates.service.spec.ports = [
          {
            protocol = "TCP";
            port = 60000;
            targetPort = 50001;
          }
        ];
        ml-ops.services.my-service.launchers.my-launcher.kubernetes.helmTemplates.deployment.spec.template.spec.containers.hello.image = "us-docker.pkg.dev/google-samples/containers/gke/hello-app:2.0";
        ml-ops.services.my-service.environmentVariables.PORT = "50001";
      };
    };
}
