#!/bin/bash
PREFIX=$1
EPREFIX=$2
SDKLIBS=$3
MINIGUI_CROSS_COMPILE=$6
PLAT_DEPENDENT_LIB=${PLATDEPENDENTLIB}

LOCAL_INCS=-I${PREFIX}/include
LOCAL_LIBS=-L${EPREFIX}/lib
SKD_LIBS=-L${SDKLIBS}
declare -x LDFLAGS=${LOCAL_LIBS}
declare -x PKG_CONFIG_PATH=${EPREFIX}/lib/pkgconfig
declare -x LIBS=${SKD_LIBS}" "${PLAT_DEPENDENT_LIB}" -lpthread  -lz"
declare -x CFLAGS="-rdynamic -funwind-tables "${LOCAL_INCS}

./configure    --host=${MINIGUI_CROSS_COMPILE} --prefix=${PREFIX} --exec-prefix=${EPREFIX}

