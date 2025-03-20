
# Barretenberg

A feature that installs the Barretenberg `cli` tool `bb` and its installer `bbup`.

## Example Usage

You can specify any version of `bb`, or leave empty to match with an existent version of `nargo` on the container.

```json
"features": {
    "ghcr.io/devcontainers/feature/barretenberg:1": {
        "version": "0.80.0"
    }
}
```

## Options

| Options Id | Description            | Type   | Default Value |
| ---------- | ---------------------- | ------ | ------------- |
| version    | The version to install | string | nargo         |
