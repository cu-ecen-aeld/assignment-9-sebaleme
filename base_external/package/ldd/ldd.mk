
##############################################################
#
# LDD
#
##############################################################

# Adding assignment-7 content
# Read https://www.kernel.org/doc/html/v5.6/kbuild/modules.html for learning how to build a kernel module
$(info    Building LDD repo packages...)
LDD_VERSION = b259454171be6fcc8b096e5e36de57c4ba6845f5
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-sebaleme.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
LDD_MODULE_SUBDIRS = scull/
LDD_MODULE_SUBDIRS += misc-modules/

#LDD_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
# The -m option sets the mode (access-control bits) of the installed object(s)
# The -d option specifies that the names are directories
# @D designs the external package folder, here buildroot/output/build/ldd-e712a1f17c55bbbc22d775f584bc4ad239c1d2ea
# Cannot install UT since repo7 does not contain them
define LDD_INSTALL_TARGET_CMDS
    $(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/misc-modules/faulty.ko $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/sleepy.ko $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/hello.ko $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull.ko $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
$(eval $(kernel-module))
$(info    End of LDD build...)
