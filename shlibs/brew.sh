#!/usr/bin/env bash

# Inspiration: 
#   https://sourabhbajaj.com/mac-setup/Docker/
#   https://github.com/rootbeersoup/dotfiles/blob/master/macos/brew.sh
#   https://github.com/mathiasbynens/dotfiles/blob/master/brew.sh

# Install command-line tools using Homebrew.
if ! [[ -x "$(command -v brew)" ]]; then 
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update and Upgrade
brew update
brew upgrade

# Taps
brew tap homebrew/core
brew tap homebrew/bundle
brew tap homebrew/services
brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts
brew tap crisidev/chunkwm
brew tap koekeishiya/formulae

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Instal ZSH and oh-my-zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
 Set default shell to zsh
#chsh -s $(which zsh)

# # Switch to using brew-installed bash as default shell
# if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
#   echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
#   chsh -s /usr/local/bin/bash;
#fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg
brew install pth

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install tmux
brew install homebrew/php/php71 --with-gmp

# General tools
brew install ctags
brew install curl
brew install stow
brew install tldr
brew install unar
brew install watch
brew install fzf # Nice: https://sourabhbajaj.com/mac-setup/iTerm/fzf.html
brew install ack # https://sourabhbajaj.com/mac-setup/iTerm/ack.html

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
# brew install lua
# brew install lynx
brew install p7zip
# brew install pigz
# brew install pv
# brew install rename
# brew install rlwrap
brew install ssh-copy-id
brew install telnet
brew install cheat
# brew install tree
# brew install vbindiff
# brew install zopfli

# Language-specific tools
brew install python pipenv
pip install nose pyparsing python-dateutil pep8
brew install numpy scipy matplotlib
brew install node
brew install sass/sass/sass
brew install gcc
brew install docker
brew install docker-toolbox
brew install neovim

# Casks
brew install cask
brew cask install iterm2
brew cask install keybase
brew cask install mark-text
brew cask install homebrew/cask-versions/firefox-developer-edition
brew cask install google-chrome
brew cask install visual-studio-code
brew cask install sublime-text
brew cask install google-backup-and-sync
brew cask install spotify
brew cask install dotnet
brew cask install dotnet-sdk
brew cask install steam
brew cask install discord
brew cask install vlc
brew csak install the-unarchiver
brew cask install teamviewer
brew cask install qbittorrent

# Casks, but non-free software
brew cask install hazel
brew cask install 1password
brew cask install bartender
brew cask install jetbrains-toolbox
brew cask install adobe-creative-cloud
brew cask install parallels
brew cask install alfred
brew cask install evernote
brew cask install spectacle
# brew cask install cyberghost
# brew cask install subtitles

# mas
brew install mas
mas install 918858936	# Airmail 3
# mas install 931657367	# Calcbot
# mas install 873245660	# Spillo
mas install 497799835 # Xcode
mas install 512617038 # Snappy
mas install 803453959 # Slack
mas install 1116599239 # NordVPN
mas install 425424353 # The Unarchiver
mas install 937984704
# mas install 634148309 # Logic Pro X

# Other
brew install speedtest-cli

# Remove outdated versions from the cellar.
brew cleanup
