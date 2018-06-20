#! /usr/bin/env bash

# Sanity
if [ "$#" -lt 1 ]; then
    set -- ${PWD}
fi
# Replace front . and .. as they are not accepted by Docker
dir=${1}
if [[ ${dir:0:2} == "./" ]] ; then
    newdir="${PWD}/${dir:2}"
    set -- ${newdir} "${@:2}"
elif [[ ${dir:0:3} == "../" ]] ; then
    newdir="${PWD}/../${dir:3}"
    set -- ${newdir} "${@:2}"
elif [[ ${dir} == "." ]] ; then
    set -- ${PWD} "${@:2}"
elif [[ ${dir} == ".." ]] ; then
    set -- ${PWD}/.. "${@:2}"
fi

# if no makefile is found, the first arg may not be a folder: the user may have called "make target"
if [ ! -e ${1}/Makefile ] ; then
    dir=${PWD}
    options="$@"
else
    dir=${1}
     options="${@:2}"
fi

# needs the SOURCES file: it contains the sources location
if [ ! -e ${dir}/SOURCES_DIR ] ; then
    echo "Cannot find SOURCES_DIR. Does this file exist along the Makefile?"
    exit -1
fi

sources=$( cat ${dir}/SOURCES_DIR )
docker run --rm -it -v ${sources}:/src -v ${dir}:/work pixinn/vbcc-amiga make_vbcc_amiga.sh ${options}
