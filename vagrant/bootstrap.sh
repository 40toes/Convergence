# install dependencies
# sudo apt-get install python-pip
export LANG=en_US.UTF-8
sudo apt-get update
sudo sed -i '$ d' /etc/locale.gen
sudo sed -i '$a en_US.UTF-8 UTF-8' /etc/locale.gen 
sudo /usr/sbin/locale-gen
apt-get install libasound2 alsa-utils alsa-oss
sudo apt-get install -y python-dev build-essential
sudo pip -y install cython
sudo apt-get build-dep -y python-matplotlib
sudo apt-get install -y libopencv-dev python-opencv
sudo apt-get install -y python-numpy python-scipy python-matplotlib
sudo ln /dev/null /dev/raw1394

if [ ! -f ~/runonce ]
  then
    sudo reboot
    touch ~/runonce
  fi