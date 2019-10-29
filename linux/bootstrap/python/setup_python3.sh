# Check if python3 is installed and install it otherwise.
PYTHON3PATH=$(which python3)
if [[ $PYTHON3PATH="python3 not found" ]]
then sudo apt-get install python3.6
fi

./python/setup_python3_pip.sh
./python/setup_venv.sh
