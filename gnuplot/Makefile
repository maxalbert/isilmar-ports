# $Id: Makefile,v 1.1 2011/09/15 14:27:10 aehlig Exp $

PORTVERSION=4.4.3
PORTNAME=gnuplot

MASTER_SITE=http://voxel.dl.sourceforge.net/project
MASTER_SITE_SUBDIR=${PORTNAME}/${PORTNAME}/${PORTVERSION}/
DISTFILES=${PORTNAME}-${PORTVERSION}.tar.gz
TAR_PARAMETER=z

PDFBASE ?= ${LOCALBASE}

CONFIGURE_OPTIONS += --with-pdf=${PDFBASE}

include ../ports.mk
