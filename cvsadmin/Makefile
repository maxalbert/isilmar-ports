# $Id: Makefile,v 1.1 2009/11/19 20:24:27 aehlig Exp $

PORTNAME=cvsadmin
PORTVERSION=1.0.3

MASTER_SITE=http://www.linta.de/distfiles/
DISTFILES=${PORTNAME}-${PORTVERSION}.tar.gz
TAR_PARAMTER=z

POST_CONFIGURE_CMD= ${ECHO_CMD} "\#define HAVE_MKDTEMP 1" >> ${WRKSRC}/config.h

include ../ports.mk
