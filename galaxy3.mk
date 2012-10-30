# Inherit CM device configuration for galaxy3.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)
$(call inherit-product-if-exists, vendor/samsung/galaxy3/galaxy3-vendor.mk)
$(call inherit-product, device/samsung/galaxy3/BoardConfig.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

# Density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=120

PRODUCT_COPY_FILES += \
        device/common/gps/gps.conf_EU_SUPL:system/etc/gps.conf

# Live wallpaper packages
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    librs_jni

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072

# Used by BusyBox
KERNEL_MODULES_DIR:=/lib/modules

# Enable Windows Media if supported by the board
WITH_WINDOWS_MEDIA:=true

# Add device package overlay
  DEVICE_PACKAGE_OVERLAYS += device/samsung/galaxy3/overlay

# Add LDPI assets, in addition to MDPI
  PRODUCT_LOCALES += ldpi mdpi

# Extra overlay for LDPI
  PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/ldpi

DISABLE_DEXPREOPT := false

# Kernel debug file
PRODUCT_COPY_FILES += \
	device/samsung/galaxy3/prebuilt/klogtail:system/xbin/klogtail

# Install the features available on this device.
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

# APN config file
PRODUCT_COPY_FILES += \
        vendor/cyanogen/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# HAL libs and other system binaries
PRODUCT_PACKAGES += \
    copybit.GT-I5800 \
    gralloc.GT-I5800 \
    gps.GT-I5800 \
    sensors.GT-I5800 \
    lights.GT-I5800 \
    libGLES_fimg \
    brcm_patchram_plus \
    screencap \
    dexpreopt \
    libstagefrighthw \
    libcamera \

# OMX Codecs
PRODUCT_PACKAGES += \
    libSEC_OMX_Core.s5p6442 \
    libOMX.SEC.AVC.Decoder.s5p6442 \
    libOMX.SEC.M4V.Decoder.s5p6442 \
    libOMX.SEC.AVC.Encoder.s5p6442 \
    libOMX.SEC.M4V.Encoder.s5p6442

PRODUCT_COPY_FILES += \
	device/samsung/galaxy3/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry

# Configs
PRODUCT_COPY_FILES += \
    device/samsung/galaxy3/init.rc:root/init.rc \
	
# Bluetooth MAC Address
PRODUCT_PACKAGES += \
    bdaddr_read

PRODUCT_COPY_FILES += \
    device/samsung/galaxy3/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/galaxy3/configs/asound.conf:system/etc/asound.conf \
    device/samsung/galaxy3/configs/dhcpcd.conf:system/etc/dhcpcd.conf \
    device/samsung/galaxy3/configs/vold.fstab:system/etc/vold.fstab \
    device/samsung/galaxy3/configs/dbus.conf:system/etc/dbus.conf \
    device/samsung/galaxy3/configs/recovery.fstab:recovery/root/etc/recovery.fstab \

# Keyboard maps
PRODUCT_COPY_FILES += \
	device/samsung/galaxy3/prebuilt/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
	device/samsung/galaxy3/prebuilt/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
	device/samsung/galaxy3/prebuilt/qt602240_ts_input.kcm.bin:system/usr/keychars/qt602240_ts_input.kcm.bin \
	device/samsung/galaxy3/prebuilt/s3c-keypad.kcm.bin:system/usr/keychars/s3c-keypad.kcm.bin \
	device/samsung/galaxy3/prebuilt/sec_jack.kcm.bin:system/usr/keychars/sec_jack.kcm.bin \
	device/samsung/galaxy3/prebuilt/qt602240_ts_input.kl:system/usr/keylayout/qt602240_ts_input.kl \
	device/samsung/galaxy3/prebuilt/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl \
	device/samsung/galaxy3/prebuilt/sec_headset.kl:system/usr/keylayout/sec_headset.kl \
        device/samsung/galaxy3/prebuilt/libsecjpeg.so:system/lib/libsecjpeg.so \
        device/samsung/galaxy3/prebuilt/libsecril-client.so:system/lib/libsecril-client.so 

# WIFI
PRODUCT_COPY_FILES += \
	device/samsung/galaxy3/prebuilt/bcm4329_aps.bin:system/etc/wifi/bcm4329_aps.bin \
	device/samsung/galaxy3/prebuilt/bcm4329_mfg.bin:system/etc/wifi/bcm4329_mfg.bin \
	device/samsung/galaxy3/prebuilt/bcm4329_sta.bin:system/etc/wifi/bcm4329_sta.bin \
	device/samsung/galaxy3/configs/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
	device/samsung/galaxy3/configs/nvram_net.txt:system/etc/wifi/nvram_net.txt \
	device/samsung/galaxy3/configs/wifi.conf:system/etc/wifi/wifi.conf \
	device/samsung/galaxy3/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf 

# Rild
PRODUCT_COPY_FILES += \
	device/samsung/galaxy3/prebuilt/libril.so:system/lib/libril.so \
	device/samsung/galaxy3/prebuilt/libsec-ril.so:system/lib/libsec-ril.so \
	device/samsung/galaxy3/prebuilt/rild:system/bin/rild


PRODUCT_PROPERTY_OVERRIDES += \
       wifi.interface=eth0 \
       wifi.supplicant_scan_interval=20 \
       ro.telephony.ril_class=samsung \
       ro.telephony.sends_barcount=1 \
       mobiledata.interfaces=pdp0,eth0,gprs,ppp0 \
       dalvik.vm.dexopt-flags=m=y \
       dalvik.vm.execution-mode=int:jit \
       dalvik.vm.heapsize=32m \
       persist.sys.purgeable_assets=0 \
       ro.compcache.default=0 \
       persist.sys.use_dithering=0 \
       persist.sys.use_16bpp_alpha=1 \
       persist.sys.led_trigger=none


PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.locationfeatures=1 \
        ro.com.google.networklocation=1


PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false
	
# Discard inherited values and use our own instead.
PRODUCT_NAME := cm_galaxy3
PRODUCT_DEVICE := Galaxy3
PRODUCT_MODEL := GT-I5800
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung


