# linux-2.6.34-study-edition
The source code came from linux-2.6.34 released version download from https://www.kernel.org/

## appended folders
ramdisk
tools/busybox-1.31.1
rootfs

### ramdisk
ramdisk contains busybox compiled by a ubuntu linux which has a lower kernel
busybox has to be compile in a linux with lower kernel because libc version will bare lower kernel version.
Once you compiled, use command: file ./busybox see if it has GNU/Linux 2.6.24
Otherwise, if you use a version like GNU/Linux 3.2.0 which is obviously higher than the kernel 2.6.34, 
you will get a Fatal error: Kernel too old. When you run bzImage.

### busybox
tools/busybox-1.31.1 is the source code downloaded from https://busybox.net/

### rootfs
rootfs contains rebuild.sh script provided to make a linux2.6.34-ramdisk.img as your root fs

### make your kernel

#### Requirement
[1] gcc
Not higher than gcc-4.8 on your system.
Though higher version I have not tested but we'd better use a lower version.
I tried 7.5.0 gave me a tragidy.

[2] glibc
I used 2.27 which is fine.

#### build
make defconfig

make -j<cpu-cores>

For me: make -j16


### Run with qemu

My qemu verison:
QEMU emulator version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.23)
Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

In the project root
run this command

qemu-system-x86_64 -drive file=./rootfs/linux2.6.34-ramdisk.img,index=0,media=disk,format=raw -kernel ./arch/x86_64/boot/bzImage -nographic -append "root=/dev/sda console=ttyS0"

Then you will see the kernel boots, try press ENTER button and use the shell.
