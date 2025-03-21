# Dev Container Features for Noir Development

This repository contains [Dev Container Features](https://containers.dev/implementors/features/) for Noir language development. It provides out-of-the-box support for installing Noir's Nargo CLI and the Barretenberg library in your development containers.

## Available Features

This repository provides the following features:

- Nargo CLI and Noirup
- BB CLI and BBup

## Usage

Check the READMEs in `src/barretenberg` and `src/noir` for usage instructions

## Development

This repository follows the [Dev Container Feature specification](https://containers.dev/implementors/features/).

### Testing

You can test the features using the Dev Container CLI:

```bash
devcontainer features test --global-scenarios-only .
```
 