#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE1="a51"

RED_BACK="\e[101m"
RED="\e[91m"
RESET="\e[0m"
GREEN="\e[92m"

export_build_vars(){
	echo -e "${GREEN}Exporting build vars from the a51 tree${RESET}"
	export ALLOW_MISSING_DEPENDENCIES=true
	export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
	export LC_ALL="C"
	export OF_VANILLA_BUILD=1
	export FOX_RECOVERY_INSTALL_PARTITION="/dev/block/by-name/recovery"
	# Skip the selinux enforce patches for a samsung device.
	export OF_NO_SAMSUNG_SPECIAL=1
	# Same as setting TW_USE_SAMSUNG_HAPTICS
	# to true in makefile.
	#export OF_USE_SAMSUNG_HAPTICS=1

	# Only set this to 1, 2 or 3.
	# Incase you don't wanna use it,
	# comment it out or unset it from the env.
	export FOX_CUSTOM_BINS_TO_SDCARD=1

	### Extra build vars ###
	export OF_USE_MAGISKBOOT=1
	export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export OF_FL_PATH1="/system/flashlight"
	export OF_FL_PATH2=""
	export OF_FLASHLIGHT_ENABLE=1
	export OF_HIDE_NOTCH=1
	export OF_CLOCK_POS=1
	export OF_ALLOW_DISABLE_NAVBAR=0
	export OF_USE_SYSTEM_FINGERPRINT=1
	export OF_USE_TWRP_SAR_DETECT=1
	export OF_QUICK_BACKUP_LIST="/super;/boot;/vbmeta;/vbmeta_samsung;/dtbo;/efs;/sec_efs;/modem"
	export FOX_DISABLE_APP_MANAGER=1
	export OF_STATUS_INDENT_LEFT="48"
	export OF_STATUS_INDENT_RIGHT="48"
	export OF_STATUS_H="88"
	export OF_SCREEN_H="2400"
	export OF_USE_GREEN_LED=0
	export OF_USE_HEXDUMP=1
	export OF_SUPPORT_PRE_FLASH_SCRIPT=1
	export OF_ENABLE_LPTOOLS=1
	export OF_DEVICE_WITHOUT_PERSIST=1
	export OF_DONT_KEEP_LOG_HISTORY=1

	export TARGET_DEVICE_ALT="a51, a51ns, a51nsxx"
	export OF_TARGET_DEVICES="a51, a51ns, a51nsxx"

	if [ "$FOX_CUSTOM_BINS_TO_SDCARD" != "" ]; then
		export FOX_USE_NANO_EDITOR=1
		export FOX_USE_SED_BINARY=1
		export FOX_USE_TAR_BINARY=1
		export FOX_USE_UNZIP_BINARY=1
		export FOX_USE_XZ_UTILS=1
		export FOX_REPLACE_BUSYBOX_PS=1
		export FOX_REPLACE_TOOLBOX_GETPROP=1
	else
		export FOX_DYNAMIC_SAMSUNG_FIX=1
	fi

	# R11
	export FOX_R11=1
	export FOX_BUILD_TYPE=Beta
	export FOX_VERSION="R11.1_2"

	# maximum permissible splash image size
	# (in kilobytes); do *NOT* increase!
	export OF_SPLASH_MAX_SIZE=104

	# Custom pic for maintainer's about section info
	export OF_MAINTAINER_AVATAR="$PWD/device/samsung/a51/maintainer.png"

	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
	  export | grep "FOX" >> $FOX_BUILD_LOG_FILE
	  export | grep "OF_" >> $FOX_BUILD_LOG_FILE
	  export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
	  export | grep "TW_" >> $FOX_BUILD_LOG_FILE
	fi
}

set_env_var(){
        echo -e "${RED_BACK}Environment Variable CURR_DEVICE not set... Aborting${RESET}"
        echo "Set to the codename of the device you're building for"
        echo -e "${GREEN}Example :${RESET}"
        echo " export CURR_DEVICE=a51"
        exit 1
}

var_not_eq(){
        echo -e "${RED_BACK}CURR_DEVICE not equal to a51${RESET}"
        echo -e "${RED_BACK}CURR_DEVICE = $CURR_DEVICE${RESET}"
        echo -e "${RED}If this is a mistake, then export CURR_DEVICE to the correct codename${RESET}"
        echo -e "${RED}Skipping a51 specific build vars...${RESET}"
}

case "$CURR_DEVICE" in
  "$FDEVICE1")
    export_build_vars;
    ;;
  "")
    set_env_var
    ;;
  *)
    var_not_eq
    ;;
esac
