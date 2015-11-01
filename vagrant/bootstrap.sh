# install dependencies
# sudo apt-get install python-pip
sudo apt-get install -y python-dev build-essential
sudo pip -y install cython
sudo apt-get build-dep -y python-matplotlib
sudo apt-get install -y libopencv-dev python-opencv
sudo apt-get install -y python-numpy python-scipy python-matplotlib
sudo ln /dev/null /dev/raw1394
sudo export LANG=en_US.UTF-8