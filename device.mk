# Copyright 2014 The Android Open Source Project
#
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

# Device path
DEVICE_PATH := device/motorola/hanoip/rootdir

DEVICE_PACKAGE_OVERLAYS += \
    device/motorola/hanoip/overlay

# Device Specific Permissions
PRODUCT_COPY_FILES := \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml

# Audio Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/etc/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(DEVICE_PATH)/vendor/etc/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(DEVICE_PATH)/vendor/etc/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# Device Init
PRODUCT_PACKAGES += \
    fstab.hanoip \
    vendor-fstab.hanoip \
    init.recovery.qcom.rc

# AB Partitions
AB_OTA_PARTITIONS += \
    vendor_boot \
    system_ext

# Gcam
PRODUCT_PACKAGES += \
    GoogleCameraGo

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/GoogleCameraGo/permissions/com.google.android.GoogleCameraGo.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.google.android.GoogleCameraGo.xml \
    $(LOCAL_PATH)/GoogleCameraGo/configs/hiddenapi-package-whitelist-GoogleCameraGo.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/hiddenapi-package-whitelist-GoogleCameraGo.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/qmi_fw.conf:$(TARGET_COPY_OUT_VENDOR)/etc/qmi_fw.conf

# GPS
PRODUCT_PACKAGES += \
    apdr.conf \
    flp.conf \
    gps.conf \
    gnss_antenna_info.conf \
    izat.conf \
    lowi.conf \
    sap.conf \
    xtwifi.conf

# Properties
-include $(LOCAL_PATH)/vendor_prop.mk

# Overlay
PRODUCT_PACKAGES += \
    hanoipFrameworkOverlay \
    hanoipSystemUIOverlay

# Telephony Packages (AOSP)
PRODUCT_PACKAGES += \
    InCallUI \
    Stk

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=400

# MotoActions
PRODUCT_PACKAGES += \
    MotoActions

# Inherit from those products. Most specific first.
$(call inherit-product, device/motorola/sm6150-common/platform.mk)

# include board vendor blobs
$(call inherit-product-if-exists, vendor/motorola/hanoip/hanoip-vendor.mk)
