#!/usr/bin/env bash

##############################
# This script installs some very basic dotfiles, but more importantly, it 
# prepares easy installation and maintenance of custom or generated dotfiles
# @author Anders Wiberg
##############################

# Include a few custom helper libraries
source ./shlibs/print.sh

# Save arguments for later use
ARGS=()
while [[ $# -gt 0 ]]; do
	key="$1"
	case $key in
		-confonly)
		CONFONLY=true
		shift
		shift
		;;
	esac
done

[[ $CONFONLY ]]
if [[ $? = 0]]; then
	echo "Only config?"
fi

# if ! sudo grep -q "%wheel	ALL=(ALL) NOPASSWD: ALL #awo-dev/dotbot" "/etc/sudoers"; then
# 	echo "no sudo??"
# 	sudo -v
# fi

