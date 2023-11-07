This is a project to test `ml-ops` when using Python virtual environment with [devenv](https://devenv.sh/). Unlike the poetry2nix solution, the Python dependencies are not managed by Nix.

## Commands available:

```
nix flake show
```

```
nix develop -c echo OK
```

```
nix develop -c python
```

### List all project-specific command-line tools

```
nix develop -c ls "${PATH%%:*}"
```
