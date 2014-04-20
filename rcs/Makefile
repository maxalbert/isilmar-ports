# $Id: Makefile,v 1.19 2013/06/01 10:00:59 aehlig Exp $

PORTVERSION=5.9.0
PORTNAME=rcs

MASTER_SITE=ftp://ftp.gnu.org/gnu/
MASTER_SITE_SUBDIR= ${PORTNAME}
DISTFILES=${PORTNAME}-${PORTVERSION}.tar.xz
TAR_PARAMETER=J

POST_CONFIGURE_CMD= echo "\#undef WOE" >> ${WRKSRC}/lib/config.h

CONFIGURE_AS_NOBODY = chown -R nobody ${WRKSRC}; ${BUILDENV} su -c '/bin/sh ./configure --prefix=${PREFIX} ${CONFIGURE_OPTIONS}' nobody
CONFIGURE_CMD = if [ `id -un` = root ]; then ${CONFIGURE_AS_NOBODY}; else ${BUILDENV} /bin/sh ./configure --prefix=${PREFIX} ${CONFIGURE_OPTIONS}; fi

BUILD_AS_NOBODY= chown -R nobody ${WRKSRC}; ${BUILDENV} su -c '${GMAKE}' nobody
BUILD_CMD= if [ `id -un` = root ]; then ${BUILD_AS_NOBODY}; else ${BUILDENV} ${GMAKE}; fi;

DO_REGRESSIONTEST ?= YES

regression-test: build
	cd ${WRKSRC} && ${GMAKE} check


include ../ports.mk
