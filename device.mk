  #
# Copyright (C) 2012 The Android Open-Source Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab \
    $(LOCAL_PATH)/recovery/kernel:kernel

# Recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/sbin/choice_fn:recovery/root/sbin/choice_fn \
    $(LOCAL_PATH)/recovery/root/sbin/detect_key:recovery/root/sbin/detect_key \
    $(LOCAL_PATH)/recovery/root/sbin/htcbatt:recovery/root/sbin/htcbatt \
    $(LOCAL_PATH)/recovery/root/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    $(LOCAL_PATH)/recovery/init.twrp.rc:recovery/root/init.twrp.rc

    # Files needed for boot image
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/init.enrc2b.rc:root/init.enrc2b.rc \
    $(LOCAL_PATH)/ramdisk/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.enrc2b.rc:root/ueventd.enrc2b.rc \
    $(LOCAL_PATH)/ramdisk/fstab.enrc2b:root/fstab.enrc2b

# Prebuilt GPS/Camera/Wi-Fi configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nvcamera_2nd.conf:system/etc/nvcamera_2nd.conf \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
    $(LOCAL_PATH)/configs/gps/gpsconfig_release.xml:system/etc/gps/gpsconfig_release.xml \
    $(LOCAL_PATH)/configs/htcfs.conf:system/etc/htcfs.conf \
    $(LOCAL_PATH)/configs/hostapd.conf:system/etc/wifi/hostapd.conf \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    $(LOCAL_PATH)/configs/calibration:system/etc/calibration \
    $(LOCAL_PATH)/configs/sysctl.conf:system/etc/sysctl.conf

# BT
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Audio packages
PRODUCT_PACKAGES += \
    libinvensense_mpl

# Filesystem management tools
PRODUCT_PACKAGES += \
    sdcard \
    libmtp

# Hostapd
PRODUCT_PACKAGES += \
    hostapd_cli \
    calibrator

# NFC
PRODUCT_PACKAGES += \
    libnfc_ndef

# Other Apps
PRODUCT_PACKAGES += \
    OmniTorch

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

# Tegra 3 spacific overrides
PRODUCT_PROPERTY_OVERRIDES += \
    persist.tegra.nvmmlite=1 \
    tf.enable=y

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_LOCALES += en_GB xhdpi

$(call inherit-product, vendor/htc/enrc2b/enrc2b-vendor.mk)

# common tegra3-HOX+ configs
$(call inherit-product, device/htc/tegra3-common/tegra3.mk)
