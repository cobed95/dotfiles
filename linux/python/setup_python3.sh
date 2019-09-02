# Check if python3 is installed and install it otherwise.
PYTHON3PATH=$(which python3)
if [[ $PYTHON3PATH="python3 not found" ]]
then sudo apt-get install python3.6
fi

./setup_python3_pip.sh
./setup_venv.sh
