FOR BEST READING EXPERIENCE, PLEASE EXPAND YOUR WINDOW TO THE SIZE OF THE FOLLOWING LINE
AND OPEN WITH NOTEPAD++ IF POSSIBLE. (NOT NEEDED BUT LOOKS BETTER ;) )
###################################################################################################

			####################################################
			##########			   XIMODE             ##########
			####################################################

Author:			Tanckom
Date: 			30.05.2016
Version:		2.0.2
Contact:		https://dashcamtalk.com/forum/conversations/add?to=Tanckom
Discussion:		http://bit.ly/24NZnKh (Dashcamtalk.com forum thread)	
Donate: 		http://tinyurl.com/ximode (Paypal)
Tutorial video: https://youtu.be/90my8LSSXck

			####################################################
			##########			   MODES              ##########
			####################################################

    •Auto (Nothing touched, except the bitrate, deleting THM files, 4GB files, RAW+JPEG, JPEG 100%)
    Normal (Mode for daylight/everyday usage, clean and sharp videos, auto scene mode (1), deleting THM files, RAW+JPEG, JPEG 100%)
	
	•Normal (HDR filming mode with good saturation and contrast settings. Can be used without any
	additional video editing.Mode for daylight/everyday usage, clean and sharp videos, auto scene mode (1), deleting THM files, RAW+JPEG, JPEG 100%)
	
    •Night (Mode for night filming, added noise reduction to 5120, added sharpness (coring), set saturation/vibrance to overaverage, landscape scene mode (13), deleting THM files, RAW+JPEG, JPEG 100%)
	
    •Yitune (Mode for filming with as less as possible compression and preset footages, low vibrance/saturation, low sharpness, low contrast, perfect for users who want to edit their videos, deleting THM files, RAW+JPEG, JPEG 100% - based on Yimax by nutsey)
    GoPro's equivalent: Protune
	
    •SupYiView (Mode for immersive wide angle perspective, captures 1600x1200p60 4:3 videos and stretches it to 1920x1080p60 16:9 videos, uses the height of the camera's sensor that you get with 4:3 meaning that you will see more of the sky and ground assuming you are pointed at the horizon
    ,deleting THM files, RAW+JPEG, JPEG 100%)
	GoPro's equivalent: Superview
	
	•Nightlapse (Mode for timelapse photography in dark/night surroundings. Shutterspeed is set to
	7.9 seconds, ISO is at 100 and Gain at 0. If you wish to edit those settings, please have a 
	look inside the "6_nightlapse.ash" script (open with Notepad++) and change the data at
	
		#++++++++++++ CORRECTIONS - PHOTO ++++++++++++++++

		#ISO, SHUTTER SPEED, GAIN CONTROL
		...
		t ia2 -ae exp 100 1 0            <<<<--- this line need to be edited in the file!
												 How-to edit is described within the file.)
	
	
	•Custom (Insert between the two given lines your custom script)
	•Custom2 (Insert between the two given lines your custom script)
	
	•		++++++++++++++ XYC CONFIGURATOR ++++++++++++++++++++
		XYC CONFIGURATOR is a tool, that lets you edit the settings (ISO, SATURATION, Video size,...) with you iPhone or Android App.
		Simply open the app, connect with your Xiaomi Yi, and off you go.
		Perfect when you're on the run, and am too lazy to get out your pc, or
		to edit your Micro SD card inside your Android.
		OR you simply want to edit fast the settings matching to your needs!

			####################################################
			##########		   INSTALLATION           ##########
			####################################################

1. 	Copy & paste the file: "XIMODE_X.X.X.zip" on your SD-Card or to the directory of the connected
	Xiaomi Yi (with USB).
2.	Extract the file with Winrar: 	http://www.rarlab.com/
					 or   7-ZIP:	http://www.7-zip.org/

3.	########################################################			 
	### INSTALLATION OF TELNET FOR PC/MAC/ANDROID/IPHONE ###
	########################################################

Android: 	Download https://play.google.com/store/apps/details?id=mobiletelnet.feng.gao&hl=en
			And Install.
iPhone:		Download https://itunes.apple.com/us/app/telnet-lite/id286893976?mt=8
			And Install.
Windows:	Download http://www.putty.org/			
			And Install.
Mac:		Download http://zoc-terminal-ssh-and-telnet-client.en.softonic.com/mac
			And Install.
			
			####################################################
			##########			HOW TO USE            ##########
			####################################################
			
----------------------
--- Normal Booter  ---
----------------------
			
1.	Click and hold the shutter button (top button to start filming etc.)
2.	Now start the camera with the front power button. (keep holding the shutter button)
3.	After the front LED has stopped blinking (reading process finished), the top small red LED near
	the	shutter button should light up. (keep holding the shutter button)
4.	Now press within 6 seconds the front power button to choose the script.
	Each time a "click/press" has been registered, the WIFI LED will light one time up (blue LED
	on the side)
	Press once 			-> XIMODE-AUTO			will be loaded
	Press twice 		-> XIMODE-NORMAL 		will be loaded
	Press three times 	-> XIMODE-NIGHT 		will be loaded
	Press four times 	-> XIMODE-YITUNE 		will be loaded
	Press five times 	-> XIMODE-SupYiView 	will be loaded
	Press six times 	-> XIMODE-NIGHTLAPSE 	will be loaded
	Press seven times 	-> XIMODE-CUSTOM 		will be loaded
	Press eight times 	-> XIMODE-CUSTOM2 		will be loaded
	
	After the x-pressed times, NOW you can stop holding the shutter button.
	
5.	The front LED starts to blink and the device will reboot.
	Now wait about 10seconds, don't press any further buttons, the device will reboot, and load 
	YOUR CHOSEN SCRIPT.
6.	The long beep indicates that the script has been loaded, and the amount of flashing times of
	the front LED indicates which script has been loaded.
	
----------------------
---     Telnet     ---
----------------------

1.	Turn on wifi on your Xiaomi Yi.
2.	Connect your device(iPhone/Android/Windows/Mac) to the Xiaomi Yi's WIFI.
3.	Open your telnet programm.
4.	Input in the right place this IP/Adress:
							192.168.42.1
5.	The username/login is:
								root
6.	Now only send/enter:
							/tmp/fuse_d/xyc.sh
7.	There you go, now after several seconds the menu should pop up and you're ready to go.
	Simply enter the number of the give Menu/Option/Setting and hit Sent/Enter.
	0 is the number to return to menu and write the autoexec.ash script via Telnet.
	PLEASE DON'T USE THE REBOOT OPTION WITHIN THE MENU, SIMPLY MANUALLY REBOOT 
	(power off -> power on)
	
INFO: 	Everytime when the device is started normally, it loads the previously selected mode.
		F.ex: You selected mode 2 and turned the camera off. When simply starting the camera	
		with only the power button, it will directly load mode 2.
		The holding of shutter button tells the device to count the pressed times to select mode.
		
Turn-off: Nothing changed, simply turn of your device as usual.

			####################################################
			##########		CONVERT RAW TO DNG        ##########
			####################################################
		
	Video tutorial: https://www.youtube.com/watch?v=xP_Odq_tGcs
	Download:		https://www.mediafire.com/?0p515wid9ovou3u
	
1. 	Start inside the "RAW_to_DNG_converter -> 01_RAW2DNG" directory and open the file
	"Raw_to_DNG_converter.exe".
2. 	Right click on list and select "Add files".
3. 	Add your RAW files from the Xiaomi Yi cam.
4. 	Check if output format is "DNG", also check that the default camera is XIAOMI YI.
5.	Click convert and wait till the files are generated.
6.	Now open the folder 02_CorrectDNGs and drag&drop the converted DNG into "exiftool.exe" and 
	afterwards into "Yi-correct-RAW-counter.bat"
7. 	Now you can edit the highest quality pictures available for the
	Xiaomi Yi with Photoshop, Gimp, ... .
			
			####################################################
			##########		   UNINSTALLATION         ##########
			####################################################
	
1. 	Simply delete all the files of XIMODE(!!! EXCEPT DCIM AND MISC !!!)
	(!!! EXCEPT DCIM AND MISC !!!)

			####################################################
			##########		   ABOUT XIMODE           ##########
			####################################################
				
• What is Ximode?
Ximode is a tool, that add's the missing modes for the Xiaomi Yi, as the auto, normal, night, and other preset modes to enhance your recording and shooting moments.
Ximode is can be used without the official Xiaomi app, and the modes are choosed by pressing at start the front button only once, twice, three times etc. .

• Why Ximode?
Ximode is a script which has only to be placed on your SD-Card, and you're good to go for your next shootings and recording without any additional scriptings. It's main target was to create a script which the user can use directly without further scripting knowledge and recieve all necessery modes to feel the "action-cam" magic.

• Why Ximode was created?
When i first recieved the Xiaomi Yi, i got the feeling that the developpers were lazy and set the cam to auto mode, so the user simply records his video and pictures. However that's in my opinion not how you deliver a camera to a customer. I've been working for over 8 years with LQ and HQ cameras, am using Sony Vegas Pro and Adobe After Effects for postproductions and Paint.net, Gimp and Photoshop to edit pictures.
Due my experience and the lack of modes for the Xiaomi Yi, i created out of several excellent scripts this complete package, which can be used fresh out of the box.

			####################################################
			##########		   UPDATE - LOG           ##########
			####################################################
			
• 2.0.2.	Not launching scripts bug fix from previous version! (2.0.1.)
			
• 2.0.1.	Minor script updates and bug fixes. Added "No split 4GB" for previous versions too.
			(1.2.13 / 1.2.12 / 1.2.6)
			
• 2.0.0.	Added XYC Configurator to XIMODE. Now it's possible to change scripts on the run
			with only a mobile phone (Telnet needed), or with the buttons.
			Fusioned the latest XYC Configurator Version with the latest XIMODE (previous one 
			1.0.2.).
			Updated the delete THM files, now all THM files in all Media folders
			(100MEDIA,101MEDIA,...135MEDIA,...) will be deleted.
			Added more scene modes:
			#auto[1] / mode-off[2] / night[10] / landscape[13] / portrait[14] / scene_sunset[15] / #sand_snow[16] / underwater[19] / day_lightning[27] / through_glass[34] / car_DV[38]
			
			_ 
			
• 1.0.2.	Edited scripts. BIG update on the Night script. (Fixed ISO for videos & more)
			Added one more custom script. (called custom2)
			Bugs fix.
			
• 1.0.1.	Edited scripts. Added nightlapse and custom. Auto-mode is now the first mode.
			All other modes have been placed one level up.
			Overall update for better GUI, understanding and description.
			Updated 4GB script. (Working now with 1.2.13)
	
• 1.0.		First release.
			

			####################################################
			##########		 INFO/CONTACT/HELP        ##########
			####################################################

• PLEASE USE WITH 35Mbit CUSTOM 1.2.13 FIRMWARE:
https://dashcamtalk.com/forum/threads/xiaomi-yi-custom-firmware-with-lastest-revision.13557/

• SOURCE/THANKS:

    • Tawbaware for creating XYC http://www.tawbaware.com/xiaomiyi.htm

    • alex for XYC Configurator updates https://github.com/alex-agency/XYC

    • nutsey Yimax and his blog http://nutseynuts.blogspot.lu/
	
    • PJanisio Githup rep. https://github.com/PJanisio/Xiaomi_Yi_autoexec
	
    • gente updated scripts
	
    • Fried Custom 1.2.13 35Mbit firmware https://dashcamtalk.com/forum/threads/xiaomi-yi-custom-firmware-with-lastest-revision.13557/
	
    • Halvabrosch ash.booter https://github.com/halvaborsch/ash.booter
	
    • strAvus clean recording https://dashcamtalk.com/forum/posts/229369/
	
    • WaffleFPV SuPoorView http://fpvlab.com/forums/showthread.php?45118-Xiaomi-Yi-SuperView-Mod-%28-more!%29
	
   •  Dashcamtalk society https://dashcamtalk.com/forum/forums/yi-action-camera.153/
