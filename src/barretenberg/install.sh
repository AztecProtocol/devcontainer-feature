#!/bin/sh
set -e

echo "Installing Barretenberg"
echo "The provided version is: ${VERSION}"

if [ "${VERSION}" != "" ]; then
    VERSION="-v ${VERSION}"
fi

apt update && apt install -y curl bash git tar gzip libc++-dev unzip jq


cat >> /etc/profile.d/99_bb.sh << EOF

curl -L https://raw.githubusercontent.com/AztecProtocol/aztec-packages/refs/heads/master/barretenberg/bbup/install | bash

PATH=\$HOME/.bb/bin:\$PATH
bash \$HOME/.bb/bbup ${VERSION}

EOF

chmod +x /etc/profile.d/99_bb.sh
chmod 755 /etc/profile.d/99_bb.sh
