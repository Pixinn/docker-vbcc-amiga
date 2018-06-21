Recipe to build a dockerized Cross-compiler targeting Commodore Amiga computers, such as the Amiga 500 or Amiga 1200.

The cross compiler is fully configured, along with a cmake toolchain. The image provides two scripts that are to be used instead of cmake and make.

# Build the container

docker build . -t **pixinn/vbcc-amiga**

The image name shall be **pixinn/vbcc-amiga**!

# Get the useful scripts

The image contains two scripts that you will use to generate the binaries:
* *cmake-amiga* instead of the native cmake
* *make-amiga* instead of the native make

> docker run --rm pixinn/vbcc-amiga cat cmake-amiga > cmake-amiga
> docker run --rm pixinn/vbcc-amiga cat make-amiga > make-amiga

# cmake-amiga

> cmake-amiga [PATH_TO_CMAKELISTS.TXT] [OPTIONS]

The *PATH* shall be provided **before** the *OPTIONS*.


## Options

* -DCONFIG=aosm68k to build for AmigaOS 3.x (**default**)
* -DCONFIG=kick13 to build for Kickstart 1.3


# make-amiga

> make-amiga [ARGS]

In order to work, a file named *SOURCES_DIR* must lay alongside the Makefile. This file is produced by *cmake-amiga*.
