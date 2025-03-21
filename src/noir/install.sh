#!/bin/sh
set -e

echo "Installing Noir"
echo "The provided version is: ${VERSION}"

if [ "${VERSION}" = "nightly" ]; then
    VERSION="-n"
elif [ "${VERSION}" != "" ]; then
    VERSION="-v ${VERSION}"
fi

apt update && apt install -y curl bash git tar gzip libc++-dev unzip jq

cat >> /etc/profile.d/noir.sh << EOF

curl -L https://raw.githubusercontent.com/noir-lang/noirup/refs/heads/main/install | bash
chmod +x /etc/profile.d/noir.sh

\$HOME/.nargo/bin/noirup ${VERSION}
PATH=\$HOME/.nargo/bin:\$PATH

EOF
