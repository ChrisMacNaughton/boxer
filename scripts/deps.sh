#!/bin/bash

set -euf -o pipefail

echo "Installing dependencies"

echo "Installing chef"
curl -s -L https://www.opscode.com/chef/install.sh | bash > /dev/null
