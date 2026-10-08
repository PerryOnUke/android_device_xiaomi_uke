#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/uke
KERNEL_PATH := $(DEVICE_PATH)-kernel

# Dolby
TARGET_PROVIDES_DOLBY_DAX := true

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/xiaomi/sm8635-common/common.mk)

# Dolby DAX
PRODUCT_COPY_FILES += \
    vendor/xiaomi/uke/proprietary/odm/etc/dolby/dax-default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default.xml \
    vendor/xiaomi/uke/proprietary/odm/etc/dolby/dax-default-spatializer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default-spatializer.xml

# Kernel Manager
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/ax_kernel_manager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/ax_kernel_manager.xml

# The NT36532 has no flash: nt36532_touch downloads its firmware at probe.
# Recovery doesn't mount /odm, so ship the firmware in its ramdisk.
PRODUCT_COPY_FILES += \
    $(foreach panel,csot tm, \
        vendor/xiaomi/uke/proprietary/odm/firmware/novatek_nt36532_o82_fw_$(panel).bin:$(TARGET_COPY_OUT_RECOVERY)/root/lib/firmware/novatek_nt36532_o82_fw_$(panel).bin)

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResUke \
    SettingsProviderResUke

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/uke/uke-vendor.mk)
