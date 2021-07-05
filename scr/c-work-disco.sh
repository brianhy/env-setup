#!/bin/bash
#
# This is a shell function.  It shouldn't be run
# directly from shell via file name.
# Instead, it must be sourced from bash
# setup file, and from then, it can be used
# by referring to the function name below.


# Handle navigation of the tofu directory
handle_tofu() {
	if [ "$1" = "" ]
	then
		echo "    |- m   - $GITDIR/csdisco/docss-tofu/src/main/python"
        return
    fi

    shift 1
    if [ "$1" == "" ]
    then
        cd $GITDIR/csdisco/docss-tofu
    elif [ "$1" = "m" ]
    then
        cd  $GITDIR/csdisco/docss-tofu/src/main/python
    fi
}


# Handle navigation in the csdisco directory
# Execution is handed off here when you pass
# 'csd' as first argument
handle_csd() {
	if [ "$1" = "" ]
	then
		echo "c          - $GITDIR/csdisco"
		echo " |- d      - $GITDIR/csdisco/disco-app"
		echo " |- d2     - $GITDIR/csdisco/disco-app2"
		echo " |- s      - $GITDIR/csdisco/search"
		echo " |- de     - $GITDIR/csdisco/data-explorer"
		echo " |- ad     - $GITDIR/csdisco/aws-deploy"
		echo " |- uc     - $GITDIR/csdisco/utility-coordmap"
		echo " |- ur     - $GITDIR/csdisco/utility-regex"
		echo " |- rs     - $GITDIR/csdisco/redaction-service"
		echo " |- mt     - $GITDIR/csdisco/microservice-template"
		echo " |- sb     - $GITDIR/csdisco/shared-build"
		echo " |- ix     - $GITDIR/csdisco/indexing-service"
		echo " |- sc     - $GITDIR/csdisco/sor_client_python"
		echo " |- e      - $GITDIR/csdisco/es-rate-limit-proxy"
		echo " |- t      - $GITDIR/csdisco/docss-tofu"
        handle_tofu
		return
	fi

	shift 1
	if [ "$1" = "" ]
	then
		cd $GITDIR/csdisco
    elif [ "$1" = "d" ]
    then
        cd $GITDIR/csdisco/disco-app
	elif [ "$1" = "d2" ]
	then
		cd $GITDIR/csdisco/disco-app2
	elif [ "$1" = "s" ]
	then
		cd $GITDIR/csdisco/search
    elif [ "$1" = "de" ]
    then
        cd $GITDIR/csdisco/data-explorer
	elif [ "$1" = "ad" ]
	then
		cd $GITDIR/csdisco/aws-deploy
	elif [ "$1" = "uc" ]
	then
		cd $GITDIR/csdisco/utility-coordmap
	elif [ "$1" = "ur" ]
	then
		cd $GITDIR/csdisco/utility-regex
	elif [ "$1" = "rs" ]
	then
		cd $GITDIR/csdisco/redaction-service
	elif [ "$1" = "mt" ]
	then
		cd $GITDIR/csdisco/microservice-template
	elif [ "$1" = "sb" ]
	then
		cd $GITDIR/csdisco/shared-build
	elif [ "$1" = "ix" ]
	then
		cd $GITDIR/csdisco/indexing-service
	elif [ "$1" = "sc" ]
	then
		cd $GITDIR/csdisco/sor_client_python
	elif [ "$1" = "e" ]
	then
		cd $GITDIR/csdisco/es-rate-limit-proxy
	elif [ "$1" = "t" ]
	then
        handle_tofu $@
	else
		cd "$1"
	fi
}

# Handle navigation in the ocr projects
# Execution is handed off here when you pass
# 'lda' as first argument
handle_lda() {
	if [ "$1" = "" ]
	then
		echo "lda"
		echo " |- e      - $GITDIR/csdisco/ingest-email-process"
		echo " |- xl     - $GITDIR/csdisco/ingest-excel-process"
		echo " |- et     - $GITDIR/csdisco/ingest-pdf-extracttext"
		echo " |- pt     - $GITDIR/csdisco/ingest-pdf-placetext"
		echo " |- ppt    - $GITDIR/csdisco/ingest-powerpoint-process"
		echo " |- w      - $GITDIR/csdisco/ingest-word-process"
		echo " |- av     - $GITDIR/csdisco/disco-clamav"
		return
	fi

	shift 1
    if [ "$1" = "e" ]
    then
        cd $GITDIR/csdisco/ingest-email-process
    elif [ "$1" = "et" ]
    then
        cd $GITDIR/csdisco/ingest-pdf-extracttext
    elif [ "$1" = "pt" ]
    then
        cd $GITDIR/csdisco/ingest-pdf-placetext
    elif [ "$1" = "ppt" ]
    then
        cd $GITDIR/csdisco/ingest-powerpoint-process
    elif [ "$1" = "xl" ]
    then
        cd $GITDIR/csdisco/ingest-excel-process
    elif [ "$1" = "w" ]
    then
        cd $GITDIR/csdisco/ingest-word-process
    elif [ "$1" = "av" ]
    then
        cd $GITDIR/csdisco/disco-clamav
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
		echo "es         - $GITDIR/env-setup"
		handle_csd
        handle_lda
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
	elif [ "$1" = "c" ]
	then
		handle_csd $@
	elif [ "$1" = "lda" ]
	then
		handle_lda $@
	elif [ "$1" = "v-ft" ]
	then
		cd /usr/share/vim/vim74/ftplugin
	else
		cd "$1"
	fi
}
