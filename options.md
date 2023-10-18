## perSystem

A function from system to flake-like attributes omitting the ` <system> ` attribute\.

Modules defined here have access to the suboptions and [some convenient module arguments](\.\./module-arguments\.html)\.



*Type:*
module

*Declared by:*
 - [vscode\.nix](flake-modules/vscode.nix)
 - [devcontainer\.nix](flake-modules/devcontainer.nix)
 - [overridable-package\.nix](flake-modules/overridable-package.nix)
 - [nixpkgs\.nix](flake-modules/nixpkgs.nix)
 - [python-vscode\.nix](flake-modules/python-vscode.nix)
 - [gke-credential\.nix](flake-modules/gke-credential.nix)
 - [nix-ld\.nix](flake-modules/nix-ld.nix)
 - [nix-ide\.nix](flake-modules/nix-ide.nix)
 - [link-nvidia-drivers\.nix](flake-modules/link-nvidia-drivers.nix)
 - [devserver\.nix](flake-modules/devserver.nix)
 - [volume-mount-empty-dir\.nix](flake-modules/volume-mount-empty-dir.nix)
 - [volume-mount-nfs\.nix](flake-modules/volume-mount-nfs.nix)
 - [cuda\.nix](flake-modules/cuda.nix)
 - [devcontainer-gcp-cli-tools\.nix](flake-modules/devcontainer-gcp-cli-tools.nix)
 - [python-envs-poetry\.nix](flake-modules/python-envs-poetry.nix)
 - [python-envs-pep508\.nix](flake-modules/python-envs-pep508.nix)
 - [kubernetes-service\.nix](flake-modules/kubernetes-service.nix)
 - [kubernetes-job\.nix](flake-modules/kubernetes-job.nix)
 - [kubernetes\.nix](flake-modules/kubernetes.nix)
 - [runtime\.nix](flake-modules/runtime.nix)
 - [services\.nix](flake-modules/services.nix)
 - [jobs\.nix](flake-modules/jobs.nix)
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.common



Settings shared between devcontainer and all jobs\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.common\.LD_LIBRARY_PATH



This option has no description\.



*Type:*
strings concatenated with “:”



*Default:*
` "" `

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.common\.devenvShellModule



Common config that will be copied to ` config.devenv.shells. `*\<shell_name>*` .config ` for each shell



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.common\.environmentVariables



This option has no description\.



*Type:*
lazy attribute set of string

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.common\.version



This option has no description\.



*Type:*
string



*Default:*
1\.0\.0+\<lastModifiedDate>\.\<hash>

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.devcontainer



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [devcontainer\.nix](flake-modules/devcontainer.nix)



## perSystem\.ml-ops\.devcontainer\.LD_LIBRARY_PATH



This option has no description\.



*Type:*
strings concatenated with “:”



*Default:*
` "" `

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.devcontainer\.cuda\.packages



This option has no description\.



*Type:*
list of package

*Declared by:*
 - [cuda\.nix, via option perSystem\.ml-ops\.common](flake-modules/cuda.nix)



## perSystem\.ml-ops\.devcontainer\.cuda\.home



This option has no description\.



*Type:*
package



*Default:*
` <derivation cuda-home> `

*Declared by:*
 - [cuda\.nix, via option perSystem\.ml-ops\.common](flake-modules/cuda.nix)



## perSystem\.ml-ops\.devcontainer\.devenvShellModule



Common config that will be copied to ` config.devenv.shells. `*\<shell_name>*` .config ` for each shell



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.devcontainer\.environmentVariables



This option has no description\.



*Type:*
lazy attribute set of string

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.devcontainer\.mkPython



This option has no description\.



*Type:*
unspecified value



*Default:*
` <function> `

*Declared by:*
 - [python-envs-pep508\.nix, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.devcontainer\.mountVolumeWithSudo



This option has no description\.



*Type:*
unspecified value



*Default:*
` true `

*Declared by:*
 - [devcontainer\.nix](flake-modules/devcontainer.nix)



## perSystem\.ml-ops\.devcontainer\.nixLdLibraries



This option has no description\.



*Type:*
list of path

*Declared by:*
 - [nix-ld\.nix, via option perSystem\.ml-ops\.common](flake-modules/nix-ld.nix)



## perSystem\.ml-ops\.devcontainer\.nixago\.requests



This option has no description\.



*Type:*
attribute set of module



*Default:*
` { } `

*Declared by:*
 - [devcontainer\.nix](flake-modules/devcontainer.nix)



## perSystem\.ml-ops\.devcontainer\.pythonEnv



This option has no description\.



*Type:*
package



*Default:*
` <derivation python3-3.9.16-env> `

*Declared by:*
 - [python-envs-pep508\.nix, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.devcontainer\.pythonEnvArgs



This option has no description\.



*Type:*
attribute set of anything

*Declared by:*
 - [python-envs-pep508\.nix, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.devcontainer\.version



This option has no description\.



*Type:*
string



*Default:*
1\.0\.0+\<lastModifiedDate>\.\<hash>

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.devcontainer\.volumeMounts\.emptyDir



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.devcontainer\.volumeMounts\.emptyDir\.\<name>\.medium



This option has no description\.



*Type:*
null or value “Memory” (singular enum)



*Default:*
` null `

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.devcontainer\.volumeMounts\.nfs



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [volume-mount-nfs\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.devcontainer\.volumeMounts\.nfs\.\<name>\.path



This option has no description\.



*Type:*
string



*Example:*
` "/ml_data" `

*Declared by:*
 - [volume-mount-nfs\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.devcontainer\.volumeMounts\.nfs\.\<name>\.server



This option has no description\.



*Type:*
string



*Example:*
` "nfs.example.com" `

*Declared by:*
 - [volume-mount-nfs\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.devserver\.gce\.image-bucket



This option has no description\.



*Type:*
string



*Default:*
` "ml-ops-vm-images" `

*Declared by:*
 - [devserver\.nix](flake-modules/devserver.nix)



## perSystem\.ml-ops\.devserver\.gce\.image-name



This option has no description\.



*Type:*
string

*Declared by:*
 - [devserver\.nix](flake-modules/devserver.nix)



## perSystem\.ml-ops\.devserver\.gce\.image-uri



This option has no description\.



*Type:*
string

*Declared by:*
 - [devserver\.nix](flake-modules/devserver.nix)



## perSystem\.ml-ops\.job



This option has no description\.



*Type:*
module

*Declared by:*
 - [jobs\.nix](flake-modules/jobs.nix)



## perSystem\.ml-ops\.jobs



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [jobs\.nix](flake-modules/jobs.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.LD_LIBRARY_PATH



This option has no description\.



*Type:*
strings concatenated with “:”



*Default:*
` "" `

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.cuda\.packages



This option has no description\.



*Type:*
list of package

*Declared by:*
 - [cuda\.nix, via option perSystem\.ml-ops\.common](flake-modules/cuda.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.cuda\.home



This option has no description\.



*Type:*
package



*Default:*
` <derivation cuda-home> `

*Declared by:*
 - [cuda\.nix, via option perSystem\.ml-ops\.common](flake-modules/cuda.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.devenvShellModule



Common config that will be copied to ` config.devenv.shells. `*\<shell_name>*` .config ` for each shell



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.environmentVariables



This option has no description\.



*Type:*
lazy attribute set of string

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launcher



This option has no description\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [runtime\.nix](flake-modules/runtime.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launcher\.environmentVariables



This option has no description\.



*Type:*
attribute set of string

*Declared by:*
 - [runtime\.nix](flake-modules/runtime.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [jobs\.nix, via option perSystem\.ml-ops\.job](flake-modules/jobs.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.environmentVariables



This option has no description\.



*Type:*
attribute set of string

*Declared by:*
 - [runtime\.nix](flake-modules/runtime.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes



This option has no description\.



*Type:*
submodule

*Declared by:*
 - [kubernetes-job\.nix, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)
 - [gke-credential\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/gke-credential.nix)
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest



This option has no description\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\._module\.environmentVariables



This option has no description\.



*Type:*
unspecified value



*Default:*

```
{
  CUDA_HOME = "/nix/store/iqj47w1mrspfcd2dz5v536hd2766cvam-cuda-home";
  NIX_LD = "/nix/store/jhbyh4fh6qfka5liz44lncdmlwh203ph-ld.so";
  NIX_LD_LIBRARY_PATH = "/nix/store/4rx3vkkd91wkbhpflsplfga603cp1l1c-zlib-1.3/lib:/nix/store/m875ridnpikvz339i31xs5ffbz18yrsq-zstd-1.5.5/lib:/nix/store/xpxln7rqi3pq4m0xpnawhxb2gs0mn1s0-gcc-12.3.0-lib/lib:/nix/store/jmq24f88d1v8aqqsq5pxz293gpziprjx-curl-8.2.1/lib:/nix/store/2kl52k9kclb82bg8nvf4paxb3v972c70-openssl-3.0.10/lib:/nix/store/srrs7gn04rwa4f6zhsjkdacxydwrmzhj-attr-2.5.1/lib:/nix/store/pf3i04kmn0mjicb0lij01j4pr3yhc3m6-libssh-0.10.5/lib:/nix/store/rmgpmxddh2hl3yl43f1kacrpd85cdrs4-bzip2-1.0.8/lib:/nix/store/qxaj0gbpc58ng6pkhcjbn6q955m51ndh-libxml2-2.11.5/lib:/nix/store/aj6gbshd8hvifpa1d8vy0iv688sm81wp-acl-2.3.1/lib:/nix/store/ycq60dgw6yybk84m9j0a9zvjn2wpbfl3-libsodium-1.0.18/lib:/nix/store/rg0kxqkz17y00y6ymfbxkcgqifmhwlmn-util-linux-2.39.2-lib/lib:/nix/store/kfrcs055nxbkwd6yy39h5xxyrj8wrb73-xz-5.4.4/lib:/nix/store/rjz12jr6wa46vcaj7v2nsi2x17jibipm-systemd-253.6/lib:/run/opengl-driver/lib:/run/opengl-driver-32/lib";
}
```

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\.env



This option has no description\.



*Type:*
unspecified value



*Default:*

```
[
  {
    name = "CUDA_HOME";
    value = "/nix/store/iqj47w1mrspfcd2dz5v536hd2766cvam-cuda-home";
  }
  {
    name = "NIX_LD";
    value = "/nix/store/jhbyh4fh6qfka5liz44lncdmlwh203ph-ld.so";
  }
  {
    name = "NIX_LD_LIBRARY_PATH";
    value = "/nix/store/4rx3vkkd91wkbhpflsplfga603cp1l1c-zlib-1.3/lib:/nix/store/m875ridnpikvz339i31xs5ffbz18yrsq-zstd-1.5.5/lib:/nix/store/xpxln7rqi3pq4m0xpnawhxb2gs0mn1s0-gcc-12.3.0-lib/lib:/nix/store/jmq24f88d1v8aqqsq5pxz293gpziprjx-curl-8.2.1/lib:/nix/store/2kl52k9kclb82bg8nvf4paxb3v972c70-openssl-3.0.10/lib:/nix/store/srrs7gn04rwa4f6zhsjkdacxydwrmzhj-attr-2.5.1/lib:/nix/store/pf3i04kmn0mjicb0lij01j4pr3yhc3m6-libssh-0.10.5/lib:/nix/store/rmgpmxddh2hl3yl43f1kacrpd85cdrs4-bzip2-1.0.8/lib:/nix/store/qxaj0gbpc58ng6pkhcjbn6q955m51ndh-libxml2-2.11.5/lib:/nix/store/aj6gbshd8hvifpa1d8vy0iv688sm81wp-acl-2.3.1/lib:/nix/store/ycq60dgw6yybk84m9j0a9zvjn2wpbfl3-libsodium-1.0.18/lib:/nix/store/rg0kxqkz17y00y6ymfbxkcgqifmhwlmn-util-linux-2.39.2-lib/lib:/nix/store/kfrcs055nxbkwd6yy39h5xxyrj8wrb73-xz-5.4.4/lib:/nix/store/rjz12jr6wa46vcaj7v2nsi2x17jibipm-systemd-253.6/lib:/run/opengl-driver/lib:/run/opengl-driver-32/lib";
  }
]
```

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\.image



This option has no description\.



*Type:*
unspecified value



*Default:*
` "registry.hub.docker.com/library/‹name›-‹name›:1.0.0_20231018231117.03c3329c" `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\.volumeMounts



This option has no description\.



*Type:*
unspecified value



*Default:*
` [ ] `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.containers



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.containers\.\<name>\.manifest



This option has no description\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.gke\.cluster



This option has no description\.



*Type:*
string

*Declared by:*
 - [gke-credential\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/gke-credential.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.gke\.region



This option has no description\.



*Type:*
string

*Declared by:*
 - [gke-credential\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/gke-credential.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helm-archive



This option has no description\.



*Type:*
package



*Default:*
` <derivation -name--helm-archive.tgz> `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helm-chart



This option has no description\.



*Type:*
package



*Default:*
` <derivation helm-chart> `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helm-push



This option has no description\.



*Type:*
package



*Default:*
` <derivation -name--helm-push.txt> `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmChartYaml



This option has no description\.



*Type:*
attribute set of anything

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` override ` and ` overrideAttrs `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete\.override



This option has no description\.



*Type:*
list of anything



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete\.overrideAttrs



This option has no description\.



*Type:*
list of anything



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmReleaseName



This option has no description\.



*Type:*
unspecified value



*Default:*
` "‹name›-‹name›" `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates



This option has no description\.



*Type:*
attribute set of attribute set of anything



*Default:*
` { } `

*Declared by:*
 - [kubernetes-job\.nix, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.apiVersion



This option has no description\.



*Type:*
unspecified value



*Default:*
` "batch/v1" `

*Declared by:*
 - [kubernetes-job\.nix, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.kind



This option has no description\.



*Type:*
unspecified value



*Default:*
` "Job" `

*Declared by:*
 - [kubernetes-job\.nix, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.metadata\.name



This option has no description\.



*Type:*
unspecified value



*Default:*
` "‹name›-‹name›-1.0.0-20231018231117.03c3329c" `

*Declared by:*
 - [kubernetes-job\.nix, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.backoffLimit



This option has no description\.



*Type:*
unspecified value



*Default:*
` 0 `

*Declared by:*
 - [kubernetes-job\.nix, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.metadata\.labels\."app\.kubernetes\.io/name"



This option has no description\.



*Type:*
unspecified value



*Default:*
` "‹name›-‹name›" `

*Declared by:*
 - [kubernetes-job\.nix, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.spec\.containers



This option has no description\.



*Type:*
attribute set of (attribute set of anything)



*Default:*
` [ ] `

*Declared by:*
 - [kubernetes-job\.nix, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)
 - [kubernetes-job\.nix, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.spec\.containers\.\<name>\._module\.environmentVariables



This option has no description\.



*Type:*
unspecified value



*Default:*

```
{
  CUDA_HOME = "/nix/store/iqj47w1mrspfcd2dz5v536hd2766cvam-cuda-home";
  NIX_LD = "/nix/store/jhbyh4fh6qfka5liz44lncdmlwh203ph-ld.so";
  NIX_LD_LIBRARY_PATH = "/nix/store/4rx3vkkd91wkbhpflsplfga603cp1l1c-zlib-1.3/lib:/nix/store/m875ridnpikvz339i31xs5ffbz18yrsq-zstd-1.5.5/lib:/nix/store/xpxln7rqi3pq4m0xpnawhxb2gs0mn1s0-gcc-12.3.0-lib/lib:/nix/store/jmq24f88d1v8aqqsq5pxz293gpziprjx-curl-8.2.1/lib:/nix/store/2kl52k9kclb82bg8nvf4paxb3v972c70-openssl-3.0.10/lib:/nix/store/srrs7gn04rwa4f6zhsjkdacxydwrmzhj-attr-2.5.1/lib:/nix/store/pf3i04kmn0mjicb0lij01j4pr3yhc3m6-libssh-0.10.5/lib:/nix/store/rmgpmxddh2hl3yl43f1kacrpd85cdrs4-bzip2-1.0.8/lib:/nix/store/qxaj0gbpc58ng6pkhcjbn6q955m51ndh-libxml2-2.11.5/lib:/nix/store/aj6gbshd8hvifpa1d8vy0iv688sm81wp-acl-2.3.1/lib:/nix/store/ycq60dgw6yybk84m9j0a9zvjn2wpbfl3-libsodium-1.0.18/lib:/nix/store/rg0kxqkz17y00y6ymfbxkcgqifmhwlmn-util-linux-2.39.2-lib/lib:/nix/store/kfrcs055nxbkwd6yy39h5xxyrj8wrb73-xz-5.4.4/lib:/nix/store/rjz12jr6wa46vcaj7v2nsi2x17jibipm-systemd-253.6/lib:/run/opengl-driver/lib:/run/opengl-driver-32/lib";
}
```

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.spec\.containers\.\<name>\.env



This option has no description\.



*Type:*
unspecified value



*Default:*

```
[
  {
    name = "CUDA_HOME";
    value = "/nix/store/iqj47w1mrspfcd2dz5v536hd2766cvam-cuda-home";
  }
  {
    name = "NIX_LD";
    value = "/nix/store/jhbyh4fh6qfka5liz44lncdmlwh203ph-ld.so";
  }
  {
    name = "NIX_LD_LIBRARY_PATH";
    value = "/nix/store/4rx3vkkd91wkbhpflsplfga603cp1l1c-zlib-1.3/lib:/nix/store/m875ridnpikvz339i31xs5ffbz18yrsq-zstd-1.5.5/lib:/nix/store/xpxln7rqi3pq4m0xpnawhxb2gs0mn1s0-gcc-12.3.0-lib/lib:/nix/store/jmq24f88d1v8aqqsq5pxz293gpziprjx-curl-8.2.1/lib:/nix/store/2kl52k9kclb82bg8nvf4paxb3v972c70-openssl-3.0.10/lib:/nix/store/srrs7gn04rwa4f6zhsjkdacxydwrmzhj-attr-2.5.1/lib:/nix/store/pf3i04kmn0mjicb0lij01j4pr3yhc3m6-libssh-0.10.5/lib:/nix/store/rmgpmxddh2hl3yl43f1kacrpd85cdrs4-bzip2-1.0.8/lib:/nix/store/qxaj0gbpc58ng6pkhcjbn6q955m51ndh-libxml2-2.11.5/lib:/nix/store/aj6gbshd8hvifpa1d8vy0iv688sm81wp-acl-2.3.1/lib:/nix/store/ycq60dgw6yybk84m9j0a9zvjn2wpbfl3-libsodium-1.0.18/lib:/nix/store/rg0kxqkz17y00y6ymfbxkcgqifmhwlmn-util-linux-2.39.2-lib/lib:/nix/store/kfrcs055nxbkwd6yy39h5xxyrj8wrb73-xz-5.4.4/lib:/nix/store/rjz12jr6wa46vcaj7v2nsi2x17jibipm-systemd-253.6/lib:/run/opengl-driver/lib:/run/opengl-driver-32/lib";
  }
]
```

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.spec\.containers\.\<name>\.image



This option has no description\.



*Type:*
unspecified value



*Default:*
` "registry.hub.docker.com/library/‹name›-‹name›:1.0.0_20231018231117.03c3329c" `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.spec\.containers\.\<name>\.volumeMounts



This option has no description\.



*Type:*
unspecified value



*Default:*
` [ ] `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.spec\.restartPolicy



This option has no description\.



*Type:*
unspecified value



*Default:*
` "Never" `

*Declared by:*
 - [kubernetes-job\.nix, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.spec\.volumes



This option has no description\.



*Type:*
unspecified value



*Default:*
` [ ] `

*Declared by:*
 - [kubernetes-job\.nix, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` override ` and ` overrideAttrs `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade\.override



This option has no description\.



*Type:*
list of anything



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade\.overrideAttrs



This option has no description\.



*Type:*
list of anything



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.imageRegistry\.host



This option has no description\.



*Type:*
unspecified value



*Default:*
` "registry.hub.docker.com" `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.imageRegistry\.path



This option has no description\.



*Type:*
unspecified value



*Default:*
` "library" `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` override ` and ` overrideAttrs `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage\.override



This option has no description\.



*Type:*
list of anything



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage\.overrideAttrs



This option has no description\.



*Type:*
list of anything



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.volumeMounts



This option has no description\.



*Type:*
list of attribute set of anything

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.volumes



This option has no description\.



*Type:*
list of attribute set of anything

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.mkPython



This option has no description\.



*Type:*
unspecified value



*Default:*
` <function> `

*Declared by:*
 - [python-envs-pep508\.nix, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.name



This option has no description\.



*Type:*
string



*Default:*
` "‹name›" `

*Declared by:*
 - [runtime\.nix](flake-modules/runtime.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.nixLdLibraries



This option has no description\.



*Type:*
list of path

*Declared by:*
 - [nix-ld\.nix, via option perSystem\.ml-ops\.common](flake-modules/nix-ld.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.poetryEnv



This option has no description\.



*Type:*
unspecified value



*Default:*
` <derivation python3-3.10.12-env> `

*Declared by:*
 - [python-envs-poetry\.nix, via option perSystem\.ml-ops\.runtime](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.poetryEnvArgs



This option has no description\.



*Type:*
attribute set of anything

*Declared by:*
 - [python-envs-poetry\.nix, via option perSystem\.ml-ops\.runtime](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.pythonEnv



This option has no description\.



*Type:*
package



*Default:*
` <derivation python3-3.9.16-env> `

*Declared by:*
 - [python-envs-pep508\.nix, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.pythonEnvArgs



This option has no description\.



*Type:*
attribute set of anything

*Declared by:*
 - [python-envs-pep508\.nix, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.version



This option has no description\.



*Type:*
string



*Default:*
1\.0\.0+\<lastModifiedDate>\.\<hash>

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.volumeMounts\.emptyDir



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-empty-dir.nix)
 - [volume-mount-empty-dir\.nix, via option perSystem\.ml-ops\.runtime](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.volumeMounts\.emptyDir\.\<name>\.kubernetesVolume



This option has no description\.



*Type:*
unspecified value



*Default:*

```
{
  emptyDir = {
    medium = null;
  };
}
```

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option perSystem\.ml-ops\.runtime](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.volumeMounts\.emptyDir\.\<name>\.medium



This option has no description\.



*Type:*
null or value “Memory” (singular enum)



*Default:*
` null `

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.volumeMounts\.nfs



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [volume-mount-nfs\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)
 - [volume-mount-nfs\.nix, via option perSystem\.ml-ops\.runtime](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.volumeMounts\.nfs\.\<name>\.kubernetesVolume



This option has no description\.



*Type:*
unspecified value



*Default:*

*Declared by:*
 - [volume-mount-nfs\.nix, via option perSystem\.ml-ops\.runtime](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.volumeMounts\.nfs\.\<name>\.path



This option has no description\.



*Type:*
string



*Example:*
` "/ml_data" `

*Declared by:*
 - [volume-mount-nfs\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.volumeMounts\.nfs\.\<name>\.server



This option has no description\.



*Type:*
string



*Example:*
` "nfs.example.com" `

*Declared by:*
 - [volume-mount-nfs\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.overridablePackage

This option has no description\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.overridablePackage\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.overridablePackage\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` override ` and ` overrideAttrs `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.overridablePackage\.override



This option has no description\.



*Type:*
list of anything



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.overridablePackage\.overrideAttrs



This option has no description\.



*Type:*
list of anything



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.runtime



Common config shared between ml-ops\.jobs and ml-ops\.services



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [runtime\.nix](flake-modules/runtime.nix)



## perSystem\.ml-ops\.runtime\.LD_LIBRARY_PATH



This option has no description\.



*Type:*
strings concatenated with “:”



*Default:*
` "" `

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.runtime\.cuda\.packages



This option has no description\.



*Type:*
list of package

*Declared by:*
 - [cuda\.nix, via option perSystem\.ml-ops\.common](flake-modules/cuda.nix)



## perSystem\.ml-ops\.runtime\.cuda\.home



This option has no description\.



*Type:*
package



*Default:*
` <derivation cuda-home> `

*Declared by:*
 - [cuda\.nix, via option perSystem\.ml-ops\.common](flake-modules/cuda.nix)



## perSystem\.ml-ops\.runtime\.devenvShellModule



Common config that will be copied to ` config.devenv.shells. `*\<shell_name>*` .config ` for each shell



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.runtime\.environmentVariables



This option has no description\.



*Type:*
lazy attribute set of string

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.runtime\.launcher



This option has no description\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [runtime\.nix](flake-modules/runtime.nix)



## perSystem\.ml-ops\.runtime\.launcher\.environmentVariables



This option has no description\.



*Type:*
attribute set of string

*Declared by:*
 - [runtime\.nix](flake-modules/runtime.nix)



## perSystem\.ml-ops\.runtime\.mkPython



This option has no description\.



*Type:*
unspecified value



*Default:*
` <function> `

*Declared by:*
 - [python-envs-pep508\.nix, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.runtime\.name



This option has no description\.



*Type:*
string



*Default:*
` "‹name›" `

*Declared by:*
 - [runtime\.nix](flake-modules/runtime.nix)



## perSystem\.ml-ops\.runtime\.nixLdLibraries



This option has no description\.



*Type:*
list of path

*Declared by:*
 - [nix-ld\.nix, via option perSystem\.ml-ops\.common](flake-modules/nix-ld.nix)



## perSystem\.ml-ops\.runtime\.pythonEnv



This option has no description\.



*Type:*
package



*Default:*
` <derivation python3-3.9.16-env> `

*Declared by:*
 - [python-envs-pep508\.nix, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.runtime\.pythonEnvArgs



This option has no description\.



*Type:*
attribute set of anything

*Declared by:*
 - [python-envs-pep508\.nix, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.runtime\.version



This option has no description\.



*Type:*
string



*Default:*
1\.0\.0+\<lastModifiedDate>\.\<hash>

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.runtime\.volumeMounts\.emptyDir



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.runtime\.volumeMounts\.emptyDir\.\<name>\.medium



This option has no description\.



*Type:*
null or value “Memory” (singular enum)



*Default:*
` null `

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.runtime\.volumeMounts\.nfs



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [volume-mount-nfs\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.runtime\.volumeMounts\.nfs\.\<name>\.path



This option has no description\.



*Type:*
string



*Example:*
` "/ml_data" `

*Declared by:*
 - [volume-mount-nfs\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.runtime\.volumeMounts\.nfs\.\<name>\.server



This option has no description\.



*Type:*
string



*Example:*
` "nfs.example.com" `

*Declared by:*
 - [volume-mount-nfs\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.service



This option has no description\.



*Type:*
module

*Declared by:*
 - [services\.nix](flake-modules/services.nix)



## perSystem\.ml-ops\.services



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [services\.nix](flake-modules/services.nix)



## perSystem\.ml-ops\.services\.\<name>\.LD_LIBRARY_PATH



This option has no description\.



*Type:*
strings concatenated with “:”



*Default:*
` "" `

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.services\.\<name>\.cuda\.packages



This option has no description\.



*Type:*
list of package

*Declared by:*
 - [cuda\.nix, via option perSystem\.ml-ops\.common](flake-modules/cuda.nix)



## perSystem\.ml-ops\.services\.\<name>\.cuda\.home



This option has no description\.



*Type:*
package



*Default:*
` <derivation cuda-home> `

*Declared by:*
 - [cuda\.nix, via option perSystem\.ml-ops\.common](flake-modules/cuda.nix)



## perSystem\.ml-ops\.services\.\<name>\.devenvShellModule



Common config that will be copied to ` config.devenv.shells. `*\<shell_name>*` .config ` for each shell



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.services\.\<name>\.environmentVariables



This option has no description\.



*Type:*
lazy attribute set of string

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.services\.\<name>\.launcher



This option has no description\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [runtime\.nix](flake-modules/runtime.nix)



## perSystem\.ml-ops\.services\.\<name>\.launcher\.environmentVariables



This option has no description\.



*Type:*
attribute set of string

*Declared by:*
 - [runtime\.nix](flake-modules/runtime.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [services\.nix, via option perSystem\.ml-ops\.service](flake-modules/services.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.environmentVariables



This option has no description\.



*Type:*
attribute set of string

*Declared by:*
 - [runtime\.nix](flake-modules/runtime.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes



This option has no description\.



*Type:*
submodule

*Declared by:*
 - [kubernetes-service\.nix, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)
 - [gke-credential\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/gke-credential.nix)
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest



This option has no description\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\._module\.environmentVariables



This option has no description\.



*Type:*
unspecified value



*Default:*

```
{
  CUDA_HOME = "/nix/store/iqj47w1mrspfcd2dz5v536hd2766cvam-cuda-home";
  NIX_LD = "/nix/store/jhbyh4fh6qfka5liz44lncdmlwh203ph-ld.so";
  NIX_LD_LIBRARY_PATH = "/nix/store/4rx3vkkd91wkbhpflsplfga603cp1l1c-zlib-1.3/lib:/nix/store/m875ridnpikvz339i31xs5ffbz18yrsq-zstd-1.5.5/lib:/nix/store/xpxln7rqi3pq4m0xpnawhxb2gs0mn1s0-gcc-12.3.0-lib/lib:/nix/store/jmq24f88d1v8aqqsq5pxz293gpziprjx-curl-8.2.1/lib:/nix/store/2kl52k9kclb82bg8nvf4paxb3v972c70-openssl-3.0.10/lib:/nix/store/srrs7gn04rwa4f6zhsjkdacxydwrmzhj-attr-2.5.1/lib:/nix/store/pf3i04kmn0mjicb0lij01j4pr3yhc3m6-libssh-0.10.5/lib:/nix/store/rmgpmxddh2hl3yl43f1kacrpd85cdrs4-bzip2-1.0.8/lib:/nix/store/qxaj0gbpc58ng6pkhcjbn6q955m51ndh-libxml2-2.11.5/lib:/nix/store/aj6gbshd8hvifpa1d8vy0iv688sm81wp-acl-2.3.1/lib:/nix/store/ycq60dgw6yybk84m9j0a9zvjn2wpbfl3-libsodium-1.0.18/lib:/nix/store/rg0kxqkz17y00y6ymfbxkcgqifmhwlmn-util-linux-2.39.2-lib/lib:/nix/store/kfrcs055nxbkwd6yy39h5xxyrj8wrb73-xz-5.4.4/lib:/nix/store/rjz12jr6wa46vcaj7v2nsi2x17jibipm-systemd-253.6/lib:/run/opengl-driver/lib:/run/opengl-driver-32/lib";
}
```

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\.env



This option has no description\.



*Type:*
unspecified value



*Default:*

```
[
  {
    name = "CUDA_HOME";
    value = "/nix/store/iqj47w1mrspfcd2dz5v536hd2766cvam-cuda-home";
  }
  {
    name = "NIX_LD";
    value = "/nix/store/jhbyh4fh6qfka5liz44lncdmlwh203ph-ld.so";
  }
  {
    name = "NIX_LD_LIBRARY_PATH";
    value = "/nix/store/4rx3vkkd91wkbhpflsplfga603cp1l1c-zlib-1.3/lib:/nix/store/m875ridnpikvz339i31xs5ffbz18yrsq-zstd-1.5.5/lib:/nix/store/xpxln7rqi3pq4m0xpnawhxb2gs0mn1s0-gcc-12.3.0-lib/lib:/nix/store/jmq24f88d1v8aqqsq5pxz293gpziprjx-curl-8.2.1/lib:/nix/store/2kl52k9kclb82bg8nvf4paxb3v972c70-openssl-3.0.10/lib:/nix/store/srrs7gn04rwa4f6zhsjkdacxydwrmzhj-attr-2.5.1/lib:/nix/store/pf3i04kmn0mjicb0lij01j4pr3yhc3m6-libssh-0.10.5/lib:/nix/store/rmgpmxddh2hl3yl43f1kacrpd85cdrs4-bzip2-1.0.8/lib:/nix/store/qxaj0gbpc58ng6pkhcjbn6q955m51ndh-libxml2-2.11.5/lib:/nix/store/aj6gbshd8hvifpa1d8vy0iv688sm81wp-acl-2.3.1/lib:/nix/store/ycq60dgw6yybk84m9j0a9zvjn2wpbfl3-libsodium-1.0.18/lib:/nix/store/rg0kxqkz17y00y6ymfbxkcgqifmhwlmn-util-linux-2.39.2-lib/lib:/nix/store/kfrcs055nxbkwd6yy39h5xxyrj8wrb73-xz-5.4.4/lib:/nix/store/rjz12jr6wa46vcaj7v2nsi2x17jibipm-systemd-253.6/lib:/run/opengl-driver/lib:/run/opengl-driver-32/lib";
  }
]
```

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\.image



This option has no description\.



*Type:*
unspecified value



*Default:*
` "registry.hub.docker.com/library/‹name›-‹name›:1.0.0_20231018231117.03c3329c" `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\.volumeMounts



This option has no description\.



*Type:*
unspecified value



*Default:*
` [ ] `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.containers



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.containers\.\<name>\.manifest



This option has no description\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.gke\.cluster



This option has no description\.



*Type:*
string

*Declared by:*
 - [gke-credential\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/gke-credential.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.gke\.region



This option has no description\.



*Type:*
string

*Declared by:*
 - [gke-credential\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/gke-credential.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helm-archive



This option has no description\.



*Type:*
package



*Default:*
` <derivation -name--helm-archive.tgz> `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helm-chart



This option has no description\.



*Type:*
package



*Default:*
` <derivation helm-chart> `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helm-push



This option has no description\.



*Type:*
package



*Default:*
` <derivation -name--helm-push.txt> `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmChartYaml



This option has no description\.



*Type:*
attribute set of anything

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` override ` and ` overrideAttrs `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete\.override



This option has no description\.



*Type:*
list of anything



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete\.overrideAttrs



This option has no description\.



*Type:*
list of anything



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmReleaseName



This option has no description\.



*Type:*
unspecified value



*Default:*
` "‹name›-‹name›" `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates



This option has no description\.



*Type:*
attribute set of attribute set of anything



*Default:*
` { } `

*Declared by:*
 - [kubernetes-service\.nix, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.apiVersion



This option has no description\.



*Type:*
unspecified value



*Default:*
` "apps/v1" `

*Declared by:*
 - [kubernetes-service\.nix, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.kind



This option has no description\.



*Type:*
unspecified value



*Default:*
` "Deployment" `

*Declared by:*
 - [kubernetes-service\.nix, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.metadata\.name



This option has no description\.



*Type:*
unspecified value



*Default:*
` "‹name›-‹name›" `

*Declared by:*
 - [kubernetes-service\.nix, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.selector\.matchLabels\."app\.kubernetes\.io/name"



This option has no description\.



*Type:*
unspecified value



*Default:*
` "‹name›-‹name›" `

*Declared by:*
 - [kubernetes-service\.nix, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.template\.metadata\.labels\."app\.kubernetes\.io/name"



This option has no description\.



*Type:*
unspecified value



*Default:*
` "‹name›-‹name›" `

*Declared by:*
 - [kubernetes-service\.nix, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.template\.spec\.containers



This option has no description\.



*Type:*
attribute set of (attribute set of anything)

*Declared by:*
 - [kubernetes-service\.nix, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.template\.spec\.containers\.\<name>\._module\.environmentVariables



This option has no description\.



*Type:*
unspecified value



*Default:*

```
{
  CUDA_HOME = "/nix/store/iqj47w1mrspfcd2dz5v536hd2766cvam-cuda-home";
  NIX_LD = "/nix/store/jhbyh4fh6qfka5liz44lncdmlwh203ph-ld.so";
  NIX_LD_LIBRARY_PATH = "/nix/store/4rx3vkkd91wkbhpflsplfga603cp1l1c-zlib-1.3/lib:/nix/store/m875ridnpikvz339i31xs5ffbz18yrsq-zstd-1.5.5/lib:/nix/store/xpxln7rqi3pq4m0xpnawhxb2gs0mn1s0-gcc-12.3.0-lib/lib:/nix/store/jmq24f88d1v8aqqsq5pxz293gpziprjx-curl-8.2.1/lib:/nix/store/2kl52k9kclb82bg8nvf4paxb3v972c70-openssl-3.0.10/lib:/nix/store/srrs7gn04rwa4f6zhsjkdacxydwrmzhj-attr-2.5.1/lib:/nix/store/pf3i04kmn0mjicb0lij01j4pr3yhc3m6-libssh-0.10.5/lib:/nix/store/rmgpmxddh2hl3yl43f1kacrpd85cdrs4-bzip2-1.0.8/lib:/nix/store/qxaj0gbpc58ng6pkhcjbn6q955m51ndh-libxml2-2.11.5/lib:/nix/store/aj6gbshd8hvifpa1d8vy0iv688sm81wp-acl-2.3.1/lib:/nix/store/ycq60dgw6yybk84m9j0a9zvjn2wpbfl3-libsodium-1.0.18/lib:/nix/store/rg0kxqkz17y00y6ymfbxkcgqifmhwlmn-util-linux-2.39.2-lib/lib:/nix/store/kfrcs055nxbkwd6yy39h5xxyrj8wrb73-xz-5.4.4/lib:/nix/store/rjz12jr6wa46vcaj7v2nsi2x17jibipm-systemd-253.6/lib:/run/opengl-driver/lib:/run/opengl-driver-32/lib";
}
```

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.template\.spec\.containers\.\<name>\.env



This option has no description\.



*Type:*
unspecified value



*Default:*

```
[
  {
    name = "CUDA_HOME";
    value = "/nix/store/iqj47w1mrspfcd2dz5v536hd2766cvam-cuda-home";
  }
  {
    name = "NIX_LD";
    value = "/nix/store/jhbyh4fh6qfka5liz44lncdmlwh203ph-ld.so";
  }
  {
    name = "NIX_LD_LIBRARY_PATH";
    value = "/nix/store/4rx3vkkd91wkbhpflsplfga603cp1l1c-zlib-1.3/lib:/nix/store/m875ridnpikvz339i31xs5ffbz18yrsq-zstd-1.5.5/lib:/nix/store/xpxln7rqi3pq4m0xpnawhxb2gs0mn1s0-gcc-12.3.0-lib/lib:/nix/store/jmq24f88d1v8aqqsq5pxz293gpziprjx-curl-8.2.1/lib:/nix/store/2kl52k9kclb82bg8nvf4paxb3v972c70-openssl-3.0.10/lib:/nix/store/srrs7gn04rwa4f6zhsjkdacxydwrmzhj-attr-2.5.1/lib:/nix/store/pf3i04kmn0mjicb0lij01j4pr3yhc3m6-libssh-0.10.5/lib:/nix/store/rmgpmxddh2hl3yl43f1kacrpd85cdrs4-bzip2-1.0.8/lib:/nix/store/qxaj0gbpc58ng6pkhcjbn6q955m51ndh-libxml2-2.11.5/lib:/nix/store/aj6gbshd8hvifpa1d8vy0iv688sm81wp-acl-2.3.1/lib:/nix/store/ycq60dgw6yybk84m9j0a9zvjn2wpbfl3-libsodium-1.0.18/lib:/nix/store/rg0kxqkz17y00y6ymfbxkcgqifmhwlmn-util-linux-2.39.2-lib/lib:/nix/store/kfrcs055nxbkwd6yy39h5xxyrj8wrb73-xz-5.4.4/lib:/nix/store/rjz12jr6wa46vcaj7v2nsi2x17jibipm-systemd-253.6/lib:/run/opengl-driver/lib:/run/opengl-driver-32/lib";
  }
]
```

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.template\.spec\.containers\.\<name>\.image



This option has no description\.



*Type:*
unspecified value



*Default:*
` "registry.hub.docker.com/library/‹name›-‹name›:1.0.0_20231018231117.03c3329c" `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.template\.spec\.containers\.\<name>\.volumeMounts



This option has no description\.



*Type:*
unspecified value



*Default:*
` [ ] `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.template\.spec\.volumes



This option has no description\.



*Type:*
unspecified value



*Default:*
` [ ] `

*Declared by:*
 - [kubernetes-service\.nix, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.service\.apiVersion



This option has no description\.



*Type:*
unspecified value



*Default:*
` "v1" `

*Declared by:*
 - [kubernetes-service\.nix, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.service\.kind



This option has no description\.



*Type:*
unspecified value



*Default:*
` "Service" `

*Declared by:*
 - [kubernetes-service\.nix, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.service\.metadata\.name



This option has no description\.



*Type:*
unspecified value



*Default:*
` "‹name›-‹name›-20231018231117-03c3329c" `

*Declared by:*
 - [kubernetes-service\.nix, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.service\.spec\.selector\."app\.kubernetes\.io/name"



This option has no description\.



*Type:*
unspecified value



*Default:*
` "‹name›-‹name›" `

*Declared by:*
 - [kubernetes-service\.nix, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.service\.spec\.type



This option has no description\.



*Type:*
unspecified value



*Default:*
` "LoadBalancer" `

*Declared by:*
 - [kubernetes-service\.nix, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` override ` and ` overrideAttrs `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade\.override



This option has no description\.



*Type:*
list of anything



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade\.overrideAttrs



This option has no description\.



*Type:*
list of anything



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.imageRegistry\.host



This option has no description\.



*Type:*
unspecified value



*Default:*
` "registry.hub.docker.com" `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.imageRegistry\.path



This option has no description\.



*Type:*
unspecified value



*Default:*
` "library" `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` override ` and ` overrideAttrs `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage\.override



This option has no description\.



*Type:*
list of anything



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage\.overrideAttrs



This option has no description\.



*Type:*
list of anything



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.volumeMounts



This option has no description\.



*Type:*
list of attribute set of anything

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.volumes



This option has no description\.



*Type:*
list of attribute set of anything

*Declared by:*
 - [kubernetes\.nix, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.mkPython



This option has no description\.



*Type:*
unspecified value



*Default:*
` <function> `

*Declared by:*
 - [python-envs-pep508\.nix, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.services\.\<name>\.name



This option has no description\.



*Type:*
string



*Default:*
` "‹name›" `

*Declared by:*
 - [runtime\.nix](flake-modules/runtime.nix)



## perSystem\.ml-ops\.services\.\<name>\.nixLdLibraries



This option has no description\.



*Type:*
list of path

*Declared by:*
 - [nix-ld\.nix, via option perSystem\.ml-ops\.common](flake-modules/nix-ld.nix)



## perSystem\.ml-ops\.services\.\<name>\.poetryEnv



This option has no description\.



*Type:*
unspecified value



*Default:*
` <derivation python3-3.10.12-env> `

*Declared by:*
 - [python-envs-poetry\.nix, via option perSystem\.ml-ops\.runtime](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.services\.\<name>\.poetryEnvArgs



This option has no description\.



*Type:*
attribute set of anything

*Declared by:*
 - [python-envs-poetry\.nix, via option perSystem\.ml-ops\.runtime](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.services\.\<name>\.pythonEnv



This option has no description\.



*Type:*
package



*Default:*
` <derivation python3-3.9.16-env> `

*Declared by:*
 - [python-envs-pep508\.nix, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.services\.\<name>\.pythonEnvArgs



This option has no description\.



*Type:*
attribute set of anything

*Declared by:*
 - [python-envs-pep508\.nix, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.services\.\<name>\.version



This option has no description\.



*Type:*
string



*Default:*
1\.0\.0+\<lastModifiedDate>\.\<hash>

*Declared by:*
 - [common\.nix](flake-modules/common.nix)



## perSystem\.ml-ops\.services\.\<name>\.volumeMounts\.emptyDir



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-empty-dir.nix)
 - [volume-mount-empty-dir\.nix, via option perSystem\.ml-ops\.runtime](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.services\.\<name>\.volumeMounts\.emptyDir\.\<name>\.kubernetesVolume



This option has no description\.



*Type:*
unspecified value



*Default:*

```
{
  emptyDir = {
    medium = null;
  };
}
```

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option perSystem\.ml-ops\.runtime](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.services\.\<name>\.volumeMounts\.emptyDir\.\<name>\.medium



This option has no description\.



*Type:*
null or value “Memory” (singular enum)



*Default:*
` null `

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.services\.\<name>\.volumeMounts\.nfs



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [volume-mount-nfs\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)
 - [volume-mount-nfs\.nix, via option perSystem\.ml-ops\.runtime](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.services\.\<name>\.volumeMounts\.nfs\.\<name>\.kubernetesVolume



This option has no description\.



*Type:*
unspecified value



*Default:*

*Declared by:*
 - [volume-mount-nfs\.nix, via option perSystem\.ml-ops\.runtime](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.services\.\<name>\.volumeMounts\.nfs\.\<name>\.path



This option has no description\.



*Type:*
string



*Example:*
` "/ml_data" `

*Declared by:*
 - [volume-mount-nfs\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.services\.\<name>\.volumeMounts\.nfs\.\<name>\.server

This option has no description\.



*Type:*
string



*Example:*
` "nfs.example.com" `

*Declared by:*
 - [volume-mount-nfs\.nix, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)


