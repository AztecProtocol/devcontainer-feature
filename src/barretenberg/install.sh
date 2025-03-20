#!/bin/sh
set -e

echo "Installing Barretenberg"
echo "The provided version is: ${VERSION}"

if [ "${VERSION}" != "" ]; then
    VERSION="-v ${VERSION}"
fi

apt update && apt install -y curl bash git tar gzip libc++-dev unzip jq

echo "curl -L https://raw.githubusercontent.com/AztecProtocol/aztec-packages/refs/heads/master/barretenberg/bbup/install | bash" >> /etc/profile.d/noir.sh
echo "\$HOME/.bb/bbup ${VERSION}" >> /etc/profile.d/noir.sh
echo "PATH=\$HOME/.bb/bin:$PATH" >> /etc/profile.d/noir.sh
