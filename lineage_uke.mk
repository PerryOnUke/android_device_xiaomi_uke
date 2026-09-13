#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Inherit from device makefile.
$(call inherit-product, device/xiaomi/uke/device.mk)

PRODUCT_DEVICE := uke
PRODUCT_BRAND := Xiaomi
PRODUCT_NAME := lineage_uke
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := Pad 7

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="missi-user 16 BP2A.250605.031.A3 OS3.0.303.0.WOZMIXM release-keys"

# Axion Device Configuration
AXION_MAINTAINER := delano-git
AXION_PROCESSOR := Snapdragon®_7+_Gen_3

# Camera Info
AXION_CAMERA_REAR_INFO := 13
AXION_CAMERA_FRONT_INFO := 8

# Graphics & Display
TARGET_ENABLE_BLUR := true
TARGET_SUPPORTED_REFRESH_RATES := 60,90,120,144
HBM_SUPPORTED := true
HBM_NODE := /data/vendor/display/hbm_mode

# Features & Performance
BYPASS_CHARGE_SUPPORTED := true
BYPASS_CHARGE_TOGGLE_PATH ?= /sys/class/xm_power/charger/smart_charge/smart_night
TARGET_INCLUDE_AXFX := true
