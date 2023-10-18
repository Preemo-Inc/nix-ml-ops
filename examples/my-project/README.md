This is a project to test `ml-ops`.

## Commands available:

```
nix flake show
```

```
nix develop -c echo OK
```

```
nix build .#my-service-my-launcher-helm-chart
```

```
nix develop -c my-service-my-launcher-upgrade
```

```
nix develop -c my-service-my-launcher-delete
```

### List all project-specific command-line tools

```
nix develop -c ls "${PATH%%:*}"
```
