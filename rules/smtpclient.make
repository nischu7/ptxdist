# $Id:$
#
# Copyright (C) 2005 by Robert Schwebel
#          
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
ifdef PTXCONF_SMTPCLIENT
PACKAGES += smtpclient
endif

#
# Paths and names
#
SMTPCLIENT_VERSION	= 1.0.0
SMTPCLIENT		= smtpclient-$(SMTPCLIENT_VERSION)
SMTPCLIENT_SUFFIX	= tar.gz
SMTPCLIENT_URL		= http://www.pengutronix.de/software/ptxdist/temporary-src/$(SMTPCLIENT).$(SMTPCLIENT_SUFFIX)
SMTPCLIENT_SOURCE	= $(SRCDIR)/$(SMTPCLIENT).$(SMTPCLIENT_SUFFIX)
SMTPCLIENT_DIR		= $(BUILDDIR)/$(SMTPCLIENT)

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

smtpclient_get: $(STATEDIR)/smtpclient.get

smtpclient_get_deps = $(SMTPCLIENT_SOURCE)

$(STATEDIR)/smtpclient.get: $(smtpclient_get_deps)
	@$(call targetinfo, $@)
	@$(call get_patches, $(SMTPCLIENT))
	touch $@

$(SMTPCLIENT_SOURCE):
	@$(call targetinfo, $@)
	@$(call get, $(SMTPCLIENT_URL))

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

smtpclient_extract: $(STATEDIR)/smtpclient.extract

smtpclient_extract_deps = $(STATEDIR)/smtpclient.get

$(STATEDIR)/smtpclient.extract: $(smtpclient_extract_deps)
	@$(call targetinfo, $@)
	@$(call clean, $(SMTPCLIENT_DIR))
	@$(call extract, $(SMTPCLIENT_SOURCE))
	@$(call patchin, $(SMTPCLIENT))
	touch $@

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

smtpclient_prepare: $(STATEDIR)/smtpclient.prepare

#
# dependencies
#
smtpclient_prepare_deps = \
	$(STATEDIR)/smtpclient.extract \
	$(STATEDIR)/virtual-xchain.install

SMTPCLIENT_PATH	=  PATH=$(CROSS_PATH)
SMTPCLIENT_ENV 	=  $(CROSS_ENV)
#SMTPCLIENT_ENV	+= PKG_CONFIG_PATH=$(CROSS_LIB_DIR)/lib/pkgconfig
#SMTPCLIENT_ENV	+=

#
# autoconf
#
SMTPCLIENT_AUTOCONF =  $(CROSS_AUTOCONF)
SMTPCLIENT_AUTOCONF += --prefix=$(CROSS_LIB_DIR)

$(STATEDIR)/smtpclient.prepare: $(smtpclient_prepare_deps)
	@$(call targetinfo, $@)
	@$(call clean, $(SMTPCLIENT_DIR)/config.cache)
	cd $(SMTPCLIENT_DIR) && \
		$(SMTPCLIENT_PATH) $(SMTPCLIENT_ENV) \
		./configure $(SMTPCLIENT_AUTOCONF)
	touch $@

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

smtpclient_compile: $(STATEDIR)/smtpclient.compile

smtpclient_compile_deps = $(STATEDIR)/smtpclient.prepare

$(STATEDIR)/smtpclient.compile: $(smtpclient_compile_deps)
	@$(call targetinfo, $@)
	cd $(SMTPCLIENT_DIR) && $(SMTPCLIENT_ENV) $(SMTPCLIENT_PATH) make
	touch $@

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

smtpclient_install: $(STATEDIR)/smtpclient.install

$(STATEDIR)/smtpclient.install: $(STATEDIR)/smtpclient.compile
	@$(call targetinfo, $@)
	cd $(SMTPCLIENT_DIR) && $(SMTPCLIENT_ENV) $(SMTPCLIENT_PATH) make install
	touch $@

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

smtpclient_targetinstall: $(STATEDIR)/smtpclient.targetinstall

smtpclient_targetinstall_deps = $(STATEDIR)/smtpclient.compile

$(STATEDIR)/smtpclient.targetinstall: $(smtpclient_targetinstall_deps)
	@$(call targetinfo, $@)
	$(call copy_root, 0, 0, 0644, $(SMTPCLIENT_DIR)/smtpclient, /usr/bin/smtpclient)
	$(CROSS_STRIP) -R .note -R .comment $(ROOTDIR)/usr/bin/smtpclient
	touch $@

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

smtpclient_clean:
	rm -rf $(STATEDIR)/smtpclient.*
	rm -rf $(SMTPCLIENT_DIR)

# vim: syntax=make
