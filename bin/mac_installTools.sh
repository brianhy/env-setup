echo "Mac install tools"

echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing pyenv..."
brew install pyenv

echo "Installing tree..."
brew install tree

echo "Installing GNU parallel..."
brew install parallel

echo "Installing GNU grep..."
brew install grep

echo "Installing jq..."
brew install jq

echo "Done installing tools"
