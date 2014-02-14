$(call inherit-product, vendor/cm/config/common_full_phone.mk)

$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

$(call inherit-product, device/htc/m7/full_m7.mk)

PRODUCT_NAME := cm_m7vzw
PRODUCT_DEVICE := m7vzw

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=HTCOneVZW \
    TARGET_DEVICE=m7wlv \
    BUILD_ID=KOT49H \
    PRIVATE_BUILD_DESC="3.11.605.1 CL304035 release-keys" \
    BUILD_FINGERPRINT="VERIZON/HTCOneVZW/m7wlv:4.4.2/KOT49H/304035.1:user/release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-verizon
