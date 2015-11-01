import sys
sys.path.append('/usr/local/lib/python2.7/site-packages')
import cv2
import wave
from struct import *
import numpy as np
from matplotlib import pyplot as plt
from scipy import signal
from scipy.io import wavfile
import audioop
from pylab import *
import pyaudio

# Returns rate and data(numpy array)
sampFreq, send = wavfile.read('440_sine.wav')

print 'send data type', send.dtype

# Normalize to -1 to 1 (for int16)
send = send / (2.**15);

print 'size and shape of send data', send.shape
print 'length in seconds', send.shape[0]*1.0 / sampFreq

# Grab one of the audio channels
ch1 = send[:,0]


# Play back audio
CHUNK = 1024 # can also be read as sample size

# wav file
wf = wave.open('surfinusa.wav', 'rb')

p = pyaudio.PyAudio()

stream = p.open(format=p.get_format_from_width(wf.getsampwidth()),
                channels=wf.getnchannels(),
                rate=wf.getframerate(),
                output=True)

data = wf.readframes(CHUNK)

while data != '':
  stream.write(data)
  data = wf.readframes(CHUNK)

stream.stop_stream()
stream.close()

p.terminate()








