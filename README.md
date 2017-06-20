# env-setup
## .bashrc
_~/.bashrc should look something like this_
```
  # Setup GITDIR var
  export GITDIR=/mnt/c/Users/bghya/git

  #
  # source bash file from git
  #
  . "$GITDIR/env-setup/cf/bashrc"
```
## .bash_profile
_~/.bash_profile should look something like this_
```
[[ -r ~/.bashrc ]] && . ~/.bashrc
```
## .vimrc
_~/.vimrc should look something like this_
```
  "
  " Source the vimrc stashed in git
  "
  source $GITDIR/env-setup/cf/vimrc
```
