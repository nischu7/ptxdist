# -*-makefile-*-
# $Id: template 2680 2005-05-27 10:29:43Z rsc $
#
# Copyright (C) 2005 by Bjoern Buerger <b.buerger@pengutronix.de>
#          
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_CHRONY) += chrony

#
# Paths and names
#
CHRONY_VERSION	= 1.20
CHRONY		= chrony-$(CHRONY_VERSION)
CHRONY_SUFFIX	= tar.gz
CHRONY_URL	= http://chrony.sunsite.dk/download//$(CHRONY).$(CHRONY_SUFFIX)
CHRONY_SOURCE	= $(SRCDIR)/$(CHRONY).$(CHRONY_SUFFIX)
CHRONY_DIR	= $(BUILDDIR)/$(CHRONY)

-include $(call package_depfile)

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

chrony_get: $(STATEDIR)/chrony.get

chrony_get_deps = $(CHRONY_SOURCE)

$(STATEDIR)/chrony.get: $(chrony_get_deps)
	@$(call targetinfo, $@)
	@$(call get_patches, $(CHRONY))
	@$(call touch, $@)

$(CHRONY_SOURCE):
	@$(call targetinfo, $@)
	@$(call get, $(CHRONY_URL))

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

chrony_extract: $(STATEDIR)/chrony.extract

chrony_extract_deps = $(STATEDIR)/chrony.get

$(STATEDIR)/chrony.extract: $(chrony_extract_deps)
	@$(call targetinfo, $@)
	@$(call clean, $(CHRONY_DIR))
	@$(call extract, $(CHRONY_SOURCE))
	@$(call patchin, $(CHRONY))
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

chrony_prepare: $(STATEDIR)/chrony.prepare

#
# dependencies
#
chrony_prepare_deps =  $(STATEDIR)/chrony.extract
chrony_prepare_deps += $(STATEDIR)/virtual-xchain.install
chrony_prepare_deps += $(STATEDIR)/readline.install

CHRONY_PATH	=  PATH=$(CROSS_PATH)
CHRONY_ENV 	=  $(CROSS_ENV)

#
# autoconf
#
CHRONY_AUTOCONF =  $(CROSS_AUTOCONF_USR)
CHRONY_AUTOCONF += --disable-readline

$(STATEDIR)/chrony.prepare: $(chrony_prepare_deps)
	@$(call targetinfo, $@)
	@$(call clean, $(CHRONY_DIR)/config.cache)
	cd $(CHRONY_DIR) && \
		$(CHRONY_PATH) $(CHRONY_ENV) \
		sh configure $(CHRONY_AUTOCONF)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

chrony_compile: $(STATEDIR)/chrony.compile

chrony_compile_deps = $(STATEDIR)/chrony.prepare

$(STATEDIR)/chrony.compile: $(chrony_compile_deps)
	@$(call targetinfo, $@)
	cd $(CHRONY_DIR) && $(CHRONY_ENV) $(CHRONY_PATH) make
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

chrony_install: $(STATEDIR)/chrony.install

$(STATEDIR)/chrony.install: $(STATEDIR)/chrony.compile
	@$(call targetinfo, $@)
	@$(call install, CHRONY)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

chrony_targetinstall: $(STATEDIR)/chrony.targetinstall

chrony_targetinstall_deps =  $(STATEDIR)/chrony.compile
chrony_targetinstall_deps += $(STATEDIR)/readline.targetinstall

$(STATEDIR)/chrony.targetinstall: $(chrony_targetinstall_deps)
	@$(call targetinfo, $@)

	@$(call install_init,default)
	@$(call install_fixup,PACKAGE,chrony)
	@$(call install_fixup,PRIORITY,optional)
	@$(call install_fixup,VERSION,$(CHRONY_VERSION))
	@$(call install_fixup,SECTION,base)
	@$(call install_fixup,AUTHOR,"Robert Schwebel <r.schwebel\@pengutronix.de>")
	@$(call install_fixup,DEPENDS,)
	@$(call install_fixup,DESCRIPTION,missing)

	@$(call install_copy, 0, 0, 0755, $(CHRONY_DIR)/chronyd, /usr/sbin/chronyd)
	@$(call install_copy, 0, 0, 0755, $(CHRONY_DIR)/chronyc, /usr/bin/chronyc)

	@$(call install_finish)

	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

chrony_clean:
	rm -rf $(STATEDIR)/chrony.*
	rm -rf $(IMAGEDIR)/chrony_*
	rm -rf $(CHRONY_DIR)

# vim: syntax=make
