
PORTS ?= $(shell pwd)/..

include $(PORTS)/bin/$(shell uname)/toolnames.mk

## Nonstandard ways of using
ifdef USEGIT
include ${PORTS}/git.mk
endif

ifdef USE_PYDISTUTILS
include ${PORTS}/pydistutils.mk
endif


## Standard infrastructure

PATCH ?= patch
PATCH_OPTIONS ?= -b -p0  # GNU patch peculiarity not to honor correct relative
                         # paths unless -p0 is given
DISTDIR ?= $(shell pwd)/../distfiles
WRKDIRPREFIX ?=
WORKDIR ?= ${WRKDIRPREFIX}/$(shell pwd)/work
MASTERDIR ?= $(shell pwd)
PATCHDIR ?= ${MASTERDIR}
WRKSRC ?= ${WORKDIR}/${PORTNAME}-${PORTVERSION}
PORTREVISION ?=
PREFIXBASE ?= /usr/local
PREFIX ?= $(shell if test 0${PORTREVISION} -gt 0; then \
	echo -n '${PREFIXBASE}/stow/${PORTNAME}-${PORTVERSION}_${PORTREVISION}'; else \
	echo -n '${PREFIXBASE}/stow/${PORTNAME}-${PORTVERSION}'; fi)
LOCALBASE ?= ${PREFIXBASE}
FETCH ?= wget
FETCH_ARGS ?= --max-redirect=0
AWK	?= awk
DIFF ?= diff
TAR ?= tar
GFIND ?= find
GMAKE ?= make
ECHO_CMD ?= echo
SED ?= sed
CONFIGURE_OPTIONS ?=
MASTER_SITE_SUBDIR ?=
CFLAGS ?= -g -I${LOCALBASE}/include -L${LOCALBASE}/lib

EXTRABUILDENV ?=
BUILDENV ?= PREFIX=${PREFIX} PKG_CONFIG_PATH=${PREFIXBASE}/lib/pkgconfig:${PREFIXBASE}/lib64/pkgconfig:$$PKG_CONFIG_PATH CFLAGS='${CFLAGS}' ${EXTRABUILDENV}

EXTRACT_CMD ?= ${TAR} xvf${TAR_PARAMETER}
DO_EXTRACT ?= for file in ${DISTFILES}; do ${EXTRACT_CMD} ${DISTDIR}/$$file; done
POSTEXTRACT_CMD ?= true
PATCHES_LIST ?= `ls ${PATCHDIR} | grep '^patch'`
PATCH_CMD ?= for patch in ${PATCHES_LIST}; do (cd ${WRKSRC} && ${PATCH} ${PATCH_OPTIONS} < ${PATCHDIR}/$$patch); done
POSTPATCH_CMD ?= true
CONFIGURE_CMD ?= ${BUILDENV} /bin/sh ./configure --prefix=${PREFIX} ${CONFIGURE_OPTIONS}
POST_CONFIGURE_CMD ?= true
ALL_TARGET ?= all
BUILD_CMD ?= ${BUILDENV} ${GMAKE} ${ALL_TARGET}
PRE_INSTALL_CMD ?= true
INSTALL_CMD ?= ${BUILDENV} ${GMAKE} install
POSTINSTALL_CMD ?= true
INSTALL_CLEAN_INFODIR ?= if [ -f ${PREFIX}/share/info/dir ]; then rm ${PREFIX}/share/info/dir; fi
INSTALL_DEPENDS ?= if [ -f ${MASTERDIR}/depends ]; then mkdir -p ${PREFIX}/dependencies && install -m 644 ${MASTERDIR}/depends ${PREFIX}/dependencies/${PORTNAME}.depends; fi
INSTALL_MESSAGE ?= if [ -f ${MASTERDIR}/message ]; then mkdir -p ${PREFIX}/dependencies && \
	install -m 644 ${MASTERDIR}/message ${PREFIX}/dependencies/${PORTNAME}.message && \
	echo "" && echo "" && cat ${MASTERDIR}/message && echo "" && echo ""; fi

DISTINFO_DATA?= ${AWK} -v alg=$$algo -v file=$${file} \
	'$$1 == alg && $$2 == "(" file ")" {print $$4}' distinfo

DO_REGRESSIONTEST ?= NO


clean:
	rm -rf ${WORKDIR}

checksum:${WORKDIR}/.done_checksum
${WORKDIR}/.done_checksum: ${WORKDIR}/.done_fetch
	-chmod u+x ${PORTS}/bin/*/* 
	PATH=$$PATH:${PORTS}/bin/`uname`; \
	for file in ${DISTFILES}; \
		do for algo in md5 sha256; \
			do MKSUM=`$$algo < ${DISTDIR}/$$file`; \
			CKSUM=`file=$$file; ${DISTINFO_DATA}`; \
			echo $$file "has real  " $$algo "sum" $$MKSUM; \
			echo $$file "has stored" $$algo "sum" $$CKSUM; \
			if [ "$$MKSUM" != "$$CKSUM" ]; \
				then echo "Checksum mismatch!"; \
				exit 1; \
			fi \
		done \
	done
	mkdir -p ${WORKDIR}
	touch $@


fetch: ${WORKDIR}/.done_fetch
${WORKDIR}/.done_fetch: $(patsubst %,${DISTDIR}/%,${DISTFILES}) | ${WORKDIR}
	touch $@

${DISTDIR}:
	mkdir -p ${DISTDIR}
	chmod 755 ${DISTDIR}

${WORKDIR}:
	mkdir -p ${WORKDIR}
	chmod 755 ${WORKDIR}

# Normalize MASTER_SITE and MASTER_SITE_SUBDIR so that each has a single trailing slash if they are defined
ifdef MASTER_SITE
MASTER_SITE_SLASHED=${MASTER_SITE:/=}/
else
MASTER_SITE_SLASHED=
endif
ifdef MASTER_SITE_SUBDIR
MASTER_SITE_SUBDIR_SLASHED=${MASTER_SITE_SUBDIR:/=}/
else
MASTER_SITE_SUBDIR_SLASHED=
endif

${DISTDIR}/%: | ${DISTDIR}
	(cd ${DISTDIR} && ${FETCH} ${FETCH_ARGS} ${MASTER_SITE_SLASHED}${MASTER_SITE_SUBDIR_SLASHED}$*)

extract: ${WORKDIR}/.done_extract
${WORKDIR}/.done_extract: ${WORKDIR}/.done_checksum
	(cd ${WORKDIR} && ${DO_EXTRACT})
	${POSTEXTRACT_CMD}
	touch $@

patch: ${WORKDIR}/.done_patch
${WORKDIR}/.done_patch: ${WORKDIR}/.done_extract
	${PATCH_CMD}
	${POSTPATCH_CMD}
	touch $@

configure: ${WORKDIR}/.done_configure
${WORKDIR}/.done_configure: ${WORKDIR}/.done_patch
	(cd ${WRKSRC} && ${CONFIGURE_CMD})
	${POST_CONFIGURE_CMD}
	touch $@

build: ${WORKDIR}/.done_build
${WORKDIR}/.done_build: ${WORKDIR}/.done_configure
	(cd ${WRKSRC} && ${BUILD_CMD})
	touch $@

test: ${WORKDIR}/.done_test
${WORKDIR}/.done_test: | ${WORKDIR}
ifeq (${DO_REGRESSIONTEST},YES)
	cd ${MASTERDIR} && ${MAKE} regression-test
endif
	touch $@

install: ${WORKDIR}/.done_install 
${WORKDIR}/.done_install: ${WORKDIR}/.done_build ${WORKDIR}/.done_test
	mkdir -p ${PREFIX}
	(cd ${WRKSRC} && ${PRE_INSTALL_CMD})
	(cd ${WRKSRC} && ${INSTALL_CMD})
	(cd ${WRKSRC} && ${POSTINSTALL_CMD})
	${INSTALL_CLEAN_INFODIR}
	${INSTALL_DEPENDS}
	${INSTALL_MESSAGE}
	touch $@

#### Utilities for maintainers

MAINTAINER ?= ports@linta.de

makesum: ${WORKDIR}/.done_fetch
	-chmod u+x ${PORTS}/bin/*/* 
	rm -f distinfo && touch distinfo;
	PATH=$$PATH:${PORTS}/bin/`uname`; \
	for file in ${DISTFILES}; \
		do for algo in md5 sha256; \
			do MKSUM=`$$algo < ${DISTDIR}/$$file`; \
            echo "$$algo ($$file) = $$MKSUM" >> distinfo; \
		done; \
	done

makepatch:
	-chmod u+x ${PORTS}/bin/*/* 
	mkdir -p ${PATCHDIR}
	(cd ${WRKSRC}; \
		for i in `${GFIND} . -type f -name '*.orig'`; do \
			ORG=$$i; \
			NEW=$${i%.orig}; \
			OUT=${PATCHDIR}/`echo $${NEW} | \
				sed -e 's|/|__|g' \
				    -e 's|\.__|patch-|'`; \
			${DIFF} -ud $${ORG} $${NEW} > $${OUT} || true; \
		done )


## Stupid work around to the fact that GNU make does not have a comand line option
## to simply show the value of a variable. *sigh*

print-%:
	@echo $($*)

## quilt to manage patches

include ${PORTS}/quilt.mk
