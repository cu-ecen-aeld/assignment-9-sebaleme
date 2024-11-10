
##############################################################
#
# LDD
#
##############################################################

# Adding assignment-7 content
# Read https://www.kernel.org/doc/html/v5.6/kbuild/modules.html for learning how to build a kernel module
$(info    Building LDD repo packages...)
LDD_VERSION = e712a1f17c55bbbc22d775f584bc4ad239c1d2ea
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-sebaleme.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
LDD_MODULE_SUBDIRS = scull/
LDD_MODULE_SUBDIRS += misc-modules/

LDD_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
# The -m option sets the mode (access-control bits) of the installed object(s)
# The -d option specifies that the names are directories
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment7-buildroot/* $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/faulty.ko $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/sleepy.ko $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/skull/scull.ko $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/skull/module_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/skull/module_unload $(TARGET_DIR)/etc/init.d/S98lddmodules
endef

$(eval $(generic-package), LDD)
$(info    End of LDD build...)
