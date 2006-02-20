# -*-makefile-*-
# $Id: template 4565 2006-02-10 14:23:10Z mkl $
#
# Copyright (C) 2006 by Robert Schwebel
#          
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_XORG_PROTO_XINERAMA) += xorg-proto-xinerama

#
# Paths and names
#
XORG_PROTO_XINERAMA_VERSION := 1.1.2
XORG_PROTO_XINERAMA	:= xineramaproto-X11R7.0-$(XORG_PROTO_XINERAMA_VERSION)
XORG_PROTO_XINERAMA_SUFFIX	:= tar.bz2
XORG_PROTO_XINERAMA_URL	:= ftp://ftp.gwdg.de/pub/x11/x.org/pub/X11R7.0/src/proto/$(XORG_PROTO_XINERAMA).$(XORG_PROTO_XINERAMA_SUFFIX)
XORG_PROTO_XINERAMA_SOURCE	:= $(SRCDIR)/$(XORG_PROTO_XINERAMA).$(XORG_PROTO_XINERAMA_SUFFIX)
XORG_PROTO_XINERAMA_DIR	:= $(BUILDDIR)/$(XORG_PROTO_XINERAMA)

-include $(call package_depfile)

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

xorg-proto-xinerama_get: $(STATEDIR)/xorg-proto-xinerama.get

$(STATEDIR)/xorg-proto-xinerama.get: $(xorg-proto-xinerama_get_deps_default)
	@$(call targetinfo, $@)
	@$(call touch, $@)

$(XORG_PROTO_XINERAMA_SOURCE):
	@$(call targetinfo, $@)
	@$(call get, $(XORG_PROTO_XINERAMA_URL))

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

xorg-proto-xinerama_extract: $(STATEDIR)/xorg-proto-xinerama.extract

$(STATEDIR)/xorg-proto-xinerama.extract: $(xorg-proto-xinerama_extract_deps_default)
	@$(call targetinfo, $@)
	@$(call clean, $(XORG_PROTO_XINERAMA_DIR))
	@$(call extract, $(XORG_PROTO_XINERAMA_SOURCE))
	@$(call patchin, $(XORG_PROTO_XINERAMA))
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

xorg-proto-xinerama_prepare: $(STATEDIR)/xorg-proto-xinerama.prepare

XORG_PROTO_XINERAMA_PATH	:=  PATH=$(CROSS_PATH)
XORG_PROTO_XINERAMA_ENV 	:=  $(CROSS_ENV)

#
# autoconf
#
XORG_PROTO_XINERAMA_AUTOCONF := $(CROSS_AUTOCONF_USR)

$(STATEDIR)/xorg-proto-xinerama.prepare: $(xorg-proto-xinerama_prepare_deps_default)
	@$(call targetinfo, $@)
	@$(call clean, $(XORG_PROTO_XINERAMA_DIR)/config.cache)
	cd $(XORG_PROTO_XINERAMA_DIR) && \
		$(XORG_PROTO_XINERAMA_PATH) $(XORG_PROTO_XINERAMA_ENV) \
		./configure $(XORG_PROTO_XINERAMA_AUTOCONF)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

xorg-proto-xinerama_compile: $(STATEDIR)/xorg-proto-xinerama.compile

$(STATEDIR)/xorg-proto-xinerama.compile: $(xorg-proto-xinerama_compile_deps_default)
	@$(call targetinfo, $@)
	cd $(XORG_PROTO_XINERAMA_DIR) && $(XORG_PROTO_XINERAMA_PATH) make
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

xorg-proto-xinerama_install: $(STATEDIR)/xorg-proto-xinerama.install

$(STATEDIR)/xorg-proto-xinerama.install: $(xorg-proto-xinerama_install_deps_default)
	@$(call targetinfo, $@)
	@$(call install, XORG_PROTO_XINERAMA)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

xorg-proto-xinerama_targetinstall: $(STATEDIR)/xorg-proto-xinerama.targetinstall

$(STATEDIR)/xorg-proto-xinerama.targetinstall: $(xorg-proto-xinerama_targetinstall_deps_default)
	@$(call targetinfo, $@)

	@$(call install_init,default)
	@$(call install_fixup,PACKAGE,xorg-proto-xinerama)
	@$(call install_fixup,PRIORITY,optional)
	@$(call install_fixup,VERSION,$(XORG_PROTO_XINERAMA_VERSION))
	@$(call install_fixup,SECTION,base)
	@$(call install_fixup,AUTHOR,"Robert Schwebel <r.schwebel\@pengutronix.de>")
	@$(call install_fixup,DEPENDS,)
	@$(call install_fixup,DESCRIPTION,missing)

	@$(call install_finish)

	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

xorg-proto-xinerama_clean:
	rm -rf $(STATEDIR)/xorg-proto-xinerama.*
	rm -rf $(IMAGEDIR)/xorg-proto-xinerama_*
	rm -rf $(XORG_PROTO_XINERAMA_DIR)

# vim: syntax=make

