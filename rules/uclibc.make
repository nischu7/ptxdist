# -*-makefile-*-
# $Id$
#
# Copyright (C) 2003, 2004 by Marc Kleine-Budde <kleine-budde@gmx.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_UCLIBC) += uclibc

UCLIBC_VERSION	:= $(call remove_quotes,$(PTXCONF_UCLIBC_VERSION))

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

uclibc_get: $(STATEDIR)/uclibc.get

$(STATEDIR)/uclibc.get:
	@$(call targetinfo, $@)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

uclibc_extract: $(STATEDIR)/uclibc.extract

$(STATEDIR)/uclibc.extract:
	@$(call targetinfo, $@)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

uclibc_prepare: $(STATEDIR)/uclibc.prepare

$(STATEDIR)/uclibc.prepare:
	@$(call targetinfo, $@)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

uclibc_compile: $(STATEDIR)/uclibc.compile

$(STATEDIR)/uclibc.compile:
	@$(call targetinfo, $@)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

uclibc_install: $(STATEDIR)/uclibc.install

$(STATEDIR)/uclibc.install:
	@$(call targetinfo, $@)
	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

uclibc_targetinstall: $(STATEDIR)/uclibc.targetinstall

$(STATEDIR)/uclibc.targetinstall:
	@$(call targetinfo, $@)

	@$(call install_init, uclibc)
	@$(call install_fixup, uclibc,PACKAGE,uclibc)
	@$(call install_fixup, uclibc,PRIORITY,optional)
	@$(call install_fixup, uclibc,VERSION,$(UCLIBC_VERSION))
	@$(call install_fixup, uclibc,SECTION,base)
	@$(call install_fixup, uclibc,AUTHOR,"Robert Schwebel <r.schwebel\@pengutronix.de>")
	@$(call install_fixup, uclibc,DEPENDS,)
	@$(call install_fixup, uclibc,DESCRIPTION,missing)

ifdef PTXCONF_UCLIBC
	@$(call install_copy_toolchain_dl, uclibc, /lib)
endif

ifdef PTXCONF_UCLIBC_LIBC
	@$(call install_copy_toolchain_lib, uclibc, libc.so)
endif

ifdef PTXCONF_UCLIBC_CRYPT
	@$(call install_copy_toolchain_lib, uclibc, libcrypt.so)
endif

ifdef PTXCONF_UCLIBC_DL
	@$(call install_copy_toolchain_lib, uclibc, libdl.so)
endif

ifdef PTXCONF_UCLIBC_M
	@$(call install_copy_toolchain_lib, uclibc, libm.so)
endif

ifdef PTXCONF_UCLIBC_NSL
	@$(call install_copy_toolchain_lib, uclibc, libnsl.so)
endif

ifdef PTXCONF_UCLIBC_PTHREAD
	@$(call install_copy_toolchain_lib, uclibc, libpthread.so)
endif

ifdef PTXCONF_UCLIBC_THREAD_DB
	@$(call install_copy_toolchain_lib, uclibc, libthread_db.so)
endif

ifdef PTXCONF_UCLIBC_RESOLV
	@$(call install_copy_toolchain_lib, uclibc, libresolv.so)
endif

ifdef PTXCONF_UCLIBC_UTIL
	@$(call install_copy_toolchain_lib, uclibc, libutil.so)
endif
	@$(call install_finish, uclibc)

	@$(call touch, $@)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

uclibc_clean: 
	rm -rf $(STATEDIR)/uclibc.*
	rm -rf $(IMAGEDIR)/uclibc_*

# vim: syntax=make
