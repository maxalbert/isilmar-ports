# $Id: quilt.mk,v 1.1 2010/12/11 18:26:28 aehlig Exp $

quilt-setup: ${WORKDIR}/.done_extract
	( [ -f ${WORKDIR}/.done_patch -o -f ${WORKDIR}/.done_quilt ] \
	    && ${MAKE} clean && ${MAKE} extract) || true
	rm -f ${WORKDIR}/series
	touch ${WORKDIR}/series
	for file in ${PATCHES_LIST}; do echo $$file -p0 >> ${WORKDIR}/series; done
	echo QUILT_PATCHES=${PATCHDIR} > ${WORKDIR}/quilt.env
	echo QUILT_SERIES=${WORKDIR}/series >> ${WORKDIR}/quilt.env
	echo export QUILT_PATCHES >> ${WORKDIR}/quilt.env
	echo export QUILT_SERIES >> ${WORKDIR}/quilt.env
	echo cd ${WRKSRC} >> ${WORKDIR}/quilt.env
	touch ${WORKDIR}/.done_quilt
	@echo
	@echo Quilt is set up.
	@echo To start working with quilt, now type
	@echo . ${WORKDIR}/quilt.env
	@echo
