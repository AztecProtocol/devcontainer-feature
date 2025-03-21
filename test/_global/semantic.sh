#!/bin/bash

set -e

source dev-container-features-test-lib

check "validate nargo version" bash -c "nargo --version | grep '1.0.0-beta.3'"
check "validate bb version" bash -c "bb --version | grep '0.79.0'"

reportResults
