###########################################
#                                         #
#			XIMODE - NIGHT                #
#                                         #
###########################################
#XIMODE NIGHT
#Mode: Night (Mode for night recording)
#Type: Video&photography
#Bitrate: 35Mbit

#-------------------------------------------------------------
#Version: 2.0.2.
#Date: 31.05.2016
#Author: Tanckom
#Contact: 		https://dashcamtalk.com/forum/conversations/add?to=Tanckom
#Discussion: 	http://bit.ly/24NZnKh
#Donate: 		http://tinyurl.com/ximode (Paypal)
#Sources: Yimax, PJanisio, Dashcamtalk,....
#Description: Recording Videos in dark/night areas. ISO fixed to 1600 and exposure locked 
#at 1/30. Contrast and colors fixed. Please remember, action cameras are always bad for
#for low light shooting. Use Neatvideo plugin if needed. (noise reducer)
#Please record in lowest possible fps (recommend 24fps), since lower fps means longer 
#shutter speed = capture more light.
#-------------------------------------------------------------
#Firmware: Custom 35Mbit 1.2.13 Firmware (by Fried)
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

#720p120 		35Mbit
writew 0xC05C2812 0x41F0

#++++++++++++ CORRECTIONS - PHOTO ++++++++++++++++

#FIRST VALUE: ISO (100,200,400,800,1600,3200,6400,12800,25600) (Don't go higher than 1600
#otherwise Noise!)
#SECOND VALUE: Shutter Speed 0 == automatic, 1==7.9s, 8==7.7f, 50==6.1s. 100==4.6s, 200==2.7s,
#400==1sec, 590==1/3sec, 600==1/5sec, 800==1/10sec, #900==1/15sec, 1000==1/30sec, 1100==1/50sec,
#1145==1/60sec, 1200==1/80sec, 1275==1/125sec, 1300==1/140sec, 1405==1/250sec, 1450==1/320sec,
#1531==1/500sec, #1607==1/752sec, 1660==1/1002sec, 1788==1/2004sec, 1800==1/2138, 1900==1/3675,
#2000==1/6316, 2047==1/8147 (EXIF value)
#Best shutter speed: 1/30 and 1/50
#THIRD VALUE: Gain control (adding more light to the sensor -> adding noise ) Values: 6,12,18 (6 f.ex. increase two times light signal)
t ia2 -ae exp 1600 1000 0

#++++++++++++ CORRECTIONS - VIDEO ++++++++++++++++

#enable scene modes: 
#auto[1] / mode-off[2] / night[10] / landscape[13] / portrait[14] / scene_sunset[15] / #sand_snow[16] / underwater[19] / day_lightning[27] / through_glass[34] / car_DV[38]
t cal -sc 1

#Fix ISO and SHUTTER for video
t ia2 -ae off
# second set manual exposure value
# t cal -me [mode][agc][shutter][iris][dgain] : Set specified parameter mode = [0|1], 0:VIDEO, 1:STILL
#[mode: 0=video , 1=still
#[agc] ISO: iso100=448 , iso200=384 , iso400=320 , iso800=256 , iso1600=192 , iso3200=192
#[shutter] Shutterspeed: 1/30s=1012 , 1/60s=1140 , 1/100s=1234
#[iris]: 0=open , 1=closed
#[dgain]: if ISO value is =3200, please input here 8192. Otherwhise for <3200 input 4096.
# the following value means: 1/30s, ISO3200
t cal -me 0 192 1012 0 4096

#vibrance/saturation adjustments, Value: 0-255
#t ia2 -adj ev 10 0 vibrance 0 0 saturation 0
t ia2 -adj ev 10 0 160 0 0 150 0

#shadow clipping adjustments Values: 0-255, higher value, more "light" in the video
t ia2 -adj l_expo 140

#highlighting ,Values: 0-255, lower value, more "light" in the video
t ia2 -adj autoknee 100

#set gamma level - makes picture darker, more highlights? - values [0~255]
t ia2 -adj gamma 120

#fix ae/awb/af/adj 0:on 1:off 
t ia2 -3a 1 0 0 1

#Disable vignettecorrection - v:video mode, s: still mode - enable 0:disable,1:enable
#t ia2 -vnc v 1

#++++++++++++ QUALITY CORRECTIONS ++++++++++++++++

#enable raw+jpeg stills
t app test debug_dump 14

#Set JPEG quality to 100%
t cal -jqlt 100

#noise reduction 0:no reduction(noisy but sharper)/16383:full noise reduction(no noise but less sharp)
t ia2 -adj tidx -1 5120 -1
sleep 1

#set sharpness for video mode
#Higher value = more noise
t is2 -shp mode 0
t is2 -shp max_change 5 5
#choose between coring 1/32/128/211/255 .txt
t is2 -shp cor d:\XCORING\coring32.txt
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

#Mode 3
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
