###########################################
#                                         #
#			XIMODE - SupYiView            #
#                                         #
###########################################

#XIMODE SupYiView
#Mode: Superview mode (Stretching 1600x1200-4:3 to 1920x1080-16:9)
#Type: Video&photography
#Bitrate: 35Mbit

#-------------------------------------------------------------
#Version: 2.0.2.
#Date: 31.05.2016
#Author: Tanckom
#Contact: 		https://dashcamtalk.com/forum/conversations/add?to=Tanckom
#Discussion: 	http://bit.ly/24NZnKh
#Donate: 		http://tinyurl.com/ximode (Paypal)
#Sources: Based on WaffleFPV(SuperView(SuPoorView), Yimax, PJanisio, Dashcamtalk
#Description: SuperView allows you to capture an immersive wide angle 
#perspective. What this mode does is it takes a 4:3 aspect ratio and 
#dynamically stretches it to a 16:9 aspect ratio. This can be a great 
#choice because it uses the height of the camera's sensor that you get 
#with 4:3 meaning that you will see more of the sky and ground assuming you 
#are pointed at the horizon

#-------------------------------------------------------------
#Firmware: Custom 35Mbit 1.2.13 Firmware (by Fried)
#Tested on: SN23A
#-------------------------------------------------------------

#+++++++++ BITRATE AND RESOLUTION ++++++++++

#Enabling superviewmode
#1600x1200p60 4:3 - Sets Bitrate to 35Mbs.
writew 0xC05C2092 0x420C
# Enables 1600x1200p60
writeb 0xC06CC426 0x0C
#This lines stretches the 1600x1200p60 4:3 video to 1920x1080p60 16:9
writel 0xC05C2D7C 0x04380780

#++++++++++++ CORRECTIONS - VIDEO ++++++++++++++++

#enable scene modes: 
#auto[1] / mode-off[2] / night[10] / landscape[13] / portrait[14] / scene_sunset[15] / #sand_snow[16] / underwater[19] / day_lightning[27] / through_glass[34] / car_DV[38]
#It is said on dashcamtalk that scene 14 is best (true???)
t cal -sc 14

#vibrance/saturation adjustments, Value: 0-255
#t ia2 -adj ev 10 0 vibrance 0 0 saturation 0
t ia2 -adj ev 10 0 140 0 0 150 0

#shadow clipping adjustments Values: 0-255, higher value, more "light" in the video
#this makes blacks not crushed
t ia2 -adj l_expo 163

#highlighting ,Values: 0-255, lower value, more "light" in the video
#this gets back the highlights
t ia2 -adj autoknee 255

#set gamma level - makes picture darker, more highlights? - values [0~255]
t ia2 -adj gamma 200

#fix ae/awb/af/adj 0:on 1:off + IMPROVED HIGHLIGHTS script by nutsey
t ia2 -3a 1 0 0 1
t ia2 -awb off

#Disable vignettecorrection - v:video mode, s: still mode - enable 0:disable,1:enable
#t ia2 -vnc v 1

#++++++++++++ QUALITY CORRECTIONS ++++++++++++++++

#enable raw+jpeg stills
t app test debug_dump 14

#Set JPEG quality to 100%
t cal -jqlt 100

#noise reduction 0:no reduction(noisy but sharper)/16383:full noise reduction(no noise but less sharp)
t ia2 -adj tidx -1 1024 -1
sleep 1

#set sharpness for video mode
t is2 -shp mode 0
#t is2 -shp fir 100 0 0 0 0 0 0
t is2 -shp max_change 5 5
t is2 -shp cor d:\XCORING\coring128.txt
sleep 1

#++++++++++++ ANYTHING ELSE ++++++++++++++++

#Enable ftp
lu_util exec 'nohup tcpsvd -u root -vE 0.0.0.0 21 ftpd -w / >> /dev/null 2>&1 &'

#4GB no split files (FW Ver.: 1.2.13 / 1.2.12 / 1.2.6)
writew 0xC03A8520 0x2004
writew 0xC03A8620 0x2004
writew 0xC0396E64 0x2004

#cleanup
lu_util exec rm /tmp/fuse_d/DCIM/*MEDIA/*_thm.mp4
lu_util exec rm /tmp/fuse_d/DCIM/*MEDIA/*.THM
sleep 2

#+++++++++++++ FINISHED +++++++++++++

#ready beep
t pwm 1 enable
sleep 1
t pwm 1 disable

#Mode 5
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
