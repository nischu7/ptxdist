# -*-makefile-*-
#
# Copyright (C) 2014 by Jon Ringle
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
ifndef PTXCONF_ENDIAN_BIG
PACKAGES-$(PTXCONF_F2FS_TOOLS) += f2fs-tools
endif

#
# Paths and names
#
F2FS_TOOLS_VERSION	:= 1.4.0
F2FS_TOOLS_MD5		:= 0c3e7f46c781449a5a9523d633b19740
F2FS_TOOLS		:= f2fs-tools-$(F2FS_TOOLS_VERSION)
F2FS_TOOLS_SUFFIX	:= tar.xz
F2FS_TOOLS_URL		:= git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git;tag=v$(F2FS_TOOLS_VERSION)
F2FS_TOOLS_SOURCE	:= $(SRCDIR)/$(F2FS_TOOLS).$(F2FS_TOOLS_SUFFIX)
F2FS_TOOLS_DIR		:= $(BUILDDIR)/$(F2FS_TOOLS)
F2FS_TOOLS_LICENSE	:= GPL-2.0+ LGPL-2.1+

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

F2FS_TOOLS_CONF_ENV	:= \
	$(CROSS_ENV) \
	ac_cv_file__git=no

#
# autoconf
#
F2FS_TOOLS_CONF_TOOL	:= autoconf

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/f2fs-tools.targetinstall:
	@$(call targetinfo)

	@$(call install_init, f2fs-tools)
	@$(call install_fixup, f2fs-tools,PRIORITY,optional)
	@$(call install_fixup, f2fs-tools,SECTION,base)
	@$(call install_fixup, f2fs-tools,AUTHOR,"Jon Ringle")
	@$(call install_fixup, f2fs-tools,DESCRIPTION,missing)

	@$(call install_copy, f2fs-tools, 0, 0, 0755, -, /sbin/mkfs.f2fs)
	@$(call install_copy, f2fs-tools, 0, 0, 0755, -, /sbin/fsck.f2fs)

	@$(call install_lib, f2fs-tools, 0, 0, 0644, libf2fs)

	@$(call install_finish, f2fs-tools)

	@$(call touch)

# vim: syntax=make
