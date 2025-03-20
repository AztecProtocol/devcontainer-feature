# Dev Container Features for Noir Development

This repository contains [Dev Container Features](https://containers.dev/implementors/features/) for Noir language development. It provides out-of-the-box support for installing Noir's Nargo CLI and the Barretenberg library in your development containers.

## Available Features

This repository provides the following features:

### 1. Nargo CLI (`nargo`)

Installs the Noir language compiler and toolchain.

- **ID**: `nargo`
- **Description**: Installs the Nargo CLI tool and its installer `noirup`
- **Options**:
  - `version`: The version of Nargo to install (default: `latest`, can be set to `nightly` or a specific version)

### 2. Barretenberg (`bb`)

Installs the Barretenberg prover backend for Noir.

- **ID**: `bb` 
- **Description**: Installs the Barretenberg CLI tool and its installer `bbup`
- **Options**:
  - `version`: The version of Barretenberg to install (default: `nargo`, meaning it will match with an existing Nargo installation)

## Usage

Add these features to your `devcontainer.json` file:

```json
"features": {
    "ghcr.io/yourusername/feature-starter/nargo:1.0.0": {},
    "ghcr.io/yourusername/feature-starter/bb:1.0.0": {}
}
```

### Examples

Install the latest stable Nargo and Barretenberg:

```json
"features": {
    "ghcr.io/signorecello/feature-starter/nargo:1.0.0": {},
    "ghcr.io/signorecello/feature-starter/bb:1.0.0": {}
}
```

Install the nightly version of Nargo and a specific version of Barretenberg:

```json
"features": {
    "ghcr.io/signorecello/feature-starter/nargo:1.0.0": {
        "version": "nightly"
    },
    "ghcr.io/signorecello/feature-starter/bb:1.0.0": {
        "version": "0.80.0"
    }
}
```

## Development

This repository follows the [Dev Container Feature specification](https://containers.dev/implementors/features/).

### Testing

You can test the features using the Dev Container CLI:

```bash
devcontainer features test --global-scenarios-only .
```
 