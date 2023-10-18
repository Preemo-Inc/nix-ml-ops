{ inputs, config, ... }: {
  imports = [
    inputs.flake-parts.flakeModules.flakeModules
  ];
  flake.flakeModules.common = ./flake-modules/common.nix;
  flake.flakeModules.cuda = ./flake-modules/cuda.nix;
  flake.flakeModules.devcontainer = ./flake-modules/devcontainer.nix;
  flake.flakeModules.nixIde = ./flake-modules/nix-ide.nix;
  flake.flakeModules.nixLd = ./flake-modules/nix-ld.nix;
  flake.flakeModules.nixpkgs = ./flake-modules/nixpkgs.nix;
  flake.flakeModules.skypilot = ./flake-modules/skypilot.nix;
  flake.flakeModules.systems = ./flake-modules/systems.nix;
  flake.flakeModules.devserver = ./flake-modules/devserver.nix;
  flake.flakeModules.devcontainerGcpCliTools = ./flake-modules/devcontainer-gcp-cli-tools.nix;
  flake.flakeModules.kubernetes = ./flake-modules/kubernetes.nix;
  flake.flakeModules.kubernetesJob = ./flake-modules/kubernetes-job.nix;
  flake.flakeModules.kubernetesService = ./flake-modules/kubernetes-service.nix;
  flake.flakeModules.jobs = ./flake-modules/jobs.nix;
  flake.flakeModules.services = ./flake-modules/services.nix;
  flake.flakeModules.pythonEnvsPep508 = ./flake-modules/python-envs-pep508.nix;
  flake.flakeModules.pythonEnvsPoetry = ./flake-modules/python-envs-poetry.nix;
  flake.flakeModules.pythonVscode = ./flake-modules/python-vscode.nix;
  flake.flakeModules.linkNvidiaDrivers = ./flake-modules/link-nvidia-drivers.nix;
  flake.flakeModules.volumeMountNfs = ./flake-modules/volume-mount-nfs.nix;
  flake.flakeModules.volumeMountEmptyDir = ./flake-modules/volume-mount-empty-dir.nix;
  flake.flakeModules.runtimeMountDevShm = ./flake-modules/runtime-mount-dev-shm.nix;
  flake.flakeModules.gkeCredential = ./flake-modules/gke-credential.nix;
  flake.flakeModules.optionsDocument = ./flake-modules/options-document.nix;
  flake.flakeModules.vscode = ./flake-modules/vscode.nix;
  flake.flakeModules.devenvPythonWithLibstdcxx = ./flake-modules/devenv-python-with-libstdc++.nix;
}
