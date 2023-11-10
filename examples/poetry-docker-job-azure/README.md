This is a project to test publishing a Kubernetes job to AKS.

## Commands available:

### Show available packages

```
nix flake show
```

### Enter the development shell manually when direnv is not enabled

```
nix develop
```

### Push job image
```
nix build .#my-job-my-launcher-pushImage
```

### Push job image and submit job to kubernetes

```
nix build .#my-job-my-launcher-helmUpgrade
```

Note that `my-job-my-launcher-upgrade` is a command-line tool whose name is generated according to your configuration.

### Delete the kubernetes job

```
nix build .#my-job-my-launcher-helmDelete
```

### List all project-specific command-line tools

```
nix develop -c sh -c 'ls "${PATH%%:*}"'
```
