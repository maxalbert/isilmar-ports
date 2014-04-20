# $Id: Makefile,v 1.1 2013/10/26 08:40:55 root Exp $

PORTVERSION=3.1.2
PORTNAME=fcron

MASTER_SITE=http://fcron.free.fr/archives
MASTER_SITE_SUBDIR= 
DISTFILES=${PORTNAME}-${PORTVERSION}.src.tar.gz
TAR_PARAMETER=z

CONFIGURE_OPTIONS= --sysconfdir=/etc --localstatedir=/var \
	--with-username=fcron --with-groupname=fcron \
	--with-sendmail=/usr/sbin/sendmail \
	--with-boot-install=no

POSTINSTALL_CMD=(chmod a+r ${PREFIX}/bin/fcrondyn ${PREFIX}/bin/fcronsighup \
	${PREFIX}/bin/fcrontab ${PREFIX}/sbin/fcron)

include ../ports.mk
