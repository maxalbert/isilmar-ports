# $Id: Makefile,v 1.6 2012/05/01 14:46:25 aehlig Exp $

USEGIT=YES

PORTNAME=dyndns

GITDATE=2011.01.09
GITCOMMITID=e90392434d9b1857225b461abb98a90194b2951c
GITREPOSITORY=git://isilmar.linta.de/isilmar/dyndns.git

PATH_TO_CONFIGFILE ?= /etc/dyndns.conf

CONFIGURE_CMD=true # don't configure
BUILD_CMD=true     # don't build
INSTALL_CMD=${BUILDENV} PATH_TO_CONFIGFILE=${PATH_TO_CONFIGFILE} ${GMAKE} install

include ../ports.mk
