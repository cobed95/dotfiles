#Bootstrapping file.
#Maintained by  : Eundo Lee
#Created on     : 2018/05/16
#Last updated   : 2018/05/16
#Intended OS    : macOS High Sierra


#-------------------- HOMEBREW SECTION ----------------------.
# Check if homebrew is installed and install it otherwise.
which brew > brewpath
BREWPATH=$(echo $brewpath)
export BREWPATH
if [[ $BREWPATH="brew not found" ]]
then /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
rm brewpath


#---------------------- GIT SECTION -------------------------.
# Check if git is installed and install it otherwise.
which git > gitpath
GITPATH=$(echo $gitpath)
export GITPATH
if [[ $GITPATH="git not found" ]]
then brew install git
fi
rm gitpath

# Set user info.
git config --global user.name "Eundo Lee"
git config --global user.email "cobed95@gmail.com"

# Clone into important repositories.
git clone git@github.com:cobed95/snu-2018-1.git ../
git clone git@github.com:cobed95/learning-ps.git ../


#-------------------- LANGUAGE SECTION ----------------------.


######## PYTHON ########

# Check if Python3 is installed and install it otherwise.
which python3 > python3path
PYTHON3PATH=$(echo $python3path)
export PYTHON3PATH
if [[ $PYTHON3PATH="python3 not found" ]]
then brew install python3
fi
rm python3path

# Automatically update Python3.
brew update python3

# Check if pip is installed and install it otherwise.
# pip is included in the brew python3 package.
which pip > pippath
PIPPATH=$(echo $pippath)
export PIPPATH
if [[ $PIPPATH="pip not found" ]]
then echo "pip not found even after installing python3 through homebrew. Installing through root..."
    sudo easy-install pip
fi
rm pippath

# Automatically update pip.
pip install --upgrade pip

# Install external modules through pip.
# NumPy
pip install numpy

# MatPlotLib
pip install --upgrade matplotlib

# PyGame
pip install --upgrade pygame

# VirtualEnv
pip install --upgrade virtualenv

# TensorFlow
virtualenv --system-site-packages -p python3 ~/tensorflow
cd ~/tensorflow
source ./bin/activate
pip3 install --upgrade tensorflow
deactivate
cd ~/dotfiles


######## JAVA ########

# Check if Java is installed and install it otherwise.
which java > javapath
JAVAPATH=$(echo $javapath)
export JAVAPATH
if [[ $JAVAPATH="java not found" ]]
then brew cask install java9
fi
rm javapath

# Automatically update Java
brew cask update java


#------------------ PERSONAL PREFERENCES --------------------.
#Install Oh My Zsh using wget.
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install Amix's awesome vimrc.
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Install Source Code Pro.
brew tap caskroom/fonts && brew cask install font-source-code-pro

# Install Vim syntax highlighting for Bluespec System Verilog.
git clone https://github.com/hanw/vim-bluespec.git ../.vim_runtime/sources_non_forked
