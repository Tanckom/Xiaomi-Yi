###########################################
#                                         #
#			XIMODE - Nightlapse           #
#                                         #
###########################################

#XIMODE Nightlapse
#Mode: Shooting time lapse pictures/videos for dark areas (nighttime)
#Type: Video&photography
#Quality: JPEG+RAW

#-------------------------------------------------------------
#Version: 2.0.2.
#Date: 31.05.2016
#Author: Tanckom
#Contact: 		https://dashcamtalk.com/forum/conversations/add?to=Tanckom
#Discussion: 	http://bit.ly/24NZnKh
#Donate: 		http://tinyurl.com/ximode (Paypal)
#Sources: nutsey, PJanisio, Dashcamtalk,
#Description: Nightlapse is created for people who want to shoot time lapse videos during the night
#This needs a low ISO for less noise, and a high shutter speed (highest 7.9sec) to capture
#more light. This mode is only made to preset the photography settings, however the time lapse
#should be choosed via Xiaomi Yi's App.(Not video timelapse!)
#                 MAKE SURE TO HAVE AT LEAST 9 SECONDS BETWEEN EACH SHOT.

#-------------------------------------------------------------
#Firmware to use with: Custom 35Mbit 1.2.13 Firmware (by Fried - http://bit.ly/1T13KxG )
#Tested on: SN23A
#-------------------------------------------------------------

#+++++++++ BITRATE AND RESOLUTION ++++++++++

#NOTHING IMPLEMENTED BECAUSE ITS A TIMELAPSE SCRIPT

#++++++++++++ CORRECTIONS - PHOTO ++++++++++++++++

#ISO, SHUTTER SPEED, GAIN CONTROL
#ONLY SET A FIX VALUE IF NEEDED, OTHERWISE DONT TOUCH IT!
#FIRST VALUE: ISO (100,200,400,800,1600,3200,6400,12800,25600) (Don't go higher than 1600
#otherwise Noise!)
#SECOND VALUE: Shutter Speed 0 == automatic, 1==7.9s, 8==7.7s, 50==6.1s. 100==4.6s, 200==2.7s,
#400==1sec, 590==1/3sec, 600==1/5sec, 800==1/10sec, #900==1/15sec, 1000==1/30sec, 1100==1/50sec,
#1145==1/60sec, 1200==1/80sec, 1275==1/125sec, 1300==1/140sec, 1405==1/250sec, 1450==1/320sec,
#1531==1/500sec, #1607==1/752sec, 1660==1/1002sec, 1788==1/2004sec, 1800==1/2138, 1900==1/3675,
#2000==1/6316, 2047==1/8147 (EXIF value)
#Best shutter speed: 1/30 and 1/50
#THIRD VALUE: Gain control (adding more light to the sensor -> adding noise ) Values: 6,12,18 (6 #f.ex. increase two times light signal)
t ia2 -ae exp 100 1 0

#SET HDR TRIM LEVELS, SET GAMMA
t ia2 -adj l_expo 163
t ia2 -adj gamma 150

#fix ae/awb/af/adj 0:on 1:off + IMPROVED HIGHLIGHTS script by nutsey
t ia2 -3a 1 0 0 1
t ia2 -awb off
t ia2 -adj autoknee 255

#++++++++++++ CORRECTIONS - VIDEO ++++++++++++++++

#NOTHING IMPLEMENTED BECAUSE ITS A TIMELAPSE SCRIPT

#++++++++++++ QUALITY CORRECTIONS ++++++++++++++++

#enable raw+jpeg stills
t app test debug_dump 14

#Set JPEG quality to 100%
t cal -jqlt 100

#noise reduction 0:no reduction(noisy but sharper)/16383:full noise reduction(no noise but less sharp)
t ia2 -adj tidx -1 0 -1

#set sharpness for video mode
t is2 -shp mode 2
t is2 -shp max_change 5 5
t is2 -shp cor d:\XCORING\coring32.txt
sleep 1

#++++++++++++ ANYTHING ELSE ++++++++++++++++

#Enable ftp
lu_util exec 'nohup tcpsvd -u root -vE 0.0.0.0 21 ftpd -w / >> /dev/null 2>&1 &'

#4GB no split files
writew 0xC03A8520 0x2004

#cleanup
lu_util exec rm /tmp/fuse_d/DCIM/*MEDIA/*_thm.mp4
lu_util exec rm /tmp/fuse_d/DCIM/*MEDIA/*.THM
sleep 2

#+++++++++++++ FINISHED +++++++++++++

#ready beep
t pwm 1 enable
sleep 1
t pwm 1 disable

#Mode 6
t gpio 6 sw out1
sleep 2
t gpio 6 sw out0
sleep 1

t gpio 6 sw out1
sleep 2
t gpio 6 sw out0
sleep 1

t gpio 6 sw out1
sleep 2
t gpio 6 sw out0
sleep 1

t gpio 6 sw out1
sleep 2
t gpio 6 sw out0
sleep 1

t gpio 6 sw out1
sleep 2
t gpio 6 sw out0
sleep 1

t gpio 6 sw out1
sleep 2
t gpio 6 sw out0
