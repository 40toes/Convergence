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

# Make a dummy signal
xs=np.arange(1,1042,.01) #generate Xs (0.00,0.01,0.02,0.03,...,100.0)
signal = np.sin(xs*.3)/300

# Returns rate and data(numpy array)
sampFreq, send0 = wavfile.read('surfinusa.wav')

# Normalize to -1 to 1 (for int16)
send = send0 / (2.**15);

# # Grab one of the audio channels
ch1 = send[:,0]
ch1_fft = fft(ch1)

mod_ch1 = ch1[1023:10230]*signal[1023:10230]

# # Plot
h,w=2,2
figure(figsize=(12,9))
subplots_adjust(hspace=.7)

subplot(h,w,1);title("Just a sine wave")
plot(xs,signal)
subplot(h,w,2);title("One channel of surfinusa")
plot(ch1)
subplot(h,w,3);title("Sine wave * channel")
plot(mod_ch1)
subplot(h,w,4);title("IFFT modulated")
plot(ifft(mod_ch1))
show()



# Play back audio
CHUNK = 1042 # can also be read as sample size

# wav file
wf = wave.open('surfinusa.wav', 'rb')

p = pyaudio.PyAudio()

stream = p.open(format=p.get_format_from_width(wf.getsampwidth()),
                channels=wf.getnchannels(),
                rate=wf.getframerate(),
                output=True)

data = wf.readframes(CHUNK)

send0_fft = fft(send0)
toplay = ifft(send0_fft)

while data != '':
  stream.write(toplay) # THis is the chunk we need to get working. Pipeline of fft to ifft w/out modulating in between
  # stream.write(send0) # this works
  data = wf.readframes(CHUNK)

stream.stop_stream()
stream.close()

p.terminate()



##NOTE HAVE TO RENORMALIZE BEFORE PLAYING MODDED AUDIO




