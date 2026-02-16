##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# Use 'HEAD' to always pull the latest, or a specific commit hash
AESD_ASSIGNMENTS_VERSION = 'HEAD'
# Ensure this is your Assignment 3 SSH URL
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-luncanu-andrei.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(TARGET_DIR)/usr/bin
	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/finder-app/conf
	
	# Install binaries and scripts to /usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/
	
	# Install config files to /etc/finder-app/conf/
	$(INSTALL) -m 0644 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
endef

$(eval $(generic-package))
