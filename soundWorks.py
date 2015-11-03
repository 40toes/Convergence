import sys
sys.path.append('/usr/local/lib/python2.7/site-packages')
import cv2
import wave
from time import sleep
from struct import *
import numpy as np
from matplotlib import pyplot as plt
from scipy import signal
from scipy.io import wavfile
import audioop
from pylab import *
import pyaudio
from pyaudio import paContinue, paFloat32

# TEST MANIPULATING WHOLE SONG.
drawGraphs = False

# Make a dummy signal
xs=np.arange(1,1042,.01) #generate Xs (0.00,0.01,0.02,0.03,...,100.0)
signal = np.sin(xs*.3)/300

# Returns rate and data(numpy array)
sampFreq, send0 = wavfile.read('surfinusa.wav')

# Normalize to -1 to 1 (for int16) 
send = send0 / (2.**15);

# Grab one of the audio channels
ch1 = send0[:,0]

# Compute fft of single-channel audio
ch1_fft = fft(ch1)

# Compute inverse fft of fft
ch1_ifft = ifft(ch1_fft)

# Convert to int16, get only REAL numbers for music playing
# Previous, static noise was due to imaginary values
# resulting from fft, then ifft math
ch1_ifft = int16(real(ch1_ifft))

toplay = ch1_ifft

# Testing code for looking at values in ifft and original signal
#for i in range(len(ch1)/2,len(ch1)):

	#print(ch1[i])
	#print(ch1_ifft[i])

# Plot
if (drawGraphs):

	h,w=2,2
	figure(figsize=(12,9))
	subplots_adjust(hspace=.7)

	# Plot our signals
	subplot(h,w,1);title("Just a sine wave")
	plot(xs,signal)
	subplot(h,w,2);title("One channel of surfinusa")
	plot(ch1)
	subplot(h,w,3);title("FFT surfinusa")
	plot(ch1_fft)
	subplot(h,w,4);title("IFFT surfinusa")
	plot(ch1_ifft)
	#subplot(h,w,4);title("IFFT modulated")
	#plot(ifft(mod_ch1))
	show()

# Play back audio
CHUNK = 1042 # can also be read as sample size

# CHUNK BY CHUNK MODULATION

# wav file
wf = wave.open('surfinusa.wav', 'rb')

p = pyaudio.PyAudio()

def applyFFT( inData ):

	data_fft = fft(inData)
	data_ifft = ifft(data_fft)
	data_ifft = int16(real(data_ifft))

	return data_ifft

def stereo_to_mono(hex1, hex2):
    """average two hex string samples"""
    return hex((ord(hex1) + ord(hex2))/2)

# Callback after each chunk of data is played
def callback(in_data, frame_count, time_info, flag):
    if flag:
        print("Playback Error: %i" % flag)
    data = wf.readframes(frame_count)

    # Attempt to convert from string array to mono amplitudes
    # per stack overflow q
    new_frames = ''

    for (s1, s2) in zip(data[0::2],data[1::2]):
    	new_frames += stereo_to_mono(s1,s2)[2:].zfill(2).decode('hex')


    played_frames = callback.counter
    callback.counter += frame_count
    transformedData = applyFFT(new_frames)
    
    print(len(data))

    return (applyFFT(new_frames), paContinue)
    #return (data, pyaudio.paContinue)
    #return data[played_frames:callback.counter], paContinue
    #return signal[played_frames:callback.counter], paContinue

callback.counter = 0

# stream = p.open(format=p.get_format_from_width(wf.getsampwidth()),
#                  channels=2, # We use one channel post-processing
#                  rate=wf.getframerate(),
#                  output=True,
#                  stream_callback = callback)

stream = p.open(format=p.get_format_from_width(wf.getsampwidth()),
                channels=1,
                rate=wf.getframerate(),
                output=True)

data = wf.readframes(CHUNK)


# Start the stream
# stream.start_stream()

# while stream.is_active():
# 	sleep(0.1)

while data != '':
	stream.write(toplay) # THis is the chunk we need to get working. Pipeline of fft to ifft w/out modulating in between
	data = wf.readframes(CHUNK)

# Done with everything
stream.stop_stream();
stream.close()
wf.close()
p.terminate();


#toplay = ch1_ifft;
# send0_fft = fft(send0)
# #toplay = ifft(send0_fft)






