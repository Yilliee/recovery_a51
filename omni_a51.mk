# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Add this line if your device is 64-bit
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# For full multilingual support
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from PitchBlack Recovery's custom product configuration
$(call inherit-product, vendor/pb/config/common.mk)

# Device identifier. This must come after all inclusions
BOARD_VENDOR := samsung
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := a51
PRODUCT_NAME := omni_a51
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := SM-A515
TARGET_VENDOR := samsung

