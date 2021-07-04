# env-setup

To setup your .bashrc, .vimrc and git configurations, run: `env-setup/bin/setup-env.sh <target terminal>`
* `target terminal` = `bash` or `zsh`

## Manual Steps

### Zsh

Need to modify `~/.zshrc` to contain the following:

```
plugins=(git)

source $ZSH/oh-my-zsh.sh

source ~/.zshrc.personal
```

## .bash_profile
_~/.bash_profile should look something like this_
```
[[ -r ~/.bashrc ]] && . ~/.bashrc
```
