# The following variables are for PATH inclusions, to gain access to their
# binaries at the shell without prefixing with root paths. Defining each by 
# name for more clarity.
DEFAULT=/usr/local/sbin:/usr/sbin:/sbin:/usr/bin:/bin:~/bin:./vendor/bin
# If the Android development toolkit is installed.
ANDROID=${HOME}/Library/Android/sdk/platform-tools

# Homebrew executables (non-cask)
HOMEBREW=/usr/local/Cellar:/usr/local/bin:/usr/local/sbin
# Composer global executables.
COMPOSER=${HOME}/.composer/vendor/bin
# Ruby global executables.
GEM_BIN=$GEM_HOME/bin
YARN_BIN=$(yarn global bin)
NPM="${HOME}/.npm-packages/bin"
RVM="${HOME}/.rvm/bin" # Add RVM to PATH for scripting
NODEBREW="${HOME}/.nodebrew/current/bin"
SYMFONY_CLI="${HOME}/.symfony/bin"
GRADLE_HOME=/Applications/Android\ Studio.app/Contents/gradle/gradle-5.1.1/
JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
# Add access to scripts pyrsa-decrypt, pyrsa-decrypt-bigfile, pyrsa-encrypt, pyrsa-encrypt-bigfile, pyrsa-keygen, pyrsa-priv2pub, pyrsa-sign and pyrsa-verify

PYTHON=${HOME}/Library/Python/3.7/bin:${HOME}/Library/Python/2.7/bin

# The following exports are for package requirements, not because I need themn in the
# path.
GEM_HOME=$HOME/.rvm/gems/ruby-2.3.0
GEM_PATH=$GEM_HOME

# Outputs the WAN IP (as from whatismyip) to the console.
function wan_ip {
	curl -s http://checkip.dyndns.org | sed 's/[a-zA-Z/<> :]//g'
}

# Outputs the LAN IP for my machine to the console.
function lan_ip {
	ifconfig | grep 'inet ' | grep -v '127.0.0.1' | awk '{print $2}';
}

# Uses spotify docker image to clean docker images
# See https://github.com/spotify/docker-gc#running-as-a-docker-container
# See https://github.com/spotify/docker-gc/issues/190
function clean_docker {
    docker run --rm --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /private/etc:/etc:ro spotify/docker-gc
}

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

## Add bash completion.
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export PATH=${JAVA_HOME}/bin:${MARIADB}:${HOMEBREW}:${COMPOSER}:${SYMFONY_CLI}:${DEFAULT}:${NPM}:${RVM}:${APACHE}:${ANDROID}:${GEM_BIN}:${PYTHON}:${GISTS}:${NODEBREW}:${GRADLE_HOME}/bin
export ANDROID_HOME=/usr/local/opt/android-sdk
export JAVA_HOME
export GRADLE_HOME
export EDITOR=emacs
export GEM_HOME
export GEM_PATH
export wan_ip
export lan_ip
export vsc

# Directory only prompt.  Keep it quiet.
PS1="\W >"


# Do aliases last, after paths have been established. Some of these are 
# dynamic.
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
# Use aws flag with common settings
alias aws="$(which aws) --region us-west-2"
alias simulator='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'
# Allows opening Chrome easily on the command line.  Also use "&> /dev/null".
# Useful when passing
# flags is needed, e.g.
#   --incognito
#   --ignore-certificate-errors
#   --aggressive-cache-discard
#   --disable-cache
#   --disable-application-cache
#   --disable-offline-load-stale-cache
#   --disk-cache-size=0
#   --new-window
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
