# dnscrypt-proxy makefile

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE:= dnscrypt-iptables
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE:= dnscrypt
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := dnscrypt-iptables
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := blocked-names
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/dnscrypt-proxy
LOCAL_SRC_FILES := etc/dnscrypt-proxy/$(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := dnscrypt
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := captive-portal-handler
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/dnscrypt-proxy
LOCAL_SRC_FILES := etc/dnscrypt-proxy/$(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := blocked-names
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := cloaking-rules
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/dnscrypt-proxy
LOCAL_SRC_FILES := etc/dnscrypt-proxy/$(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := captive-portal-handler
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := dnscrypt-proxy.toml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/dnscrypt-proxy
LOCAL_SRC_FILES := etc/dnscrypt-proxy/$(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := cloaking-rules
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := dnscrypt-proxy-tor.toml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/dnscrypt-proxy
LOCAL_SRC_FILES := etc/dnscrypt-proxy/$(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := dnscrypt-proxy.toml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := forwarding-rules
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/dnscrypt-proxy
LOCAL_SRC_FILES := etc/dnscrypt-proxy/$(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := dnscrypt-proxy-tor.toml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := blocked-ips
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/dnscrypt-proxy
LOCAL_SRC_FILES := etc/dnscrypt-proxy/$(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := forwarding-rules
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := allowed-ips
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/dnscrypt-proxy
LOCAL_SRC_FILES := etc/dnscrypt-proxy/$(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := blocked-ips
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := allowed-names
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/dnscrypt-proxy
LOCAL_SRC_FILES := etc/dnscrypt-proxy/$(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := allowed-ips
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := public-resolvers.md
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/dnscrypt-proxy
LOCAL_SRC_FILES := etc/dnscrypt-proxy/$(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := allowed-names
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := public-resolvers.md.minisig
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/dnscrypt-proxy
LOCAL_SRC_FILES := etc/dnscrypt-proxy/$(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := public-resolvers.md
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := relays.md
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/dnscrypt-proxy
LOCAL_SRC_FILES := etc/dnscrypt-proxy/$(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := public-resolvers.md.minisig
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := relays.md.minisig
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/dnscrypt-proxy
LOCAL_SRC_FILES := etc/dnscrypt-proxy/$(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := relays.md
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := localhost.pem
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/dnscrypt-proxy
LOCAL_SRC_FILES := etc/dnscrypt-proxy/$(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := relays.md.minisig
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := dnscrypt-proxy
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_TARGET_ARCH := arm arm64
my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
LOCAL_SRC_FILES := prebuilt/$(my_src_arch)/$(LOCAL_MODULE)
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_INIT_RC := dnscrypt_proxy.rc
LOCAL_REQUIRED_MODULES := localhost.pem
include $(BUILD_PREBUILT)
