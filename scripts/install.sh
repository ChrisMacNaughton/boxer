#!/bin/bash

echo "Installing git"
apt-get install -yqq git

git clone https://github.com/ChrisMacNaughton/boxer /tmp/boxer
sudo /tmp/boxer/scripts/botstrap.sh