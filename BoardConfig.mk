# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Device codename
SHRP_DEVICE_CODE := a51
SHRP_PATH := device/samsung/$(SHRP_DEVICE_CODE)

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a73
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Bootloader
BOARD_VENDOR := samsung
TARGET_SOC := exynos9611
TARGET_BOOTLOADER_BOARD_NAME := exynos9611
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true
TARGET_NO_RADIOIMAGE := true

# Kernel
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_PREBUILT_KERNEL := $(SHRP_PATH)/prebuilt/Image
BOARD_KERNEL_CMDLINE := androidboot.hardware=exynos9611
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --header_version 2 --board SRPSG30B004RU

# Platform
TARGET_BOARD_PLATFORM := exynos9611
TARGET_BOARD_PLATFORM_GPU := mali-g72

# Filesystem
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# TWRP specific build flags
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_PIXEL_FORMAT := "ABGR_8888"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 365
TW_DEFAULT_BRIGHTNESS := 219
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_EXTRA_LANGUAGES := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_BASH := true
TW_EXCLUDE_NANO := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(SHRP_PATH)/prebuilt/recovery_dtbo
BOARD_PREBUILT_DTBIMAGE_DIR := $(SHRP_PATH)/prebuilt/dtb
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

PLATFORM_SECURITY_PATCH := 2021-05-01

BOARD_KERNEL_IMAGE_NAME := Image

BOARD_SUPER_PARTITION_SIZE := 6365921848
BOARD_SUPER_PARTITION_GROUPS := google_dynamic_partitions
BOARD_GOOGLE_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    vendor \
    product \
    odm

# BOARD_GOOGLE_DYNAMIC_PARTITIONS_SIZE is set to BOARD_SUPER_PARTITION_SIZE / 2 - 4MB
BOARD_GOOGLE_DYNAMIC_PARTITIONS_SIZE := 3178766620

# Set error limit to BOARD_SUPER_PARTITION_SIZE - 500MB
BOARD_SUPER_PARTITION_ERROR_LIMIT := 5841633848

# Haptics
TW_USE_SAMSUNG_HAPTICS := true

# Maintainer name
SHRP_MAINTAINER := Yillié

# Recovery Type (for "About" section only)
SHRP_REC_TYPE := SAR

# Device Type (for "About" section only)
SHRP_DEVICE_TYPE := A_Only

SHRP_REC := /dev/block/by-name/recovery
SHRP_EXTERNAL := /external_sd
SHRP_OTG := /usb_otg
SHRP_FLASH := 1
SHRP_STATUSBAR_RIGHT_PADDING := 48
SHRP_STATUSBAR_LEFT_PADDING := 48

# custom led paths for flashlight
SHRP_CUSTOM_FLASHLIGHT := true
SHRP_FONP_1 := /sys/devices/virtual/camera/flash/rear_flash
SHRP_FLASH_MAX_BRIGHTNESS := 1 # Value to echo to the flashlight file
