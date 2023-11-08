# ml-ops

See [options documentation](options.md) for all available options.
## Quick start

Here is an example of the ml-ops config. In the example: `."${"key"}".` denotes a name picked by the user, while `."key".` denotes a union, i.e. there are multiple choices.

``` nix
{
  ml-ops = {

    # Common volumes shared between devcontainer and jobs
    common.volumeMounts."nfs"."${"/mnt/ml-data/"}". = {
      server = "my-server.example.com";
      path = "/ml_data";
    };

    # Common environment variables shared between devcontainer and jobs
    common.environmentVariables = {};

    # Environment variables in additionto the ml-ops.common.environmentVariables
    devcontainer.environmentVariables = {
    }

    devcontainer.volumeMounts = {
      # Volumes in addition to the ml-ops.common.volumeMounts
      "emptyDir"."${"/mnt/my-temporary-data/"}" = {
        medium = "Memory";
      };
    };

    # TODO: Support elastic
    # jobs."${"training"}".resources."elastic"

    # This is the configuration for single node training orstatic distributed
    # training, not for elastic distributed training
    jobs."${"training"}".resources."static".accelerators."A100" = 16;
    jobs."${"training"}".resources."static".cpus = 32;

    jobs."${"training"}".run = ''
      torchrun ...
    '';
    # Environment variables in additionto the ml-ops.common.environmentVariables
    jobs."${"training"}".environmentVariables = {
      HF_DATASETS_IN_MEMORY_MAX_SIZE = "200000000";
    };

    # Volumes in addition to the ml-ops.common.volumeMounts
    jobs."${"training"}".volumeMounts = {};

    jobs."${"training"}".launchers."${"my-gke-autopilot-launcher"}"."kubernetes".imageRegistry = "us-central1-docker.pkg.dev/ml-solutions-371721/training-images";
    jobs."${"training"}".launchers."${"my-gke-autopilot-launcher"}"."kubernetes".namespace = "default";

    # TODO: Other types of launcher
    # jobs."${"training"}".launchers."${"my-aws-ec2-launcher"}"."skypilot" = { ... };

    # Extra package available in both runtime and development environment:
    pythonEnvs."pep508".common.extraPackages."${"peft"}"."buildPythonPackage".src = peft-src;

    # Extra packages available in development environment only:
    pythonEnvs."pep508".development.extraPackages = {};

    # TODO: Support poetry projects:
    # pythonEnvs."poetry" = { ... };
  };

}
```

## Generate image

### on devserver

```bash
nix build .#devserver-gce
```

```bash
nix build .#devserver-amazon
```

```bash
# Azure Image Generation 1
nix build .#devserver-azure
```

```bash
# Azure Image Generation 2
nix build .#devserver-hyperv
```

Note that KVM must be enabled on the devserver. See [this document](https://cloud.google.com/compute/docs/instances/nested-virtualization/enabling) for enabling KVM on GCE.

Also the following steps are required on Debian to install kvm kernel modules:

``` bash
sudo apt-get install qemu-kvm

sudo tee -a /etc/nix/nix.conf <<EOF
extra-experimental-features = nix-command flakes
extra-system-features = kvm
EOF
```

## Upload the devserver image to Google Cloud

``` bash
nix run .#upload-devserver-gce-image
```

Then the image will be uploaded to https://console.cloud.google.com/compute/images?tab=images&project=ml-solutions-371721&pageState=(%22images%22:(%22f%22:%22%255B%257B_22k_22_3A_22%25E5%2588%259B%25E5%25BB%25BA%25E8%2580%2585_22_2C_22t_22_3A10_2C_22v_22_3A_22_5C_22ml-solutions-371721_5C_22_22_2C_22s_22_3Atrue_2C_22i_22_3A_22creator_22%257D%255D%22))


## Upload the devserver image to Azure Blob Storage

### Generation 1
``` bash
nix run .#upload-devserver-azure-image
```

### Generation 2

``` bash
nix run .#upload-devserver-azure-hyperv
```

## Update devserver to the latest configuration

If you already checked out this repository, run the following command in the work tree
``` bash
sudo nixos-rebuild switch --flake .#devserverGce
```

Or under an abitrary path, run 
``` bash
sudo nixos-rebuild switch --flake git+ssh://git@github.com/Preemo-Inc/ml-ops.git#devserverGce
```
or
``` bash
sudo nixos-rebuild switch --flake git+https://github.com/Preemo-Inc/ml-ops.git#devserverGce
```
