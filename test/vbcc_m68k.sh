#! /usr/bin/env bash

docker run --rm -it -v ${PWD}:/src vbcc_m68k vc +aos68k "$@"
