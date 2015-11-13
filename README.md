# Convergence

## Running the installation

- A PD file runs on startup of the Pi.
	- login into the Pi by using the network connection settings [here](https://ccrma.stanford.edu/wiki/CCRMA_Satellite_How_To_Connect_RevC)
	- the default PD file to start is set in the following file: /home/ccrma/on-startup/load_default_patch
		- do `cd on-startup/` and type `cat load_default_patch` to read the contents of the file, at the bottom is the line which starts the default PD file.
	- on startup of the Pi, the file will play automatically. To stop it, ssh into the pi and type `./bin/stop_default`

## Raspberry Pi Setup

- SD card boot image: https://ccrma.stanford.edu/~eberdahl/Satellite/
- Sonar sensor setup: http://www.maxbotix.com/articles/074.htm

## Working on Mac OSX

- You can work on Pure Data on a Mac and then uploading the patch files to the Pi after.
	- https://puredata.info/downloads/pd-extended
	- use `scp` to copy files to and from your Pi ([link](https://ccrma.stanford.edu/wiki/Satellite_CCRMA_First_Steps))

## Pure Data references

- https://www.youtube.com/playlist?list=PL12DC9A161D8DC5DC
- http://en.flossmanuals.net/pure-data/dataflow-tutorials/arrays-graphs-tables/
