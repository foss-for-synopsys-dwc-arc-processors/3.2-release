3.2-release
===========

This repository is meant to provide a quick start for users of the ARC Linux 3.2 release. It contains source code 
for kernel and uboot in tarball format for convenience, prebuilt executable images and complete user documentation. 

Sub-directory contents overview: 

    - arc-linux-source-code: Linux kernel source code in tarball format.

    - arc-u-boot-source-code: U-boot source code in tarball format.

    - documentation-package: Release Notes and Getting Started Guide in pdf format

    - prebuilt-arc-angel4: xbf fpga image and vmlinux executable for the AA4 platform.  This platform is internal 
      to Synopsys and not available to customers.

    - prebuilt-arc-gnu-toolchain: ARC GNU toolchain prebuilt executables with README on how to install and 
      relocate the toolchain if required.

    - prebuilt-arc-haps51:  fpga image bitfile, prebuilt u-boot and vmlinux executables for Synopsys HAPS51 
      Development System

    - prebuilt-arc-initramfs: root file system which can be used with ARC Angel4, HAPS51 and ML509 
      Development Systems.

    - prebuilt-arc-ml509: fpga image bitfile and vmlinux executable for Xilinx ML509 Development System.