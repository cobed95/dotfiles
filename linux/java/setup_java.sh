# Check if Java is installed and install it otherwise.
JAVAPATH=$(which java)
if [[ $JAVAPATH="java not found" ]]
then sudo apt-get install openjdk-10-jdk
fi

