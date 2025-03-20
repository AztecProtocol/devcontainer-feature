
# Nargo

A feature that installs the Nargo `cli` tool `nargo` and its installer `noirup`.

## Example Usage

You can specify any version of `noir`, or leave empty to install the latest stable. Pass `nightly` for the latest nightly version.

```json
"features": {
    "ghcr.io/devcontainers/feature/barretenberg:1": {
        "version": "nightly"
    }
}
```

## Options

| Options Id | Description            | Type   | Default Value |
| ---------- | ---------------------- | ------ | ------------- |
| version    | The version to install | string | nargo         |
