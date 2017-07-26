#!/bin/bash

set -euf -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd )"

echo "Updating system"
apt-get update -qq
apt-get upgrade -yqq

$DIR/scripts/deps.sh

echo $(chef-solo --version)

if [ ! -f /home/chris/.ssh/id_rsa ] && [ ! -f/home/chris/.ssh/id_ed25519 ]; then
    echo "SSH keys aren't yet installed, an SSH key must be present for full initialization"
    exit 1
fi
chef-solo  -c $DIR/solo.rb -j $DIR/solo.json