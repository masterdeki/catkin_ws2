from sre_constants import SUCCESS
import rospy
from datetime import datetime


# OpenCV
import cv2
from cv_bridge import CvBridge

# Ros Messages
from sensor_msgs.msg import Image
from sensor_msgs.msg import CompressedImage

# numpy and scipy
import numpy as np

class camera_device(object):
    def __init__(self):
        self.br = CvBridge()


        time_stamp = datetime.now().strftime("%Y%m%d%H%M%S%f")
        video_file = "/home/pi/agar_video/agar_{0}.avi".format(time_stamp)

        self.cap = cv2.VideoCapture(0)
        self.out = cv2.VideoWriter(video_file, cv2.VideoWriter_fourcc('M','J','P','G'), 25, (640, 480))
 
        self.pub = rospy.Publisher('/camera/image_raw', Image, queue_size=1)
        self.pub_compressed = rospy.Publisher("/camera/image_raw/compressed", CompressedImage, queue_size=1)


    def start(self):
        self.isCapOpened = self.cap.isOpened()
        print(f'cap is opened: {self.isCapOpened}, publishing...')

        while self.isCapOpened:
            self.success, self.frame = self.cap.read()
            #print(f'Cap read: {self.success}')
            try:
                #cv2.imshow('frame', self.frame)
                k = 2
                width = int((self.frame.shape[1])/k)
                height = int((self.frame.shape[0])/k)
                scaled = cv2.resize(self.frame, (width, height), interpolation=cv2.INTER_AREA)

                self.out.write(self.frame)

                msg = CompressedImage()
                msg.header.stamp = rospy.Time.now()
                msg.format = "jpeg"
                msg.data = np.array(cv2.imencode('.jpg', scaled)[1]).tostring()
                


                self.pub.publish(self.br.cv2_to_imgmsg(self.frame, encoding='bgr8'))
                self.pub_compressed.publish(msg)

            except Exception as err:
                print(f'Unexpected {err=}, {type(err)=}')
                break

            if rospy.is_shutdown():
                break

        print('publishing stopped')
        self.cap.release()
        self.out.release()
        #cv2.destroyAllWindows()

if __name__ == '__main__':
    rospy.init_node("camera_node", anonymous=True)
    camera = camera_device()
    camera.start()