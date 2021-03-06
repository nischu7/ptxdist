# -*-makefile-*-
#
# Copyright (C) 2015 by Bernhard Walle <bernhard@bwalle.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_PICOCOM) += picocom

#
# Paths and names
#
PICOCOM_VERSION	:= 1.7
PICOCOM_MD5	:= 8eaba1d31407e8408674d6e57af447ef
PICOCOM		:= picocom-$(PICOCOM_VERSION)
PICOCOM_SUFFIX	:= tar.gz
PICOCOM_URL	:= https://picocom.googlecode.com/files//$(PICOCOM).$(PICOCOM_SUFFIX)
PICOCOM_SOURCE	:= $(SRCDIR)/$(PICOCOM).$(PICOCOM_SUFFIX)
PICOCOM_DIR	:= $(BUILDDIR)/$(PICOCOM)
PICOCOM_LICENSE	:= GPL-2.0+

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

PICOCOM_CONF_TOOL	:= NO
PICOCOM_MAKE_ENV	:= $(CROSS_ENV)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/picocom.install:
	@$(call targetinfo)
	install -D -m0755 $(PICOCOM_DIR)/picocom $(PICOCOM_PKGDIR)/usr/bin/picocom
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/picocom.targetinstall:
	@$(call targetinfo)

	@$(call install_init, picocom)
	@$(call install_fixup, picocom,PRIORITY,optional)
	@$(call install_fixup, picocom,SECTION,base)
	@$(call install_fixup, picocom,AUTHOR,"Bernhard Walle <bernhard@bwalle.de>")
	@$(call install_fixup, picocom,DESCRIPTION,missing)

	@$(call install_copy, picocom, 0, 0, 0755, -, /usr/bin/picocom)

	@$(call install_finish, picocom)

	@$(call touch)

# vim: syntax=make
