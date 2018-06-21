# Ref: https://blitterstudio.com/setting-up-an-amiga-cross-compiler/

FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive

LABEL "Author"="Christophe Meneboeuf <christophe@xtof.info>"

# DEPENDENCIES

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential cmake lhasa unzip wget expect

# COMPILER SUITE
ENV VBCC /opt/vbcc
RUN mkdir -p ${VBCC}/bin
ADD assets/build_vbcc.sh /build_vbcc.sh
RUN chmod +x /build_vbcc.sh
ADD assets/script.exp /script.exp
ADD assets/script_s.exp /script_s.exp
ADD assets/vbcc_amiga.cmake ${VBCC}
RUN /build_vbcc.sh

# FINAL STEPS

# internal scripts
ADD assets/cmake_vbcc_amiga.sh /cmake_vbcc_amiga.sh
ADD assets/make_vbcc_amiga.sh /make_vbcc_amiga.sh
# user scripts
ADD assets/user_cmake.sh /cmake-amiga
ADD assets/user_make.sh /make-amiga

RUN chmod +x /*.sh
ENV PATH=/:${VBCC}/bin:${PATH}
