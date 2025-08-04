# Aztec Sandbox (aztec-sandbox)

Installs and automatically runs the Aztec Sandbox development environment with test accounts pre-configured.

## Example Usage

```json
"features": {
    "ghcr.io/aztecprotocol/devcontainer-feature/aztec-sandbox:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| autoStart | Automatically start the sandbox on container creation | boolean | true |
| importTestAccounts | Import test accounts using aztec-wallet | boolean | true |

## What This Feature Does

This feature:
1. Installs the Aztec CLI and related tools
2. Sets up the Aztec Sandbox to run automatically on container startup (if autoStart is true)
3. Configures the environment with HOME set to /workspaces for Aztec compatibility
4. Provides the aztec command in your PATH

## Usage

After installation, the `aztec` command is available in your PATH:

```bash
# If autoStart is false, manually start the sandbox:
aztec start --sandbox

# Check the version
aztec --version
```

## Sandbox Management

When autoStart is enabled (default), the sandbox runs in the background automatically. Logs are written to `/workspaces/.aztec/aztec-sandbox.log`.

To monitor the sandbox logs in real-time:
```bash
tail -f /workspaces/.aztec/aztec-sandbox.log
```

## Test Accounts

When `importTestAccounts` is enabled (default), test accounts are automatically imported and ready to use. These accounts come pre-funded and are ideal for development and testing.

## Customization

To disable auto-start and manage the sandbox manually:
```json
"features": {
    "ghcr.io/aztecprotocol/devcontainer-feature/aztec-sandbox:1": {
        "autoStart": false
    }
}
```

## Dependencies

This feature automatically includes:
- **Docker-in-Docker** (`ghcr.io/devcontainers/features/docker-in-docker:2`): Provides Docker daemon access required by the Aztec Sandbox

## Notes

- Node.js v20+ is required (v22 will be installed automatically if needed)
- Port 8080 is used by the sandbox for the JSON-RPC endpoint
- The Aztec tools are installed using the official installation script from install.aztec.network
- Binaries are installed to `/workspaces/.aztec/bin`
- HOME is set to `/workspaces` to ensure compatibility with Aztec's containerized applications
- The sandbox runs in a Docker container managed by the Docker-in-Docker feature

## GitHub Codespaces Support

This feature includes special support for GitHub Codespaces:
- Automatically configures the PXE_URL environment variable for Codespaces port forwarding
- Ensures port 8080 is properly forwarded for sandbox access