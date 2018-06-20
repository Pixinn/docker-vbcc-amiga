This is a cross-compiler producing binairies targeting Commodore Amiga computers, such as the Amiga 500 or the Amiga 1200.

Your projects shall be built using **cmake**.

# Build the container

docker build . -t **vbcc_mk68**

The image name shall be **vbcc_mk68**!

# Get the scripts

The image contains two scripts that you will use to generate the binaries:
* *cmake-amiga* instead of the native cmake
* *make-amiga* instead of the native make

> docker run --rm vbcc_m68k cat cmake-amiga > cmake-amiga
> chmod +x cmake-amiga
> docker run --rm vbcc_m68k cat make-amiga > cmake-amiga
> chmod +x make-amiga

# Run cmake

> cmake-amiga [PATH_TO_CMAKELISTS.TXT] [OPTIONS]

## Options

* -DCONFIG=aosm68k to build AmigaOS 3.x (**default**)
* -DCONFIG=kick13 to build for kickstart 1.3


# Run make

> make-amiga [ARGS]

