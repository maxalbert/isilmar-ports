# $Id: Makefile,v 1.3 2011/07/05 07:54:38 aehlig Exp $

PORTVERSION=1.1.1
PORTNAME=meep

MASTER_SITE=http://ab-initio.mit.edu/${PORTNAME}
DISTFILES=${PORTNAME}-${PORTVERSION}.tar.gz
TAR_PARAMETER=z

FFTWBASE ?= /local/software/rh53/fftw/3.2.2/gcc/double/

CPPFLAGS+= -I${LOCALBASE}/include -I${FFTWBASE}/include
LD_LIBRARY_PATH= -L${LOCALBASE}/lib -L/usr/lib -L${FFTWBASE}/lib
LDFLAGS+= -L${LOCALBASE}/lib -L${FFTWBASE}/lib

MPICXX ?= /local/software/rh53/openmpi/1.4.3/qlogic/gcc/bin/mpiCC
WITHMPI ?= --with-mpi=openmpi

BUILDENV += CPPFLAGS="${CPPFLAGS}" LD_LIBRARY_PATH="${LD_LIBRARY_PATH}" LDFLAGS="${LDFLAGS}" MPICXX="${MPICXX}"
CONFIGURE_OPTIONS += --with-libctl=${LOCALBASE}/share/libctl ${WITHMPI}


include ../ports.mk
