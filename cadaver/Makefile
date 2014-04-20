# $Id: Makefile,v 1.2 2010/10/15 15:05:55 aehlig Exp $

PORTVERSION=0.23.3
PORTREVISION=1
PORTNAME=cadaver

MASTER_SITE=http://www.webdav.org/
MASTER_SITE_SUBDIR= ${PORTNAME}
DISTFILES=${PORTNAME}-${PORTVERSION}.tar.gz
TAR_PARAMETER=z

CONFIGURE_OPTIONS = --with-ssl

INSTALL_CMD = (mkdir -p ${PREFIX}/bin && cp -p ${WRKSRC}/cadaver ${PREFIX}/bin)

include ../ports.mk
