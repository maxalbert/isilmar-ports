# $Id: Makefile,v 1.3 2011/05/10 18:16:49 aehlig Exp $

PORTVERSION=2.2.0
PORTNAME=stow

MASTER_SITE=ftp://ftp.cs.tu-berlin.de/pub/gnu/
MASTER_SITE_SUBDIR= ${PORTNAME}
DISTFILES=${PORTNAME}-${PORTVERSION}.tar.gz
TAR_PARAMETER=z
POSTINSTALL_CMD=rm -f ${PREFIX}/info/dir

include ../ports.mk
