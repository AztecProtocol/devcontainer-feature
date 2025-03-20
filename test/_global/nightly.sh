#!/bin/bash

set -e

source dev-container-features-test-lib

check "check for nightly version" bash -c "noirup -n | grep -q 'nightly' && echo 'Found nightly' && exit 0 || echo 'Nightly not found' && exit 1"
check "validate bb version" bash -c "bb --version"

reportResults
