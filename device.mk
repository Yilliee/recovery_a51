#Dynamic Partition Flag
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    android.hardware.fastboot@1.0-impl-mock.recovery

# Apex Libraries
PRODUCT_HOST_PACKAGES += \
    libandroidicu

# Exclude twrp_Apex.cpp
# As of right now it does not support
# compressed apexes introduced in Android 12
TW_EXCLUDE_APEX := true
