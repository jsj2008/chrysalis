include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ChrysalisPrefs
ChrysalisPrefs_FILES = $(wildcard *.m) $(wildcard *.x)
ChrysalisPrefs_INSTALL_PATH = /Library/PreferenceBundles
ChrysalisPrefs_FRAMEWORKS = UIKit MessageUI
ChrysalisPrefs_PRIVATE_FRAMEWORKS = Preferences
ChrysalisPrefs_EXTRA_FRAMEWORKS = CepheiPrefs
ChrysalisPrefs_LIBRARIES = MobileGestalt

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/ChrysalisPrefs.plist$(ECHO_END)
