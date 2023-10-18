{
  inputs.ml-ops.url = "git+file:./../..?ref=HEAD&shallow=1";
  outputs = inputs @ { ml-ops, ... }:
    ml-ops.lib.mkFlake { inherit inputs; } {
      imports = [
        ml-ops.flakeModules.common
        ml-ops.flakeModules.skypilot
        ml-ops.flakeModules.kubernetesJob
        ml-ops.flakeModules.kubernetesService
        ml-ops.flakeModules.devcontainer
        ml-ops.flakeModules.linkNvidiaDrivers
        ml-ops.flakeModules.volumeMountNfs
        ml-ops.flakeModules.devcontainerGcpCliTools
        ml-ops.flakeModules.gkeCredential
        ml-ops.flakeModules.pythonVscode
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
