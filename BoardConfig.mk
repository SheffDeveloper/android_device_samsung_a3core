DEVICE_PATH := device/samsung/a3core
ALLOW_MISSING_DEPENDENCIES := true

# Bootloader
BOARD_VENDOR := samsung
TARGET_SOC := sc9863a
TARGET_BOOTLOADER_BOARD_NAME := m168
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_USES_UEFI := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_64_BIT_APPS := true

TARGET_CPU_SMP := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Platform
TARGET_BOARD_PLATFORM := sp9863a
TARGET_BOARD_PLATFORM_GPU := img8322

# Kernel
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/KernelImage
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/KernelDTB
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/KernelDTBO
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_ARCH := arm64

# Boot
BOARD_BOOT_HEADER_VERSION := 2
BOARD_BOOT_HEADER_SIZE := 1660
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8
BOARD_KERNEL_IMAGE_NAME := KernelImage
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_SECOND_OFFSET := 0x00000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_DTB_OFFSET := 0x01f00000
BOARD_DTB_SIZE := 89670
BOARD_MKBOOTIMG_ARGS := \
	--kernel_offset $(BOARD_KERNEL_OFFSET) \
	--ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
	--tags_offset $(BOARD_KERNEL_TAGS_OFFSET) \
	--second_offset $(BOARD_KERNEL_SECOND_OFFSET) \
	--header_version $(BOARD_BOOT_HEADER_VERSION) \
	--pagesize $(BOARD_KERNEL_PAGESIZE) \
	--board "SRPUH09A004" \
	--dtb $(TARGET_PREBUILT_DTB) \
	--dtb_offset $(BOARD_DTB_OFFSET)
	
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/bootimg.mk

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # $(BOARD_KERNEL_PAGESIZE) * 64
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 3303014400
BOARD_SUPER_PARTITION_GROUPS := group_unisoc
BOARD_GROUP_UNISOC_SIZE := 2082045952
BOARD_GROUP_UNISOC_LIST := system system_ext vendor product

# System as root
BOARD_ROOT_EXTRA_FOLDERS := acct cache data_mirror efs linkerconfig metadata odm_dlkm persist product system_dlkm system_ext vendor_dlkm

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 0
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 0
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flag 0

# Crypto
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
TW_INCLUDE_CRYPTO := false
TW_INCLUDE_CRYPTO_FBE := false
TW_INCLUDE_FBE_METADATA_DECRYPT := false
BOARD_USES_METADATA_PARTITION := true

# TWRP
TW_DEVICE_VERSION := 1
TW_THEME := portrait_hdpi
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1600
TARGET_USES_LOGD := true
RECOVERY_SDCARD_ON_DATA := true

# Screen & Haptics
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 200
TW_USE_SAMSUNG_HAPTICS := true

# Screen Offsets
TW_Y_OFFSET := 80
TW_H_OFFSET := -80

# Touch fix
TW_LOAD_VENDOR_MODULES := $(shell echo \"$(shell ls $(DEVICE_PATH)/mnt/vendor/socko)\")
TW_LOAD_VENDOR_MODULES := "chipone-tddi.ko chipone-tddi_ss.ko focaltech_ts.ko ilitek-tddi.ko gcore_ss.ko gcore_7202h.ko nt36xxx_ss.ko tcs3430.ko"
TW_LOAD_VENDOR_BOOT_MODULES := true
TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true
# PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,device/samsung/a3core/recovery/root,recovery/root) 
# ^ probably not needed

# TWRP Settings
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
TW_INCLUDE_NTFS_3G := true
TWRP_INCLUDE_LOGCAT := true
TW_USE_NEW_MINADBD := true
TW_EXCLUDE_TWRPAPP := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
#TW_EXTRA_LANGUAGES := true
TARGET_USES_MKE2FS := true
TW_NO_LEGACY_PROPS := true
TW_NO_BIND_SYSTEM := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TW_MTP_DEVICE := "Galaxy A03 Core"

# Making the recovery.img smaller
# BOARD_HAS_NO_REAL_SDCARD := true

