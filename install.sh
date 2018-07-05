#!/usr/bin/env bash

##############################
# This script installs some very basic dotfiles, but more importantly, it 
# prepares easy installation and maintenance of custom or generated dotfiles
# @author Anders Wiberg
##############################

# Include a few custom helper libraries
source ./shlibs/print.sh

unameStr=`uname`
platform="undefined"

if [[ $unameStr == "Darwin" ]]; then
	platform="macos"
elif [[ $unameStr == "Linux" ]]; then
	platform="linux"
fi

showInfo() {
	if [[ $platform == "macos" ]]; then
		bot "I can see you are running MacOSX, good choice!"
		running "Executing MacOS configuration script"
		# TODO: Spørg bruger om de vil have slettet alle ikonerne i Docken
		# defaults write com.apple.dock persistent-apps -array
		source ./shlibs/osx.sh
	elif [[ $platform == "linux" ]]; then
		bot "I detected your OS as Linux, good for you!"
	else
		error "Your operating system, `uname`, is not supported by this script."
		exit;
	fi
}

showInfo