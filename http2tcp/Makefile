# $Id: Makefile,v 1.4 2010/11/12 20:03:14 aehlig Exp $

PORTNAME=http2tcp
PORTVERSION=0.4
MASTER_SITE=http://www.linta.de/~aehlig/${PORTNAME}
DISTFILES=${PORTNAME}-${PORTVERSION}.tar.gz

CONFIGURE_CMD=true    # don't configure
BUILD_CMD=true        # don't build

INSTALL_CMD= (mkdir -p ${PREFIX}/bin && mkdir -p ${PREFIX}/sbin && mkdir -p ${PREFIX}/share/${PORTNAME} && \
			  install ${WRKSRC}/http2tcp-server ${PREFIX}/sbin/http2tcp-server && \
	          install ${WRKSRC}/http2tcp-client ${PREFIX}/bin/http2tcp-client  && \
			  install -m 644 ${WRKSRC}/Protocol ${PREFIX}/share/${PORTNAME}/Protocol)

include ../ports.mk
