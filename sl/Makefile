PORTVERSION=5.02
PORTNAME=sl

MASTER_SITE=https://github.com/mtoyoda/sl/archive/
DISTFILES=${PORTVERSION}.tar.gz
TAR_PARAMETER=z

WRKSRC=${WORKDIR}/${PORTNAME}-${PORTVERSION}

CONFIGURE_CMD = true
BUILD_CMD = make
INSTALL_CMD = mkdir -p ${PREFIX}/bin && cp ${WRKSRC}/sl ${PREFIX}/bin/sl

include ../ports.mk
