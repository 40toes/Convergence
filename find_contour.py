import sys
sys.path.append('/usr/local/lib/python2.7/site-packages')
import cv2
import numpy as np
import matplotlib.pyplot as plt
import pylab

im = cv2.imread('cabrillo.jpg')
edges = cv2.Canny(im,250,100)
# imgray = cv2.cvtColor(im,cv2.COLOR_BGR2GRAY)
ret,thresh = cv2.threshold(edges,127,255,0)
contours, hierarchy = cv2.findContours(thresh,cv2.RETR_LIST,cv2.CHAIN_APPROX_SIMPLE)


max = 0
max_ind = 0

for i in range(0, len(contours)):
    if len(contours[i]) > max:
        max = len(contours[i])
        max_ind = i
else:
    print max


cnt = contours[max_ind]
M = cv2.moments(cnt)
cv2.drawContours(im,cnt,-1,(0,255,0),3)

cnt = cnt.flatten(2)

x = np.linspace(0,1,len(cnt)-1)
y = np.linspace(0,1,len(cnt)-1)
ii=0
for i in range(406,len(cnt)):
    y[ii] = cnt[i]
    ii=ii+1
else:
    plt.figure(0)
    plt.plot(x, y)
    cv2.imshow('cabrillo.jpg',im)
    plt.show()