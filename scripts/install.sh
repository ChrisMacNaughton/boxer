#!/bin/bash

echo "Installing setup dependencies"
sudo apt-get install -yqq git curl

rm -rf /tmp/boxer
git clone --recurse-submodules https://github.com/ChrisMacNaughton/boxer /tmp/boxer
sudo /tmp/boxer/scripts/bootstrap.sh