#Bootstrapping file.
#Maintained by  : Eundo Lee
#Created on     : 2018/06/17
#Last updated   : 2018/06/17
#Intended OS    : Ubuntu


sudo apt-get update

#---------------------- GIT SECTION ------------------------.
# Check if git is installed and install it otherwise.
GITPATH=$(which git)
if [[ $GITPATH="git not found" ]]
then sudo apt-get install git
fi

# Clone into dotfiles repositories.
git clone git@github.com:cobed95/dotfiles.git ../

#------------------- LANGUAGE SECTION ----------------------.


######## PYTHON ########

# Check if Python3 is installed and install it otherwise.
PYTHON3PATH=$(which python3)
if [[ $PYTHON3PATH="python3 not found" ]]
then sudo apt-get install python3.6
fi

# Check if pip is installed and install it otherwise.
PIPPATH=$(which pip)
if [[ $PIPPATH="pip not found" ]]
then sudo apt install python3-pip
fi

# Automatically update pip.
pip install --upgrade pip

# VirtualEnv
pip install --upgrade virtualenv


######## JAVA ########

# Check if Java is installed and install it otherwise.
JAVAPATH=$(which java)
if [[ $JAVAPATH="java not found" ]]
then sudo apt-get install openjdk-10-jdk
fi


#------------------ PERSONAL PREFERENCES --------------------.
# Install Oh My Zsh using wget.
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install Amix's awesome vimrc.
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Install Vim syntax highlighting for Bluespec System Verilog.
git clone https://github.com/hanw/vim-bluespec.git ../.vim_runtime/sources_non_forked
