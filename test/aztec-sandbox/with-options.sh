#!/bin/bash

# This test file will be executed against the 'with-options' scenario in scenarios.json

set -e

# Import test library
source dev-container-features-test-lib

# Feature-specific tests
# Check that installation and startup scripts exist
check "install-script-exists" bash -c "test -x /usr/local/share/install-aztec.sh"
check "startup-script-exists" bash -c "test -x /usr/local/share/aztec-sandbox-start.sh"

# Check that HOME is set to /workspaces
check "home-is-workspaces" bash -c "grep -q 'export HOME=\"/workspaces\"' /etc/profile.d/01_set_home.sh"

# Check that PATH includes aztec binaries
check "path-includes-aztec" bash -c "grep -q '/workspaces/.aztec/bin' /etc/profile.d/01_set_home.sh"

# Since autoStart is false in this scenario, check that sandbox is NOT running
# We can't check this directly as postCreateCommand hasn't run yet in tests

reportResults