import sys
sys.path.append('/usr/local/lib/python2.7/site-packages')
import cv2
import numpy as np
from matplotlib import pyplot as plt
import pylab

##Canny edge detect
img = cv2.imread('cabrillo.jpg',0)
edges = cv2.Canny(img,250,100)
cv2.imwrite('cabedge.jpg', edges)

  #Plot results
# plt.subplot(121),plt.imshow(img,cmap = 'gray')
# plt.title('Original Image'), plt.xticks([]), plt.yticks([])
# plt.subplot(122),plt.imshow(edges,cmap = 'gray')
# plt.title('Edge Image'), plt.xticks([]), plt.yticks([])
# plt.show()


##Extract main contour with cv2.findcontours
ret,thresh = cv2.threshold(img,127,255,0)
contours, hierarchy = cv2.findContours(thresh,cv2.RETR_TREE,cv2.CHAIN_APPROX_SIMPLE)
cnt = contours[1]

maxsize = 0
best = 0
count = 0
for cnt in contours:
    if cv2.contourArea(cnt) > maxsize:
        maxsize = cv2.contourArea(cnt)
        best = count
    count += 1


# print len(contours[best])
cv2.drawContours(img, contours[best], -1, (0,0,255), 2)

# cv2.imshow('cabrillo.jpg',img)
# cv2.waitKey()

x = np.linspace(0,1,len(contours[best]))
y = contours[best]
yy = np.squeeze(np.asarray(y))
yy = np.squeeze(np.asarray(yy[...,0]))
pylab.plot(x,yy)
cv2.waitKey()

print yy

##Turn contour into freq response with freqz

##Port in audio file

##Convolve audio with filter coefficients

#

