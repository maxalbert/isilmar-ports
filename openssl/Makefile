# $Id: Makefile,v 1.3 2012/03/25 15:36:37 aehlig Exp $

PORTVERSION=1.0.0g
PORTNAME=openssl

MASTER_SITE=http://www.openssl.org/
MASTER_SITE_SUBDIR= source
DISTFILES=${PORTNAME}-${PORTVERSION}.tar.gz
TAR_PARAMETER=z

CONFIGURE_CMD ?= ${BUILDENV} /bin/sh ./config --prefix=${PREFIX} ${CONFIGURE_OPTIONS} enable-md2

include ../ports.mk
