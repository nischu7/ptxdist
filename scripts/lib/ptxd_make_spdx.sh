#!/bin/bash
#
# Copyright (C) 2015 by Michael Olbrich <m.olbrich@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# WARNING: This file is generated with 'update_spdx.sh' from
# 'spdx_licenselist_v2.2.csv' and 'spdx_licenselist_v2.2_exceptions.csv'.
#
# To regenerate this file export the license and exception sheets from the
# original SPDX license list using '|' as field delimiter and run
# 'update_spdx.sh'.

ptxd_make_spdx() {
    license="${1}"

    case "${license}" in
	Glide) ;;
	Abstyles) ;;
	AFL-1.1) osi="true" ;;
	AFL-1.2) osi="true" ;;
	AFL-2.0) osi="true" ;;
	AFL-2.1) osi="true" ;;
	AFL-3.0) osi="true" ;;
	AMPAS) ;;
	APL-1.0) osi="true" ;;
	Adobe-Glyph) ;;
	APAFML) ;;
	Adobe-2006) ;;
	AGPL-1.0) ;;
	Afmparse) ;;
	Aladdin) ;;
	ADSL) ;;
	AMDPLPA) ;;
	ANTLR-PD) ;;
	Apache-1.0) ;;
	Apache-1.1) osi="true" ;;
	Apache-2.0) osi="true" ;;
	AML) ;;
	APSL-1.0) osi="true" ;;
	APSL-1.1) osi="true" ;;
	APSL-1.2) osi="true" ;;
	APSL-2.0) osi="true" ;;
	Artistic-1.0) osi="true" ;;
	Artistic-1.0-Perl) osi="true" ;;
	Artistic-1.0-cl8) osi="true" ;;
	Artistic-2.0) osi="true" ;;
	AAL) osi="true" ;;
	Bahyph) ;;
	Barr) ;;
	Beerware) ;;
	BitTorrent-1.0) ;;
	BitTorrent-1.1) ;;
	BSL-1.0) osi="true" ;;
	Borceux) ;;
	BSD-2-Clause) osi="true" ;;
	BSD-2-Clause-FreeBSD) ;;
	BSD-2-Clause-NetBSD) ;;
	BSD-3-Clause) osi="true" ;;
	BSD-3-Clause-Clear) ;;
	BSD-4-Clause) ;;
	BSD-Protection) ;;
	BSD-3-Clause-Attribution) ;;
	0BSD) ;;
	BSD-4-Clause-UC) ;;
	bzip2-1.0.5) ;;
	bzip2-1.0.6) ;;
	Caldera) ;;
	CECILL-1.0) ;;
	CECILL-1.1) ;;
	CECILL-2.0) ;;
	CECILL-2.1) osi="true" ;;
	CECILL-B) ;;
	CECILL-C) ;;
	ClArtistic) ;;
	MIT-CMU) ;;
	CNRI-Jython) ;;
	CNRI-Python) osi="true" ;;
	CNRI-Python-GPL-Compatible) ;;
	CPOL-1.02) ;;
	CDDL-1.0) osi="true" ;;
	CDDL-1.1) ;;
	CPAL-1.0) osi="true" ;;
	CPL-1.0) osi="true" ;;
	CATOSL-1.1) osi="true" ;;
	Condor-1.1) ;;
	CC-BY-1.0) ;;
	CC-BY-2.0) ;;
	CC-BY-2.5) ;;
	CC-BY-3.0) ;;
	CC-BY-4.0) ;;
	CC-BY-ND-1.0) ;;
	CC-BY-ND-2.0) ;;
	CC-BY-ND-2.5) ;;
	CC-BY-ND-3.0) ;;
	CC-BY-ND-4.0) ;;
	CC-BY-NC-1.0) ;;
	CC-BY-NC-2.0) ;;
	CC-BY-NC-2.5) ;;
	CC-BY-NC-3.0) ;;
	CC-BY-NC-4.0) ;;
	CC-BY-NC-ND-1.0) ;;
	CC-BY-NC-ND-2.0) ;;
	CC-BY-NC-ND-2.5) ;;
	CC-BY-NC-ND-3.0) ;;
	CC-BY-NC-ND-4.0) ;;
	CC-BY-NC-SA-1.0) ;;
	CC-BY-NC-SA-2.0) ;;
	CC-BY-NC-SA-2.5) ;;
	CC-BY-NC-SA-3.0) ;;
	CC-BY-NC-SA-4.0) ;;
	CC-BY-SA-1.0) ;;
	CC-BY-SA-2.0) ;;
	CC-BY-SA-2.5) ;;
	CC-BY-SA-3.0) ;;
	CC-BY-SA-4.0) ;;
	CC0-1.0) ;;
	Crossword) ;;
	CrystalStacker) ;;
	CUA-OPL-1.0) osi="true" ;;
	Cube) ;;
	D-FSL-1.0) ;;
	diffmark) ;;
	WTFPL) ;;
	DOC) ;;
	Dotseqn) ;;
	DSDP) ;;
	dvipdfm) ;;
	EPL-1.0) osi="true" ;;
	ECL-1.0) osi="true" ;;
	ECL-2.0) osi="true" ;;
	eGenix) ;;
	EFL-1.0) osi="true" ;;
	EFL-2.0) osi="true" ;;
	MIT-advertising) ;;
	MIT-enna) ;;
	Entessa) osi="true" ;;
	ErlPL-1.1) ;;
	EUDatagrid) osi="true" ;;
	EUPL-1.0) ;;
	EUPL-1.1) osi="true" ;;
	Eurosym) ;;
	Fair) osi="true" ;;
	MIT-feh) ;;
	Frameworx-1.0) osi="true" ;;
	FreeImage) ;;
	FTL) ;;
	FSFUL) ;;
	FSFULLR) ;;
	Giftware) ;;
	GL2PS) ;;
	Glulxe) ;;
	AGPL-3.0) osi="true" ;;
	GFDL-1.1) ;;
	GFDL-1.2) ;;
	GFDL-1.3) ;;
	GPL-1.0) ;;
	GPL-2.0) osi="true" ;;
	GPL-3.0) osi="true" ;;
	LGPL-2.1) osi="true" ;;
	LGPL-3.0) osi="true" ;;
	LGPL-2.0) osi="true" ;;
	gnuplot) ;;
	gSOAP-1.3b) ;;
	HaskellReport) ;;
	HPND) osi="true" ;;
	IBM-pibs) ;;
	IPL-1.0) osi="true" ;;
	ICU) ;;
	ImageMagick) ;;
	iMatix) ;;
	Imlib2) ;;
	IJG) ;;
	Intel-ACPI) ;;
	Intel) osi="true" ;;
	Interbase-1.0) ;;
	IPA) osi="true" ;;
	ISC) osi="true" ;;
	JasPer-2.0) ;;
	JSON) ;;
	LPPL-1.3a) ;;
	LPPL-1.0) ;;
	LPPL-1.1) ;;
	LPPL-1.2) ;;
	LPPL-1.3c) osi="true" ;;
	Latex2e) ;;
	BSD-3-Clause-LBNL) ;;
	Leptonica) ;;
	LGPLLR) ;;
	Libpng) ;;
	libtiff) ;;
	LPL-1.02) osi="true" ;;
	LPL-1.0) osi="true" ;;
	MakeIndex) ;;
	MTLL) ;;
	MS-PL) osi="true" ;;
	MS-RL) osi="true" ;;
	MirOS) osi="true" ;;
	MITNFA) ;;
	MIT) osi="true" ;;
	Motosoto) osi="true" ;;
	MPL-1.0) osi="true" ;;
	MPL-1.1) osi="true" ;;
	MPL-2.0) osi="true" ;;
	MPL-2.0-no-copyleft-exception) osi="true" ;;
	mpich2) ;;
	Multics) osi="true" ;;
	Mup) ;;
	NASA-1.3) osi="true" ;;
	Naumen) osi="true" ;;
	NBPL-1.0) ;;
	NetCDF) ;;
	NGPL) osi="true" ;;
	NOSL) ;;
	NPL-1.0) ;;
	NPL-1.1) ;;
	Newsletr) ;;
	NLPL) ;;
	Nokia) osi="true" ;;
	NPOSL-3.0) osi="true" ;;
	Noweb) ;;
	NRL) ;;
	NTP) osi="true" ;;
	Nunit) ;;
	OCLC-2.0) osi="true" ;;
	ODbL-1.0) ;;
	PDDL-1.0) ;;
	OGTSL) osi="true" ;;
	OLDAP-2.2.2) ;;
	OLDAP-1.1) ;;
	OLDAP-1.2) ;;
	OLDAP-1.3) ;;
	OLDAP-1.4) ;;
	OLDAP-2.0) ;;
	OLDAP-2.0.1) ;;
	OLDAP-2.1) ;;
	OLDAP-2.2) ;;
	OLDAP-2.2.1) ;;
	OLDAP-2.3) ;;
	OLDAP-2.4) ;;
	OLDAP-2.5) ;;
	OLDAP-2.6) ;;
	OLDAP-2.7) ;;
	OLDAP-2.8) ;;
	OML) ;;
	OPL-1.0) ;;
	OSL-1.0) osi="true" ;;
	OSL-1.1) ;;
	OSL-2.0) osi="true" ;;
	OSL-2.1) osi="true" ;;
	OSL-3.0) osi="true" ;;
	OpenSSL) ;;
	PHP-3.0) osi="true" ;;
	PHP-3.01) ;;
	Plexus) ;;
	PostgreSQL) osi="true" ;;
	psfrag) ;;
	psutils) ;;
	Python-2.0) osi="true" ;;
	QPL-1.0) osi="true" ;;
	Qhull) ;;
	Rdisc) ;;
	RPSL-1.0) osi="true" ;;
	RPL-1.1) osi="true" ;;
	RPL-1.5) osi="true" ;;
	RHeCos-1.1) ;;
	RSCPL) osi="true" ;;
	RSA-MD) ;;
	Ruby) ;;
	SAX-PD) ;;
	Saxpath) ;;
	SCEA) ;;
	SWL) ;;
	Sendmail) ;;
	SGI-B-1.0) ;;
	SGI-B-1.1) ;;
	SGI-B-2.0) ;;
	OFL-1.0) ;;
	OFL-1.1) osi="true" ;;
	SimPL-2.0) osi="true" ;;
	Sleepycat) osi="true" ;;
	SNIA) ;;
	Spencer-86) ;;
	Spencer-94) ;;
	Spencer-99) ;;
	SMLNJ) ;;
	SugarCRM-1.1.3) ;;
	SISSL) osi="true" ;;
	SISSL-1.2) ;;
	SPL-1.0) osi="true" ;;
	Watcom-1.0) osi="true" ;;
	TCL) ;;
	Unlicense) ;;
	TMate) ;;
	TORQUE-1.1) ;;
	TOSL) ;;
	Unicode-TOU) ;;
	UPL-1.0) osi="true" ;;
	NCSA) osi="true" ;;
	Vim) ;;
	VOSTROM) ;;
	VSL-1.0) osi="true" ;;
	W3C-19980720) ;;
	W3C) osi="true" ;;
	Wsuipa) ;;
	Xnet) osi="true" ;;
	X11) ;;
	Xerox) ;;
	XFree86-1.1) ;;
	xinetd) ;;
	xpp) ;;
	XSkat) ;;
	YPL-1.0) ;;
	YPL-1.1) ;;
	Zed) ;;
	Zend-2.0) ;;
	Zimbra-1.3) ;;
	Zimbra-1.4) ;;
	Zlib) osi="true" ;;
	zlib-acknowledgement) ;;
	ZPL-1.1) ;;
	ZPL-2.0) osi="true" ;;
	ZPL-2.1) ;;
	389-exception) exception="true" ;;
	Autoconf-exception-2.0) exception="true" ;;
	Autoconf-exception-3.0) exception="true" ;;
	Bison-exception-2.2) exception="true" ;;
	Classpath-exception-2.0) exception="true" ;;
	CLISP-exception-2.0) exception="true" ;;
	DigiRule-FOSS-exception) exception="true" ;;
	eCos-exception-2.0) exception="true" ;;
	Fawkes-Runtime-exception) exception="true" ;;
	FLTK-exception) exception="true" ;;
	Font-exception-2.0) exception="true" ;;
	freertos-exception-2.0) exception="true" ;;
	GCC-exception-2.0) exception="true" ;;
	GCC-exception-3.1) exception="true" ;;
	gnu-javamail-exception) exception="true" ;;
	i2p-gpl-java-exception) exception="true" ;;
	Libtool-exception) exception="true" ;;
	LZMA-exception) exception="true" ;;
	mif-exception) exception="true" ;;
	Nokia-Qt-exception-1.1) exception="true" ;;
	openvpn-openssl-exception) exception="true" ;;
	Qwt-exception-1.0) exception="true" ;;
	u-boot-exception-2.0) exception="true" ;;
	WxWindows-exception-3.1) exception="true" ;;
	*) return 1 ;;
    esac
}
export -f ptxd_make_spdx
