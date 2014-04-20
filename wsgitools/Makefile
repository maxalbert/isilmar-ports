# $Id: Makefile,v 1.8 2013/03/10 13:52:14 helmut Exp $

USEGIT=YES

PORTNAME=wsgitools

GITDATE=2013.03.10
GITCOMMITID=30e8af066f3a091cf58443b8e45068c55bf0d68b
GITREPOSITORY=git://git.subdivi.de/~helmut/wsgitools.git

USE_PYDISTUTILS=YES

DO_REGRESSIONTEST ?= YES

regression-test: build
	cd ${WRKSRC} && python test.py

include ../ports.mk
