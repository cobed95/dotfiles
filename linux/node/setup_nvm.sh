# Install required library
sudo apt-get install build-essential libssl-dev

# Install nvm
curl https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
source ~/.profile

# Setup nvm
nvm --version
nvm install 12.6
nvm alias default 12.6
