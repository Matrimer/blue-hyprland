#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
echo "Setting 'CAP_SYS_NICE=eip' for gamescope executable"
setcap 'CAP_SYS_NICE=eip' $(which gamescope)
