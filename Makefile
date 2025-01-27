TARGET := iphone:clang:latest:7.0
export TARGET=iphone:clang:7.0
INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = armv7 armv7s arm64


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SigPass

SigPass_FILES = Tweak.x
SigPass_CFLAGS = -fobjc-arc
SigPass_FRAMEWORKS = UIKit PassKit

include $(THEOS_MAKE_PATH)/tweak.mk
