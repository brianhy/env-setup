#
# setupEnv.sh
#
# A Simple shell file that iterates through all setup
# shell scripts and executes them.
#

# Directory where all scripts for setup are found
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"

bash $SCRIPTDIR/svo.sh # Setup VIM settings
bash $SCRIPTDIR/sgo.sh # Setup git settings
