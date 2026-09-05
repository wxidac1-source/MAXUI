INSTALL_TARGET_PROCESSES = SpringBoard
THEOS_PACKAGE_SCHEME     = rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = maxui

maxui_FILES      = Tweak.xm vcam_friend_js.mm
maxui_LDFLAGS    = -Wl,-x -Wl,-S -lz -lsubstrate
maxui_FRAMEWORKS = AVFoundation CoreMedia CoreVideo CoreImage Foundation UIKit QuartzCore IOSurface ImageIO Security
maxui_ARCHS      = arm64 arm64e
maxui_CFLAGS     = -fobjc-arc -Wno-deprecated-declarations -Wno-unguarded-availability-new -O2

include $(THEOS_MAKE_PATH)/tweak.mk
