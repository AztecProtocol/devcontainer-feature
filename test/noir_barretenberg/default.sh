#!/bin/bash

set -e

source dev-container-features-test-lib

check "validate nargo version" bash -c "nargo --version | grep 'nargo version'"
check "validate bb version" bash -c "bb --version"

reportResults
