#
# svo.sh
#
# Setup VIM Options
#

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
