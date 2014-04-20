# $Id: Makefile,v 1.11 2012/07/16 18:35:03 aehlig Exp $

PORTVERSION=1.7.11.1
PORTNAME=git

# In the past, kernel.org was able to host the distfiles...
# MASTER_SITE=http://kernel.org/pub
# MASTER_SITE_SUBDIR= software/scm/${PORTNAME}

MASTER_SITE=http://git-core.googlecode.com/files/
DISTFILES=${PORTNAME}-${PORTVERSION}.tar.gz
TAR_PARAMETER=z

MAINTAINER=maximilian.albert@googlemail.com

POSTINSTALL_CMD = install -d ${PREFIX}/share/git/ && install -m 644 ${WRKSRC}/contrib/completion/git-completion.bash ${PREFIX}/share/git

include ../ports.mk
