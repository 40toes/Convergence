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

  # plt.subplot(121),plt.imshow(img,cmap = 'gray')
  # plt.title('Original Image'), plt.xticks([]), plt.yticks([])
  # plt.subplot(122),plt.imshow(edges,cmap = 'gray')
  # plt.title('Edge Image'), plt.xticks([]), plt.yticks([])
  # plt.show()

##Extract main contour with cv2.findcontours
ret,thresh = cv2.threshold(img,127,255,0)
contours,hierarchy = cv2.findContours(thresh, 1, 2)
cnt = contours[0]
epsilon = 0.1*cv2.arcLength(cnt,True)
approx = cv2.approxPolyDP(cnt,epsilon,True)

# print contours
contour_img = cv2.drawContours(img, contours, -1, (0,255,0), 3)

# plt.subplot(111),plt.imshow(img,cmap = 'gray')
# plt.title('Original Image'), plt.xticks([]), plt.yticks([])
# plt.show()

##Turn contour into freq response with freqz

hor = []
for x in contours:
	hor.append(x[0][0][0])

print len(hor)
print len(contours)

b = signal.firwin(80, 0.5, window=('kaiser', 8))
# print b
w, h = signal.freqz(hor)

# fig = plt.figure()
# plt.title('Digital filter frequency response')
# ax1 = fig.add_subplot(111)

# plt.plot(w, 20 * np.log10(abs(h)), 'b')
# plt.ylabel('Amplitude [dB]', color='b')
# plt.xlabel('Frequency [rad/sample]')

# ax2 = ax1.twinx()
# angles = np.unwrap(np.angle(h))
# plt.plot(w, angles, 'g')
# plt.ylabel('Angle (radians)', color='g')
# plt.grid()
# plt.axis('tight')

# plt.show()

##Port in audio file
auInput = wave.open('./raw-music/Sparks.wav', mode='r')
auOutput = wave.open('./raw-music/output.wav', mode='w')

t0, t1 = 10, 11 # cut audio between t0 t1 seconds
# s0, s1 = int(t0*auInput.getframerate()), int(t1*auInput.getframerate())
s0, s1 = int(t0*auInput.getframerate()), int(t0*auInput.getframerate()+10)
auInput.readframes(s0) #discard
frames = auInput.readframes(s1 - s0)

# testFrame = auInput.readframes(1)

# frames = audioop.mul(frames, 2, 0.5)

auOutput.setparams(auInput.getparams())
# auOutput.writeframes(frames)

# auInput.close()
# auOutput.close()


# sig = np.repeat([0., 1., 0.], 100)
# sig = frames
win = signal.hann(50)
prewin = signal.hann(4)
print prewin
# win = []
import itertools
sig = []
for i in range(len(frames)/2):
  sig.append(audioop.getsample(frames, 2, i))
  test = i%4
  # if test == 0:
    # win = np.concatenate([win, prewin])

print len(sig)
print len(win)
BinStr = ""
for i in range(len(hor)):
  BinStr = BinStr + pack('h', round(hor[i]*20000))

# out = audioop.add(frames, BinStr, 2)
# auOutput.writeframesraw(out)
auOutput.writeframesraw(BinStr)
auInput.close()
auOutput.close()


# import binascii

# d = unpack('h', testFrame)
# print d[0]

# print sig
# print win
# filtered = signal.convolve(sig, win, mode='same') / sum(win)
# filtered = signal.correlate(sig, win, mode='same') / sum(win)

# fig = plt.figure()
# ax_original = fig.add_subplot(311)
# plt.plot(sig)

# ax_win = fig.add_subplot(312)
# plt.plot(win)

# ax_filt = fig.add_subplot(313)
# plt.plot(filtered)

# fig.tight_layout()
# plt.show()

# fig, (ax_orig, ax_win, ax_filt) = plt.subplots(3, 1, sharex=True)
# ax_orig.plot(sig)
# ax_orig.set_title('Original pulse')
# ax_orig.margins(0, 0.1)
# ax_win.plot(win)
# ax_win.set_title('Filter impulse response')
# ax_win.margins(0, 0.1)
# ax_filt.plot(filtered)
# ax_filt.set_title('Filtered signal')
# ax_filt.margins(0, 0.1)
# fig.set_tight_layout(True)
# plt.show()


# from scipy.fftpack import rfft, irfft, fftfreq

# W = fftfreq(len(hor))
# f_signal = rfft(hor)

# plt.subplot(121)
# plt.plot(len(sig),sig)
# plt.subplot(122)
# plt.plot(w, f_signal)
# plt.show()

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





