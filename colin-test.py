import sys
sys.path.append('/usr/local/lib/python2.7/site-packages')
import cv2
import wave
from struct import *
import numpy as np
from matplotlib import pyplot as plt
from scipy import signal
import audioop

##Canny edge detect
img = cv2.imread('cabrillo.jpg',0)
edges = cv2.Canny(img,290,100)
cv2.imwrite('cabedge-test.jpg', edges)

##Extract main contour with cv2.findcontours
ret,thresh = cv2.threshold(img,127,255,0)
contours,hierarchy = cv2.findContours(thresh, 1, 2)
cnt = contours[0]
epsilon = 0.1*cv2.arcLength(cnt,True)
approx = cv2.approxPolyDP(cnt,epsilon,True)

# print contours
contour_img = cv2.drawContours(img, contours, -1, (0,255,0), 3)


##Turn contour into freq response with freqz

hor = []
for x in contours:
	hor.append(x[0][0][0])

print len(hor)
print len(contours)

b = signal.firwin(80, 0.5, window=('kaiser', 8))
w, h = signal.freqz(hor)

##Port in audio file
auInput = wave.open('./raw-music/Sparks.wav', mode='r')

t0, t1 = 10, 20 # cut audio between t0 t1 seconds
s0, s1 = int(t0*auInput.getframerate()), int(t1*auInput.getframerate())
auInput.readframes(s0) #discard
frames = auInput.readframes(s1 - s0)

win = signal.hann(50)
prewin = signal.hann(4)
print prewin
# win = []
import itertools
sig = []
for i in range(len(frames)/2):
  sig.append(audioop.getsample(frames, 2, i))


from scipy.fftpack import rfft, irfft, fftfreq

W = fftfreq(len(hor), d=1.0)
f_signal = rfft(hor)

# plt.subplot(121)
# plt.plot(len(sig),sig)
plt.subplot(122)
plt.plot(w, f_signal)
plt.show()

# time   = np.linspace(0,10,2000)
# signal = np.cos(5*np.pi*time) + np.cos(7*np.pi*time)

# W = fftfreq(signal.size, d=time[1]-time[0])
# f_signal = rfft(signal)

# # If our original signal time was in seconds, this is now in Hz    
# cut_f_signal = f_signal.copy()
# cut_f_signal[(W<6)] = 0

# cut_signal = irfft(cut_f_signal)

# import pylab as plt
# plt.subplot(221)
# plt.plot(time,signal)
# plt.subplot(222)
# plt.plot(W,f_signal)
# plt.xlim(0,10)
# plt.subplot(223)
# plt.plot(W,cut_f_signal)
# plt.xlim(0,10)
# plt.subplot(224)
# plt.plot(time,cut_signal)
# plt.show()