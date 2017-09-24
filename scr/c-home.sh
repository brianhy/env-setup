#!/bin/bash
#
# This is a shell function.  It shouldn't be run
# directly from shell via file name.
# Instead, it must be sourced from bash
# setup file, and from then, it can be used
# by referring to the function name below.



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
		echo "wud   - /mnt/c/Users/bghya/Documents"
		echo "mte   - $GITDIR/mnist-tf-exploration"
		echo "ndl   - $GITDIR/neural-networks-and-deep-learning"
		echo "ts    - $GITDIR/titanic-survivor"
		echo "ngex  - $GITDIR/AngularExploration"
		echo "um    - $GITDIR/umbelmania"
		echo "mws   - $GITDIR/mnist-web-service"
		echo "es    - $GITDIR/env-setup"
		echo "cyn   - $GITDIR/cynch"
		echo ""
		echo "v-ft  - /usr/share/vim/vim74/ftplugin"
		echo ""
		echo "__ref - refresh c.sh"
		echo "__e   - edit c.sh"
	elif [ "$1" = "__ref" ]
	then
		. ${BASH_SOURCE}
	elif [ "$1" = "__e" ]
	then
		vim ${BASH_SOURCE}
	elif [ "$1" = "wud" ]
	then
		cd /mnt/c/Users/bghya/Documents
	elif [ "$1" = "mte" ]
	then
		cd $GITDIR/mnist-tf-exploration
	elif [ "$1" = "ndl" ]
	then
		cd $GITDIR/neural-networks-and-deep-learning
	elif [ "$1" = "ts" ]
	then
		cd $GITDIR/titanic-survivor
	elif [ "$1" = "ngex" ]
	then
		cd $GITDIR/AngularExploration
	elif [ "$1" = "um" ]
	then
		cd $GITDIR/umbelmania
	elif [ "$1" = "mws" ]
	then
		cd $GITDIR/mnist-web-service
	elif [ "$1" = "es" ]
	then
		cd $GITDIR/env-setup
	elif [ "$1" = "cyn" ]
	then
		cd $GITDIR/cynch
	elif [ "$1" = "v-ft" ]
	then
		cd /usr/share/vim/vim74/ftplugin
	else
		cd "$1"
	fi
}
