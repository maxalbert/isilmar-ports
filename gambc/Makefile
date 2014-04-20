# $Id: Makefile,v 1.2 2011/07/05 14:51:47 aehlig Exp $

PORTNAME=	gambc
PORTVERSION=	v4_6_1

MASTER_SITE=	http://www.iro.umontreal.ca/~gambit/download/gambit/v4.6/source/
DISTFILES=	${PORTNAME}-${PORTVERSION}.tgz
TAR_PARAMETER=z

CONFIGURE_OPTIONS ?= --enable-single-host --enable-gcc-opts \
	--prefix=${PREFIX} --docdir=${PREFIX}/share/doc/gambit-c \
	--libdir=${PREFIX}/lib/gambit-c/ --includedir=${PREFIX}/include/gambit-c \
	--enable-interpreter-name=gsi-gambit  --enable-compiler-name=gsc-gambit

include ../ports.mk
