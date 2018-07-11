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

		read -r -p "Remove all icons from the Dock [y|N]? " choice
		if [[ $choice =~ (yes|y|Y) ]]; then
			defaults write com.apple.dock persistent-apps -array
		fi
		
		running "Executing MacOS configuration script"
		source ./shlibs/osx.sh

		read -r -p "Install ZSH, Brew and all the applications [Y|n]?" choice
		if [[ $choice =~ (no|n|N) ]]; then
			source ./shlibs/brew.sh
			source ./shlibs/macosAppConfig.sh
		fi
	elif [[ $platform == "linux" ]]; then
		bot "I detected your OS as Linux, good for you!"
		bot "I don't have any installation configuration for you, so you have to skip this for know :("
	else
		error "Your operating system, `uname`, is not supported by this script."
		exit;
	fi
}

# showInfo

bot "All applications have now been installed and configured."
bot "I will now configure all the dotfiles. Let's start with GitHub!"

read -r -p "Git username: " input
sed "s/NAME/$input/g" init/gitconfig > tmp.properties
read -r -p "Git email: " input
sed "s/MAIL/$input/g" tmp.properties > tmp2.properties
read -r -p "Editor (i.e. 'vim', 'nano', 'code -w', 'subl -w'): " input
sed "s/EDITOR/$input/g" tmp2.properties > tmp.properties

cp tmp.properties ~/.gitconfig
rm tmp.properties tmp2.properties

bot "All configurations finished successfully."
bot "IMPORTANT: All dotfiles have not yet been setup in this script."
