# Convergence

###Raspberry Pi Setup
Start with the noobs guide for installing raspbian.

- `sudo apt-get install python-dev build-essential`
- `pip install cython` This one takes awhile
- `sudo apt-get build-dep python-matplotlib`
- `sudo apt-get install libopencv-dev python-opencv`
- `sudo apt-get install -y python-numpy python-scipy python-matplotlib`
- `git clone https://github.com/40toes/Convergence.git`
- `cd Convergence`


###Mac OS X Install

With Homebrew installed.
- `brew install python`
- `brew install gcc`
sudo apt-get install python-dev build-essential
- `pip install cython`
sudo apt-get build-dep python-matplotlib
- `pip install matplotlib`
sudo apt-get install libopencv-dev python-opencv
sudo apt-get install -y python-numpy python-scipy python-matplotlib
- `brew install homebrew/science/opencv`
- `git clone https://github.com/40toes/Convergence.git`
- `cd Convergence`
- `git clone git://github.com/numpy/numpy.git numpy`
- `git clone git://github.com/scipy/scipy.git scipy`
- `cd numpy`
- `python setup.py build`
- `python setup.py install`
- `cd ../scipy`
- `python setup.py build`
- `python setup.py install`

Mac PyAudio
- brew install portaudio
- pip install pyaudio

Debian PyAudio
- sudo apt-get install python-pyaudio python3-pyaudio
or if unavailable
- pip install pyaudio


sudo dpkg-reconfigure locales

sudo apt-get install libportaudiocpp0
sudo apt-get install portaudio19-dev
