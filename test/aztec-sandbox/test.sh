#!/bin/bash

# This is the primary test file that gets executed by default when running:
# devcontainer features test -f aztec-sandbox
#
# It should test the basic functionality of the feature with default options.

set -e

# Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
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
reportResults