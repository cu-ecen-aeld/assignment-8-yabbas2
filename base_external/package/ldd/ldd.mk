
##############################################################
#
# ldd
#
##############################################################

LDD_VERSION = '173c3438379e4f95be84d6e0bd51725cc53bd6c9'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-yabbas2.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = aesd-char-driver

define LDD_INSTALL_TARGET_CMDS
    $(INSTALL) -d $(TARGET_DIR)/etc/init.d
    $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/etc/init.d/aesdchar_load
    $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/etc/init.d/aesdchar_unload
endef

$(eval $(kernel-module))
$(eval $(generic-package))
