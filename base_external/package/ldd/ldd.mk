
##############################################################
#
# ldd
#
##############################################################

LDD_VERSION = '861695a5710ccfe48ecfeac4696395e416f52be2'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-yabbas2.git'
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = misc-modules
LDD_MODULE_SUBDIRS += scull

define LDD_INSTALL_TARGET_CMDS
    $(INSTALL) -d $(TARGET_DIR)/etc/init.d
    $(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/etc/init.d/module_load
    $(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/etc/init.d/module_unload
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/etc/init.d/scull_load
    $(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/etc/init.d/scull_unload
endef

$(eval $(kernel-module))
$(eval $(generic-package))
