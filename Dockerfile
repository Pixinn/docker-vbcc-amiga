# Ref: https://blitterstudio.com/setting-up-an-amiga-cross-compiler/

FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive

# DEPENDENCIES

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential cmake lhasa unzip wget expect

# COMPILER SUITE
ENV VBCC /opt/vbcc
RUN mkdir -p ${VBCC}/bin
ADD build_vbcc.sh /build_vbcc.sh
ADD script.exp /script.exp
ADD script_s.exp /script_s.exp
RUN chmod +x /build_vbcc.sh && /build_vbcc.sh

# there is a bug in the current kick13 config
RUN sed -i -e 's/m68k-amigaos/m68k-kick13/g' ${VBCC}/config/kick13
RUN sed -i -e 's/startup13.o/minstart.o/g' ${VBCC}/config/kick13

# FINAL STEP
ENV PATH=${VBCC}/bin:${PATH}
WORKDIR /src
