## perSystem

A function from system to flake-like attributes omitting the ` <system> ` attribute\.

Modules defined here have access to the suboptions and [some convenient module arguments](\.\./module-arguments\.html)\.



*Type:*
module

*Declared by:*
 - [vscode\.nix, via option flake\.flakeModules\.vscode](flake-modules/vscode.nix)
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs](flake-modules/volume-mount-nfs.nix)
 - [volume-mount-empty-dir\.nix, via option flake\.flakeModules\.volumeMountEmptyDir](flake-modules/volume-mount-empty-dir.nix)
 - [skypilot\.nix, via option flake\.flakeModules\.skypilot](flake-modules/skypilot.nix)
 - [services\.nix, via option flake\.flakeModules\.services](flake-modules/services.nix)
 - [runtime\.nix, via option flake\.flakeModules\.runtime](flake-modules/runtime.nix)
 - [python-vscode\.nix, via option flake\.flakeModules\.pythonVscode](flake-modules/python-vscode.nix)
 - [python-package\.nix, via option flake\.flakeModules\.pythonPackage](flake-modules/python-package.nix)
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry](flake-modules/python-envs-poetry.nix)
 - [python-envs-pep508\.nix, via option flake\.flakeModules\.pythonEnvsPep508](flake-modules/python-envs-pep508.nix)
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)
 - [options-document\.nix, via option flake\.flakeModules\.optionsDocument](flake-modules/options-document.nix)
 - [nixpkgs\.nix, via option flake\.flakeModules\.nixpkgs](flake-modules/nixpkgs.nix)
 - [nix-ld\.nix, via option flake\.flakeModules\.nixLd](flake-modules/nix-ld.nix)
 - [nix-ide\.nix, via option flake\.flakeModules\.nixIde](flake-modules/nix-ide.nix)
 - [link-nvidia-drivers\.nix, via option flake\.flakeModules\.linkNvidiaDrivers](flake-modules/link-nvidia-drivers.nix)
 - [kubernetes-service\.nix, via option flake\.flakeModules\.kubernetesService](flake-modules/kubernetes-service.nix)
 - [kubernetes-job\.nix, via option flake\.flakeModules\.kubernetesJob](flake-modules/kubernetes-job.nix)
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes](flake-modules/kubernetes.nix)
 - [jobs\.nix, via option flake\.flakeModules\.jobs](flake-modules/jobs.nix)
 - [gke-credential\.nix, via option flake\.flakeModules\.gkeCredential](flake-modules/gke-credential.nix)
 - [devserver\.nix, via option flake\.flakeModules\.devserver](flake-modules/devserver.nix)
 - [devenv-python-with-libstdc++\.nix, via option flake\.flakeModules\.devenvPythonWithLibstdcxx](flake-modules/devenv-python-with-libstdc++.nix)
 - [devcontainer-gcp-cli-tools\.nix, via option flake\.flakeModules\.devcontainerGcpCliTools](flake-modules/devcontainer-gcp-cli-tools.nix)
 - [devcontainer-azure-cli-tools\.nix, via option flake\.flakeModules\.devcontainerAzureCliTools](flake-modules/devcontainer-azure-cli-tools.nix)
 - [devcontainer\.nix, via option flake\.flakeModules\.devcontainer](flake-modules/devcontainer.nix)
 - [cuda\.nix, via option flake\.flakeModules\.cuda](flake-modules/cuda.nix)
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)
 - [aks-credential\.nix, via option flake\.flakeModules\.aksCredential](flake-modules/aks-credential.nix)
 - [options-document\.nix](flake-modules/options-document.nix)



## perSystem\.ml-ops\.common



Settings shared between devcontainer and all jobs and services\.
For example, config of ` perSystem.ml-ops.common.xxx ` will be copied to ` perSystem.ml-ops.devcontainer.xxx `, all ` perSystem.ml-ops.jobs.<name>.xx ` and all ` perSystem.ml-ops.services.<name>.xxx `\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [python-package\.nix, via option flake\.flakeModules\.pythonPackage](flake-modules/python-package.nix)
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.common\.LD_LIBRARY_PATH



This option has no description\.



*Type:*
strings concatenated with “:”



*Default:*
` "" `

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.common\.devenvShellModule



Common config that will be copied to ` config.devenv.shells. `*\<shell_name>*` .config ` for each shell\.

See [devenv options](https://devenv\.sh/reference/options/) for supported nested options\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.common\.environmentVariables



Environment variables for either devcontainer, jobs or services\.

For devcontainer, these variables will be copied to via ` devenv `’s [env](https://devenv\.sh/reference/options/\#env) config\.
For kubernetes jobs and services, these variables will be copied to the Pods’ ` spec.containers.*.env ` field\.



*Type:*
lazy attribute set of string



*Default:*
` { } `

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.common\.pythonPackage



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [python-package\.nix, via option flake\.flakeModules\.pythonPackage](flake-modules/python-package.nix)



## perSystem\.ml-ops\.common\.pythonPackage\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.common\.pythonPackage\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` pipe `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.common\.pythonPackage\.pipe



This option has no description\.



*Type:*
list of function that evaluates to a(n) package



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.common\.version



Version of job or service\.
This will be used as the image tag\.



*Type:*
string



*Default:*
1\.0\.0+\<lastModifiedDate>\.\<hash>

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.devcontainer



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [devcontainer\.nix, via option flake\.flakeModules\.devcontainer](flake-modules/devcontainer.nix)



## perSystem\.ml-ops\.devcontainer\.LD_LIBRARY_PATH



This option has no description\.



*Type:*
strings concatenated with “:”



*Default:*
` "" `

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.devcontainer\.cuda\.packages



This option has no description\.



*Type:*
list of package

*Declared by:*
 - [cuda\.nix, via option flake\.flakeModules\.cuda, via option perSystem\.ml-ops\.common](flake-modules/cuda.nix)



## perSystem\.ml-ops\.devcontainer\.cuda\.home



This option has no description\.



*Type:*
package



*Default:*
` <derivation cuda-home> `

*Declared by:*
 - [cuda\.nix, via option flake\.flakeModules\.cuda, via option perSystem\.ml-ops\.common](flake-modules/cuda.nix)



## perSystem\.ml-ops\.devcontainer\.devenvShellModule



Common config that will be copied to ` config.devenv.shells. `*\<shell_name>*` .config ` for each shell\.

See [devenv options](https://devenv\.sh/reference/options/) for supported nested options\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.devcontainer\.environmentVariables



Environment variables for either devcontainer, jobs or services\.

For devcontainer, these variables will be copied to via ` devenv `’s [env](https://devenv\.sh/reference/options/\#env) config\.
For kubernetes jobs and services, these variables will be copied to the Pods’ ` spec.containers.*.env ` field\.



*Type:*
lazy attribute set of string



*Default:*
` { } `

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.devcontainer\.mkPython



This option has no description\.



*Type:*
unspecified value



*Default:*
` <function> `

*Declared by:*
 - [python-envs-pep508\.nix, via option flake\.flakeModules\.pythonEnvsPep508, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.devcontainer\.mountVolumeWithSudo



This option has no description\.



*Type:*
unspecified value



*Default:*
` true `

*Declared by:*
 - [devcontainer\.nix, via option flake\.flakeModules\.devcontainer](flake-modules/devcontainer.nix)



## perSystem\.ml-ops\.devcontainer\.nixDirenvFlakeFlags



This option has no description\.



*Type:*
list of string

*Declared by:*
 - [devcontainer\.nix, via option flake\.flakeModules\.devcontainer](flake-modules/devcontainer.nix)



## perSystem\.ml-ops\.devcontainer\.nixLdLibraries



This option has no description\.



*Type:*
list of path

*Declared by:*
 - [nix-ld\.nix, via option flake\.flakeModules\.nixLd, via option perSystem\.ml-ops\.common](flake-modules/nix-ld.nix)



## perSystem\.ml-ops\.devcontainer\.nixago\.requests



This option has no description\.



*Type:*
attribute set of module



*Default:*
` { } `

*Declared by:*
 - [devcontainer\.nix, via option flake\.flakeModules\.devcontainer](flake-modules/devcontainer.nix)



## perSystem\.ml-ops\.devcontainer\.poetry2nix\.pkgs



The nix package set to use for poetry2nix\.

It is by default set to the nixpkgs from ` nix-ml-ops `’s lock file with a python package specified by ` perSystem.ml-ops.common.pythonPackage `\.



*Type:*
unspecified value



*Default:*

```
pkgs.appendOverlays [
  (self: super: {
    ${common.config.pythonPackage.base-package.pythonAttr} = lib.pipe super.${common.config.pythonPackage.base-package.pythonAttr} common.config.pythonPackage.pipe;
  })
]

```

*Declared by:*
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry, via option perSystem\.ml-ops\.common](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.devcontainer\.poetry2nix\.poetry2nixLib



This option has no description\.



*Type:*
unspecified value



*Default:*

```
{
  callPackage = <function>;
  cleanPythonSources = <function, args: {src}>;
  cli = <derivation poetry2nix-cli-0>;
  defaultPoetryOverrides = <function>;
  mkDefaultPoetryOverrides = <function>;
  mkPoetryApplication = <function, args: {checkGroups?, extras?, groups?, meta?, overrides?, poetrylock?, preferWheels?, projectDir?, pwd?, pyproject?, python?, src?}>;
  mkPoetryEditablePackage = <function, args: {editablePackageSources, projectDir?, pyProject?, pyproject?, python?}>;
  mkPoetryEnv = <function, args: {checkGroups?, editablePackageSources?, extraPackages?, extras?, groups?, overrides?, poetrylock?, preferWheels?, projectDir?, pwd?, pyproject?, python?}>;
  mkPoetryPackages = <function, args: {checkGroups?, editablePackageSources?, extras?, groups?, overrides?, poetrylock?, poetrylockPos?, preferWheels?, projectDir?, pwd?, pyProject?, pyproject?, python?}>;
  mkPoetryScriptsPackage = <function, args: {projectDir?, pyProject?, pyproject?, python?, scripts?}>;
  newScope = <function>;
  overrideScope = <function>;
  overrideScope' = <function>;
  overrides = {
    withDefaults = <function>;
    withoutDefaults = <function>;
  };
  packages = <function>;
}
```

*Declared by:*
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry, via option perSystem\.ml-ops\.common](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.devcontainer\.poetry2nix\.python



This option has no description\.



*Type:*
unspecified value



*Default:*
` <derivation python3-3.11.5> `

*Declared by:*
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry, via option perSystem\.ml-ops\.common](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.devcontainer\.pythonEnv



This option has no description\.



*Type:*
package



*Default:*
` <derivation python3-3.9.16-env> `

*Declared by:*
 - [python-envs-pep508\.nix, via option flake\.flakeModules\.pythonEnvsPep508, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.devcontainer\.pythonEnvArgs



This option has no description\.



*Type:*
attribute set of anything

*Declared by:*
 - [python-envs-pep508\.nix, via option flake\.flakeModules\.pythonEnvsPep508, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.devcontainer\.pythonPackage



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [python-package\.nix, via option flake\.flakeModules\.pythonPackage](flake-modules/python-package.nix)



## perSystem\.ml-ops\.devcontainer\.pythonPackage\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.devcontainer\.pythonPackage\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` pipe `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.devcontainer\.pythonPackage\.pipe



This option has no description\.



*Type:*
list of function that evaluates to a(n) package



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.devcontainer\.version



Version of job or service\.
This will be used as the image tag\.



*Type:*
string



*Default:*
1\.0\.0+\<lastModifiedDate>\.\<hash>

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.devcontainer\.volumeMounts\.emptyDir



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option flake\.flakeModules\.volumeMountEmptyDir, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.devcontainer\.volumeMounts\.emptyDir\.\<name>\.medium



This option has no description\.



*Type:*
null or value “Memory” (singular enum)



*Default:*
` null `

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option flake\.flakeModules\.volumeMountEmptyDir, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.devcontainer\.volumeMounts\.nfs



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.devcontainer\.volumeMounts\.nfs\.\<name>\.mountOptions



This option has no description\.



*Type:*
list of string



*Default:*

```
[
  "rw"
  "intr"
  "nolock"
]
```

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.devcontainer\.volumeMounts\.nfs\.\<name>\.path



This option has no description\.



*Type:*
string



*Example:*
` "/ml_data" `

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.devcontainer\.volumeMounts\.nfs\.\<name>\.server



This option has no description\.



*Type:*
string



*Example:*
` "nfs.example.com" `

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.devserver\.azure\.blobname



This option has no description\.



*Type:*
string

*Declared by:*
 - [devserver\.nix, via option flake\.flakeModules\.devserver](flake-modules/devserver.nix)



## perSystem\.ml-ops\.devserver\.azure\.containername



This option has no description\.



*Type:*
string



*Default:*
` "images" `

*Declared by:*
 - [devserver\.nix, via option flake\.flakeModules\.devserver](flake-modules/devserver.nix)



## perSystem\.ml-ops\.devserver\.azure\.imageName



This option has no description\.



*Type:*
string

*Declared by:*
 - [devserver\.nix, via option flake\.flakeModules\.devserver](flake-modules/devserver.nix)



## perSystem\.ml-ops\.devserver\.azure\.stgaccountname



This option has no description\.



*Type:*
string



*Default:*
` "mlsolutionimages" `

*Declared by:*
 - [devserver\.nix, via option flake\.flakeModules\.devserver](flake-modules/devserver.nix)



## perSystem\.ml-ops\.devserver\.gce\.image-bucket



This option has no description\.



*Type:*
string



*Default:*
` "ml-ops-vm-images" `

*Declared by:*
 - [devserver\.nix, via option flake\.flakeModules\.devserver](flake-modules/devserver.nix)



## perSystem\.ml-ops\.devserver\.gce\.image-name



This option has no description\.



*Type:*
string

*Declared by:*
 - [devserver\.nix, via option flake\.flakeModules\.devserver](flake-modules/devserver.nix)



## perSystem\.ml-ops\.devserver\.gce\.image-uri



This option has no description\.



*Type:*
string

*Declared by:*
 - [devserver\.nix, via option flake\.flakeModules\.devserver](flake-modules/devserver.nix)



## perSystem\.ml-ops\.devserver\.gceEfi\.image-bucket



This option has no description\.



*Type:*
string



*Default:*
` "ml-ops-vm-images" `

*Declared by:*
 - [devserver\.nix, via option flake\.flakeModules\.devserver](flake-modules/devserver.nix)



## perSystem\.ml-ops\.devserver\.gceEfi\.image-name



This option has no description\.



*Type:*
string

*Declared by:*
 - [devserver\.nix, via option flake\.flakeModules\.devserver](flake-modules/devserver.nix)



## perSystem\.ml-ops\.devserver\.gceEfi\.image-uri



This option has no description\.



*Type:*
string

*Declared by:*
 - [devserver\.nix, via option flake\.flakeModules\.devserver](flake-modules/devserver.nix)



## perSystem\.ml-ops\.devserver\.hyperv\.blobname



This option has no description\.



*Type:*
string

*Declared by:*
 - [devserver\.nix, via option flake\.flakeModules\.devserver](flake-modules/devserver.nix)



## perSystem\.ml-ops\.devserver\.hyperv\.containername



This option has no description\.



*Type:*
string



*Default:*
` "images" `

*Declared by:*
 - [devserver\.nix, via option flake\.flakeModules\.devserver](flake-modules/devserver.nix)



## perSystem\.ml-ops\.devserver\.hyperv\.stgaccountname



This option has no description\.



*Type:*
string



*Default:*
` "mlsolutionimages" `

*Declared by:*
 - [devserver\.nix, via option flake\.flakeModules\.devserver](flake-modules/devserver.nix)



## perSystem\.ml-ops\.job



The shared options among all jobs\.

For example, config of ` perSystem.ml-ops.job.xxx ` will be copied to all ` perSystem.ml-ops.jobs.<name>.xxx `\.



*Type:*
module

*Declared by:*
 - [jobs\.nix, via option flake\.flakeModules\.jobs](flake-modules/jobs.nix)



## perSystem\.ml-ops\.jobs



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [jobs\.nix, via option flake\.flakeModules\.jobs](flake-modules/jobs.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.LD_LIBRARY_PATH



This option has no description\.



*Type:*
strings concatenated with “:”



*Default:*
` "" `

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.cuda\.packages



This option has no description\.



*Type:*
list of package

*Declared by:*
 - [cuda\.nix, via option flake\.flakeModules\.cuda, via option perSystem\.ml-ops\.common](flake-modules/cuda.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.cuda\.home



This option has no description\.



*Type:*
package



*Default:*
` <derivation cuda-home> `

*Declared by:*
 - [cuda\.nix, via option flake\.flakeModules\.cuda, via option perSystem\.ml-ops\.common](flake-modules/cuda.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.devenvShellModule



Common config that will be copied to ` config.devenv.shells. `*\<shell_name>*` .config ` for each shell\.

See [devenv options](https://devenv\.sh/reference/options/) for supported nested options\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.environmentVariables



Environment variables for either devcontainer, jobs or services\.

For devcontainer, these variables will be copied to via ` devenv `’s [env](https://devenv\.sh/reference/options/\#env) config\.
For kubernetes jobs and services, these variables will be copied to the Pods’ ` spec.containers.*.env ` field\.



*Type:*
lazy attribute set of string



*Default:*
` { } `

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launcher



This option has no description\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [runtime\.nix, via option flake\.flakeModules\.runtime](flake-modules/runtime.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launcher\.environmentVariables



This option has no description\.



*Type:*
attribute set of string

*Declared by:*
 - [runtime\.nix, via option flake\.flakeModules\.runtime](flake-modules/runtime.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [jobs\.nix, via option flake\.flakeModules\.jobs, via option perSystem\.ml-ops\.job](flake-modules/jobs.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.environmentVariables



This option has no description\.



*Type:*
attribute set of string

*Declared by:*
 - [runtime\.nix, via option flake\.flakeModules\.runtime](flake-modules/runtime.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes



This option has no description\.



*Type:*
submodule

*Declared by:*
 - [kubernetes-job\.nix, via option flake\.flakeModules\.kubernetesJob, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)
 - [gke-credential\.nix, via option flake\.flakeModules\.gkeCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/gke-credential.nix)
 - [aks-credential\.nix, via option flake\.flakeModules\.aksCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/aks-credential.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.aks



This option has no description\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [aks-credential\.nix, via option flake\.flakeModules\.aksCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/aks-credential.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.aks\.cluster



This option has no description\.



*Type:*
string



*Default:*
` "ml-aks" `

*Declared by:*
 - [aks-credential\.nix, via option flake\.flakeModules\.aksCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/aks-credential.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.aks\.registryName



This option has no description\.



*Type:*
string



*Default:*
` "mlsolutionregistry" `

*Declared by:*
 - [aks-credential\.nix, via option flake\.flakeModules\.aksCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/aks-credential.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.aks\.resourcegroup



This option has no description\.



*Type:*
string



*Default:*
` "ml-solutions" `

*Declared by:*
 - [aks-credential\.nix, via option flake\.flakeModules\.aksCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/aks-credential.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest



This option has no description\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\._module\.environmentVariables



This option has no description\.



*Type:*
unspecified value



*Default:*
` launchers.<name>.environmentVariables `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\.env



This option has no description\.



*Type:*
unspecified value



*Default:*

```
lib.attrsets.mapAttrsToList
  lib.attrsets.nameValuePair
  perSystem.ml-ops.services|jobs.<name>.launchers.<name>.kubernetes.containerManifest._module.environmentVariables

```

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\.image



This option has no description\.



*Type:*
unspecified value



*Default:*
` perSystem.services|jobs.<name>.launchers.<name>.kubernetes.<name>.overridden-package.remoteImage `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\.name



This option has no description\.



*Type:*
string

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\.volumeMounts



This option has no description\.



*Type:*
unspecified value



*Default:*
` [ ] `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.containers



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.containers\.\<name>\.manifest



This option has no description\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.gke



This option has no description\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [gke-credential\.nix, via option flake\.flakeModules\.gkeCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/gke-credential.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.gke\.cluster



This option has no description\.



*Type:*
string

*Declared by:*
 - [gke-credential\.nix, via option flake\.flakeModules\.gkeCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/gke-credential.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.gke\.region



This option has no description\.



*Type:*
string

*Declared by:*
 - [gke-credential\.nix, via option flake\.flakeModules\.gkeCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/gke-credential.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helm-chart



This option has no description\.



*Type:*
package



*Default:*
` <derivation helm-chart> `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmChartYaml



This option has no description\.



*Type:*
attribute set of anything

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` pipe `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete\.pipe



This option has no description\.



*Type:*
list of function that evaluates to a(n) package



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmReleaseName



This option has no description\.



*Type:*
unspecified value



*Default:*
` "‹name›-‹name›" `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates



This option has no description\.



*Type:*
attribute set of attribute set of anything



*Default:*
` { } `

*Declared by:*
 - [kubernetes-job\.nix, via option flake\.flakeModules\.kubernetesJob, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.apiVersion



This option has no description\.



*Type:*
unspecified value



*Default:*
` "batch/v1" `

*Declared by:*
 - [kubernetes-job\.nix, via option flake\.flakeModules\.kubernetesJob, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.kind



This option has no description\.



*Type:*
unspecified value



*Default:*
` "Job" `

*Declared by:*
 - [kubernetes-job\.nix, via option flake\.flakeModules\.kubernetesJob, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.metadata\.name



This option has no description\.



*Type:*
unspecified value



*Default:*

```
"${job.config._module.args.name}-${launcher.config._module.args.name}-${builtins.replaceStrings ["+"] ["-"] job.config.version}"

```

*Declared by:*
 - [kubernetes-job\.nix, via option flake\.flakeModules\.kubernetesJob, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.backoffLimit



This option has no description\.



*Type:*
unspecified value



*Default:*
` 0 `

*Declared by:*
 - [kubernetes-job\.nix, via option flake\.flakeModules\.kubernetesJob, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.metadata\.labels\."app\.kubernetes\.io/name"



This option has no description\.



*Type:*
unspecified value



*Default:*
` "‹name›-‹name›" `

*Declared by:*
 - [kubernetes-job\.nix, via option flake\.flakeModules\.kubernetesJob, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.spec\.containers



This option has no description\.



*Type:*
attribute set of (attribute set of anything)

*Declared by:*
 - [kubernetes-job\.nix, via option flake\.flakeModules\.kubernetesJob, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.spec\.containers\.\<name>\._module\.environmentVariables



This option has no description\.



*Type:*
unspecified value



*Default:*
` launchers.<name>.environmentVariables `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.spec\.containers\.\<name>\.env



This option has no description\.



*Type:*
unspecified value



*Default:*

```
lib.attrsets.mapAttrsToList
  lib.attrsets.nameValuePair
  perSystem.ml-ops.services|jobs.<name>.launchers.<name>.kubernetes.containerManifest._module.environmentVariables

```

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.spec\.containers\.\<name>\.image



This option has no description\.



*Type:*
unspecified value



*Default:*
` perSystem.services|jobs.<name>.launchers.<name>.kubernetes.<name>.overridden-package.remoteImage `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.spec\.containers\.\<name>\.name



This option has no description\.



*Type:*
string

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.spec\.containers\.\<name>\.volumeMounts



This option has no description\.



*Type:*
unspecified value



*Default:*
` [ ] `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.spec\.restartPolicy



This option has no description\.



*Type:*
unspecified value



*Default:*
` "Never" `

*Declared by:*
 - [kubernetes-job\.nix, via option flake\.flakeModules\.kubernetesJob, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.job\.spec\.template\.spec\.volumes



This option has no description\.



*Type:*
unspecified value



*Default:*
` [ ] `

*Declared by:*
 - [kubernetes-job\.nix, via option flake\.flakeModules\.kubernetesJob, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes-job.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade\.overridden-package

This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` pipe `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade\.pipe



This option has no description\.



*Type:*
list of function that evaluates to a(n) package



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.imageRegistry\.host



This option has no description\.



*Type:*
string



*Default:*
` "registry.hub.docker.com" `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.imageRegistry\.path



This option has no description\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeClaimManifests



This option has no description\.



*Type:*
attribute set of (submodule)

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeClaimManifests\.\<name>\.apiVersion



This option has no description\.



*Type:*
unspecified value



*Default:*
` "v1" `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeClaimManifests\.\<name>\.kind



This option has no description\.



*Type:*
unspecified value



*Default:*
` "PersistentVolumeClaim" `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeClaimManifests\.\<name>\.metadata\.name



This option has no description\.



*Type:*
string

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeClaimManifests\.\<name>\.spec\.accessModes



This option has no description\.



*Type:*
unspecified value



*Default:*

```
[
  "ReadWriteMany"
]
```

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeClaimManifests\.\<name>\.spec\.resources\.requests\.storage



This option has no description\.



*Type:*
unspecified value



*Default:*
` "1000Ti" `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeClaimManifests\.\<name>\.spec\.storageClassName



This option has no description\.



*Type:*
unspecified value



*Default:*
` "" `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeClaimManifests\.\<name>\.spec\.volumeName



This option has no description\.



*Type:*
string

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeManifests



This option has no description\.



*Type:*
attribute set of (submodule)

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeManifests\.\<name>\.apiVersion



This option has no description\.



*Type:*
unspecified value



*Default:*
` "v1" `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeManifests\.\<name>\.kind



This option has no description\.



*Type:*
unspecified value



*Default:*
` "PersistentVolume" `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeManifests\.\<name>\.metadata\.name



This option has no description\.



*Type:*
string

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeManifests\.\<name>\.spec



This option has no description\.



*Type:*
attribute set of anything

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` pipe `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage\.pipe



This option has no description\.



*Type:*
list of function that evaluates to a(n) package



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.volumeMounts



This option has no description\.



*Type:*
list of attribute set of anything

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.kubernetes\.volumes



This option has no description\.



*Type:*
list of attribute set of anything

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.launchers\.\<name>\.skypilot\.options\.todo-placeholder



This option has no description\.



*Type:*
unspecified value



*Default:*
` "blah blah" `

*Declared by:*
 - [skypilot\.nix, via option flake\.flakeModules\.skypilot, via option perSystem\.ml-ops\.job, via option perSystem\.ml-ops\.jobs\.\<name>\.launcher](flake-modules/skypilot.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.mkPython



This option has no description\.



*Type:*
unspecified value



*Default:*
` <function> `

*Declared by:*
 - [python-envs-pep508\.nix, via option flake\.flakeModules\.pythonEnvsPep508, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.name



This option has no description\.



*Type:*
string



*Default:*
` "‹name›" `

*Declared by:*
 - [runtime\.nix, via option flake\.flakeModules\.runtime](flake-modules/runtime.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.nixLdLibraries



This option has no description\.



*Type:*
list of path

*Declared by:*
 - [nix-ld\.nix, via option flake\.flakeModules\.nixLd, via option perSystem\.ml-ops\.common](flake-modules/nix-ld.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.poetry2nix\.pkgs



The nix package set to use for poetry2nix\.

It is by default set to the nixpkgs from ` nix-ml-ops `’s lock file with a python package specified by ` perSystem.ml-ops.common.pythonPackage `\.



*Type:*
unspecified value



*Default:*

```
pkgs.appendOverlays [
  (self: super: {
    ${common.config.pythonPackage.base-package.pythonAttr} = lib.pipe super.${common.config.pythonPackage.base-package.pythonAttr} common.config.pythonPackage.pipe;
  })
]

```

*Declared by:*
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry, via option perSystem\.ml-ops\.common](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.poetry2nix\.poetry2nixLib



This option has no description\.



*Type:*
unspecified value



*Default:*

```
{
  callPackage = <function>;
  cleanPythonSources = <function, args: {src}>;
  cli = <derivation poetry2nix-cli-0>;
  defaultPoetryOverrides = <function>;
  mkDefaultPoetryOverrides = <function>;
  mkPoetryApplication = <function, args: {checkGroups?, extras?, groups?, meta?, overrides?, poetrylock?, preferWheels?, projectDir?, pwd?, pyproject?, python?, src?}>;
  mkPoetryEditablePackage = <function, args: {editablePackageSources, projectDir?, pyProject?, pyproject?, python?}>;
  mkPoetryEnv = <function, args: {checkGroups?, editablePackageSources?, extraPackages?, extras?, groups?, overrides?, poetrylock?, preferWheels?, projectDir?, pwd?, pyproject?, python?}>;
  mkPoetryPackages = <function, args: {checkGroups?, editablePackageSources?, extras?, groups?, overrides?, poetrylock?, poetrylockPos?, preferWheels?, projectDir?, pwd?, pyProject?, pyproject?, python?}>;
  mkPoetryScriptsPackage = <function, args: {projectDir?, pyProject?, pyproject?, python?, scripts?}>;
  newScope = <function>;
  overrideScope = <function>;
  overrideScope' = <function>;
  overrides = {
    withDefaults = <function>;
    withoutDefaults = <function>;
  };
  packages = <function>;
}
```

*Declared by:*
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry, via option perSystem\.ml-ops\.common](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.poetry2nix\.python



This option has no description\.



*Type:*
unspecified value



*Default:*
` <derivation python3-3.11.5> `

*Declared by:*
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry, via option perSystem\.ml-ops\.common](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.poetryEnv



This option has no description\.



*Type:*
package



*Default:*
` <derivation python3-3.11.5-env> `

*Declared by:*
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry, via option perSystem\.ml-ops\.runtime](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.poetryEnvArgs



This option has no description\.



*Type:*
attribute set of anything



*Default:*
` { } `

*Declared by:*
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry, via option perSystem\.ml-ops\.runtime](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.pythonEnv



This option has no description\.



*Type:*
package



*Default:*
` <derivation python3-3.9.16-env> `

*Declared by:*
 - [python-envs-pep508\.nix, via option flake\.flakeModules\.pythonEnvsPep508, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.pythonEnvArgs



This option has no description\.



*Type:*
attribute set of anything

*Declared by:*
 - [python-envs-pep508\.nix, via option flake\.flakeModules\.pythonEnvsPep508, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.pythonPackage



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [python-package\.nix, via option flake\.flakeModules\.pythonPackage](flake-modules/python-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.pythonPackage\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.pythonPackage\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` pipe `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.pythonPackage\.pipe



This option has no description\.



*Type:*
list of function that evaluates to a(n) package



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.version



Version of job or service\.
This will be used as the image tag\.



*Type:*
string



*Default:*
1\.0\.0+\<lastModifiedDate>\.\<hash>

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.volumeMounts\.emptyDir



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option flake\.flakeModules\.volumeMountEmptyDir, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-empty-dir.nix)
 - [volume-mount-empty-dir\.nix, via option flake\.flakeModules\.volumeMountEmptyDir, via option perSystem\.ml-ops\.runtime](flake-modules/volume-mount-empty-dir.nix)



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
 - [volume-mount-empty-dir\.nix, via option flake\.flakeModules\.volumeMountEmptyDir, via option perSystem\.ml-ops\.runtime](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.volumeMounts\.emptyDir\.\<name>\.medium



This option has no description\.



*Type:*
null or value “Memory” (singular enum)



*Default:*
` null `

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option flake\.flakeModules\.volumeMountEmptyDir, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.volumeMounts\.nfs



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.runtime](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.volumeMounts\.nfs\.\<name>\.kubernetesVolume



This option has no description\.



*Type:*
unspecified value



*Default:*

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.runtime](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.volumeMounts\.nfs\.\<name>\.mountOptions



This option has no description\.



*Type:*
list of string



*Default:*

```
[
  "rw"
  "intr"
  "nolock"
]
```

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.volumeMounts\.nfs\.\<name>\.path



This option has no description\.



*Type:*
string



*Example:*
` "/ml_data" `

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.jobs\.\<name>\.volumeMounts\.nfs\.\<name>\.server



This option has no description\.



*Type:*
string



*Example:*
` "nfs.example.com" `

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.overridablePackage



This option has no description\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.overridablePackage\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.overridablePackage\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` pipe `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.overridablePackage\.pipe



This option has no description\.



*Type:*
list of function that evaluates to a(n) package



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.runtime



Common config shared among all ` ml-ops.jobs.<name> ` and ` ml-ops.services.<name> `\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [runtime\.nix, via option flake\.flakeModules\.runtime](flake-modules/runtime.nix)



## perSystem\.ml-ops\.runtime\.LD_LIBRARY_PATH



This option has no description\.



*Type:*
strings concatenated with “:”



*Default:*
` "" `

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.runtime\.cuda\.packages



This option has no description\.



*Type:*
list of package

*Declared by:*
 - [cuda\.nix, via option flake\.flakeModules\.cuda, via option perSystem\.ml-ops\.common](flake-modules/cuda.nix)



## perSystem\.ml-ops\.runtime\.cuda\.home



This option has no description\.



*Type:*
package



*Default:*
` <derivation cuda-home> `

*Declared by:*
 - [cuda\.nix, via option flake\.flakeModules\.cuda, via option perSystem\.ml-ops\.common](flake-modules/cuda.nix)



## perSystem\.ml-ops\.runtime\.devenvShellModule



Common config that will be copied to ` config.devenv.shells. `*\<shell_name>*` .config ` for each shell\.

See [devenv options](https://devenv\.sh/reference/options/) for supported nested options\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.runtime\.environmentVariables



Environment variables for either devcontainer, jobs or services\.

For devcontainer, these variables will be copied to via ` devenv `’s [env](https://devenv\.sh/reference/options/\#env) config\.
For kubernetes jobs and services, these variables will be copied to the Pods’ ` spec.containers.*.env ` field\.



*Type:*
lazy attribute set of string



*Default:*
` { } `

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.runtime\.launcher



This option has no description\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [runtime\.nix, via option flake\.flakeModules\.runtime](flake-modules/runtime.nix)



## perSystem\.ml-ops\.runtime\.launcher\.environmentVariables



This option has no description\.



*Type:*
attribute set of string

*Declared by:*
 - [runtime\.nix, via option flake\.flakeModules\.runtime](flake-modules/runtime.nix)



## perSystem\.ml-ops\.runtime\.mkPython



This option has no description\.



*Type:*
unspecified value



*Default:*
` <function> `

*Declared by:*
 - [python-envs-pep508\.nix, via option flake\.flakeModules\.pythonEnvsPep508, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.runtime\.name



This option has no description\.



*Type:*
string



*Default:*
` "‹name›" `

*Declared by:*
 - [runtime\.nix, via option flake\.flakeModules\.runtime](flake-modules/runtime.nix)



## perSystem\.ml-ops\.runtime\.nixLdLibraries



This option has no description\.



*Type:*
list of path

*Declared by:*
 - [nix-ld\.nix, via option flake\.flakeModules\.nixLd, via option perSystem\.ml-ops\.common](flake-modules/nix-ld.nix)



## perSystem\.ml-ops\.runtime\.poetry2nix\.pkgs



The nix package set to use for poetry2nix\.

It is by default set to the nixpkgs from ` nix-ml-ops `’s lock file with a python package specified by ` perSystem.ml-ops.common.pythonPackage `\.



*Type:*
unspecified value



*Default:*

```
pkgs.appendOverlays [
  (self: super: {
    ${common.config.pythonPackage.base-package.pythonAttr} = lib.pipe super.${common.config.pythonPackage.base-package.pythonAttr} common.config.pythonPackage.pipe;
  })
]

```

*Declared by:*
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry, via option perSystem\.ml-ops\.common](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.runtime\.poetry2nix\.poetry2nixLib



This option has no description\.



*Type:*
unspecified value



*Default:*

```
{
  callPackage = <function>;
  cleanPythonSources = <function, args: {src}>;
  cli = <derivation poetry2nix-cli-0>;
  defaultPoetryOverrides = <function>;
  mkDefaultPoetryOverrides = <function>;
  mkPoetryApplication = <function, args: {checkGroups?, extras?, groups?, meta?, overrides?, poetrylock?, preferWheels?, projectDir?, pwd?, pyproject?, python?, src?}>;
  mkPoetryEditablePackage = <function, args: {editablePackageSources, projectDir?, pyProject?, pyproject?, python?}>;
  mkPoetryEnv = <function, args: {checkGroups?, editablePackageSources?, extraPackages?, extras?, groups?, overrides?, poetrylock?, preferWheels?, projectDir?, pwd?, pyproject?, python?}>;
  mkPoetryPackages = <function, args: {checkGroups?, editablePackageSources?, extras?, groups?, overrides?, poetrylock?, poetrylockPos?, preferWheels?, projectDir?, pwd?, pyProject?, pyproject?, python?}>;
  mkPoetryScriptsPackage = <function, args: {projectDir?, pyProject?, pyproject?, python?, scripts?}>;
  newScope = <function>;
  overrideScope = <function>;
  overrideScope' = <function>;
  overrides = {
    withDefaults = <function>;
    withoutDefaults = <function>;
  };
  packages = <function>;
}
```

*Declared by:*
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry, via option perSystem\.ml-ops\.common](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.runtime\.poetry2nix\.python



This option has no description\.



*Type:*
unspecified value



*Default:*
` <derivation python3-3.11.5> `

*Declared by:*
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry, via option perSystem\.ml-ops\.common](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.runtime\.pythonEnv



This option has no description\.



*Type:*
package



*Default:*
` <derivation python3-3.9.16-env> `

*Declared by:*
 - [python-envs-pep508\.nix, via option flake\.flakeModules\.pythonEnvsPep508, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.runtime\.pythonEnvArgs



This option has no description\.



*Type:*
attribute set of anything

*Declared by:*
 - [python-envs-pep508\.nix, via option flake\.flakeModules\.pythonEnvsPep508, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.runtime\.pythonPackage



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [python-package\.nix, via option flake\.flakeModules\.pythonPackage](flake-modules/python-package.nix)



## perSystem\.ml-ops\.runtime\.pythonPackage\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.runtime\.pythonPackage\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` pipe `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.runtime\.pythonPackage\.pipe



This option has no description\.



*Type:*
list of function that evaluates to a(n) package



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.runtime\.version



Version of job or service\.
This will be used as the image tag\.



*Type:*
string



*Default:*
1\.0\.0+\<lastModifiedDate>\.\<hash>

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.runtime\.volumeMounts\.emptyDir



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option flake\.flakeModules\.volumeMountEmptyDir, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.runtime\.volumeMounts\.emptyDir\.\<name>\.medium



This option has no description\.



*Type:*
null or value “Memory” (singular enum)



*Default:*
` null `

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option flake\.flakeModules\.volumeMountEmptyDir, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.runtime\.volumeMounts\.nfs



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.runtime\.volumeMounts\.nfs\.\<name>\.mountOptions



This option has no description\.



*Type:*
list of string



*Default:*

```
[
  "rw"
  "intr"
  "nolock"
]
```

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.runtime\.volumeMounts\.nfs\.\<name>\.path



This option has no description\.



*Type:*
string



*Example:*
` "/ml_data" `

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.runtime\.volumeMounts\.nfs\.\<name>\.server



This option has no description\.



*Type:*
string



*Example:*
` "nfs.example.com" `

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.service



The shared options among all services\.

For example, config of ` perSystem.ml-ops.service.xxx ` will be copied to all ` perSystem.ml-ops.services.<name>.xxx `\.



*Type:*
module

*Declared by:*
 - [services\.nix, via option flake\.flakeModules\.services](flake-modules/services.nix)



## perSystem\.ml-ops\.services



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [services\.nix, via option flake\.flakeModules\.services](flake-modules/services.nix)



## perSystem\.ml-ops\.services\.\<name>\.LD_LIBRARY_PATH



This option has no description\.



*Type:*
strings concatenated with “:”



*Default:*
` "" `

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.services\.\<name>\.cuda\.packages



This option has no description\.



*Type:*
list of package

*Declared by:*
 - [cuda\.nix, via option flake\.flakeModules\.cuda, via option perSystem\.ml-ops\.common](flake-modules/cuda.nix)



## perSystem\.ml-ops\.services\.\<name>\.cuda\.home



This option has no description\.



*Type:*
package



*Default:*
` <derivation cuda-home> `

*Declared by:*
 - [cuda\.nix, via option flake\.flakeModules\.cuda, via option perSystem\.ml-ops\.common](flake-modules/cuda.nix)



## perSystem\.ml-ops\.services\.\<name>\.devenvShellModule



Common config that will be copied to ` config.devenv.shells. `*\<shell_name>*` .config ` for each shell\.

See [devenv options](https://devenv\.sh/reference/options/) for supported nested options\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.services\.\<name>\.environmentVariables



Environment variables for either devcontainer, jobs or services\.

For devcontainer, these variables will be copied to via ` devenv `’s [env](https://devenv\.sh/reference/options/\#env) config\.
For kubernetes jobs and services, these variables will be copied to the Pods’ ` spec.containers.*.env ` field\.



*Type:*
lazy attribute set of string



*Default:*
` { } `

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.services\.\<name>\.launcher



This option has no description\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [runtime\.nix, via option flake\.flakeModules\.runtime](flake-modules/runtime.nix)



## perSystem\.ml-ops\.services\.\<name>\.launcher\.environmentVariables



This option has no description\.



*Type:*
attribute set of string

*Declared by:*
 - [runtime\.nix, via option flake\.flakeModules\.runtime](flake-modules/runtime.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [services\.nix, via option flake\.flakeModules\.services, via option perSystem\.ml-ops\.service](flake-modules/services.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.environmentVariables



This option has no description\.



*Type:*
attribute set of string

*Declared by:*
 - [runtime\.nix, via option flake\.flakeModules\.runtime](flake-modules/runtime.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes



This option has no description\.



*Type:*
submodule

*Declared by:*
 - [kubernetes-service\.nix, via option flake\.flakeModules\.kubernetesService, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)
 - [gke-credential\.nix, via option flake\.flakeModules\.gkeCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/gke-credential.nix)
 - [aks-credential\.nix, via option flake\.flakeModules\.aksCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/aks-credential.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.aks



This option has no description\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [aks-credential\.nix, via option flake\.flakeModules\.aksCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/aks-credential.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.aks\.cluster



This option has no description\.



*Type:*
string



*Default:*
` "ml-aks" `

*Declared by:*
 - [aks-credential\.nix, via option flake\.flakeModules\.aksCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/aks-credential.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.aks\.registryName



This option has no description\.



*Type:*
string



*Default:*
` "mlsolutionregistry" `

*Declared by:*
 - [aks-credential\.nix, via option flake\.flakeModules\.aksCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/aks-credential.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.aks\.resourcegroup



This option has no description\.



*Type:*
string



*Default:*
` "ml-solutions" `

*Declared by:*
 - [aks-credential\.nix, via option flake\.flakeModules\.aksCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/aks-credential.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest



This option has no description\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\._module\.environmentVariables



This option has no description\.



*Type:*
unspecified value



*Default:*
` launchers.<name>.environmentVariables `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\.env



This option has no description\.



*Type:*
unspecified value



*Default:*

```
lib.attrsets.mapAttrsToList
  lib.attrsets.nameValuePair
  perSystem.ml-ops.services|jobs.<name>.launchers.<name>.kubernetes.containerManifest._module.environmentVariables

```

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\.image



This option has no description\.



*Type:*
unspecified value



*Default:*
` perSystem.services|jobs.<name>.launchers.<name>.kubernetes.<name>.overridden-package.remoteImage `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\.name



This option has no description\.



*Type:*
string

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.containerManifest\.volumeMounts



This option has no description\.



*Type:*
unspecified value



*Default:*
` [ ] `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.containers

This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.containers\.\<name>\.manifest



This option has no description\.



*Type:*
module



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.gke



This option has no description\.



*Type:*
null or (submodule)



*Default:*
` null `

*Declared by:*
 - [gke-credential\.nix, via option flake\.flakeModules\.gkeCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/gke-credential.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.gke\.cluster



This option has no description\.



*Type:*
string

*Declared by:*
 - [gke-credential\.nix, via option flake\.flakeModules\.gkeCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/gke-credential.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.gke\.region



This option has no description\.



*Type:*
string

*Declared by:*
 - [gke-credential\.nix, via option flake\.flakeModules\.gkeCredential, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/gke-credential.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helm-chart



This option has no description\.



*Type:*
package



*Default:*
` <derivation helm-chart> `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmChartYaml



This option has no description\.



*Type:*
attribute set of anything

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` pipe `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmDelete\.pipe



This option has no description\.



*Type:*
list of function that evaluates to a(n) package



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmReleaseName



This option has no description\.



*Type:*
unspecified value



*Default:*
` "‹name›-‹name›" `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates



This option has no description\.



*Type:*
attribute set of attribute set of anything



*Default:*
` { } `

*Declared by:*
 - [kubernetes-service\.nix, via option flake\.flakeModules\.kubernetesService, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.apiVersion



This option has no description\.



*Type:*
unspecified value



*Default:*
` "apps/v1" `

*Declared by:*
 - [kubernetes-service\.nix, via option flake\.flakeModules\.kubernetesService, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.kind



This option has no description\.



*Type:*
unspecified value



*Default:*
` "Deployment" `

*Declared by:*
 - [kubernetes-service\.nix, via option flake\.flakeModules\.kubernetesService, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.metadata\.name



This option has no description\.



*Type:*
unspecified value



*Default:*

```
"${service.config._module.args.name}-${launcher.config._module.args.name}"

```

*Declared by:*
 - [kubernetes-service\.nix, via option flake\.flakeModules\.kubernetesService, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.selector\.matchLabels\."app\.kubernetes\.io/name"



This option has no description\.



*Type:*
unspecified value



*Default:*
` "‹name›-‹name›" `

*Declared by:*
 - [kubernetes-service\.nix, via option flake\.flakeModules\.kubernetesService, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.template\.metadata\.labels\."app\.kubernetes\.io/name"



This option has no description\.



*Type:*
unspecified value



*Default:*
` "‹name›-‹name›" `

*Declared by:*
 - [kubernetes-service\.nix, via option flake\.flakeModules\.kubernetesService, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.template\.spec\.containers



This option has no description\.



*Type:*
attribute set of (attribute set of anything)

*Declared by:*
 - [kubernetes-service\.nix, via option flake\.flakeModules\.kubernetesService, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.template\.spec\.containers\.\<name>\._module\.environmentVariables



This option has no description\.



*Type:*
unspecified value



*Default:*
` launchers.<name>.environmentVariables `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.template\.spec\.containers\.\<name>\.env



This option has no description\.



*Type:*
unspecified value



*Default:*

```
lib.attrsets.mapAttrsToList
  lib.attrsets.nameValuePair
  perSystem.ml-ops.services|jobs.<name>.launchers.<name>.kubernetes.containerManifest._module.environmentVariables

```

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.template\.spec\.containers\.\<name>\.image



This option has no description\.



*Type:*
unspecified value



*Default:*
` perSystem.services|jobs.<name>.launchers.<name>.kubernetes.<name>.overridden-package.remoteImage `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.template\.spec\.containers\.\<name>\.name



This option has no description\.



*Type:*
string

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.template\.spec\.containers\.\<name>\.volumeMounts



This option has no description\.



*Type:*
unspecified value



*Default:*
` [ ] `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.deployment\.spec\.template\.spec\.volumes



This option has no description\.



*Type:*
unspecified value



*Default:*
` [ ] `

*Declared by:*
 - [kubernetes-service\.nix, via option flake\.flakeModules\.kubernetesService, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.service\.apiVersion



This option has no description\.



*Type:*
unspecified value



*Default:*
` "v1" `

*Declared by:*
 - [kubernetes-service\.nix, via option flake\.flakeModules\.kubernetesService, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.service\.kind



This option has no description\.



*Type:*
unspecified value



*Default:*
` "Service" `

*Declared by:*
 - [kubernetes-service\.nix, via option flake\.flakeModules\.kubernetesService, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.service\.metadata\.name



This option has no description\.



*Type:*
unspecified value



*Default:*

```
"${service.config._module.args.name}-${launcher.config._module.args.name}-${flakeModule.self.lastModifiedDate}-${builtins.substring 0 8 flakeModule.self.rev or "dirty"}"

```

*Declared by:*
 - [kubernetes-service\.nix, via option flake\.flakeModules\.kubernetesService, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.service\.spec\.selector\."app\.kubernetes\.io/name"



This option has no description\.



*Type:*
unspecified value



*Default:*
` "‹name›-‹name›" `

*Declared by:*
 - [kubernetes-service\.nix, via option flake\.flakeModules\.kubernetesService, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmTemplates\.service\.spec\.type



This option has no description\.



*Type:*
unspecified value



*Default:*
` "LoadBalancer" `

*Declared by:*
 - [kubernetes-service\.nix, via option flake\.flakeModules\.kubernetesService, via option perSystem\.ml-ops\.service, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes-service.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` pipe `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.helmUpgrade\.pipe



This option has no description\.



*Type:*
list of function that evaluates to a(n) package



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.imageRegistry\.host



This option has no description\.



*Type:*
string



*Default:*
` "registry.hub.docker.com" `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.imageRegistry\.path



This option has no description\.



*Type:*
null or string



*Default:*
` null `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeClaimManifests



This option has no description\.



*Type:*
attribute set of (submodule)

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeClaimManifests\.\<name>\.apiVersion



This option has no description\.



*Type:*
unspecified value



*Default:*
` "v1" `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeClaimManifests\.\<name>\.kind



This option has no description\.



*Type:*
unspecified value



*Default:*
` "PersistentVolumeClaim" `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeClaimManifests\.\<name>\.metadata\.name



This option has no description\.



*Type:*
string

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeClaimManifests\.\<name>\.spec\.accessModes



This option has no description\.



*Type:*
unspecified value



*Default:*

```
[
  "ReadWriteMany"
]
```

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeClaimManifests\.\<name>\.spec\.resources\.requests\.storage



This option has no description\.



*Type:*
unspecified value



*Default:*
` "1000Ti" `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeClaimManifests\.\<name>\.spec\.storageClassName



This option has no description\.



*Type:*
unspecified value



*Default:*
` "" `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeClaimManifests\.\<name>\.spec\.volumeName



This option has no description\.



*Type:*
string

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeManifests



This option has no description\.



*Type:*
attribute set of (submodule)

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeManifests\.\<name>\.apiVersion



This option has no description\.



*Type:*
unspecified value



*Default:*
` "v1" `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeManifests\.\<name>\.kind



This option has no description\.



*Type:*
unspecified value



*Default:*
` "PersistentVolume" `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeManifests\.\<name>\.metadata\.name



This option has no description\.



*Type:*
string

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.persistentVolumeManifests\.\<name>\.spec



This option has no description\.



*Type:*
attribute set of anything

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` pipe `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.pushImage\.pipe



This option has no description\.



*Type:*
list of function that evaluates to a(n) package



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.volumeMounts



This option has no description\.



*Type:*
list of attribute set of anything

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.launchers\.\<name>\.kubernetes\.volumes



This option has no description\.



*Type:*
list of attribute set of anything

*Declared by:*
 - [kubernetes\.nix, via option flake\.flakeModules\.kubernetes, via option perSystem\.ml-ops\.runtime, via option perSystem\.ml-ops\.services\.\<name>\.launcher](flake-modules/kubernetes.nix)



## perSystem\.ml-ops\.services\.\<name>\.mkPython



This option has no description\.



*Type:*
unspecified value



*Default:*
` <function> `

*Declared by:*
 - [python-envs-pep508\.nix, via option flake\.flakeModules\.pythonEnvsPep508, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.services\.\<name>\.name



This option has no description\.



*Type:*
string



*Default:*
` "‹name›" `

*Declared by:*
 - [runtime\.nix, via option flake\.flakeModules\.runtime](flake-modules/runtime.nix)



## perSystem\.ml-ops\.services\.\<name>\.nixLdLibraries



This option has no description\.



*Type:*
list of path

*Declared by:*
 - [nix-ld\.nix, via option flake\.flakeModules\.nixLd, via option perSystem\.ml-ops\.common](flake-modules/nix-ld.nix)



## perSystem\.ml-ops\.services\.\<name>\.poetry2nix\.pkgs



The nix package set to use for poetry2nix\.

It is by default set to the nixpkgs from ` nix-ml-ops `’s lock file with a python package specified by ` perSystem.ml-ops.common.pythonPackage `\.



*Type:*
unspecified value



*Default:*

```
pkgs.appendOverlays [
  (self: super: {
    ${common.config.pythonPackage.base-package.pythonAttr} = lib.pipe super.${common.config.pythonPackage.base-package.pythonAttr} common.config.pythonPackage.pipe;
  })
]

```

*Declared by:*
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry, via option perSystem\.ml-ops\.common](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.services\.\<name>\.poetry2nix\.poetry2nixLib



This option has no description\.



*Type:*
unspecified value



*Default:*

```
{
  callPackage = <function>;
  cleanPythonSources = <function, args: {src}>;
  cli = <derivation poetry2nix-cli-0>;
  defaultPoetryOverrides = <function>;
  mkDefaultPoetryOverrides = <function>;
  mkPoetryApplication = <function, args: {checkGroups?, extras?, groups?, meta?, overrides?, poetrylock?, preferWheels?, projectDir?, pwd?, pyproject?, python?, src?}>;
  mkPoetryEditablePackage = <function, args: {editablePackageSources, projectDir?, pyProject?, pyproject?, python?}>;
  mkPoetryEnv = <function, args: {checkGroups?, editablePackageSources?, extraPackages?, extras?, groups?, overrides?, poetrylock?, preferWheels?, projectDir?, pwd?, pyproject?, python?}>;
  mkPoetryPackages = <function, args: {checkGroups?, editablePackageSources?, extras?, groups?, overrides?, poetrylock?, poetrylockPos?, preferWheels?, projectDir?, pwd?, pyProject?, pyproject?, python?}>;
  mkPoetryScriptsPackage = <function, args: {projectDir?, pyProject?, pyproject?, python?, scripts?}>;
  newScope = <function>;
  overrideScope = <function>;
  overrideScope' = <function>;
  overrides = {
    withDefaults = <function>;
    withoutDefaults = <function>;
  };
  packages = <function>;
}
```

*Declared by:*
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry, via option perSystem\.ml-ops\.common](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.services\.\<name>\.poetry2nix\.python



This option has no description\.



*Type:*
unspecified value



*Default:*
` <derivation python3-3.11.5> `

*Declared by:*
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry, via option perSystem\.ml-ops\.common](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.services\.\<name>\.poetryEnv



This option has no description\.



*Type:*
package



*Default:*
` <derivation python3-3.11.5-env> `

*Declared by:*
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry, via option perSystem\.ml-ops\.runtime](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.services\.\<name>\.poetryEnvArgs



This option has no description\.



*Type:*
attribute set of anything



*Default:*
` { } `

*Declared by:*
 - [python-envs-poetry\.nix, via option flake\.flakeModules\.pythonEnvsPoetry, via option perSystem\.ml-ops\.runtime](flake-modules/python-envs-poetry.nix)



## perSystem\.ml-ops\.services\.\<name>\.pythonEnv



This option has no description\.



*Type:*
package



*Default:*
` <derivation python3-3.9.16-env> `

*Declared by:*
 - [python-envs-pep508\.nix, via option flake\.flakeModules\.pythonEnvsPep508, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.services\.\<name>\.pythonEnvArgs



This option has no description\.



*Type:*
attribute set of anything

*Declared by:*
 - [python-envs-pep508\.nix, via option flake\.flakeModules\.pythonEnvsPep508, via option perSystem\.ml-ops\.common](flake-modules/python-envs-pep508.nix)



## perSystem\.ml-ops\.services\.\<name>\.pythonPackage



This option has no description\.



*Type:*
submodule



*Default:*
` { } `

*Declared by:*
 - [python-package\.nix, via option flake\.flakeModules\.pythonPackage](flake-modules/python-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.pythonPackage\.base-package



This option has no description\.



*Type:*
package



*Example:*
` <derivation hello-2.12.1> `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.pythonPackage\.overridden-package



This option has no description\.



*Type:*
package



*Default:*
applied ` base-package ` with ` pipe `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.pythonPackage\.pipe



This option has no description\.



*Type:*
list of function that evaluates to a(n) package



*Default:*
` [ ] `

*Declared by:*
 - [overridable-package\.nix, via option flake\.flakeModules\.overridablePackage](flake-modules/overridable-package.nix)



## perSystem\.ml-ops\.services\.\<name>\.version



Version of job or service\.
This will be used as the image tag\.



*Type:*
string



*Default:*
1\.0\.0+\<lastModifiedDate>\.\<hash>

*Declared by:*
 - [common\.nix, via option flake\.flakeModules\.common](flake-modules/common.nix)



## perSystem\.ml-ops\.services\.\<name>\.volumeMounts\.emptyDir



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option flake\.flakeModules\.volumeMountEmptyDir, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-empty-dir.nix)
 - [volume-mount-empty-dir\.nix, via option flake\.flakeModules\.volumeMountEmptyDir, via option perSystem\.ml-ops\.runtime](flake-modules/volume-mount-empty-dir.nix)



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
 - [volume-mount-empty-dir\.nix, via option flake\.flakeModules\.volumeMountEmptyDir, via option perSystem\.ml-ops\.runtime](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.services\.\<name>\.volumeMounts\.emptyDir\.\<name>\.medium



This option has no description\.



*Type:*
null or value “Memory” (singular enum)



*Default:*
` null `

*Declared by:*
 - [volume-mount-empty-dir\.nix, via option flake\.flakeModules\.volumeMountEmptyDir, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-empty-dir.nix)



## perSystem\.ml-ops\.services\.\<name>\.volumeMounts\.nfs



This option has no description\.



*Type:*
attribute set of (submodule)



*Default:*
` { } `

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.runtime](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.services\.\<name>\.volumeMounts\.nfs\.\<name>\.kubernetesVolume



This option has no description\.



*Type:*
unspecified value



*Default:*

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.runtime](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.services\.\<name>\.volumeMounts\.nfs\.\<name>\.mountOptions



This option has no description\.



*Type:*
list of string



*Default:*

```
[
  "rw"
  "intr"
  "nolock"
]
```

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.services\.\<name>\.volumeMounts\.nfs\.\<name>\.path



This option has no description\.



*Type:*
string



*Example:*
` "/ml_data" `

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)



## perSystem\.ml-ops\.services\.\<name>\.volumeMounts\.nfs\.\<name>\.server



This option has no description\.



*Type:*
string



*Example:*
` "nfs.example.com" `

*Declared by:*
 - [volume-mount-nfs\.nix, via option flake\.flakeModules\.volumeMountNfs, via option perSystem\.ml-ops\.common](flake-modules/volume-mount-nfs.nix)


