# The following variables are for PATH inclusions, to gain access to their
# binaries at the shell without prefixing with root paths. Defining each by 
# name for more clarity.
DEFAULT=/usr/local/sbin:/usr/sbin:/sbin:/usr/bin:/bin:~/bin:./vendor/bin
# If the Android development toolkit is installed.
ANDROID=${HOME}/android-sdk/tools:/Users/aronbeal/android-sdk/platform-tools
# Homebrew executables (non-cask)
HOMEBREW=/usr/local/Cellar:/usr/local/bin:/usr/local/sbin
# Composer global executables.
COMPOSER=${HOME}/.composer/vendor/bin
# Ruby global executables.
GEM_BIN=$GEM_HOME/bin
NPM="${HOME}/.npm-packages/bin"
RVM="${HOME}/.rvm/bin" # Add RVM to PATH for scripting
NODEBREW="${HOME}/.nodebrew/current/bin"
SYMFONY_CLI="${HOME}/.symfony/bin"
# Add access to scripts pyrsa-decrypt, pyrsa-decrypt-bigfile, pyrsa-encrypt, pyrsa-encrypt-bigfile, pyrsa-keygen, pyrsa-priv2pub, pyrsa-sign and pyrsa-verify

PYTHON=${HOME}/Library/Python/3.7/bin

# The following exports are for package requirements, not because I need themn in the
# path.
GEM_HOME=$HOME/.rvm/gems/ruby-2.3.0
GEM_PATH=$GEM_HOME

# Aliases
# Opens something in Sublime text using the 'subl' command.
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
# Opens something in Visual Studio Code using the 'vsc' command.
alias vsc="open -a \"Visual Studio Code\""
# Opens a shell to the php container for a docker-compose instance.
alias dbash="docker-compose exec php /bin/bash"
# Opens in PhpStorm
alias pstorm="open -a \"PhpStorm\""
# For a local installation of jmeter.  Note: need to update this
# once I get the homebrew version working properly.
alias jmeter=/Users/aronbeal/apache-jmeter-5.1.1/bin/jmeter

# Outputs the WAN IP (as from whatismyip) to the console.
function wan_ip {
	curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g'
}

# Outputs the LAN IP for my machine to the console.
function lan_ip {
	ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}';
}

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

## Add bash completion.
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export PATH=${NODEBREW}:${MARIADB}:${HOMEBREW}:${COMPOSER}:${SYMFONY_CLI}:${DEFAULT}:${NPM}:${RVM}:${APACHE}:${ANDROID}:${GEM_BIN}:${PYTHON}
export ANDROID_HOME=/usr/local/opt/android-sdk
export JAVA_HOME=$(/usr/libexec/java_home)
export EDITOR=emacs
export GEM_HOME
export GEM_PATH
export wan_ip
export lan_ip
export vsc

# Directory only prompt.  Keep it quiet.
PS1="\W >"