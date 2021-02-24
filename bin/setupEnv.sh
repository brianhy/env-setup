#!/bin/bash

#
# setupEnv.sh
#
# A Simple shell file that iterates through all setup
# shell scripts and executes them.
#

# Directory where all scripts for setup are found
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

echo "GITDIR= "
read GITDIR_IN
export GITDIR=${GITDIR_IN}

bash ${SCRIPTDIR}/svo.sh # Setup VIM settings
bash ${SCRIPTDIR}/sgo.sh # Setup git settings
bash ${SCRIPTDIR}/installPyenv.sh

#
# Install tools
#
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)    bash ${SCRIPTDIR}/linux_installTools.sh;;
    Darwin*)   bash ${SCRIPTDIR}/mac_installTools.sh;;
    *)         echo "Unknown Machine ${unameOut}"
esac

# Setup completions
mkdir ~/.completions
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.completions/git-completions.bash

echo "GITSSH_KEY= "
read GITSSH_KEY_IN

GITSSH=""
if [ "$GITSSH_KEY_IN" != "" ]; then
    read -r -d '' GITSSH << EOM
#
# setup git ssh
#
eval "\$(ssh-agent -s)" 1>/dev/null
ssh-add ~/.ssh/${GITSSH_KEY_IN} &>/dev/null
EOM
fi

cat > ~/.bash_profile << EOM
export GITDIR=${GITDIR_IN}

#
# Source bash file from git
#
. "\${GITDIR}/env-setup/cf/bashrc"

#
# PYENV
#
export PATH="${PATH}:~/.pyenv/bin"
eval "\$(pyenv init -)"

${GITSSH}

EOM

