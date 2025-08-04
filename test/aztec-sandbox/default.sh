#!/bin/bash

# This test file will be executed against an auto-generated devcontainer.json that
# includes the 'aztec-sandbox' Feature with no options.
#
# For more information, see: https://github.com/devcontainers/cli/blob/main/docs/features/test.md
#
# Eg:
# {
#    "image": "<..some-base-image...>",
#    "features": {
#      "aztec-sandbox": {}
#    },
#    "remoteUser": "root"
# }
#
# Thus, the value of all options will fall back to the default value in the
# Feature's 'devcontainer-feature.json'.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.

# Check that installation and startup scripts exist
check "install-script-exists" bash -c "test -x /usr/local/share/install-aztec.sh"
check "startup-script-exists" bash -c "test -x /usr/local/share/aztec-sandbox-start.sh"

# Check that HOME is set to /workspaces
check "home-is-workspaces" bash -c "grep -q 'export HOME=\"/workspaces\"' /etc/profile.d/01_set_home.sh"

# Check that PATH includes aztec binaries
check "path-includes-aztec" bash -c "grep -q '/workspaces/.aztec/bin' /etc/profile.d/01_set_home.sh"

# Check that Node.js is installed
check "node-installed" bash -c "command -v node"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults