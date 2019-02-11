################################################################################
#
# wpeframework-netflix
#
################################################################################
ifeq ($(BR2_PACKAGE_NETFLIX5),y)
# Netflix 5 has a little different API, use "netflix5" branch for now.
WPEFRAMEWORK_NETFLIX_VERSION = 466b72020e9b4f8ef9e6ce679b6bb4038f7d57a3
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DNETFLIX_VERSION_5=true
WPEFRAMEWORK_NETFLIX_DEPENDENCIES = wpeframework netflix5
else
WPEFRAMEWORK_NETFLIX_VERSION = 48f6c87ec3401079d6052fab4b8a82cc3a4b274a
WPEFRAMEWORK_NETFLIX_DEPENDENCIES = wpeframework netflix
endif

WPEFRAMEWORK_NETFLIX_SITE_METHOD = git
WPEFRAMEWORK_NETFLIX_SITE = git@github.com:WebPlatformForEmbedded/WPEPluginNetflix.git
WPEFRAMEWORK_NETFLIX_INSTALL_STAGING = YES

WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DBUILD_REFERENCE=${WPEFRAMEWORK_NETFLIX_VERSION}

# TODO: Do not have WPEFRAMEWORK versioning yet
# WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_VERSION="$(WEBBRIDGE_BUILD_VERSION)-dev"

ifeq ($(BR2_PACKAGE_PLUGIN_NETFLIX_NETFLIX_AUTOSTART),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_AUTOSTART=true
else
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_AUTOSTART=false
endif

ifneq ($(BR2_PACKAGE_PLUGIN_NETFLIX_NETFLIX_MODEL),)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_MODEL="$(call qstrip,$(BR2_PACKAGE_PLUGIN_NETFLIX_NETFLIX_MODEL))"
endif

ifneq ($(BR2_PACKAGE_PLUGIN_NETFLIX_NETFLIX_SUSPEND_TIMEOUT),)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_SUSPENDTIMEOUT="$(call qstrip,$(BR2_PACKAGE_PLUGIN_NETFLIX_NETFLIX_SUSPEND_TIMEOUT))"
endif

ifneq ($(BR2_PACKAGE_PLUGIN_NETFLIX_NETFLIX_RESUME_TIMEOUT),)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_RESUMETIMEOUT="$(call qstrip,$(BR2_PACKAGE_PLUGIN_NETFLIX_NETFLIX_RESUME_TIMEOUT))"
endif

ifeq ($(BR2_PACKAGE_PLUGIN_NETFLIX_NETFLIX_FULLHD),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_FULLHD=true
else
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_NETFLIX_FULLHD=false
endif

ifeq ($(BR2_PACKAGE_NETFLIX5),y)
ifeq  ($(BR2_PACKAGE_RPI_FIRMWARE),y)
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_SPLASH_IMAGE_FORMAT=PNG
WPEFRAMEWORK_NETFLIX_CONF_OPTS += -DPLUGIN_ENABLE_AUDIO_DOWNMIX=true
endif
endif

$(eval $(cmake-package))

