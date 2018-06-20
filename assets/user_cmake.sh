#! /usr/bin/env bash

# Sanity
if [ "$#" -lt 1 ]; then
    echo "Where is the CMakelists.txt?"
    exit -1
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

docker run --rm -it -v ${1}:/src -v ${PWD}:/work pixinn/vbcc-amiga cmake_vbcc_amiga.sh "${@:2}"
# sources location must be saved to be used by make.sh
echo ${1} > SOURCES_DIR
