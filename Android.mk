# dnscrypt-proxy makefile

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := dnscrypt-proxy-config
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/dnscrypt-proxy
LOCAL_SRC_FILES := etc/dnscrypt-proxy/blacklist \
	etc/dnscrypt-proxy/cloaking-rules \
	etc/dnscrypt-proxy/dnscrypt-proxy.toml \
	etc/dnscrypt-proxy/forwarding-rules \
	etc/dnscrypt-proxy/ip-blacklist \
	etc/dnscrypt-proxy/whitelist \
	etc/dnscrypt-proxy/localhost.pem \
	etc/dnscrypt-proxy/public-resolvers.md \
	etc/dnscrypt-proxy/public-resolvers.md.minisig \
	etc/dnscrypt-proxy/relays.md \
	etc/dnscrypt-proxy/relays.md.minisig
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := dnscrypt-proxy
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_TARGET_ARCH := arm arm64
my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
LOCAL_SRC_FILES := prebuilt/$(my_src_arch)/$(LOCAL_MODULE)
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_INIT_RC := dnscrypt_proxy.rc
LOCAL_REQUIRED_MODULES := dnscrypt-proxy-config
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE:= dnscrypt-iptables
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := dnscrypt-proxy
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE:= dnscrypt
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_REQUIRED_MODULES := dnscrypt-iptables
include $(BUILD_PREBUILT)
