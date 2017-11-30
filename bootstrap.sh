#!/bin/bash

set -euf -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )/" && pwd )"
. $DIR/src/helpers

require_root

. $DIR/config.sh
apt_update
apt_upgrade

ensure_packages "$BASE_PACKAGES $APT_PACKAGES"

# if [ ! -f /home/chris/.ssh/id_rsa ] && [ ! -f/home/chris/.ssh/id_ed25519 ]; then
#     echo "SSH keys aren't yet installed, an SSH key must be present for full initialization"
#     exit 1
# fi

shopt -s nullglob

set +f
FILES=$(echo $DIR/scripts/*)
set -f
for file in $FILES
do
    . $file
done

cd config
set +f
FILES=$(echo *)
set -f
for file in $FILES
do
    cp $file ~/.$file
done
cd $DIR

echo "Done!"