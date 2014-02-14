# Copyright (C) 2013 The Android Open Source Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from common m7-common
-include device/htc/m7-common/BoardConfigCommon.mk

# Assert
ifeq ($(TARGET_DEVICE),m7spr)
TARGET_OTA_ASSERT_DEVICE := m7spr,m7wls
else ifeq ($(TARGET_DEVICE),m7vzw)
TARGET_OTA_ASSERT_DEVICE := m7vzw,m7wlv
else
TARGET_OTA_ASSERT_DEVICE := m7,m7att,m7tmo,m7ul
endif

# Bootloader
ifeq ($(TARGET_DEVICE),m7spr)
TARGET_BOOTLOADER_BOARD_NAME := m7wls
else ifeq ($(TARGET_DEVICE),m7vzw)
TARGET_BOOTLOADER_BOARD_NAME := m7wlv
else
TARGET_BOOTLOADER_BOARD_NAME := m7
endif

# Filesystem
ifeq ($(TARGET_DEVICE),m7vzw)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2348809216
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27380416512
else
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1946156032
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27917287424
endif

# inherit from the proprietary version
ifeq ($(TARGET_DEVICE),m7spr)
-include vendor/htc/m7spr/BoardConfigVendor.mk
else ifeq ($(TARGET_DEVICE),m7vzw)
-include vendor/htc/m7vzw/BoardConfigVendor.mk
else
-include vendor/htc/m7/BoardConfigVendor.mk
endif
