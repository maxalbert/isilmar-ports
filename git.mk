
GIT ?= git

PORTVERSION ?= ${GITDATE}.${GITCOMMITID}
DO_EXTRACT ?=  ${GIT} clone ${GITREPOSITORY} gitwork && cd gitwork && ${GIT} checkout -b githead ${GITCOMMITID}
WRKSRC ?= ${WORKDIR}/gitwork

GIT_VERSION_BRANCH ?= master
GIT_VERSION_REPOSITORY ?= ${GITREPOSITORY}

GIT_GETNEWCOMMITID = (cd / && ${GIT} ls-remote ${GIT_VERSION_REPOSITORY} ${GIT_VERSION_BRANCH}) | cut -f 1

makegitcommitid:
	${SED} -i'' -e 's/GITCOMMITID *=.*/GITCOMMITID='`${GIT_GETNEWCOMMITID}`/g Makefile
	${SED} -i'' -e 's/GITDATE *=.*/GITDATE='`date +%Y.%m.%d`/g Makefile
