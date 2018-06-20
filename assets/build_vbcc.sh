#!/usr/bin/env bash

cd /tmp

## VASM
wget http://sun.hasenbraten.de/vasm/release/vasm.tar.gz && tar xvfz vasm.tar.gz
cd vasm && make -j CPU=m68k SYNTAX=mot
cp vasmm68k_mot vobjdump ${VBCC}/bin
cd /tmp

## VLINK
wget http://sun.hasenbraten.de/vlink/release/vlink.tar.gz && tar xvfz vlink.tar.gz
cd vlink
make -j
cp -f vlink ${VBCC}/bin
cd /tmp

## VBCC
wget http://server.owl.de/~frank/tags/vbcc0_9fP1.tar.gz && tar xvfz vbcc0_9fP1.tar.gz
cd vbcc && mkdir bin
expect /script.exp
expect /script_s.exp
cp bin/vbcc* bin/vc bin/vprof ${VBCC}/bin

## TARGETS
## Targets are precompiled and have to be downloaded as blobs
cd /tmp
wget http://server.owl.de/~frank/vbcc/2017-08-14/vbcc_target_m68k-amigaos.lha
wget http://server.owl.de/~frank/vbcc/2017-08-14/vbcc_target_m68k-kick13.lha
wget http://server.owl.de/~frank/vbcc/2017-08-14/vbcc_unix_config.tar.gz
lha x vbcc_target_m68k-amigaos.lha
lha x vbcc_target_m68k-kick13.lha
tar -xzf vbcc_unix_config.tar.gz
mv config ${VBCC}/
mv vbcc_target_m68k-amigaos/targets ${VBCC}/
cp -r vbcc_target_m68k-kick13/targets/* ${VBCC}/targets

