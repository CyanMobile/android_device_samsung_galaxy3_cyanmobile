ifeq ($(TARGET_BOOTLOADER_BOARD_NAME),galaxy3)
include $(call first-makefiles-under,$(call my-dir))
endif
