# -*-makefile-*-
#
# Copyright (C) 2007 by Michael Olbrich <m.olbrich@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
HOST_PACKAGES-$(PTXCONF_HOST_LIBPTHREAD_STUBS) += host-libpthread-stubs

#
# Paths and names
#
HOST_LIBPTHREAD_STUBS_DIR	= $(HOST_BUILDDIR)/$(LIBPTHREAD_STUBS)

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(STATEDIR)/host-libpthread-stubs.get: $(STATEDIR)/libpthread-stubs.get
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

HOST_LIBPTHREAD_STUBS_PATH	:= PATH=$(HOST_PATH)
HOST_LIBPTHREAD_STUBS_ENV 	:= $(HOST_ENV)

#
# autoconf
#
HOST_LIBPTHREAD_STUBS_AUTOCONF	:= $(HOST_AUTOCONF)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

host-libpthread-stubs_clean:
	rm -rf $(STATEDIR)/host-libpthread-stubs.*
	rm -rf $(HOST_LIBPTHREAD_STUBS_DIR)

# vim: syntax=make
