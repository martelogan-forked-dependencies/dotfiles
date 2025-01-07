#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed` as gsed
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion@2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  if [ "$SHELL" != "/usr/local/bin/fish" ]; then
    chsh -s "${BREW_PREFIX}/bin/bash";
  fi;
fi;

# Install `wget`
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
# # OPTIONAL: below can cause issues on Mac
# brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
# brew install hashpump
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
# brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xz

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install gs
brew install imagemagick
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# ** Programming **
# largely from https://github.com/donnemartin/dev-setup/blob/master/brew.sh

# More git
brew install git-flow
brew install git-extras
brew install hub

# Cask
# deprecated taps commented out but preserved for posterity
# brew tap homebrew/cask 
brew install brew-cask-completion
# brew tap homebrew/cask-versions

# Install Python
brew install python
brew install python3

# Java

# OLD JDK via jenv installation (deprecated casks) preserved as comments for posterity
# brew tap AdoptOpenJDK/openjdk
# brew install --cask adoptopenjdk/openjdk/adoptopenjdk8
# brew install --cask adoptopenjdk/openjdk/adoptopenjdk11

# brew install jenv

# LINE='if which jenv > /dev/null; then eval "$(jenv init -)"; fi'
# grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# technically the following are not brews...keep an eye for issues but sdkman is 2024's preferred Java env tool 
# and zsh is 2024's default macos shell
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sdk install java

# Lxml and Libxslt
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force

# Misc
brew install pkg-config libffi
brew install pandoc
brew install vips

# Remove outdated versions from the cellar.
brew cleanup
