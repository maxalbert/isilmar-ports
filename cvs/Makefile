# $Id: Makefile,v 1.7 2012/02/09 19:45:22 aehlig Exp $

PORTVERSION=1.12.13.0.2011.04.07
PORTNAME=cvs
PORTREVISION=1

# Snapshot release
MASTER_SITE=http://www.linta.de/distfiles/snapshots
WRKSRC=${WORKDIR}/ccvs

# # Official releases can be obtained here
# MASTER_SITE=http://ftp.gnu.org/gnu/
# MASTER_SITE_SUBDIR= non-gnu/${PORTNAME}/source/feature/${PORTVERSION}

DISTFILES=${PORTNAME}-${PORTVERSION}.tar.bz2
TAR_PARAMETER=j


CONFIGURE_OPTIONS=--enable-rootcommit
POST_CONFIGURE_CMD= echo "\#undef HAVE_OPENPGP" >> ${WRKSRC}/config.h

include ../ports.mk
