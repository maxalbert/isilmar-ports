# $Id: Makefile,v 1.1 2011/09/15 14:27:10 aehlig Exp $

PORTVERSION=7.0.4
PORTNAME=pdflib

## Note:
## This software has quite a restrictive license; see http://www.pdflib.com
## for terms and conditions before installing this software


MASTER_SITE= http://www.pdflib.com/binaries/PDFlib/704/
DISTFILES=PDFlib-Lite-${PORTVERSION}p4.tar.gz
TAR_PARAMETER=z

WRKSRC=${WORKDIR}/PDFlib-Lite-${PORTVERSION}p4

CONFIGURE_OPTIONS ?= --with-java=no --with-py=no --with-ruby=no --with-tcl=no --with-perl=no

include ../ports.mk
