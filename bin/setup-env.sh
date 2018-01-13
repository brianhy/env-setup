#
# setupEnv.sh
#
# A Simple shell file that iterates through all setup
# shell scripts and executes them.
#

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -g|--gitdir)
    GITDIR="$2"
    shift # past argument
    shift # past value
    ;;
	-m|--mode)
	MODE="$2"
	shift # past argument
	shift # past value
	;;
	*)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

if [ "x${GITDIR}" = "x" ]; then

echo "Need to specify GITDIR"
exit

fi

if [ "x${MODE}" = "xdisco" ]; then

    CDIR="\${GITDIR}/env-setup/scr/c-work-disco.sh"

    mkdir -p ${GITDIR}/csdisco

fi

#
# BASH SETTINGS
#
echo "Setup Bash Settings"

# Create .bashrc file that points to env-setup's bashrc
if [ ! -f ~/.bashrc ]; then
    BASHRCTEXT="# Setup GITDIR\nexport GITDIR=$GITDIR\n\n. \"\${GITDIR}/env-setup/cf/bashrc\""

    if [ "x${CDIR}" != "x" ]; then
        BASHRCTEXT="${BASHRCTEXT}\n. \"${CDIR}\""
    fi

echo -e "${BASHRCTEXT}" > ~/.bashrc 

fi

#
# VIM SETTINGS
#
echo "Setup VIM Settings"

# Create .vimrc file that points to env-setup's vimrc
if [ ! -f ~/.vimrc ]; then

cat >~/.vimrc <<EOL
"
" Source the vimrc stashed in git
"
source \$GITDIR/env-setup/cf/vimrc
EOL

fi

# Install plug-in manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plug-ins
vim +PlugInstall +qall

#
# Setup git options
#

# Execute basic git command to check existence
git --version 2>&1 >/dev/null
GIT_VERSION_EXIT_CODE=$?

if [ $GIT_VERSION_EXIT_CODE -ne 0 ]
    then
        echo "NO GIT INSTALLED"
        exit 1
fi

# If we're here, then git does indeed exist.  Let's start configuring.

#
# Git config options
#

# Set default options for all projects
git config --global core.editor vim
git config --global user.name "Brian Hyams"
git config --global alias.lod "log --oneline --decorate"
git config --global alias.lodg "log --oneline --decorate --graph"
git config --global alias.d "diff"
git config --global alias.ds "diff --staged"
