# -*-makefile-*-
# $Id: template 1681 2004-09-01 18:12:49Z  $
#
# Copyright (C) 2004 by BSP
#          
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
ifdef PTXCONF_SUDO
PACKAGES += sudo
endif

#
# Paths and names
#
SUDO_VERSION	= 1.6.8
SUDO		= sudo-$(SUDO_VERSION)
SUDO_SUFFIX	= tar.gz
SUDO_URL	= http://www.courtesan.com/sudo/dist/$(SUDO).$(SUDO_SUFFIX)
SUDO_SOURCE	= $(SRCDIR)/$(SUDO).$(SUDO_SUFFIX)
SUDO_DIR	= $(BUILDDIR)/$(SUDO)

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

sudo_get: $(STATEDIR)/sudo.get

sudo_get_deps = $(SUDO_SOURCE)

$(STATEDIR)/sudo.get: $(sudo_get_deps)
	@$(call targetinfo, $@)
	@$(call get_patches, $(SUDO))
	touch $@

$(SUDO_SOURCE):
	@$(call targetinfo, $@)
	@$(call get, $(SUDO_URL))

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

sudo_extract: $(STATEDIR)/sudo.extract

sudo_extract_deps = $(STATEDIR)/sudo.get

$(STATEDIR)/sudo.extract: $(sudo_extract_deps)
	@$(call targetinfo, $@)
	@$(call clean, $(SUDO_DIR))
	@$(call extract, $(SUDO_SOURCE))
	@$(call patchin, $(SUDO))
	touch $@

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

sudo_prepare: $(STATEDIR)/sudo.prepare

#
# dependencies
#
sudo_prepare_deps = \
	$(STATEDIR)/sudo.extract \
	$(STATEDIR)/virtual-xchain.install

SUDO_PATH	=  PATH=$(CROSS_PATH)
SUDO_ENV 	=  $(CROSS_ENV)
#SUDO_ENV	+= PKG_CONFIG_PATH=$(CROSS_LIB_DIR)/lib/pkgconfig
#SUDO_ENV	+=

#
# autoconf
#
SUDO_AUTOCONF = \
	--build=$(GNU_HOST) \
	--host=$(PTXCONF_GNU_TARGET) \
	--prefix=$(CROSS_LIB_DIR)

$(STATEDIR)/sudo.prepare: $(sudo_prepare_deps)
	@$(call targetinfo, $@)
	@$(call clean, $(SUDO_DIR)/config.cache)
	cd $(SUDO_DIR) && \
		$(SUDO_PATH) $(SUDO_ENV) \
		./configure $(SUDO_AUTOCONF)
	touch $@

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

sudo_compile: $(STATEDIR)/sudo.compile

sudo_compile_deps = $(STATEDIR)/sudo.prepare

$(STATEDIR)/sudo.compile: $(sudo_compile_deps)
	@$(call targetinfo, $@)
	cd $(SUDO_DIR) && $(SUDO_ENV) $(SUDO_PATH) make
	touch $@

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

sudo_install: $(STATEDIR)/sudo.install

$(STATEDIR)/sudo.install: $(STATEDIR)/sudo.compile
	@$(call targetinfo, $@)
	cd $(SUDO_DIR) && $(SUDO_ENV) $(SUDO_PATH) make install
	touch $@

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

sudo_targetinstall: $(STATEDIR)/sudo.targetinstall

sudo_targetinstall_deps = $(STATEDIR)/sudo.compile

$(STATEDIR)/sudo.targetinstall: $(sudo_targetinstall_deps)
	@$(call targetinfo, $@)
	touch $@

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

sudo_clean:
	rm -rf $(STATEDIR)/sudo.*
	rm -rf $(SUDO_DIR)

# vim: syntax=make
