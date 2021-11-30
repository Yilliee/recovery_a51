#Dynamic Partition Flag
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.0implmock

# Lpdump
TW_EXCLUDE_LPDUMP := true
