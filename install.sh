#!/bin/sh
# Created by: WestleyR
# Email: westleyr@nym.hush.com
# version-1.0.0
# Date: Jan 20, 2018
# https://github.com/WestleyK/easy-clone
#
# The Clear BSD License
#
# Copyright (c) 2019 WestleyR
# All rights reserved.
#
# This software is licensed under a Clear BSD License.
#

#
# Usage: ./install.sh
#

set -e

SCRIPT_NAME=".day-timer.sh"
INSTALL_TO="${HOME}"

if ! [ -x "$(command -v ecgo)" ]; then
    echo "ERROR: You need to install: ecgo"
    echo "https://github.com/WestleyK/ecgo"
    exit 1
fi

ecgo -i "Checking .bashrc..."
if [ $(cat ~/.bashrc | grep .day-timer.sh | wc -l) -eq 0 ]; then
    ecgo -i "Added somthing to .bashrc..."
    cat << EOF >> ~/.bashrc
if [ \$(ps aux | grep hour-meter | wc -l ) -le 1 ]; then
    ./.day-timer.sh &
fi
EOF
fi

ecgo -i "Installing: ${SCRIPT_NAME}: to: ${INSTALL_TO}"
cp -f "$SCRIPT_NAME" "$INSTALL_TO"

ecgo -green "DONE."

#
# End install.sh
#
