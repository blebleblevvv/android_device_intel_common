DEVICE_PACKAGE_OVERLAYS += device/intel/common/base_x86_legacy/overlay

TARGET_SYSLINUX_CONFIG := device/intel/common/base_x86_legacy/syslinux-fastboot.cfg
TARGET_SYSLINUX_USB_CONFIG := device/intel/common/base_x86_legacy/syslinux-usb.cfg

# ----------------- BEGIN MIX-IN DEFINITIONS -----------------
# Mix-In definitions are auto-generated by mixin-update
##############################################################
# Source: device/intel/mixins/groups/boot-arch/syslinux32/BoardConfig.mk
##############################################################
#
# -- OTA RELATED DEFINES --
#

# tell build system where to get the recovery.fstab. Userfastboot
# uses this too.
TARGET_RECOVERY_FSTAB ?= $(TARGET_DEVICE_DIR)/fstab

# Used by ota_from_target_files to add platform-specific directives
# to the OTA updater scripts
TARGET_RELEASETOOLS_EXTENSIONS ?= device/intel/common/recovery/releasetools.py

# Adds edify commands swap_entries and copy_partition for robust
# update of the EFI system partition
TARGET_RECOVERY_UPDATER_LIBS := libupdater_esp

# Extra libraries needed to be rolled into recovery updater
# libgpt_static is needed by libupdater_esp
TARGET_RECOVERY_UPDATER_EXTRA_LIBS := libcommon_recovery libgpt_static

TARGET_RECOVERY_UI_LIB := libgmin_recovery_ui

# By default recovery minui expects RGBA framebuffer
# also affects UI in Userfastboot
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"


#
# FILESYSTEMS
#

# NOTE: These values must be kept in sync with BOARD_GPT_INI
BOARD_SYSTEMIMAGE_PARTITION_SIZE ?= 2684354560
BOARD_BOOTLOADER_PARTITION_SIZE ?= 104857600

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Partition table configuration file
BOARD_GPT_INI ?= $(TARGET_DEVICE_DIR)/gpt.ini

#
# FASTBOOT
#

TARGET_STAGE_USERFASTBOOT := true
TARGET_USE_USERFASTBOOT := true

TARGET_BOOTLOADER_BOARD_NAME := $(TARGET_DEVICE)

#
# Bootloader
#
TARGET_USE_SYSLINUX := true
TARGET_INSTALL_CUSTOM_SYSLINUX_CONFIG := true
TARGET_SYSLINUX_FILES = \
	$(SYSLINUX_BASE)/isolinux.bin \
	$(SYSLINUX_BASE)/vesamenu.c32 \
	$(SYSLINUX_BASE)/android.c32

BOARD_MBR_BLOCK_BIN ?= external/syslinux/mbr/gptmbr.bin

#
# USERFASTBOOT Configuration
#
TARGET_STAGE_USERFASTBOOT := true
TARGET_USE_USERFASTBOOT := true

BOOTLOADER_ADDITIONAL_DEPS += $(PRODUCT_OUT)/fastboot.img
BOOTLOADER_ADDITIONAL_ARGS += --fastboot $(PRODUCT_OUT)/fastboot.img

BOARD_FLASHFILES += $(BOARD_GPT_INI):gpt.ini
INSTALLED_RADIOIMAGE_TARGET += $(BOARD_GPT_INI)

##############################################################
# Source: device/intel/mixins/groups/kernel/gmin64/BoardConfig.mk.1
##############################################################
TARGET_USES_64_BIT_BINDER := true
##############################################################
# Source: device/intel/mixins/groups/kernel/gmin64/BoardConfig.mk
##############################################################
# Specify location of board-specific kernel headers
TARGET_BOARD_KERNEL_HEADERS := device/intel/gmin-kernel/kernel-headers

KERNEL_LOGLEVEL ?= 5

BOARD_KERNEL_CMDLINE += \
        loglevel=$(KERNEL_LOGLEVEL) \
        androidboot.hardware=$(TARGET_DEVICE)\
        firmware_class.path=/system/etc/firmware \
	i915.fastboot=1

##############################################################
# Source: device/intel/mixins/groups/display-density/medium/BoardConfig.mk
##############################################################
ADDITIONAL_DEFAULT_PROPERTIES += ro.sf.lcd_density=160

##############################################################
# Source: device/intel/mixins/groups/cpu-arch/x86/BoardConfig.mk
##############################################################
TARGET_CPU_ABI := x86
TARGET_ARCH_VARIANT := x86

TARGET_ARCH := x86

##############################################################
# Source: device/intel/mixins/groups/houdini/true/BoardConfig.mk
##############################################################
# enable ARM codegen for x86 with Houdini
BUILD_ARM_FOR_X86 := true

##############################################################
# Source: device/intel/mixins/groups/graphics/software/BoardConfig.mk
##############################################################
BOARD_KERNEL_CMDLINE += vga=current nomodeset
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
USE_INTEL_UFO_DRIVER := false
INTEL_VA := true
BOARD_GRAPHIC_IS_GEN := true

# System's VSYNC phase offsets in nanoseconds
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000

# Allow HWC to perform a final CSC on virtual displays
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

##############################################################
# Source: device/intel/mixins/groups/storage/emulated/BoardConfig.mk
##############################################################
DEVICE_PACKAGE_OVERLAYS += device/intel/common/storage/overlay-emulated

##############################################################
# Source: device/intel/mixins/groups/media/ufo/BoardConfig.mk
##############################################################
# Settings for the Intel-optimized codecs and plug-ins:
USE_INTEL_MDP := true

# Settings for the Media SDK library and plug-ins:
# - USE_MEDIASDK: use Media SDK support or not
# - MFX_IPP: sets IPP library optimization to use
USE_MEDIASDK := true
MFX_IPP := p8

##############################################################
# Source: device/intel/mixins/groups/sensors/iio/BoardConfig.mk
##############################################################
USE_INTEL_SENSOR_HAL := true
##############################################################
# Source: device/intel/mixins/groups/navigationbar/true/BoardConfig.mk
##############################################################
DEVICE_PACKAGE_OVERLAYS += device/intel/common/navigationbar/overlay

##############################################################
# Source: device/intel/mixins/groups/device-type/tablet/BoardConfig.mk
##############################################################
DEVICE_PACKAGE_OVERLAYS += device/intel/common/device-type/overlay-tablet
##############################################################
# Source: device/intel/mixins/groups/factory-scripts/true/BoardConfig.mk
##############################################################
# Include factory archive in 'make dist' output
TARGET_BUILD_INTEL_FACTORY_SCRIPTS := true

##############################################################
# Source: device/intel/mixins/groups/sepolicy/permissive/BoardConfig.mk.1
##############################################################
# start kernel in permissive mode, this way we don't
# need 'setenforce 0' from init.rc files
BOARD_KERNEL_CMDLINE += enforcing=0 androidboot.selinux=permissive
##############################################################
# Source: device/intel/mixins/groups/sepolicy/permissive/BoardConfig.mk
##############################################################
# SELinux Policy
BOARD_SEPOLICY_DIRS := device/intel/common/sepolicy
BOARD_SEPOLICY_REPLACE := \
    domain.te

# please keep this list in alphabetical order
BOARD_SEPOLICY_UNION := \
    adbd.te \
    bluetooth.te \
    coreu.te \
    device.te \
    drmserver.te \
    file_contexts \
    file.te \
    genfs_contexts \
    gpsd.te \
    hdcpd.te \
    init_shell.te \
    init.te \
    kernel.te \
    keymaster.te \
    keystore.te \
    mediaserver.te \
    netd.te \
    platform_app.te \
    power_hal_helper.te \
    property_contexts \
    property.te \
    pstore-clean.te \
    recovery.te \
    service_contexts \
    service.te \
    setup_fs.te \
    shell.te \
    surfaceflinger.te \
    system_app.te \
    system_server.te \
    thermal.te \
    ueventd.te \
    untrusted_app.te \
    userfastboot.te \
    vold.te \
    wpa.te
##############################################################
# Source: device/intel/mixins/groups/art-config/default/BoardConfig.mk
##############################################################
# Enable dex-preoptimization to speed up the first boot sequence
# Note that this operation only works on Linux for now
WITH_DEXPREOPT := true

##############################################################
# Source: device/intel/mixins/groups/mixin-check/default/BoardConfig.mk
##############################################################
mixin_update := $(wildcard device/intel/mixins/mixin-update)

ifneq ($(mixin_update),)

# TARGET_DEVICE_DIR doesn't get expanded until later. so OK to reference
# this in BoardConfig.mk
.PHONY: check-mixins
check-mixins:
	device/intel/mixins/mixin-update --dry-run --spec $(TARGET_DEVICE_DIR)/mixins.spec

# This invocation of dumpvar gets called during the 'lunch' command. Hook it to
# do some additional checking.
dumpvar-TARGET_DEVICE: check-mixins
droidcore: check-mixins

endif

# ------------------ END MIX-IN DEFINITIONS ------------------
