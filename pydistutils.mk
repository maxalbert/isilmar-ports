# $Id: pydistutils.mk,v 1.3 2011/06/02 10:55:43 aehlig Exp $

PYTHON_CMD ?= python

PYSETUP ?= setup.py
PYDISTUTILS_CONFIGURE_TARGET ?= config
PYDISTUTILS_BUILD_TARGET ?= build
PYDISTUTILS_INSTALL_TARGET ?= install

ifeq ($(shell test -f /etc/debian_version && grep -q '^[6-9]' /etc/debian_version && echo YES),YES)
PYDISTUTILS_INSTALLSYSTEMFLAGS ?= --install-layout=deb
endif

PYDISTUTILS_CONFIGUREARGS ?=
PYDISTUTILS_BUILDARGS ?=
PYDISTUITLS_EXTRAINSTALLFLAGS ?=
PYDISTUTILS_INSTALLARGS ?=  -c -O1 --prefix=${PREFIX} ${PYDISTUTILS_INSTALLSYSTEMFLAGS} ${PYDISTUITLS_EXTRAINSTALLFLAGS}

CONFIGURE_CMD ?=  ${BUILDENV} ${PYTHON_CMD} ${PYSETUP} ${PYDISTUTILS_CONFIGURE_TARGET} ${PYDISTUTILS_CONFIGUREARGS}
BUILD_CMD ?= ${BUILDENV} ${PYTHON_CMD} ${PYSETUP} ${PYDISTUTILS_BUILD_TARGET} ${PYDISTUTILS_BUILDARGS}
INSTALL_CMD ?= ${BUILDENV} ${PYTHON_CMD} ${PYSETUP} ${PYDISTUTILS_INSTALL_TARGET} ${PYDISTUTILS_INSTALLARGS}