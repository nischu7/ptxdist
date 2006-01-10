# -*-makefile-*-
# $Id$
#
# Copyright (C) 2004 by Robert Schwebel
#          
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_BONNIEXX) += bonniexx

#
# Paths and names
#
BONNIEXX_VERSION	= 1.03a
BONNIEXX		= bonnie++-$(BONNIEXX_VERSION)
BONNIEXX_SUFFIX		= tgz
BONNIEXX_URL		= http://www.coker.com.au/bonnie++/$(BONNIEXX).$(BONNIEXX_SUFFIX)
BONNIEXX_SOURCE		= $(SRCDIR)/$(BONNIEXX).$(BONNIEXX_SUFFIX)
BONNIEXX_DIR		= $(BUILDDIR)/$(BONNIEXX)

-include $(call package_depfile)

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

bonniexx_get: $(STATEDIR)/bonniexx.get

bonniexx_get_deps = $(BONNIEXX_SOURCE)

$(STATEDIR)/bonniexx.get: $(bonniexx_get_deps)
	@$(call targetinfo, $@)
	@$(call get_patches, $(BONNIEXX))
	@$(call touch, $@)

$(BONNIEXX_SOURCE):
	@$(call targetinfo, $@)
	@$(call get, $(BONNIEXX_URL))

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

bonniexx_extract: $(STATEDIR)/bonniexx.extract

bonniexx_extract_deps = $(STATEDIR)/bonniexx.get

$(STATEDIR)/bonniexx.extract: $(bonniexx_extract_deps)
	@$(call targetinfo, $@)
	@$(call clean, $(BONNIEXX_DIR))
	@$(call extract, $(BONNIEXX_SOURCE))
	@$(call patchin, $(BONNIEXX))
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

bonniexx_prepare: $(STATEDIR)/bonniexx.prepare

#
# dependencies
#
bonniexx_prepare_deps = \
	$(STATEDIR)/bonniexx.extract \
	$(STATEDIR)/virtual-xchain.install

BONNIEXX_PATH	=  PATH=$(CROSS_PATH)
BONNIEXX_ENV 	=  $(CROSS_ENV)

#
# autoconf
#
BONNIEXX_AUTOCONF =  $(CROSS_AUTOCONF_USR)

$(STATEDIR)/bonniexx.prepare: $(bonniexx_prepare_deps)
	@$(call targetinfo, $@)
	@$(call clean, $(BONNIEXX_DIR)/config.cache)
	cd $(BONNIEXX_DIR) && \
		$(BONNIEXX_PATH) $(BONNIEXX_ENV) \
		./configure $(BONNIEXX_AUTOCONF)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

bonniexx_compile: $(STATEDIR)/bonniexx.compile

bonniexx_compile_deps = $(STATEDIR)/bonniexx.prepare

$(STATEDIR)/bonniexx.compile: $(bonniexx_compile_deps)
	@$(call targetinfo, $@)
	cd $(BONNIEXX_DIR) && $(BONNIEXX_ENV) $(BONNIEXX_PATH) make
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

bonniexx_install: $(STATEDIR)/bonniexx.install

$(STATEDIR)/bonniexx.install: $(STATEDIR)/bonniexx.compile
	@$(call targetinfo, $@)
	@$(call install, BONNIEXX)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

bonniexx_targetinstall: $(STATEDIR)/bonniexx.targetinstall

bonniexx_targetinstall_deps = $(STATEDIR)/bonniexx.compile

$(STATEDIR)/bonniexx.targetinstall: $(bonniexx_targetinstall_deps)
	@$(call targetinfo, $@)

	@$(call install_init,default)
	@$(call install_fixup,PACKAGE,bonniexx)
	@$(call install_fixup,PRIORITY,optional)
	@$(call install_fixup,VERSION,$(COREUTILS_VERSION))
	@$(call install_fixup,SECTION,base)
	@$(call install_fixup,AUTHOR,"Robert Schwebel <r.schwebel\@pengutronix.de>")
	@$(call install_fixup,DEPENDS,)
	@$(call install_fixup,DESCRIPTION,missing)

	@$(call install_copy, 0, 0, 0755, $(BONNIEXX_DIR)/bonnie++, /usr/bin/bonnie++)

	@$(call install_finish)

	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

bonniexx_clean:
	rm -rf $(STATEDIR)/bonniexx.*
	rm -rf $(IMAGEDIR)/bonniexx_*
	rm -rf $(BONNIEXX_DIR)

# vim: syntax=make
