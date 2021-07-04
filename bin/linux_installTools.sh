echo "Linux install tools"

echo "Installing pyenv"
# Install pyenv prerequisites (e.g. to allow building python versions)
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

curl https://pyenv.run | bash

echo "Installing tree..."
sudo apt-get install tree

echo "Installing GNU parallel..."
sudo apt-get install parallel

echo "Installing jq..."
sudo apt-get install jq

echo "Done installing tools"
