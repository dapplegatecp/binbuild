# binbuild
The goal of this repo is to provide Dockerfile and Makefile scripts to generate cross-builds of various binaries for the aarch64 architecture. These binaries should be compatible to run on certain aarch64 platforms. 

TODO: put together an arm32 toolchain for building other platforms.

## Usage
First build the dockerfile and give it a useful image name:
```
docker build . -t dapplegatecp/toolchain-aarch64-uclibc`
```

Then run the docker image being sure to specify and `output` location for built binaries:
```
docker run -it --rm -v `pwd`/output:/output dapplegatecp/toolchain-aarch64-uclibc
```

This will run `make` in the /build directory inside the container and install binaries to the `output` directory. These binaries should be ready to run on the target platform.

In case you need to rebuild, or want more control over what is built. I suggest mounting the lib and usr directories as volumes and just running bash

```
 docker run -it --rm -v `pwd`/output:/output -v `pwd`/build/usr:/build/usr -v `pwd`/build/lib:/build/lib dapplegatecp/toolchain-aarch64-uclibc bash
 ```

## Notes
I'm not a cross-compile or toolchain expert and these scripts are my best guess on building binaries for aarch64 hardware. Many of the Makefiles are result of trial and error to, ultimately, produce a statically linked binary that can be packaged and used on the platform as is. 

Feel free to follow the pattern outlined here to add your own Makefiles and build other binaries.  

These scripts and the resulting binaries come with no warranty or guarantee. Also, running binaries on these platforms come with security risks that could lead to compromised systems. Please use this repo and the binaries built with it at your own risk.