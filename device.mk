#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/uke
KERNEL_PATH := $(DEVICE_PATH)-kernel

# Inherit from the common OEM chipset makefile.
$(call inherit-product, device/xiaomi/sm8635-common/common.mk)

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResUke \
    SettingsProviderResUke \
    LineageSettingsOverlayDevice

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/uke/uke-vendor.mk)

$(call soong_config_set,surfaceflinger,frame_rate_category_high,144)
$(call soong_config_set,surfaceflinger,frame_rate_category_min,60)

# Powerhint (uke-tuned, overrides QCOM pineapple default)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/power/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml
