#Bootstrapping file.
#Maintained by  : Eundo Lee
#Created on     : 2018/05/16
#Last updated   : 2020/06/30
#Intended OS    : macOS Catalina

# One argument is required to distinguish personal and company macs.
# Default value is omitted intentionally to prevent naive execution of this script.
OPTION=$1
if [[ ! $OPTION =~ ^(personal|company)$ ]]
then
    echo "BOOTSTRAP INFO: Missing required argument. Argument should be either \"personal\" or \"company\""
    exit
fi

echo "BOOTSTRAP INFO: Starting bootstrapping $OPTION mac..."

#------------------ SCRIPT UTILITY FUNCS --------------------.
# Takes user input to confirm installation of a target name.
confirm_install() {
    TARGET_NAME=$1
    read -n 1 -p "BOOTSTRAP INFO: File includes install script for $TARGET_NAME. Do you want to install it? (Y/n) " "PERMISSION"
    if [[ $PERMISSION == "Y" ]]
    then
        echo "\nBOOTSTRAP INFO: Installation for $TARGET_NAME confirmed"
        return 0
    fi

    echo "\n"
    return 1
}


#-------------------- HOMEBREW SECTION ----------------------.
# Check if homebrew is installed and install it otherwise.
echo "BOOTSTRAP INFO: Checking if homebrew is already found in the system..."

BREWPATH=$(which brew)
if [[ $BREWPATH = "brew not found" ]]
then
    echo "BOOTSTRAP INFO: Homebrew is not found in the system... Installing through curl..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "BOOTSTRAP INFO: Homebrew is already found in the system... Skipping installation..."
fi

echo "BOOTSTRAP INFO: Updating homebrew and upgrading brew packages..."
brew update
brew upgrade


#------------------ TEXT EDITOR SECTION ---------------------.
# Check if vim is installed and install it otherwise.
echo "BOOTSTRAP INFO: Checking if vim is already found in the system..."
VIMPATH=$(which vim)
if [[ $VIMPATH = "vim not found" ]]
then
    echo "BOOTSTRAP INFO: Vim is not found in the system... Installing through homebrew..."
    brew install vim
else
    echo "BOOTSTRAP INFO: Vim is already found in the system... Skipping installation..."
fi

echo "BOOTSTRAP INFO: Upgrading vim through homebrew..."
brew upgrade vim


#---------------------- GIT SECTION -------------------------.
# Check if git is installed and install it otherwise.
echo "BOOTSTRAP INFO: Checking if git is already found in the system..."
GITPATH=$(which git)
if [[ $GITPATH = "git not found" ]]
then
    echo "BOOTSTRAP INFO: Git is not found in the system... Installing through homebrew..."
    brew install git
else
    echo "BOOTSTRAP INFO: Git is already found in the system... Skipping installation..."
fi

echo "BOOTSTRAP INFO: Upgrading git through homebrew..."
brew upgrade git

# Set user info.
# Only set user info as below if bootstrapping is for a personal mac.
# Otherwise, the user info should be set manually.
if [[ $OPTION = "personal" ]]
then
    git config --global user.name "Eundo Lee"
    git config --global user.email "cobed95@gmail.com"
fi


#-------------------- LANGUAGE SECTION ----------------------.

######## PYTHON ########
confirm_install Python
PERMISSION=$?
if [[ $PERMISSION == "0" ]]
then
    echo "BOOTSTRAP INFO: Checking if python is already found in the system..."

    # Check if Python3 is installed and install it otherwise.
    PYTHON3PATH=$(which python3)
    if [[ $PYTHON3PATH = "python3 not found" ]]
    then
        echo "BOOTSTRAP INFO: Python 3 is not found in the system. Installing it through homebrew..."
        brew install python3
    else
        echo "BOOTSTRAP INFO: Python 3 is already found in the system. Skipping installation..."
    fi

    # Automatically update Python3.
    echo "BOOTSTRAP INFO: Upgrading Python 3 through homebrew..."
    brew upgrade python3

    # Check if pip is installed and install it otherwise.
    # pip is included in the brew python3 package.
    PIPPATH=$(which pip3)
    if [[ $PIPPATH = "pip3 not found" ]]
    then
        echo "BOOTSTRAP INFO: pip3 not found even after installing python3 through homebrew. Installing through root..."
        sudo easy-install pip3
    else
        echo "BOOTSTRAP INFO: pip3 is found in the system. Skpping installation..."
    fi

    # Automatically update pip.
    echo "BOOTSTRAP INFO: Upgrading pip3..."
    pip3 install --upgrade pip3

    # VirtualEnv
    echo "BOOTSTRAP INFO: Installing virtualenv..."
    pip3 install --upgrade virtualenv
else
    echo "BOOTSTRAP INFO: Skipping installation of Python..."
fi


######## JAVA ########
confirm_install Java
PERMISSION=$?
if [[ $PERMISSION == "0" ]]
then
    echo "BOOTSTRAP INFO: Checking if java is already found in the system..."
    # Check if Java is installed and install it otherwise.
    JAVAPATH=$(which java)
    if [[ $JAVAPATH = "java not found" ]]
    then
        echo "BOOTSTRAP INFO: Java is not found in the system. Installing it through homebrew cask..."
        brew cask install java
    else
        echo "BOOTSTRAP INFO: Java is already found in the system. Skipping installation..."
    fi

    # Automatically update Java
    echo "BOOTSTRAP INFO: Upgrading java..."
    brew cask upgrade java
else
    echo "BOOTSTRAP INFO: Skipping installation of Java..."
fi


#------------------ PERSONAL PREFERENCES --------------------.
# Install Oh My Zsh using wget.
echo "BOOTSTRAP INFO: Installing Oh My Zsh with wget..."
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install Amix's awesome vimrc.
echo "BOOTSTRAP INFO: Installing awesome vimrc..."
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Install Source Code Pro.
echo "BOOTSTRAP INFO: Installing font: Source Code Pro..."
brew tap caskroom/fonts && brew cask install font-source-code-pro

# Install Vim syntax highlighting for Bluespec System Verilog.
# No need to install Bluespec System Verilog syntax highlighter...
#git clone https://github.com/hanw/vim-bluespec.git ../.vim_runtime/sources_non_forked

echo "BOOTSTRAP INFO: Bootstrapping completed. Enjoy!"

