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

echo "curl -L https://raw.githubusercontent.com/noir-lang/noirup/refs/heads/main/install | bash" >> /etc/profile.d/noir.sh
echo "\$HOME/.nargo/bin/noirup ${VERSION}" >> /etc/profile.d/noir.sh
echo "PATH=\$HOME/.nargo/bin:$PATH" >> /etc/profile.d/noir.sh
