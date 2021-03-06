# -*-makefile-*-
#
# Copyright (C) 2010 by Alexander Stein <alexander.stein@systec-electronic.com>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_LIBKSBA) += libksba

#
# Paths and names
#
LIBKSBA_VERSION	:= 1.3.2
LIBKSBA_MD5	:= c3c9a66e22d87fe3ae59865250b8a09c
LIBKSBA		:= libksba-$(LIBKSBA_VERSION)
LIBKSBA_SUFFIX	:= tar.bz2
LIBKSBA_URL	:= ftp://ftp.gnupg.org/gcrypt/libksba/$(LIBKSBA).$(LIBKSBA_SUFFIX)
LIBKSBA_SOURCE	:= $(SRCDIR)/$(LIBKSBA).$(LIBKSBA_SUFFIX)
LIBKSBA_DIR	:= $(BUILDDIR)/$(LIBKSBA)
LIBKSBA_LICENSE	:= GPL-2.0, GPL-3.0, LGPL-3.0
LIBKSBA_LICENSE_FILES := \
	file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
	file://COPYING.GPLv3;md5=2f31b266d3440dd7ee50f92cf67d8e6c \
	file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

LIBKSBA_CONF_TOOL := autoconf

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/libksba.targetinstall:
	@$(call targetinfo)

	@$(call install_init, libksba)
	@$(call install_fixup, libksba,PRIORITY,optional)
	@$(call install_fixup, libksba,SECTION,base)
	@$(call install_fixup, libksba,AUTHOR,"Alexander Stein")
	@$(call install_fixup, libksba,DESCRIPTION,missing)

	@$(call install_lib, libksba, 0, 0, 0644, libksba)

	@$(call install_finish, libksba)

	@$(call touch)

# vim: syntax=make
