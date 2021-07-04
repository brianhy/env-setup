#!/bin/bash

#
# setupEnv.sh
#
# A Simple shell file that iterates through all setup
# shell scripts and executes them.
#

targetShell="${1:-bash}"
if [ "${targetShell}" != "zsh" ] && [ "${targetShell}" != "bash" ]; then
    echo "Unknown target shell '${targetShell}'"
    exit 42
fi

echo "Target Shell = ${targetShell}"

psCurrentShellOutput=$(ps -p$$ -ocommand=)

# Directory where all scripts for setup are found
if [[ "${psCurrentShellOutput}" == bash* ]]; then
    currentShell="bash"
elif [[ "${psCurrentShellOutput}" == zsh* ]]; then
    currentShell="zsh"
fi

echo "Current Shell = ${currentShell}"

if [ "${currentShell}" = "bash"  ]; then
    SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
elif [ "${currentShell}" = "zsh" ]; then
    SCRIPTDIR="$( cd "$( dirname "${0:A}" )" && pwd)"
fi

echo "Script Dir = ${SCRIPTDIR}"

echo "GITDIR= "
read GITDIR_IN
export GITDIR=${GITDIR_IN}

bash ${SCRIPTDIR}/svo.sh # Setup VIM settings
bash ${SCRIPTDIR}/sgo.sh # Setup git settings
bash ${SCRIPTDIR}/installPyenv.sh

#
# Install tools
#
case "${unameOut}" in
    Linux*)    bash ${SCRIPTDIR}/linux_installTools.sh;;
    Darwin*)   bash ${SCRIPTDIR}/mac_installTools.sh;;
    *)         echo "Unknown Machine ${unameOut}"
esac


# Setup completions
if [ "${targetShell}" = "bash" ]; then
    mkdir ~/.completions
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.completions/git-completions.bash
fi

#
# ZSH
#
if [ "${targetShell}" = "zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

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

if [ "${targetShell}" = "bash" ]; then
    profileFileName=".bash_profile"
    rcFile="bashrc"
elif [ "${targetShell}" = "zsh" ]; then
    profileFileName=".zprofile"
    rcFile="zshrc"
fi

cat > ~/"${profileFileName}" << EOM
export GITDIR=${GITDIR_IN}

#
# Source bash file from git
#
. "\${GITDIR}/p/env-setup/cf/${rcFile}"

#
# PYENV
#
export PATH="${PATH}:~/.pyenv/bin"
eval "\$(pyenv init -)"

${GITSSH}

EOM

