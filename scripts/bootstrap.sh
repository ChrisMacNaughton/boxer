#!/bin/bash

set -euf -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/../" && pwd )"

echo "Updating system"
apt-get update -qq
apt-get upgrade -yqq

$DIR/scripts/deps.sh

echo $(chef-solo --version)

chef-solo  -c $DIR/solo.rb -j $DIR/solo.json