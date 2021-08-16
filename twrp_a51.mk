# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Include any options that can't be included in BoardConfig.mk
$(call inherit-product, device/samsung/a51/device.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := twrp_a51
PRODUCT_DEVICE := a51
PRODUCT_MODEL := SM-A515F
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
