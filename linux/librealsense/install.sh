echo "This installation script is intended for Ubuntu 18.04"
echo "For running make, this script assumes that you have 4 or more cores available"

read -p "Did you install CMake 3.15 or higher? Y/n" answer
if [ "Y" == "$answer" ]; then
    echo "Updating Ubuntu distribution..."
    sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade

    echo "Cloning librealsense sources..."
    git clone https://github.com/IntelRealSense/librealsense.git

    echo "Preparing linux backend and dev env..."
    cd librealsense
    sudo apt-get install git libssl-dev libusb-1.0-0-dev pkg-config libgtk-3-dev
    sudo apt-get install libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev

    echo "Running Intel Realsense permission scripts..."
    ./scripts/setup_udev_rules.sh

    echo "Building applying patched kernel modules..."
    ./scripts/patch-realsense-ubuntu-lts.sh

    echo "Building librealsense2 SDK"
    mkdir build && cd build
    cmake ../

    sudo make uninstall && make clean && make -j4 && sudo make install

    echo "Finished manually building librealsense2. Enjoy!"
fi
