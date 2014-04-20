# $Id: pydistutils.mk,v 1.3 2011/06/02 10:55:43 aehlig Exp $

PYTHON_CMD ?= python
PYTHONVERSION = python$(shell $(PYTHON_CMD) -c 'from distutils.sysconfig import get_python_version; print(get_python_version())')
PYSITEPREFIX = ${PREFIX}/lib/${PYTHONVERSION}/site-packages

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

# Ensure that the package installs cleanly into PREFIX without Python complaining
# (the target directory must be contained in PYTHONPATH).
EXTRABUILDENV ?= PYTHONPATH=${PYTHONPATH}:${PREFIX}/lib/${PYTHONVERSION}/site-packages/ LIBRARY_PATH=${LOCALBASE}/lib:${LIBRARY_PATH}
PRE_INSTALL_CMD ?= install -d ${PREFIX}/lib/${PYTHONVERSION}/site-packages/

# After installing, delete "site.py" (which should already be provided
# by Python itself or setuptools) and rename "easy-install.py" to a
# file with a unique name to avoid conflicts with other packages when
# stow-ing. The "|| :" idiom ignores a non-zero exit status so that
# errors are ignored, e.g. if easy-install.pth doesn't exist.
POSTINSTALL_CMD ?= (rm -f ${PYSITEPREFIX}/site.py* && ([ -f ${PYSITEPREFIX}/easy-install.pth ] && mv ${PYSITEPREFIX}/easy-install.pth ${PYSITEPREFIX}/easy-install_${PORTNAME}-${PORTVERSION}.pth) && ([ -f ${PYSITEPREFIX}/setuptools.pth ] && mv ${PYSITEPREFIX}/setuptools.pth ${PYSITEPREFIX}/setuptools_${PORTNAME}-${PORTVERSION}.pth)) || :

CONFIGURE_CMD ?=  ${BUILDENV} ${PYTHON_CMD} ${PYSETUP} ${PYDISTUTILS_CONFIGURE_TARGET} ${PYDISTUTILS_CONFIGUREARGS}
BUILD_CMD ?= ${BUILDENV} ${PYTHON_CMD} ${PYSETUP} ${PYDISTUTILS_BUILD_TARGET} ${PYDISTUTILS_BUILDARGS}
INSTALL_CMD ?= ${BUILDENV} ${PYTHON_CMD} ${PYSETUP} ${PYDISTUTILS_INSTALL_TARGET} ${PYDISTUTILS_INSTALLARGS}
