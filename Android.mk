LOCAL_PATH := $(call my-dir)

# HAL module implemenation stored in
# hw/<POWERS_HARDWARE_MODULE_ID>.<ro.hardware>.so
include $(CLEAR_VARS)

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SHARED_LIBRARIES := liblog libcutils libdl
LOCAL_SRC_FILES := power.c metadata-parser.c utils.c list.c hint-data.c

# Include target-specific files.
ifneq ($(filter msm8916,$(TARGET_BOARD_PLATFORM)),)
LOCAL_SRC_FILES += power-8916.c
endif

ifneq ($(filter msm8952,$(TARGET_BOARD_PLATFORM)),)
LOCAL_SRC_FILES += power-8952.c
endif

ifneq ($(filter msm8974,$(TARGET_BOARD_PLATFORM)),)
LOCAL_SRC_FILES += power-8974.c
endif

ifneq ($(filter msm8994,$(TARGET_BOARD_PLATFORM)),)
LOCAL_SRC_FILES += power-8994.c
endif

ifneq ($(filter msm8996,$(TARGET_BOARD_PLATFORM)),)
LOCAL_SRC_FILES += power-8996.c
endif

ifeq ($(TARGET_USES_INTERACTION_BOOST),true)
    LOCAL_CFLAGS += -DINTERACTION_BOOST
endif

ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
    LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif

LOCAL_MODULE := power.$(TARGET_DEVICE)
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
