#############################################################
#
# apparmor
#
#############################################################
APPARMOR_VERSION = v2.13
APPARMOR_SITE = git://git.launchpad.net/apparmor
APPARMOR_LICENSE = GPL-2
APPARMOR_LICENSE_FILES = LICENSE
APPARMOR_DEPENDENCIES = libapparmor

define APPARMOR_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/parser
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/profiles
endef

define APPARMOR_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/parser DESTDIR=$(TARGET_DIR) PREFIX=/usr install
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/profiles DESTDIR=$(TARGET_DIR) PREFIX=/usr install
endef

$(eval $(generic-package))
