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
    $(LOCAL_PATH)/recovery/kernel:kernel \
    $(LOCAL_PATH)/recovery/root/sbin/choice_fn:recovery/root/sbin/choice_fn \
    $(LOCAL_PATH)/recovery/root/sbin/detect_key:recovery/root/sbin/detect_key \
    $(LOCAL_PATH)/recovery/root/sbin/htcbatt:recovery/root/sbin/htcbatt \
    $(LOCAL_PATH)/recovery/root/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    $(LOCAL_PATH)/ramdisk/init.recovery.enrc2b.rc:root/init.recovery.enrc2b.rc \
    $(LOCAL_PATH)/ramdisk/init.usb.rc:root/init.usb.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.enrc2b.rc:root/ueventd.enrc2b.rc \
    $(LOCAL_PATH)/ramdisk/fstab.enrc2b:root/fstab.enrc2b

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp,adb

# Tegra 3 spacific overrides
PRODUCT_PROPERTY_OVERRIDES += \
    persist.tegra.nvmmlite=1 \
    tf.enable=y

$(call inherit-product, vendor/htc/enrc2b/enrc2b-vendor.mk)
