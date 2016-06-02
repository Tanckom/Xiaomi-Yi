###########################################
#                                         #
#			XIMODE - AUTO   	          #
#                                         #
###########################################

#XIMODE Auto
#Mode: Auto (auto mode for all usage)
#Type: Video&photography
#Bitrate: 35Mbit

#-------------------------------------------------------------
#Version: 2.0.2.
#Date: 31.05.2016
#Author: Tanckom
#Contact: 		https://dashcamtalk.com/forum/conversations/add?to=Tanckom
#Discussion: 	http://bit.ly/24NZnKh
#Donate: 		http://tinyurl.com/ximode (Paypal)
#Sources: Yimax(by nutsey), PJanisio, Dashcamtalk, (Based on Yimax), strAvus
#Description: This script is made for the normal user who wants to film outside/inside
#in daytime/nightime and keeps everything in automode. Record in ~60fps when the video is too dark, record in ~30fps
#when the video is too bright.
#Mode made for normal videos, which can be used for postprocessing. 
#-------------------------------------------------------------
#Firmware to use with: Custom 35Mbit 1.2.13 Firmware (by Fried - http://bit.ly/1T13KxG )
#Tested on: SN23A
#-------------------------------------------------------------

#+++++++++ BITRATE AND RESOLUTION ++++++++++

#2304x1296p30 	35Mbit
writew 0xC05C1EB2 0x420C

#1080p60 		35Mbit
writew 0xC05C1EE2 0x420C

#1080p48 		35Mbit
writew 0xC05C2452 0x420C

#1080p30 		35Mbit
writew 0xC05C1F72 0x420C

#1080p24 		35Mbit
writew 0xC05C2492 0x420C

#1200p60		35Mbit
writew 0xC05C2092 0x420C

#720p120 		35Mbit
writew 0xC05C2812 0x41F0

#++++++++++++ CORRECTIONS - PHOTO ++++++++++++++++

#AUTO-MODE

#++++++++++++ CORRECTIONS - VIDEO ++++++++++++++++

#AUTO-MODE

#++++++++++++ QUALITY CORRECTIONS ++++++++++++++++

#enable raw+jpeg stills
t app test debug_dump 14

#Set JPEG quality to 100%
t cal -jqlt 100

#AUTO-MODE

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

#Mode 1
t gpio 6 sw out1
sleep 2
t gpio 6 sw out0
