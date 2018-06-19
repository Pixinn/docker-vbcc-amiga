#! /usr/bin/env bash

cd /curr
ls -l
cmake /src -DCMAKE_TOOLCHAIN_FILE=${VBCC}/vbcc_amiga.cmake "$@"
