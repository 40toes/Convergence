import sys
sys.path.append('/usr/local/lib/python2.7/site-packages')
import cv2
import numpy as np
from matplotlib import pyplot as plt

#Canny edge detect
img = cv2.imread('cabrillo.jpg',0)
edges = cv2.Canny(img,290,100)
cv2.imwrite('cabedge.jpg', edges)

  # plt.subplot(121),plt.imshow(img,cmap = 'gray')
  # plt.title('Original Image'), plt.xticks([]), plt.yticks([])
  # plt.subplot(122),plt.imshow(edges,cmap = 'gray')
  # plt.title('Edge Image'), plt.xticks([]), plt.yticks([])
  # plt.show()

#Extract main contour
ret,thresh = cv2.threshold(img,127,255,0)
contours,hierarchy = cv2.findContours(thresh, 1, 2)
cnt = contours[0]
epsilon = 0.1*cv2.arcLength(cnt,True)
approx = cv2.approxPolyDP(cnt,epsilon,True)

print contours
contour_img = cv2.drawContours(img, contours, -1, (0,255,0), 3)
# plt.subplot(121),plt.imshow(img,cmap = 'gray')
# plt.title('Original Image'), plt.xticks([]), plt.yticks([])
# plt.subplot(122),plt.imshow(contour_img,cmap = 'gray')
# plt.title('Edge Image'), plt.xticks([]), plt.yticks([])
# plt.show()

#Turn contour into freq response

#Port in audio file

#Convolve audio with filter coefficients

