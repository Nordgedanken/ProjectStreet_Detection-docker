##########################################################################################################
# Code is based on: https://pythonprogramming.net/haar-cascade-object-detection-python-opencv-tutorial/  #
##########################################################################################################
import urllib2
from urllib2 import HTTPError, URLError
import cv2
import numpy as np
import os
from socket import timeout

def store_raw_images():
    neg_images_link = 'http://image-net.org/api/text/imagenet.synset.geturls?wnid=n00523513'   
    neg_image_urls = urllib2.urlopen(neg_images_link).read().decode()
    pic_num = 1
    fail_images = 0
    fail_url = 0
    
    if not os.path.exists('neg'):
        os.makedirs('neg')
        
    for i in neg_image_urls.split('\n'):
        try:
            i
            try:
                urllib2.urlretrieve(i, "neg/"+str(pic_num)+".jpg")
            except (HTTPError, URLError) as error:
                fail_url = 0
            except timeout:
                fail_url = 0
            img = cv2.imread("neg/"+str(pic_num)+".jpg",cv2.IMREAD_GRAYSCALE)
            if img is not None:
                # should be larger than samples / pos pic (so we can place our image on it)
                resized_image = cv2.resize(img, (100, 100))
                cv2.imwrite("neg/"+str(pic_num)+".jpg",resized_image)
            else:
                fail_images += 1
            pic_num += 1
            
        except Exception as e:
            print str(e)
    print fail_images + " invalid imgages"
    print fail_url + " invalid urls"
            
def store_raw_images2():
    neg_images_link = 'http://image-net.org/api/text/imagenet.synset.geturls?wnid=n07942152'   
    neg_image_urls = urllib2.urlopen(neg_images_link).read().decode()
    pic_num = len([name for name in os.listdir('neg') if os.path.isfile(name)])+1
    fail_images = 0
    fail_url = 0
    
    if not os.path.exists('neg'):
        os.makedirs('neg')
        
    for i in neg_image_urls.split('\n'):
        try:
            i
            try:
                urllib2.urlretrieve(i, "neg/"+str(pic_num)+".jpg")
            except (HTTPError, URLError) as error:
                fail_url = 0
            except timeout:
                fail_url = 0
            img = cv2.imread("neg/"+str(pic_num)+".jpg",cv2.IMREAD_GRAYSCALE)
            if img is not None:
                # should be larger than samples / pos pic (so we can place our image on it)
                resized_image = cv2.resize(img, (100, 100))
                cv2.imwrite("neg/"+str(pic_num)+".jpg",resized_image)
            else:
                fail_images += 1
            pic_num += 1
            
        except Exception as e:
            print str(e)
    print fail_images + " invalid imgages"
    print fail_url + " invalid urls"
    
def store_raw_pos_images():
    pos_images_link = 'http://image-net.org/api/text/imagenet.synset.geturls?wnid=n04096066'   
    pos_image_urls = urllib2.urlopen(pos_images_link).read().decode()
    pic_num = len([name for name in os.listdir('pos') if os.path.isfile(name)])+1
    fail_images = 0
    fail_url = 0
    
    if not os.path.exists('pos'):
        os.makedirs('pos')
        
    for i in pos_image_urls.split('\n'):
        try:
            i
            try:
                urllib2.urlretrieve(i, "pos/"+str(pic_num)+".jpg")
            except (HTTPError, URLError) as error:
                fail_url = 0
            except timeout:
                fail_url = 0
            img = cv2.imread("pos/"+str(pic_num)+".jpg")
            if img is not None:
                # should be larger than samples / pos pic (so we can place our image on it)
                resized_image = cv2.resize(img, (50, 50))
                cv2.imwrite("pos/"+str(pic_num)+".jpg",resized_image)
            else:
                fail_images += 1
            pic_num += 1
            
        except Exception as e:
            print str(e)
    print fail_images + " invalid imgages"
    print fail_url + " invalid urls"

def create_pos_n():
    for file_type in ['neg','pos']:
        
        for img in os.listdir(file_type):

            if file_type == 'pos':
                line = file_type+'/'+img+' 1 0 0 50 50\n'
                with open('info.dat','a') as f:
                    f.write(line)
            elif file_type == 'neg':
                line = file_type+'/'+img+'\n'
                with open('bg.txt','a') as f:
                    f.write(line)
                    
store_raw_images()
store_raw_images2()
store_raw_pos_images()
create_pos_n()
