
##############################################################
#
# AESD-CHAR-DRIVER
#
##############################################################

# Adding assignment-8 content
$(info    Building AESD-CHAR-DRIVER repo packages...)
AESD_CHAR_DRIVER_VERSION = 4d88e6d684944665d5056a308310554bbc7e0608
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_CHAR_DRIVER_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-sebaleme.git
AESD_CHAR_DRIVER_SITE_METHOD = git
AESD_CHAR_DRIVER_GIT_SUBMODULES = YES
AESD_CHAR_DRIVER_MODULE_SUBDIRS = aesd-char-driver/

# the $(eval $(kernel-module)) line tells Buildroot to use its predefined infrastructure for building kernel modules. 
# This includes automatically invoking make with the correct environment, paths, and cross-compilation flags.
# Hence no explicite call to make in this file

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
# The -m option sets the mode (access-control bits) of the installed object(s)
# The -d option specifies that the names are directories
define AESD_CHAR_DRIVER_INSTALL_TARGET_CMDS
    $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar.ko $(TARGET_DIR)/usr/bin/
    $(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment8/drivertest.sh $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
$(eval $(kernel-module))
$(info    End of AESD_CHAR build...)
