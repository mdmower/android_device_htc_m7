#
# Copyright (C) 2013 The CyanogenMod Project
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

# call the proprietary setup
$(call inherit-product-if-exists, vendor/htc/m7/m7-vendor.mk)

# Overlays
ifneq ($(filter m7 m7att m7tmo m7ul,$(TARGET_DEVICE)),)
DEVICE_PACKAGE_OVERLAYS += device/htc/m7/overlay-gsm
endif

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.target.rc

# Device specific build properties
ifeq ($(TARGET_DEVICE),m7spr)
PRODUCT_PROPERTY_OVERRIDES += \
    gsm.operator.alpha=Sprint \
    gsm.operator.iso-country=us \
    gsm.operator.numeric=310120 \
    gsm.sim.operator.alpha=Sprint \
    gsm.sim.operator.iso-country=us \
    gsm.sim.operator.numeric=310120 \
    persist.radio.always_send_plmn=true \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.mode_pref_nv10=1 \
    persist.radio.snapshot_enabled=1 \
    persist.radio.snapshot_timer=2 \
    persist.radio.use_nv_for_ehrpd=true \
    ro.cdma.home.operator.alpha=Sprint \
    ro.cdma.home.operator.numeric=310120 \
    ro.telephony.default_network=10 \
    telephony.lteOnCdmaDevice=1
else ifeq ($(TARGET_DEVICE),m7vzw)
PRODUCT_PROPERTY_OVERRIDES += \
    gsm.operator.alpha=Verizon \
    gsm.operator.iso-country=us \
    gsm.operator.numeric=311480 \
    gsm.sim.operator.alpha=Verizon \
    gsm.sim.operator.iso-country=us \
    gsm.sim.operator.numeric=311480 \
    persist.radio.add_power_save=1 \
    persist.radio.snapshot_enabled=1 \
    persist.radio.snapshot_timer=22 \
    ro.cdma.home.operator.alpha=Verizon \
    ro.cdma.home.operator.numeric=311480 \
    ro.cdma.subscribe_on_ruim_ready=true \
    ro.ril.wp.feature=1 \
    ro.telephony.default_cdma_sub=0 \
    ro.telephony.default_network=8 \
    ro.use_data_netmgrd=true \
    telephony.lteOnCdmaDevice=1
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=9 \
    telephony.lteOnGsmDevice=1
endif

# Inherit from m7-common
$(call inherit-product, device/htc/m7-common/m7-common.mk)
