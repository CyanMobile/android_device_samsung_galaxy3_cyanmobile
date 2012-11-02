# Inherit from those products. Most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product-if-exists, vendor/samsung/galaxy3/galaxy3-vendor.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/galaxy3/overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/ldpi

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml 

# Board-specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.apollo.rc:root/init.apollo.rc \
    $(LOCAL_PATH)/ueventd.rc:root/ueventd.rc 
   
# Touch and Keyboard Maps
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    $(LOCAL_PATH)/prebuilt/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    $(LOCAL_PATH)/prebuilt/qt602240_ts_input.kcm.bin:system/usr/keychars/qt602240_ts_input.kcm.bin \
    $(LOCAL_PATH)/prebuilt/s3c-keypad.kcm.bin:system/usr/keychars/s3c-keypad.kcm.bin \
    $(LOCAL_PATH)/prebuilt/sec_jack.kcm.bin:system/usr/keychars/sec_jack.kcm.bin \
    $(LOCAL_PATH)/prebuilt/qt602240_ts_input.kl:system/usr/keylayout/qt602240_ts_input.kl \
    $(LOCAL_PATH)/prebuilt/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl \
    $(LOCAL_PATH)/prebuilt/sec_headset.kl:system/usr/keylayout/sec_headset.kl

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf 

# SD Card
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab 

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml 

# Device permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

#  Board
PRODUCT_PACKAGES += \
    bdaddr_read \
    copybit.GT-I5800 \
    gralloc.GT-I5800 \
    sensors.GT-I5800 \
    lights.GT-I5800 \
    libaudio \
    libcamera \
  
# Extras
PRODUCT_PACKAGES += \
    brcm_patchram_plus \
    screencap \
    FM \
    dexpreopt \
    LiveWallpapers \
    LiveWallpapersPicker \

    

PRODUCT_LOCALES += ldpi mdpi

# Discard inherited values and use our own instead.
PRODUCT_NAME := galaxy3
PRODUCT_DEVICE := Galaxy3
PRODUCT_MODEL := GT-I5800
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung



