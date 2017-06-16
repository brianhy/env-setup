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
## .vimrc
_~/.vimrc should look something like this_
```
  "
  " Source the vimrc stashed in git
  "
  source $GITDIR/env-setup/cf/vimrc
```
