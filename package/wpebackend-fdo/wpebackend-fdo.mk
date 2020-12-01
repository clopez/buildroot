################################################################################
#
# wpebackend-fdo
#
################################################################################

WPEBACKEND_FDO_VERSION = 1.8.0
WPEBACKEND_FDO_SITE = https://wpewebkit.org/releases
WPEBACKEND_FDO_SOURCE = wpebackend-fdo-$(WPEBACKEND_FDO_VERSION).tar.xz
WPEBACKEND_FDO_INSTALL_STAGING = YES
WPEBACKEND_FDO_LICENSE = BSD-2-Clause
WPEBACKEND_FDO_LICENSE_FILES = COPYING
WPEBACKEND_FDO_DEPENDENCIES = libglib2 libwpe wayland libepoxy

ifeq ($(BR2_PACKAGE_WPEBACKEND_FDO_RPI4),y)
WPEBACKEND_FDO_CONF_OPTS = -DFORCE_LINEAR_INVALID_MODIFIERS=ON
endif

$(eval $(cmake-package))
