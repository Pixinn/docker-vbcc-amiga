#! /usr/bin/env bash

cd /work
cmake /src -DCMAKE_TOOLCHAIN_FILE=${VBCC}/vbcc_amiga.cmake "$@"
