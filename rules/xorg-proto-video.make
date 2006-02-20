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
PACKAGES-$(PTXCONF_XORG_PROTO_VIDEO) += xorg-proto-video

#
# Paths and names
#
XORG_PROTO_VIDEO_VERSION := 2.2.2
XORG_PROTO_VIDEO	:= videoproto-X11R7.0-$(XORG_PROTO_VIDEO_VERSION)
XORG_PROTO_VIDEO_SUFFIX	:= tar.bz2
XORG_PROTO_VIDEO_URL	:= ftp://ftp.gwdg.de/pub/x11/x.org/pub/X11R7.0/src/proto/$(XORG_PROTO_VIDEO).$(XORG_PROTO_VIDEO_SUFFIX)
XORG_PROTO_VIDEO_SOURCE	:= $(SRCDIR)/$(XORG_PROTO_VIDEO).$(XORG_PROTO_VIDEO_SUFFIX)
XORG_PROTO_VIDEO_DIR	:= $(BUILDDIR)/$(XORG_PROTO_VIDEO)

-include $(call package_depfile)

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

xorg-proto-video_get: $(STATEDIR)/xorg-proto-video.get

$(STATEDIR)/xorg-proto-video.get: $(xorg-proto-video_get_deps_default)
	@$(call targetinfo, $@)
	@$(call touch, $@)

$(XORG_PROTO_VIDEO_SOURCE):
	@$(call targetinfo, $@)
	@$(call get, $(XORG_PROTO_VIDEO_URL))

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

xorg-proto-video_extract: $(STATEDIR)/xorg-proto-video.extract

$(STATEDIR)/xorg-proto-video.extract: $(xorg-proto-video_extract_deps_default)
	@$(call targetinfo, $@)
	@$(call clean, $(XORG_PROTO_VIDEO_DIR))
	@$(call extract, $(XORG_PROTO_VIDEO_SOURCE))
	@$(call patchin, $(XORG_PROTO_VIDEO))
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

xorg-proto-video_prepare: $(STATEDIR)/xorg-proto-video.prepare

XORG_PROTO_VIDEO_PATH	:=  PATH=$(CROSS_PATH)
XORG_PROTO_VIDEO_ENV 	:=  $(CROSS_ENV)

#
# autoconf
#
XORG_PROTO_VIDEO_AUTOCONF := $(CROSS_AUTOCONF_USR)

$(STATEDIR)/xorg-proto-video.prepare: $(xorg-proto-video_prepare_deps_default)
	@$(call targetinfo, $@)
	@$(call clean, $(XORG_PROTO_VIDEO_DIR)/config.cache)
	cd $(XORG_PROTO_VIDEO_DIR) && \
		$(XORG_PROTO_VIDEO_PATH) $(XORG_PROTO_VIDEO_ENV) \
		./configure $(XORG_PROTO_VIDEO_AUTOCONF)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

xorg-proto-video_compile: $(STATEDIR)/xorg-proto-video.compile

$(STATEDIR)/xorg-proto-video.compile: $(xorg-proto-video_compile_deps_default)
	@$(call targetinfo, $@)
	cd $(XORG_PROTO_VIDEO_DIR) && $(XORG_PROTO_VIDEO_PATH) make
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

xorg-proto-video_install: $(STATEDIR)/xorg-proto-video.install

$(STATEDIR)/xorg-proto-video.install: $(xorg-proto-video_install_deps_default)
	@$(call targetinfo, $@)
	@$(call install, XORG_PROTO_VIDEO)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

xorg-proto-video_targetinstall: $(STATEDIR)/xorg-proto-video.targetinstall

$(STATEDIR)/xorg-proto-video.targetinstall: $(xorg-proto-video_targetinstall_deps_default)
	@$(call targetinfo, $@)

	@$(call install_init,default)
	@$(call install_fixup,PACKAGE,xorg-proto-video)
	@$(call install_fixup,PRIORITY,optional)
	@$(call install_fixup,VERSION,$(XORG_PROTO_VIDEO_VERSION))
	@$(call install_fixup,SECTION,base)
	@$(call install_fixup,AUTHOR,"Robert Schwebel <r.schwebel\@pengutronix.de>")
	@$(call install_fixup,DEPENDS,)
	@$(call install_fixup,DESCRIPTION,missing)

	@$(call install_finish)

	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

xorg-proto-video_clean:
	rm -rf $(STATEDIR)/xorg-proto-video.*
	rm -rf $(IMAGEDIR)/xorg-proto-video_*
	rm -rf $(XORG_PROTO_VIDEO_DIR)

# vim: syntax=make

