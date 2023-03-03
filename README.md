# binbuild
The goal of this repo is to provide Dockerfile and Makefile scripts to generate cross-builds of various binaries for the aarch64 or armv7 architecture. These binaries should be compatible to run on certain aarch64 or armv7 platforms. 

## Usage
First build the dockerfile and give it a useful image name:
```
docker build . -t dapplegatecp/toolchain-aarch64-uclibc
```

For armv7 provide the build arg `armv7-eabihf`

```
docker build . -t dapplegatecp/toolchain-arm-uclibc --build-arg ARCH=armv7-eabihf
````

Then run the docker image being sure to specify and `output` location for built binaries:
```
docker run -it --rm -v `pwd`/output:/output dapplegatecp/toolchain-aarch64-uclibc
```
or on windows
```
docker run -it --rm -v %cd%/output:/output dapplegatecp/toolchain-aarch64-uclibc
```

This will run `make` in the /build directory inside the container and install binaries to the `output` directory. These binaries should be ready to run on the target platform.

In case you need to rebuild, or want more control over what is built. I suggest mounting the lib and usr directories as volumes and just running bash

```
 docker run -it --rm -v `pwd`/output:/output -v `pwd`/build/usr:/build/usr -v `pwd`/build/lib:/build/lib dapplegatecp/toolchain-aarch64-uclibc bash
 ```
or on windows
```
 docker run -it --rm -v %cd%/output:/output -v %cd%/build/usr:/build/usr -v %cd%/build/lib:/build/lib dapplegatecp/toolchain-aarch64-uclibc bash
 ```

 The resulting binaries will be scattered in the /output folder likely in
 /usr/bin, /usr/local/bin, /usr/local/sbin. Only the binaries that are statically linked will work, so use the `file` command to double check
```
#file ./socat
./usr/local/bin/socat: ELF 64-bit LSB executable, ARM aarch64, version 1 (SYSV), statically linked, with debug_info, not stripped
```

## Notes
I'm not a cross-compile or toolchain expert and these scripts are my best guess on building binaries for specific target hardware. Many of the Makefiles are result of trial and error to, ultimately, produce a statically linked binary that can be packaged and used on the platform as is. 

Feel free to follow the pattern outlined here to add your own Makefiles and build other binaries.  

These scripts and the resulting binaries come with no warranty or guarantee. Also, running binaries on these platforms come with security risks that could lead to compromised systems. Please use this repo and the binaries built with it at your own risk.