AESD_ASSIGNMENTS_VERSION = 'HEAD'
# This points to the folder containing your assignment code (writer, finder, etc.)
# relative to the buildroot directory
AESD_ASSIGNMENTS_SITE = $(BR2_EXTERNAL_PROJECT_BASE_PATH)/package/aesd-assignments
AESD_ASSIGNMENTS_SITE_METHOD = local

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

# Ensure the files are installed to the target /usr/bin
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/writer $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder.sh $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-test.sh $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/conf/assignment.txt $(TARGET_DIR)/usr/bin/conf/
	$(INSTALL) -m 0755 $(@D)/conf/username.txt $(TARGET_DIR)/usr/bin/conf/
endef

$(eval $(generic-package))
