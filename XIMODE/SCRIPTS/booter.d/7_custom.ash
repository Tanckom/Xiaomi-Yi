###########################################
#                                         #
#			XIMODE - CUSTOM               #
#                                         #
###########################################

#Author: YOU
#Description: If you want to add your own script to the booter, simply paste it below here.
#Caution, if there are no bitrate changes made, the bitrate resolution stays at 35Mbit.
#If you want to keep the THM files, please remove the "Anything Else" section in 0_default.ash script.
#If the THM should be kept in all the other scripts but not this one, please copy the "Anything Else"
#section into all the other scripts and delete it from the first script.(0_default.ash)

###############################################
#		YOUR SCRIPT BELOW THIS LINE		      #
###############################################



# My script
# Change ISO, ...




###############################################
#		YOUR SCRIPT OVER THIS LINE		      #
###############################################
#+++++++++++++ FINISHED +++++++++++++

#ready beep
t pwm 1 enable
sleep 1
t pwm 1 disable

#Mode 7
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

t gpio 6 sw out1
sleep 2
t gpio 6 sw out0
sleep 1

t gpio 6 sw out1
sleep 2
t gpio 6 sw out0
