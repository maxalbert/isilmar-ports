# $Id: Makefile,v 1.37 2014/03/24 07:01:16 aehlig Exp $

USEGIT=YES

PORTNAME=dokuforge2

GITDATE=2014.03.24
GITCOMMITID=dcbaf659bd537d78542f7288b1cd03dbfce9a6bf
GITREPOSITORY=git://isilmar.linta.de/dokuforge2

## Setup is via python distutils

USE_PYDISTUTILS=YES

POSTINSTALL_CMD=(install -d ${PREFIX}/share/${PORTNAME}/static \
	&& install -m 644 ${WRKSRC}/dokuforge/static/* ${PREFIX}/share/${PORTNAME}/static)

DO_REGRESSIONTEST ?= YES

regression-test: build
	cd ${WRKSRC} && ${GMAKE} test

include ../ports.mk
