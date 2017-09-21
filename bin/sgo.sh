#!/bin/bash

#
# SGO.SH
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
