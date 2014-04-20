# $Id: Makefile,v 1.2 2011/11/11 04:37:02 aehlig Exp $

PORTNAME=mathjax

PORTVERSION = v1.1a
DISTFILES = ${PORTVERSION}
MASTER_SITE=http://github.com/mathjax/MathJax/zipball
FETCH_ARGS= --no-check-certificate
DO_EXTRACT     = (cd ${WORKDIR} && unzip ${DISTDIR}/${DISTFILES} && mv mathjax-* mathjax)
WRKSRC=${WORKDIR}/mathjax
CONFIGURE_CMD  = true    # don't configure
BUILD_CMD      = true    # don't build
INSTALL_CMD = ( find . -type d -exec install -d {} ${PREFIX}/share/${PORTNAME}/{} \; && \
                find . -type f -exec install -m 644 {} ${PREFIX}/share/${PORTNAME}/{} \; )

include ../ports.mk
