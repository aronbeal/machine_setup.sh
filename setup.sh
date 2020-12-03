echo "Creating an SSH key for you..."
ssh-keygen -t rsa

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

echo "Installing xcode-stuff"
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update
# Custom taps
brew tap drud/ddev

# Install core homebrew packages
homebrew_packages=(
    ack
    apr
    apr-util
    argon2
    aspell
    autoconf
    aws-elasticbeanstalk
    awscli
    brotli
    c-ares
    closure-compiler
    cmake
    cocoapods
    composer
    coreutils
    curl-openssl
    ddev
    dnsmasq
    docker
    emojify
    flac
    fontconfig
    freetds
    freetype
    fribidi
    gawk
    gcc
    gd
    gdbm
    gettext
    ghostscript
    git
    git-extras
    git-flow
    git-lfs
    glib
    gmp
    go
    graphviz
    gts
    htop # Like top, but easier to navigate.
    icu4c
    isl
    jansson
    jasper
    jemalloc
    jmeter
    jpeg
    jq # Bash level json parsing
    json-yaml
    jsonpp
    lame
    libev
    libevent
    libffi
    libgcrypt
    libgpg-error
    libidn
    libidn2
    libmetalink
    libmpc
    libogg
    libpng
    libpq
    libsndfile
    libsodium
    libssh2
    libtiff
    libtool
    libunistring
    libvorbis
    libyaml
    libzip
    mackup
    mad
    midnight-commander
    minica
    mkcert
    mpfr
    mysql-client
    ncurses
    ncdu # Disk utility for terminal
    netpbm
    nghttp2
    node
    nodebrew
    noti
    nspr
    nss
    oniguruma
    openldap
    openssl
    openssl@1.1
    opus
    opusfile
    pcre2
    percona-xtrabackup
    php
    pkg-config
    pngcrush
    python3
    qcachegrind
    qt
    readline
    rlwrap
    rsync
    rtmpdump
    s-lang
    sox
    sqlite
    squid
    taskwarrior # open-source terminal-based TODO program
    telnet
    terraform
    tidy-html5
    timer
    tldr # Like man page, but with examples, e.g. 'tldr find'
    translate-shell
    travis
    tree
    tty-clock #clock for the terminal.
    typora
    unison
    unixodbc
    watchman
    webp
    wifi-password # Shows password of current wifi, keychain shortcut.
    wget
    xz
    yajl
)
echo "Installing Homebrew Packages..."
brew install ${homebrew_packages[@]}

echo "Git config"

git config --global user.name "Aron Beal"
git config --global user.email aron.beal.biz@gmail.com


# Apps (Cask installation)
apps=(
    alfred
    android-sdk
    android-studio
    angry-ip-scanner
    caffeine
    cyberduck
    dbeaver-community
    diffmerge
    docker
    firefox
    gas-mask
    google-chrome
    harvest
    intel-haxm
    iterm2
    java
    kdiff3
    mysqlworkbench
    ngrok
    p4v
    phpstorm
    postman
    sequel-pro
    slack
    sourcetree
    spectacle
    spotify
    squidman
    sublime-text
    typora
    visual-studio-code
    vlc
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew install --cask --appdir="/Applications" ${apps[@]}

brew cask alfred link

echo "Cleaning up brew"
brew cask cleanup
brew cleanup

echo "Adding a default profile to ${HOME}/.profile..."
cp ./.profile ${HOME}/.profile

echo "Setting some Mac settings..."

#"Disabling system-wide resume"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

#"Disabling automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

#"Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

#"Disabling OS X Gate Keeper"
#"(You'll be able to install any app you want from here on, not just Mac App Store apps)"
sudo spctl --master-disable
sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
defaults write com.apple.LaunchServices LSQuarantine -bool false

#"Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

#"Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#"Saving to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

#"Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

#"Disable smart quotes and smart dashes as they are annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

#"Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

#"Disabling press-and-hold for keys in favor of a key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

#"Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

#"Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

#"Showing icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

#"Showing all filename extensions in Finder by default"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

#"Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

#"Use column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Clmv

#"Avoiding the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#"Enabling snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

#"Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 36

#"Speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

#"Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

#"Setting the dock to only show actively running applications"
defaults write com.apple.dock static-only -bool TRUE; killall Dock;

#"Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

#"Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default"
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

#"Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

#"Disable the sudden motion sensor as its not useful for SSDs"
sudo pmset -a sms 0

#"Speeding up wake from sleep to 24 hours from an hour"
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
sudo pmset -a standbydelay 86400

#"Disable annoying backswipe in Chrome"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

#"Setting screenshots location to ~/Desktop"
defaults write com.apple.screencapture location -string "$HOME/Desktop"

#"Setting screenshot format to PNG"
defaults write com.apple.screencapture type -string "png"

#"Disable 'natural' (Lion-style) scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

killall Finder

echo "Done!"
