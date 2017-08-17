#!/bin/bash
#
# This is a shell function.  It shouldn't be run
# directly from shell via file name.
# Instead, it must be sourced from bash
# setup file, and from then, it can be used
# by referring to the function name below.

# Handle navigation in the csdisco directory
# Execution is handed off here when you pass
# 'csd' as first argument
handle_csd() {
	if [ "$1" = "" ]
	then
		echo "csd     - $GITDIR/csdisco"
		echo " |- d   - $GITDIR/csdisco/disco-app"
		echo " |- ad  - $GITDIR/csdisco/aws-deploy"
		return
	fi

	shift 1
	if [ "$1" = "" ]
	then
		cd $GITDIR/csdisco
	elif [ "$1" = "d" ]
	then
		cd $GITDIR/csdisco/disco-app
	elif [ "$1" = "ad" ]
	then
		cd $GITDIR/csdisco/aws-deploy
	else
		cd "$1"
	fi
}

# "c", short for "cd".
# It'll take user-defined shortcut names and expand them
# to directories to the script will navigate.
#
# If script can't find user-defined name, then it'll assume
# it's an existing directory and will attempt to cd to it.
function c() {
	if [ "$1" = "" ]
	then
		echo ""
		echo "Help text for $(basename ${BASH_SOURCE}) [${BASH_SOURCE}]"
		echo ""
		echo "es      - $GITDIR/env-setup"
		handle_csd
		echo ""
		echo ""
		echo "__ref - refresh c.sh"
		echo "__e   - edit c.sh"
	elif [ "$1" = "__ref" ]
	then
		. ${BASH_SOURCE}
	elif [ "$1" = "__e" ]
	then
		vim ${BASH_SOURCE}
	elif [ "$1" = "es" ]
	then
		cd $GITDIR/env-setup
	elif [ "$1" = "csd" ]
	then
		handle_csd $@
	elif [ "$1" = "v-ft" ]
	then
		cd /usr/share/vim/vim74/ftplugin
	else
		cd "$1"
	fi
}
