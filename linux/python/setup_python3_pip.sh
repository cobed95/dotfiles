# Check if pip is installed and install it otherwise.
PIPPATH=$(which pip)
if [[ $PIPPATH="pip not found" ]]
then sudo apt install python3-pip
fi

# Automatically update pip.
pip install --upgrade pip

