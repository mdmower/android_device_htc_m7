$(call inherit-product, device/htc/m7/full_m7.mk)

$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

$(call inherit-product, vendor/cm/config/common_full_phone.mk)

ifeq ($(TARGET_DEVICE),m7spr)
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="htc/sprint_wwe/m7wls:4.3/JSS15J/251863.2:user/release-keys" \
    BUILD_ID=JSS15J \
    PRIVATE_BUILD_DESC="3.04.651.2 CL251863 release-keys" \
    PRODUCT_NAME=m7wls
PRODUCT_DEVICE := m7spr
PRODUCT_NAME := cm_m7spr
else ifeq ($(TARGET_DEVICE),m7vzw)
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="VERIZON/HTCOneVZW/m7wlv:4.3/JSS15J/278010.1:user/release-keys" \    
    BUILD_ID=JSS15J \
    PRIVATE_BUILD_DESC="2.10.605.1 CL278010 release-keys" \
    PRODUCT_NAME=HTCOneVZW \
PRODUCT_GMS_CLIENTID_BASE := android-verizon
PRODUCT_DEVICE := m7vzw
PRODUCT_NAME := cm_m7vzw
else
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="htc/m7_google/m7:4.4.2/KOT49H.H1/288144:user/release-keys" \
    BUILD_ID=KOT49H.H1 \
    PRIVATE_BUILD_DESC="3.62.1700.1 CL288144 release-keys"
PRODUCT_DEVICE := m7
PRODUCT_NAME := cm_m7
endif
