#!/usr/bin/env python
# import os
# sys.path.append('D:\ILUHOME\lib')
# sys.path.append('D:\ILUHOME\bin')
from nlink_parser.msg import LinktrackNodeframe2
from sensor_msgs.msg import Imu
from robomaster import robot
from robomaster import chassis
from robomaster import vision
from robomaster import camera
import Ground_Unit__skel
import Ground_Console
import robomaster
import _thread
import rospy
import time
import math
import ilu
import cv2
import signal
import sys
import csv
import numpy as np


theService = None
vehicleid = 2
ilu.ThreadedOperation()

header = ['uwbx', 'uwby','uwbz', 'camerax1', 'cameray1', 'camerax2', 'cameray2', 'camerax3', 'cameray3']
x = None
y = None
SCOPE = 50
x_val = None
z_val = None
t = 50
ilu.ThreadedOperation()
ubuntutp = None
ubuntuv = None
fusion_sensor_zc = None
R = 0.1
Q = 0.00001
fx = 336.92142555
fy = 336.63221749
cx = 319.33700697
cy = 183.59174765
knownHeight = 270
focalLength = 336.77682152
posx = None
posy = None
posz = None
uvelx = None
uvely = None
uvelz = None
uaccx = None
uaccy = None
uaccz = None
sensor = None
sensor = None
yawangle = None
distance = None
position = None
ubuntutag = None
velocity = None
robots = []
zc = None
camerapx1 = None
camerapy1 = None
camerapx2 = None
camerapy2 = None
camerapx3 = None
camerapy3 = None
#zc = 100
#camerapx1 = 1
#camerapy1 = 1
#camerapx2 = 2
#camerapy2 = 2
#camerapx3 = 3
#camerapy3 = 3
loopvar = ilu.CreateLoopHandle()


def signal_handler(signal,frame):
    print('You pressed Ctrl + C!')
    sys.exit(0)


signal.signal(signal.SIGINT,signal_handler)
print('Press Ctrl + C')



class realGround_Unit (Ground_Unit__skel.Ground_Vehicle):
    def __init__(self, server=None, ih=None):
        self.IluServer = server
        self.IluInstHandle = ih

    def setCurrentTargetpoint(self, targetpoint):
        global ubuntutp
        print("start set a targetpoint")
        print("set a targetpoint end")
        ubuntutp = targetpoint
        print("gbb: targetpoint is %f, %f" % (targetpoint.x, targetpoint.y))
        return 1
        
        
    def setCurrentVelocity(self, velocity, velocitytag):
        global ubuntuv
        global ubuntuw
        global ubuntutag
        print("start set a velocity")
        print("set a velocity end")
        ubuntuv = velocity.v
        ubuntuw = velocity.w
        ubuntutag = velocitytag
        print("gbb: velocitytag is", velocitytag)
        print("gbb: velocity is %f, %f" % (velocity.v, velocity.w))
        return 1



class RobotInfo:

    def __init__(self, x, y, w, h):
        self._x = x
        self._y = y
        self._w = w
        self._h = h

    @property
    def pt1(self):
        return int((self._x - self._w / 2) * 640), int((self._y - self._h / 2) * 360)

    @property
    def pt2(self):
        return int((self._x + self._w / 2) * 640), int((self._y + self._h / 2) * 360)

    @property
    def pt3(self):
        return self._h * 360

    @property
    def center_x(self):
        return int(self._x * 640)
    
    @property
    def center_y(self):
        return int(self._y * 360)
    
    @property
    def all(self):
        #return self._info
        return self._x * 640, self._y * 360, self._w * 640, self._h * 360


def on_detect_robot(robot_info):
    robots.clear()
    number = len(robot_info)
    for i in range(0, number):
        x, y, w, h = robot_info[i]
        robots.append(RobotInfo(x, y, w, h))


def Kalman_one(val,fusion_val_old,Accumulated_Error):
    if (abs(val-fusion_val_old)/SCOPE > 0.25):
        Old_Input = val*0.382 + fusion_val_old*0.618
    else:
        Old_Input = fusion_val_old
    Old_Error_All = (Accumulated_Error**2 + Q**2)**(1/2)
    H = Old_Error_All**2/(Old_Error_All**2 + R**2)
    fusion_val = Old_Input + H * (val - Old_Input)
    Accumulated_Error = ((1 - H)*Old_Error_All**2)**(1/2)
    fusion_val_old = fusion_val
    return (fusion_val,fusion_val,Accumulated_Error)
    

def Kalman_two(val1,val2,Accumulated_Error):
    if (abs(val1-val2)/SCOPE > 0.25):
        Old_Input = val1*0.382 + val2*0.618
    else:
        Old_Input = val2
    Old_Error_All = (Accumulated_Error**2 + Q**2)**(1/2)
    H = Old_Error_All**2/(Old_Error_All**2 + R**2)
    fusion_val = Old_Input + H * (val1 - Old_Input)
    Accumulated_Error = ((1 - H)*Old_Error_All**2)**(1/2)
    return (fusion_val,fusion_val,Accumulated_Error)


def Kalman_one_position(val,fusion_val_old,Accumulated_Error):
    if (abs(val[0]-fusion_val_old[0])/SCOPE > 0.25):
        Old_Input0 = val[0]*0.382 + fusion_val_old[0]*0.618
    else:
        Old_Input0 = fusion_val_old[0]
    if (abs(val[1]-fusion_val_old[1])/SCOPE > 0.25):
        Old_Input1 = val[1]*0.382 + fusion_val_old[1]*0.618
    else:
        Old_Input1 = fusion_val_old[1] 
    Old_Error_All0 = (Accumulated_Error[0] **2 + Q**2)**(1/2)
    Old_Error_All1 = (Accumulated_Error[1] **2 + Q**2)**(1/2)
    H0  = Old_Error_All0 **2/(Old_Error_All0 **2 + R**2)
    H1  = Old_Error_All1 **2/(Old_Error_All1 **2 + R**2)
    fusion_val0  = Old_Input0  + H0  * (val[0]  - Old_Input0 )
    fusion_val1  = Old_Input1  + H1  * (val[1]  - Old_Input1 )
    Accumulated_Error[0]  = ((1 - H0 )*Old_Error_All0 **2)**(1/2)
    Accumulated_Error[1]  = ((1 - H1 )*Old_Error_All1 **2)**(1/2)
    fusion_val = [fusion_val0, fusion_val1]
    fusion_val_old =  fusion_val
    return (fusion_val,fusion_val,Accumulated_Error)


def cal_world_coordinate(x,y,zc):
    In = np.array([[fx, 0, cx],
                   [0, fy, cy],
                   [0, 0, 1]])
    In_ni = np.linalg.inv(In)
    Out = np.array([[0.99988645,  -0.01461291, 0.00368019, -0.00123798],
                    [-0.00327405,  0.0277204, 0.99961035,  0.23421152],
                    [-0.01470923,  -0.9995089, 0.02766941,   1.08547414],
                    [0,           0,          0,            1]])
    Out_ni = np.linalg.inv(Out)

    pixel_coordinate = np.mat([[x],
                               [y],
                               [1]])

    camera_coordinate = In_ni * pixel_coordinate * zc

    camera_coordinate = np.mat([[camera_coordinate[0,0]],
                                [camera_coordinate[1,0]],
                                [camera_coordinate[2,0]],
                                [1]])
    world_coordinate = Out_ni * camera_coordinate
    return (world_coordinate[0],world_coordinate[1])


def callback1(data):
        #global uposx,uposy,uvelx,uvely,uaccx,uaccy
        global posx,posy,uvelx,uvely,uaccx,uaccy
        #uposx=data.pos_3d[0]
        #uposy=data.pos_3d[1]
        posx=data.pos_3d[0]
        posy=data.pos_3d[1]
        uvelx=data.vel_3d[0]
        uvely=data.vel_3d[1]
        uaccx=data.imu_acc_3d[0]
        uaccy=data.imu_acc_3d[1]


def callback2(data):
        global posz, uvelz, uaccz
        posz=data.orientation.z
        uvelz = data.angular_velocity.z
        uaccz = data.linear_acceleration.z


def pose_subscriber():
        rospy.init_node('pose_subscriber', anonymous=True)
        rospy.Subscriber("nlink_linktrack_nodeframe2",LinktrackNodeframe2,callback1)
        rospy.Subscriber("imu",Imu,callback2)
        rospy.spin()


def sub_data_handler(sub_info):
    global sensor
    sensors = sub_info
    sensor = (sensors[0])

        
def thread_func1(sbh):
    global theServer
    global theObject
    theServer = ilu.CreateServer('rikirobot'+'vehicle2', ("tcp_192.168.0.151_9900",), "iiop") #ubuntu
    theObject = realGround_Unit(theServer, 'vehicle')
    print("the sbh is", theObject.IluSBH())
    time.sleep(10)
    _thread.start_new_thread(thread_func2, (sbh,))
    _thread.start_new_thread(thread_func5, ())
    _thread.start_new_thread(thread_func3, ())
    _thread.start_new_thread(thread_func6, ())
    _thread.start_new_thread(thread_func7, ())
    ilu.RunMainLoop(loopvar)        

        
def thread_func2(sbh):
    global position
    global distance
    global camerapx1, camerapy1, camerapx2, camerapy2, camerapx3, camerapy3
    print(sbh)
    theService = ilu.ObjectOfSBH(Ground_Console.Ground_Vehicle_Console, sbh)
    print(theService)
    while 1:        
        if posx and posy and posz:
            position = Ground_Console.positionInfo(posx, posy, posz)
            print("python: vehicleid is", vehicleid)
            print("python: position is %f, %f, %f" % (position.x, position.y, position.z))
            vel = Ground_Console.velInfo(uvelx, uvely, uvelz)
            acc = Ground_Console.accInfo(uaccx, uaccy, uaccz)
            theService.sendCurrentPosition(position, vehicleid)
            theService.sendCurrentVel(vel, vehicleid)
            theService.sendCurrentAcc(acc, vehicleid)
        if camerapx1 and camerapy1:
            camerap = Ground_Console.camerapInfo(camerapx1, camerapy1)
            theService.sendCurrentCamerap(camerap, vehicleid)
            camerapx1 = None
            camerapy1 = None
        if camerapx2 and camerapy2:
            camerapzc = Ground_Console.camerapzcInfo(camerapx2, camerapy2)
            theService.sendCurrentCamerapzc(camerapzc, vehicleid)
            camerapx2 = None
            camerapy2 = None
        if camerapx3 and camerapy3:
            camerapfu = Ground_Console.camerapfuInfo(camerapx3, camerapy3)
            theService.sendCurrentCamerapfu(camerapfu, vehicleid)
            camerapx3 = None
            camerapy3 = None
        if sensor:
            theService.sendCurrentSensor(sensor, vehicleid)
        if zc:
            theService.sendCurrentZc(zc, vehicleid)
        if ubuntutp and position:
            print("python: ubuntutp is %f, %f" % (ubuntutp.x, ubuntutp.y))
            distance = (math.sqrt((position.x-ubuntutp.x)**2+(position.y-ubuntutp.y)**2))
            print("python: distance is", distance)
            theService.sendCurrentDistance(distance, vehicleid)
        if yawangle:
            print("python:yawangle is", yawangle)
            theService.sendCurrentYawangle(yawangle, vehicleid)


def thread_func3():
    global velocity
    global yawangle
    while 1:
        if distance and position and ubuntutp:
            x_val = distance/t 
            if ubuntutp.x > position.x:
                z_val=0-position.z+((math.atan2((ubuntutp.y-position.y),(ubuntutp.x-position.x))*360)/(2*math.pi))
            else:
                z_val=0-position.z+((math.atan2((ubuntutp.y-position.y),(ubuntutp.x-position.x))*360)/(2*math.pi))
            if z_val > 180.0:
                a=z_val
                z_val=(0-(360-a))
            if z_val < -180:
                a=z_val
                z_val=(360+a)
            yawangle = -z_val
            z_val=z_val/(t/1.4)
            if ubuntutag:
                x_val = ubuntuv
                z_val = ubuntuw          
            velocity = Ground_Console.velocityInfo(x_val, z_val)
            ep_chassis.drive_speed(x=x_val, y=0, z=z_val)
            time.sleep(0.2)
            ep_chassis.drive_speed(x=0, y=0, z=0)


def thread_func5():
    while 1:
        ep_sensor.sub_distance(freq=5, callback=sub_data_handler)
        time.sleep(1000)
        ep_sensor.unsub_distance()


def thread_func7():
    with open('/home/ubuntu20/Desktop/test1-1.csv', 'w', encoding='UTF8', newline='') as f:
        writer = csv.writer(f)
        writer.writerow(header)
        while 1:
              #time.sleep(1)
              data = [posx,posy,posz,camerapx1,camerapy1,camerapx2,camerapy2,camerapx3,camerapy3]
              print(data)
              writer.writerow(data)


def thread_func6():
    global camerapx1, camerapy1, zc,camerapx2, camerapy2, camerapx3, camerapy3 
    fusion_sensor_zc_lst = [0,0,1] 
    ep_camera.start_video_stream(display=False)
    result = ep_vision.sub_detect_info(name="robot", callback=on_detect_robot)
    for i in range(0, 5000000):
      img = ep_camera.read_cv2_image(strategy="newest", timeout=0.5)
      for j in range(0, len(robots)):
          try: 
              cv2.rectangle(img, robots[j].pt1, robots[j].pt2, (0, 0, 255), 5)
              zc = ((knownHeight * focalLength) / robots[j].pt3)          
              if sensor < 65534:
                 world_coordinate1 = cal_world_coordinate(robots[j].center_x,robots[j].center_y,sensor*0.001)
                 camerapx1 = world_coordinate1[1][0,0]
                 camerapy1 = world_coordinate1[0][0,0]
                 print("fusion sensor and zc start") 
                 fusion_sensor_zc_lst = Kalman_two(sensor,zc,fusion_sensor_zc_lst[2])
                 fusion_sensor_zc = fusion_sensor_zc_lst[0] 
                 print("fusion sensor and zc end") 
              else:
                 print("fusion sensor and zc start")
                 fusion_sensor_zc = zc
                 print("fusion sensor and zc end") 
              
              world_coordinate2 = cal_world_coordinate(robots[j].center_x,robots[j].center_y,zc*0.001)
              world_coordinate3 = cal_world_coordinate(robots[j].center_x,robots[j].center_y,fusion_sensor_zc*0.001)

              camerapx2 = world_coordinate2[1][0,0]
              camerapy2 = world_coordinate2[0][0,0]
              camerapx3 = world_coordinate3[1][0,0]
              camerapy3 = world_coordinate3[0][0,0]
          except:
              continue
      #cv2.imshow("robots", img)
      cv2.waitKey(1)
      if cv2.waitKey(20) & 0xFF == 27:
         break


if __name__ == "__main__":
    time.sleep(10)
    
    ep_robot = robot.Robot()
    ep_robot.initialize(conn_type="rndis")

    ep_chassis = ep_robot.chassis
    ep_camera = ep_robot.camera
    ep_vision = ep_robot.vision
    ep_sensor = ep_robot.sensor
    sbh = "ilusbh:rikirobotVehicleConsole/vehicle;IDL%3AGround_Console%2FGround_Vehicle_Console%3A1.0;iiop@tcp_192.168.0.199_9977" #windows
    _thread.start_new_thread(thread_func1, (sbh,))
    pose_subscriber()
    ep_robot.close()
