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

./java/setup_java.sh
./node/setup_node.sh
./python/setup_python3.sh
./vim/setup_vimrc.sh
