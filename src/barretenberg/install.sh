#!/bin/sh
set -e

echo "Installing Barretenberg"
echo "The provided version is: ${VERSION}"

if [ "${VERSION}" != "" ]; then
    VERSION="-v ${VERSION}"
fi

apt update && apt install -y curl bash git tar gzip libc++-dev unzip jq

cat >> /etc/profile.d/noir.sh << EOF

curl -L https://raw.githubusercontent.com/AztecProtocol/aztec-packages/refs/heads/master/barretenberg/bbup/install | bash
chmod +x /etc/profile.d/noir.sh

\$HOME/.bb/bbup ${VERSION}
PATH=\$HOME/.bb/bin:\$PATH

EOF
