Subject: Building meta-ti with ti-sgx-ddk-km for Yocto dunfell Kernel 5.4 fails
To: meta-ti@lists.yoctoproject.org
From: "Michael" <kakuschky@elbe-net.de>
X-Originating-Location: DE (165.225.27.83)
X-Originating-Platform: Linux Firefox 90
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 10 Aug 2021 06:39:15 -0700
Message-ID: <QWlz.1628602755891666140.xanL@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="x71xHVtTcRcEKwWqLJKy"

--x71xHVtTcRcEKwWqLJKy
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello, I'm trying to build Yocto dunfell with meta-ti and ti-sgx-ddk-km. Wi=
thout ti-sgx-ddk-km it works for me. But when add ti-sgx-ddk-km to the proj=
ect it fails.

That is the configuration I add to the Yocto local.conf

MACHINE_EXTRA_RDEPENDS +=3D "ti-sgx-ddk-km"

IMAGE_INSTALL_append =3D " ti-sgx-ddk-km ti-sgx-ddk-um libdrm libdrm-tests"

DEPENDS_remove =3D "virtual/libgl"
PREFERRED_PROVIDER_virtual/egl=3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"

PREFERRED_PROVIDER_virtual/mesa =3D "mesa-gl"
PREFERRED_PROVIDER_libgbm =3D "libgbm"
PREFERRED_PROVIDER_libgbm-dev =3D "libgbm-dev"

At the end of the mail you find the complete output from trying to build ti=
-sgx-ddk-km. It's the same error when I try to build the whole image.

Some struct definitions seems not matching. Can somebody help me to fix tha=
t? I also try it with Kernel 5.10 with a similar result

/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
94:15: error: variable 'pvr_proc_operations' has initializer but incomplete=
 type
94 | static struct proc_ops pvr_proc_operations =3D
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^~~~~~~~
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
96:3: error: 'struct proc_ops' has no member named 'proc_open'

The builds output:

bert@kubuntu-dev:~/yocto/jumpnow-3.1/bbb/build$ bitbake -c compile ti-sgx-d=
dk-km
Loading cache: 100% |######################################################=
###########################################################################=
###########################################################################=
###############################| Time: 0:00:00
Loaded 3824 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D =
"1.46.0"
BUILD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D "x86_64-linux"
NATIVELSBSTRING=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "universal"
TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D =
"arm-poky-linux-gnueabi"
MACHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D "beaglebone"
DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D "poky"
DISTRO_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "3.1.9"
TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "arm armv7a vfp=
 thumb neon callconvention-hard"
TARGET_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D =
"hard"
meta
meta-poky=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D "dunfell:43060f59ba60a0257864f1f7b25b51fac3f2d2cf"
meta-oe
meta-networking
meta-perl
meta-python=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "dunf=
ell:c38d2a74f762a792046f3d3c377827b08aade513"
meta-qt5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D "dunfell:b4d24d70aca75791902df5cd59a4f4a54aa4a125"
meta-security=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "dunfell:93232a=
e6d52b0d1968aa0ce69fa745e85e3bbc6b"
meta-jumpnow=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "dunfell:b=
3995636741be0d219a50035c98ded8b48590888"
meta-arm-toolchain
meta-arm=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D "dunfell:ceb42f2d6c9726528533728f90dc13830690e240"
meta-ti=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 =3D "dunfell:211f440f5b863078bef4e3af58be00ae187a96a5"
meta-bbb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D "dunfell:fa02d8e9079c1cc18f83527588a9dd2747293992"
meta-bert=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "dunfel=
l:43060f59ba60a0257864f1f7b25b51fac3f2d2cf"

Initialising tasks: 100% |#################################################=
###########################################################################=
###########################################################################=
###############################| Time: 0:00:00
Sstate summary: Wanted 2 Found 2 Missed 0 Current 107 (100% match, 100% com=
plete)
NOTE: Executing Tasks
ERROR: ti-sgx-ddk-km-1.17.4948957-r22x do_compile: oe_runmake failed
ERROR: ti-sgx-ddk-km-1.17.4948957-r22x do_compile: Execution of '/home/bert=
/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-=
ddk-km/1.17.4948957-r22x/temp/run.do_compile.14349' failed with exit code 1=
:
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/amba: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/avf: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/bcma: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/byteorder: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/can: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/ceph: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/clk: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/crush: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/decompress: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/dma: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/dsa: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/extcon: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/firmware: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/fpga: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/fsl: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/gpio: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/greybus: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/hsi: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/i3c: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/iio: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/input: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/irqchip: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/isdn: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/lockd: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/mailbox: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/mfd: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/mlx4: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/mlx5: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/mmc: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/mtd: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/mux: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/netfilter: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/netfilter_arp: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/netfilter_bridge: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/netfilter_ipv4: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/netfilter_ipv6: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/perf: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/phy: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/pinctrl: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/platform_data: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/power: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/qed: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/raid: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/regulator: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/remoteproc: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/reset: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/rpmsg: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/rpmsg-remotedev: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/rtc: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/sched: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/soc: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/soundwire: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/spi: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/ssb: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/sunrpc: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/ulpi: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/unaligned: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/usb: Is a directory
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/wimax: Is a directory
../config/compiler.mk:96: host gcc
../config/compiler.mk:185: target arm-poky-linux-gnueabi-gcc=C2=A0 -mno-thu=
mb-interwork -marm -fuse-ld=3Dbfd -fmacro-prefix-map=3D/home/bert/yocto/jum=
pnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.1=
7.4948957-r22x=3D/usr/src/debug/ti-sgx-ddk-km/1.17.4948957-r22x=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fdebug-prefix-map=3D/home/bert/yoc=
to/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-=
km/1.17.4948957-r22x=3D/usr/src/debug/ti-sgx-ddk-km/1.17.4948957-r22x=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fdebug-prefix-map=3D/home/be=
rt/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sg=
x-ddk-km/1.17.4948957-r22x/recipe-sysroot=3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -fdebug-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb=
/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r2=
2x/recipe-sysroot-native=3D=C2=A0 -fdebug-prefix-map=3D/home/bert/yocto/jum=
pnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source=3D/usr/src/kern=
el
******* Multiarch build: no
******* Primary arch:=C2=A0=C2=A0=C2=A0 target_armhf
******* Secondary arch:=C2=A0 none
../config/core.mk:513: $(KERNELDIR)/vmlinux does not exist. Kbuild may fail=
.
CC [M]=C2=A0 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-pok=
y-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/b=
inary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/=
linux/osfunc.o
CC [M]=C2=A0 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-pok=
y-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/b=
inary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/=
linux/proc.o
CC [M]=C2=A0 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-pok=
y-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/b=
inary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/=
linux/mm.o
CC [M]=C2=A0 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-pok=
y-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/b=
inary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/comm=
on/buffer_manager.o
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
94:15: error: variable 'pvr_proc_operations' has initializer but incomplete=
 type
94 | static struct proc_ops pvr_proc_operations =3D
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^~~~~~~~
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
96:3: error: 'struct proc_ops' has no member named 'proc_open'
96 |=C2=A0 .proc_open=C2=A0 =3D pvr_proc_open,
|=C2=A0=C2=A0 ^~~~~~~~~
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
96:16: warning: excess elements in struct initializer
96 |=C2=A0 .proc_open=C2=A0 =3D pvr_proc_open,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
96:16: note: (near initialization for 'pvr_proc_operations')
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
97:3: error: 'struct proc_ops' has no member named 'proc_read'
97 |=C2=A0 .proc_read=C2=A0 =3D seq_read,
|=C2=A0=C2=A0 ^~~~~~~~~
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
97:16: warning: excess elements in struct initializer
97 |=C2=A0 .proc_read=C2=A0 =3D seq_read,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^~~~~~~~
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
97:16: note: (near initialization for 'pvr_proc_operations')
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
98:3: error: 'struct proc_ops' has no member named 'proc_write'
98 |=C2=A0 .proc_write=C2=A0 =3D pvr_proc_write,
|=C2=A0=C2=A0 ^~~~~~~~~~
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
98:17: warning: excess elements in struct initializer
98 |=C2=A0 .proc_write=C2=A0 =3D pvr_proc_write,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
98:17: note: (near initialization for 'pvr_proc_operations')
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
99:3: error: 'struct proc_ops' has no member named 'proc_lseek'
99 |=C2=A0 .proc_lseek=C2=A0 =3D seq_lseek,
|=C2=A0=C2=A0 ^~~~~~~~~~
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
99:17: warning: excess elements in struct initializer
99 |=C2=A0 .proc_lseek=C2=A0 =3D seq_lseek,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
99:17: note: (near initialization for 'pvr_proc_operations')
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
100:3: error: 'struct proc_ops' has no member named 'proc_release'
100 |=C2=A0 .proc_release =3D seq_release,
|=C2=A0=C2=A0 ^~~~~~~~~~~~
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
100:18: warning: excess elements in struct initializer
100 |=C2=A0 .proc_release =3D seq_release,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
100:18: note: (near initialization for 'pvr_proc_operations')
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
 In function 'CreateProcEntryInDirSeq':
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
439:47: error: passing argument 4 of 'proc_create_data' from incompatible p=
ointer type [-Werror=3Dincompatible-pointer-types]
439 |=C2=A0 ppde->pde=3Dproc_create_data(name, mode, pdir, &pvr_proc_operat=
ions, ppde);
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct proc_ops *
In file included from /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beagl=
ebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eur=
asiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/s=
rvkm/env/linux/proc.c:56:
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-so=
urce/include/linux/proc_fs.h:45:31: note: expected 'const struct file_opera=
tions *' but argument is of type 'struct proc_ops *'
45 | extern struct proc_dir_entry *proc_create_data(const char *, umode_t,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
 At top level:
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:=
94:24: error: storage size of 'pvr_proc_operations' isn't known
94 | static struct proc_ops pvr_proc_operations =3D
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~=
~~~~~~~~~~~
cc1: some warnings being treated as errors
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-so=
urce/scripts/Makefile.build:261: recipe for target '/home/bert/yocto/jumpno=
w-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4=
948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/t=
arget_armhf/kbuild/services4/srvkm/env/linux/proc.o' failed
make[4]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-po=
ky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/=
binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env=
/linux/proc.o] Error 1
make[4]: *** Waiting for unfinished jobs....
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/mm.c: I=
n function '_VMallocWrapper':
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/mm.c:54=
0:13: error: too few arguments to function '__vmalloc'
540 |=C2=A0=C2=A0=C2=A0=C2=A0 pvRet =3D __vmalloc(uiBytes, gfp_mask);
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^=
~~~~~~~~
In file included from /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beagl=
ebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eur=
asiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/s=
rvkm/env/linux/mm.c:59:
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-so=
urce/include/linux/vmalloc.h:99:14: note: declared here
99 | extern void *__vmalloc(unsigned long size, gfp_t gfp_mask, pgprot_t pr=
ot);
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ^~~~~~~~~
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-so=
urce/scripts/Makefile.build:261: recipe for target '/home/bert/yocto/jumpno=
w-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4=
948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/t=
arget_armhf/kbuild/services4/srvkm/env/linux/mm.o' failed
make[4]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-po=
ky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/=
binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env=
/linux/mm.o] Error 1
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/osfunc.=
c: In function 'OSAcquirePhysPageAddr':
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/osfunc.=
c:3772:5: error: implicit declaration of function 'mmap_read_lock'; did you=
 mean '_raw_read_lock'? [-Werror=3Dimplicit-function-declaration]
3772 |=C2=A0=C2=A0=C2=A0=C2=A0 mmap_read_lock(current->mm);
|=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~
|=C2=A0=C2=A0=C2=A0=C2=A0 _raw_read_lock
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/osfunc.=
c:3971:5: error: implicit declaration of function 'mmap_read_unlock'; did y=
ou mean '_raw_read_unlock'? [-Werror=3Dimplicit-function-declaration]
3971 |=C2=A0=C2=A0=C2=A0=C2=A0 mmap_read_unlock(current->mm);
|=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~
|=C2=A0=C2=A0=C2=A0=C2=A0 _raw_read_unlock
cc1: some warnings being treated as errors
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-so=
urce/scripts/Makefile.build:261: recipe for target '/home/bert/yocto/jumpno=
w-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4=
948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/t=
arget_armhf/kbuild/services4/srvkm/env/linux/osfunc.o' failed
make[4]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-po=
ky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/=
binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env=
/linux/osfunc.o] Error 1
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-so=
urce/Makefile:1734: recipe for target '/home/bert/yocto/jumpnow-3.1/bbb/bui=
ld/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/g=
it/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/k=
build' failed
make[3]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-po=
ky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/=
binary_omap_linux_nulldrmws_release/target_armhf/kbuild] Error 2
Makefile:179: recipe for target 'sub-make' failed
make[2]: *** [sub-make] Error 2
eurasiacon/build/linux2/kbuild/kbuild.mk:56: recipe for target 'kbuild' fai=
led
make[1]: *** [kbuild] Error 2
../config/core.mk:789: recipe for target 'build' failed
make: *** [build] Error 2
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/bert/yocto/jumpnow-3.1/bbb/build=
/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/tem=
p/log.do_compile.14349
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 4 KERNEL_SRC=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/w=
ork-shared/beaglebone/kernel-source KERNELDIR=3D/home/bert/yocto/jumpnow-3.=
1/bbb/build/tmp/work-shared/beaglebone/kernel-source TARGET_PRODUCT=3Dti335=
x WINDOW_SYSTEM=3Dnulldrmws KERNEL_PATH=3D/home/bert/yocto/jumpnow-3.1/bbb/=
build/tmp/work-shared/beaglebone/kernel-source KERNEL_VERSION=3D5.4.106-g02=
3faefa70 CC=3Darm-poky-linux-gnueabi-gcc=C2=A0 -mno-thumb-interwork -marm -=
fuse-ld=3Dbfd -fmacro-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb/build/t=
mp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x=3D/us=
r/src/debug/ti-sgx-ddk-km/1.17.4948957-r22x=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -fdebug-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb=
/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r2=
2x=3D/usr/src/debug/ti-sgx-ddk-km/1.17.4948957-r22x=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fdebug-prefix-map=3D/home/bert/yocto/jumpnow-3=
.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948=
957-r22x/recipe-sysroot=3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -fdebug-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/be=
aglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/recipe-sysroot-=
native=3D=C2=A0 -fdebug-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb/build=
/tmp/work-shared/beaglebone/kernel-source=3D/usr/src/kernel LD=3Darm-poky-l=
inux-gnueabi-ld.bfd=C2=A0=C2=A0 AR=3Darm-poky-linux-gnueabi-ar=C2=A0 O=3D/h=
ome/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-buil=
d-artifacts KBUILD_EXTRA_SYMBOLS=3D
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/amba: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/avf: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/bcma: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/byteorder: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/can: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/ceph: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/clk: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/crush: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/decompress: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/dma: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/dsa: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/extcon: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/firmware: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/fpga: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/fsl: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/gpio: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/greybus: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/hsi: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/i3c: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/iio: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/input: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/irqchip: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/isdn: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/lockd: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/mailbox: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/mfd: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/mlx4: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/mlx5: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/mmc: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/mtd: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/mux: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/netfilter: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/netfilter_arp: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/netfilter_bridge: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/netfilter_ipv4: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/netfilter_ipv6: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/perf: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/phy: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/pinctrl: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/platform_data: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/power: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/qed: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/raid: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/regulator: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/remoteproc: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/reset: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/rpmsg: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/rpmsg-remotedev: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/rtc: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/sched: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/soc: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/soundwire: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/spi: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/ssb: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/sunrpc: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/ulpi: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/unaligned: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/usb: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/wimax: Is a directory
| ../config/compiler.mk:96: host gcc
| ../config/compiler.mk:185: target arm-poky-linux-gnueabi-gcc=C2=A0 -mno-t=
humb-interwork -marm -fuse-ld=3Dbfd -fmacro-prefix-map=3D/home/bert/yocto/j=
umpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1=
.17.4948957-r22x=3D/usr/src/debug/ti-sgx-ddk-km/1.17.4948957-r22x=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fdebug-prefix-map=3D/home/bert/=
yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-d=
dk-km/1.17.4948957-r22x=3D/usr/src/debug/ti-sgx-ddk-km/1.17.4948957-r22x=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fdebug-prefix-map=3D/home=
/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti=
-sgx-ddk-km/1.17.4948957-r22x/recipe-sysroot=3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -fdebug-prefix-map=3D/home/bert/yocto/jumpnow-3.1/=
bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957=
-r22x/recipe-sysroot-native=3D=C2=A0 -fdebug-prefix-map=3D/home/bert/yocto/=
jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source=3D/usr/src/k=
ernel
| ******* Multiarch build: no
| ******* Primary arch:=C2=A0=C2=A0=C2=A0 target_armhf
| ******* Secondary arch:=C2=A0 none
| ../config/core.mk:513: $(KERNELDIR)/vmlinux does not exist. Kbuild may fa=
il.
|=C2=A0=C2=A0 CC [M]=C2=A0 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/=
beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_k=
m/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/servic=
es4/srvkm/env/linux/osfunc.o
|=C2=A0=C2=A0 CC [M]=C2=A0 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/=
beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_k=
m/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/servic=
es4/srvkm/env/linux/proc.o
|=C2=A0=C2=A0 CC [M]=C2=A0 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/=
beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_k=
m/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/servic=
es4/srvkm/env/linux/mm.o
|=C2=A0=C2=A0 CC [M]=C2=A0 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/=
beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_k=
m/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/servic=
es4/srvkm/common/buffer_manager.o
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:94:15: error: variable 'pvr_proc_operations' has initializer but incomple=
te type
|=C2=A0=C2=A0=C2=A0 94 | static struct proc_ops pvr_proc_operations =3D
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:96:3: error: 'struct proc_ops' has no member named 'proc_open'
|=C2=A0=C2=A0=C2=A0 96 |=C2=A0 .proc_open=C2=A0 =3D pvr_proc_open,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ^~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:96:16: warning: excess elements in struct initializer
|=C2=A0=C2=A0=C2=A0 96 |=C2=A0 .proc_open=C2=A0 =3D pvr_proc_open,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:96:16: note: (near initialization for 'pvr_proc_operations')
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:97:3: error: 'struct proc_ops' has no member named 'proc_read'
|=C2=A0=C2=A0=C2=A0 97 |=C2=A0 .proc_read=C2=A0 =3D seq_read,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ^~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:97:16: warning: excess elements in struct initializer
|=C2=A0=C2=A0=C2=A0 97 |=C2=A0 .proc_read=C2=A0 =3D seq_read,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:97:16: note: (near initialization for 'pvr_proc_operations')
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:98:3: error: 'struct proc_ops' has no member named 'proc_write'
|=C2=A0=C2=A0=C2=A0 98 |=C2=A0 .proc_write=C2=A0 =3D pvr_proc_write,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ^~~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:98:17: warning: excess elements in struct initializer
|=C2=A0=C2=A0=C2=A0 98 |=C2=A0 .proc_write=C2=A0 =3D pvr_proc_write,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:98:17: note: (near initialization for 'pvr_proc_operations')
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:99:3: error: 'struct proc_ops' has no member named 'proc_lseek'
|=C2=A0=C2=A0=C2=A0 99 |=C2=A0 .proc_lseek=C2=A0 =3D seq_lseek,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ^~~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:99:17: warning: excess elements in struct initializer
|=C2=A0=C2=A0=C2=A0 99 |=C2=A0 .proc_lseek=C2=A0 =3D seq_lseek,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:99:17: note: (near initialization for 'pvr_proc_operations')
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:100:3: error: 'struct proc_ops' has no member named 'proc_release'
|=C2=A0=C2=A0 100 |=C2=A0 .proc_release =3D seq_release,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ^~~~~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:100:18: warning: excess elements in struct initializer
|=C2=A0=C2=A0 100 |=C2=A0 .proc_release =3D seq_release,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~=
~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:100:18: note: (near initialization for 'pvr_proc_operations')
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c: In function 'CreateProcEntryInDirSeq':
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:439:47: error: passing argument 4 of 'proc_create_data' from incompatible=
 pointer type [-Werror=3Dincompatible-pointer-types]
|=C2=A0=C2=A0 439 |=C2=A0 ppde->pde=3Dproc_create_data(name, mode, pdir, &p=
vr_proc_operations, ppde);
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct proc_ops *
| In file included from /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/bea=
glebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/e=
urasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4=
/srvkm/env/linux/proc.c:56:
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-=
source/include/linux/proc_fs.h:45:31: note: expected 'const struct file_ope=
rations *' but argument is of type 'struct proc_ops *'
|=C2=A0=C2=A0=C2=A0 45 | extern struct proc_dir_entry *proc_create_data(con=
st char *, umode_t,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~=
~~~~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c: At top level:
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:94:24: error: storage size of 'pvr_proc_operations' isn't known
|=C2=A0=C2=A0=C2=A0 94 | static struct proc_ops pvr_proc_operations =3D
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
| cc1: some warnings being treated as errors
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-=
source/scripts/Makefile.build:261: recipe for target '/home/bert/yocto/jump=
now-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17=
.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release=
/target_armhf/kbuild/services4/srvkm/env/linux/proc.o' failed
| make[4]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-=
poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiaco=
n/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/e=
nv/linux/proc.o] Error 1
| make[4]: *** Waiting for unfinished jobs....
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/mm.c:=
 In function '_VMallocWrapper':
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/mm.c:=
540:13: error: too few arguments to function '__vmalloc'
|=C2=A0=C2=A0 540 |=C2=A0=C2=A0=C2=A0=C2=A0 pvRet =3D __vmalloc(uiBytes, gf=
p_mask);
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~
| In file included from /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/bea=
glebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/e=
urasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4=
/srvkm/env/linux/mm.c:59:
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-=
source/include/linux/vmalloc.h:99:14: note: declared here
|=C2=A0=C2=A0=C2=A0 99 | extern void *__vmalloc(unsigned long size, gfp_t g=
fp_mask, pgprot_t prot);
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-=
source/scripts/Makefile.build:261: recipe for target '/home/bert/yocto/jump=
now-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17=
.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release=
/target_armhf/kbuild/services4/srvkm/env/linux/mm.o' failed
| make[4]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-=
poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiaco=
n/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/e=
nv/linux/mm.o] Error 1
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/osfun=
c.c: In function 'OSAcquirePhysPageAddr':
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/osfun=
c.c:3772:5: error: implicit declaration of function 'mmap_read_lock'; did y=
ou mean '_raw_read_lock'? [-Werror=3Dimplicit-function-declaration]
|=C2=A0 3772 |=C2=A0=C2=A0=C2=A0=C2=A0 mmap_read_lock(current->mm);
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~=
~~~
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 _raw_read_l=
ock
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/osfun=
c.c:3971:5: error: implicit declaration of function 'mmap_read_unlock'; did=
 you mean '_raw_read_unlock'? [-Werror=3Dimplicit-function-declaration]
|=C2=A0 3971 |=C2=A0=C2=A0=C2=A0=C2=A0 mmap_read_unlock(current->mm);
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~=
~~~~~
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 _raw_read_u=
nlock
| cc1: some warnings being treated as errors
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-=
source/scripts/Makefile.build:261: recipe for target '/home/bert/yocto/jump=
now-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17=
.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release=
/target_armhf/kbuild/services4/srvkm/env/linux/osfunc.o' failed
| make[4]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-=
poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiaco=
n/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/e=
nv/linux/osfunc.o] Error 1
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-=
source/Makefile:1734: recipe for target '/home/bert/yocto/jumpnow-3.1/bbb/b=
uild/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x=
/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf=
/kbuild' failed
| make[3]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-=
poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiaco=
n/binary_omap_linux_nulldrmws_release/target_armhf/kbuild] Error 2
| Makefile:179: recipe for target 'sub-make' failed
| make[2]: *** [sub-make] Error 2
| eurasiacon/build/linux2/kbuild/kbuild.mk:56: recipe for target 'kbuild' f=
ailed
| make[1]: *** [kbuild] Error 2
| ../config/core.mk:789: recipe for target 'build' failed
| make: *** [build] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beag=
lebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/temp/run.do_compi=
le.14349' failed with exit code 1:
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/amba: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/avf: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/bcma: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/byteorder: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/can: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/ceph: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/clk: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/crush: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/decompress: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/dma: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/dsa: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/extcon: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/firmware: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/fpga: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/fsl: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/gpio: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/greybus: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/hsi: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/i3c: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/iio: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/input: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/irqchip: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/isdn: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/lockd: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/mailbox: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/mfd: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/mlx4: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/mlx5: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/mmc: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/mtd: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/mux: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/netfilter: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/netfilter_arp: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/netfilter_bridge: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/netfilter_ipv4: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/netfilter_ipv6: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/perf: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/phy: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/pinctrl: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/platform_data: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/power: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/qed: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/raid: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/regulator: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/remoteproc: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/reset: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/rpmsg: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/rpmsg-remotedev: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/rtc: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/sched: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/soc: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/soundwire: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/spi: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/ssb: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/sunrpc: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/ulpi: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/unaligned: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/usb: Is a directory
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/wimax: Is a directory
| ../config/compiler.mk:96: host gcc
| ../config/compiler.mk:185: target arm-poky-linux-gnueabi-gcc=C2=A0 -mno-t=
humb-interwork -marm -fuse-ld=3Dbfd -fmacro-prefix-map=3D/home/bert/yocto/j=
umpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1=
.17.4948957-r22x=3D/usr/src/debug/ti-sgx-ddk-km/1.17.4948957-r22x=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fdebug-prefix-map=3D/home/bert/=
yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-d=
dk-km/1.17.4948957-r22x=3D/usr/src/debug/ti-sgx-ddk-km/1.17.4948957-r22x=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fdebug-prefix-map=3D/home=
/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti=
-sgx-ddk-km/1.17.4948957-r22x/recipe-sysroot=3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -fdebug-prefix-map=3D/home/bert/yocto/jumpnow-3.1/=
bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957=
-r22x/recipe-sysroot-native=3D=C2=A0 -fdebug-prefix-map=3D/home/bert/yocto/=
jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source=3D/usr/src/k=
ernel
| ******* Multiarch build: no
| ******* Primary arch:=C2=A0=C2=A0=C2=A0 target_armhf
| ******* Secondary arch:=C2=A0 none
| ../config/core.mk:513: $(KERNELDIR)/vmlinux does not exist. Kbuild may fa=
il.
|=C2=A0=C2=A0 CC [M]=C2=A0 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/=
beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_k=
m/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/servic=
es4/srvkm/env/linux/osfunc.o
|=C2=A0=C2=A0 CC [M]=C2=A0 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/=
beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_k=
m/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/servic=
es4/srvkm/env/linux/proc.o
|=C2=A0=C2=A0 CC [M]=C2=A0 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/=
beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_k=
m/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/servic=
es4/srvkm/env/linux/mm.o
|=C2=A0=C2=A0 CC [M]=C2=A0 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/=
beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_k=
m/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/servic=
es4/srvkm/common/buffer_manager.o
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:94:15: error: variable 'pvr_proc_operations' has initializer but incomple=
te type
|=C2=A0=C2=A0=C2=A0 94 | static struct proc_ops pvr_proc_operations =3D
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:96:3: error: 'struct proc_ops' has no member named 'proc_open'
|=C2=A0=C2=A0=C2=A0 96 |=C2=A0 .proc_open=C2=A0 =3D pvr_proc_open,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ^~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:96:16: warning: excess elements in struct initializer
|=C2=A0=C2=A0=C2=A0 96 |=C2=A0 .proc_open=C2=A0 =3D pvr_proc_open,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:96:16: note: (near initialization for 'pvr_proc_operations')
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:97:3: error: 'struct proc_ops' has no member named 'proc_read'
|=C2=A0=C2=A0=C2=A0 97 |=C2=A0 .proc_read=C2=A0 =3D seq_read,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ^~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:97:16: warning: excess elements in struct initializer
|=C2=A0=C2=A0=C2=A0 97 |=C2=A0 .proc_read=C2=A0 =3D seq_read,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:97:16: note: (near initialization for 'pvr_proc_operations')
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:98:3: error: 'struct proc_ops' has no member named 'proc_write'
|=C2=A0=C2=A0=C2=A0 98 |=C2=A0 .proc_write=C2=A0 =3D pvr_proc_write,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ^~~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:98:17: warning: excess elements in struct initializer
|=C2=A0=C2=A0=C2=A0 98 |=C2=A0 .proc_write=C2=A0 =3D pvr_proc_write,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:98:17: note: (near initialization for 'pvr_proc_operations')
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:99:3: error: 'struct proc_ops' has no member named 'proc_lseek'
|=C2=A0=C2=A0=C2=A0 99 |=C2=A0 .proc_lseek=C2=A0 =3D seq_lseek,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ^~~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:99:17: warning: excess elements in struct initializer
|=C2=A0=C2=A0=C2=A0 99 |=C2=A0 .proc_lseek=C2=A0 =3D seq_lseek,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:99:17: note: (near initialization for 'pvr_proc_operations')
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:100:3: error: 'struct proc_ops' has no member named 'proc_release'
|=C2=A0=C2=A0 100 |=C2=A0 .proc_release =3D seq_release,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 ^~~~~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:100:18: warning: excess elements in struct initializer
|=C2=A0=C2=A0 100 |=C2=A0 .proc_release =3D seq_release,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~=
~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:100:18: note: (near initialization for 'pvr_proc_operations')
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c: In function 'CreateProcEntryInDirSeq':
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:439:47: error: passing argument 4 of 'proc_create_data' from incompatible=
 pointer type [-Werror=3Dincompatible-pointer-types]
|=C2=A0=C2=A0 439 |=C2=A0 ppde->pde=3Dproc_create_data(name, mode, pdir, &p=
vr_proc_operations, ppde);
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct proc_ops *
| In file included from /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/bea=
glebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/e=
urasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4=
/srvkm/env/linux/proc.c:56:
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-=
source/include/linux/proc_fs.h:45:31: note: expected 'const struct file_ope=
rations *' but argument is of type 'struct proc_ops *'
|=C2=A0=C2=A0=C2=A0 45 | extern struct proc_dir_entry *proc_create_data(con=
st char *, umode_t,
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~=
~~~~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c: At top level:
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:94:24: error: storage size of 'pvr_proc_operations' isn't known
|=C2=A0=C2=A0=C2=A0 94 | static struct proc_ops pvr_proc_operations =3D
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~
| cc1: some warnings being treated as errors
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-=
source/scripts/Makefile.build:261: recipe for target '/home/bert/yocto/jump=
now-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17=
.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release=
/target_armhf/kbuild/services4/srvkm/env/linux/proc.o' failed
| make[4]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-=
poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiaco=
n/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/e=
nv/linux/proc.o] Error 1
| make[4]: *** Waiting for unfinished jobs....
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/mm.c:=
 In function '_VMallocWrapper':
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/mm.c:=
540:13: error: too few arguments to function '__vmalloc'
|=C2=A0=C2=A0 540 |=C2=A0=C2=A0=C2=A0=C2=A0 pvRet =3D __vmalloc(uiBytes, gf=
p_mask);
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~
| In file included from /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/bea=
glebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/e=
urasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4=
/srvkm/env/linux/mm.c:59:
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-=
source/include/linux/vmalloc.h:99:14: note: declared here
|=C2=A0=C2=A0=C2=A0 99 | extern void *__vmalloc(unsigned long size, gfp_t g=
fp_mask, pgprot_t prot);
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-=
source/scripts/Makefile.build:261: recipe for target '/home/bert/yocto/jump=
now-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17=
.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release=
/target_armhf/kbuild/services4/srvkm/env/linux/mm.o' failed
| make[4]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-=
poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiaco=
n/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/e=
nv/linux/mm.o] Error 1
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/osfun=
c.c: In function 'OSAcquirePhysPageAddr':
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/osfun=
c.c:3772:5: error: implicit declaration of function 'mmap_read_lock'; did y=
ou mean '_raw_read_lock'? [-Werror=3Dimplicit-function-declaration]
|=C2=A0 3772 |=C2=A0=C2=A0=C2=A0=C2=A0 mmap_read_lock(current->mm);
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~=
~~~
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 _raw_read_l=
ock
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/osfun=
c.c:3971:5: error: implicit declaration of function 'mmap_read_unlock'; did=
 you mean '_raw_read_unlock'? [-Werror=3Dimplicit-function-declaration]
|=C2=A0 3971 |=C2=A0=C2=A0=C2=A0=C2=A0 mmap_read_unlock(current->mm);
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~=
~~~~~
|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0 _raw_read_u=
nlock
| cc1: some warnings being treated as errors
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-=
source/scripts/Makefile.build:261: recipe for target '/home/bert/yocto/jump=
now-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17=
.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release=
/target_armhf/kbuild/services4/srvkm/env/linux/osfunc.o' failed
| make[4]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-=
poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiaco=
n/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/e=
nv/linux/osfunc.o] Error 1
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-=
source/Makefile:1734: recipe for target '/home/bert/yocto/jumpnow-3.1/bbb/b=
uild/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x=
/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf=
/kbuild' failed
| make[3]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-=
poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiaco=
n/binary_omap_linux_nulldrmws_release/target_armhf/kbuild] Error 2
| Makefile:179: recipe for target 'sub-make' failed
| make[2]: *** [sub-make] Error 2
| eurasiacon/build/linux2/kbuild/kbuild.mk:56: recipe for target 'kbuild' f=
ailed
| make[1]: *** [kbuild] Error 2
| ../config/core.mk:789: recipe for target 'build' failed
| make: *** [build] Error 2
| WARNING: exit code 1 from a shell command.
|
ERROR: Task (/home/bert/yocto/jumpnow-3.1/bbb/build/../../poky-dunfell/meta=
-ti/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb:do_compile) f=
ailed with exit code '1'
NOTE: Tasks Summary: Attempted 490 tasks of which 489 didn't need to be rer=
un and 1 failed.

Summary: 1 task failed:
/home/bert/yocto/jumpnow-3.1/bbb/build/../../poky-dunfell/meta-ti/recipes-b=
sp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb:do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--x71xHVtTcRcEKwWqLJKy
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello, I'm trying to build Yocto dunfell with meta-ti and ti-sgx-ddk-km. Wi=
thout ti-sgx-ddk-km it works for me. But when add ti-sgx-ddk-km to the proj=
ect it fails. <br /><br />That is the configuration I add to the Yocto loca=
l.conf<br /><br />MACHINE_EXTRA_RDEPENDS +=3D "ti-sgx-ddk-km"<br /><br />IM=
AGE_INSTALL_append =3D " ti-sgx-ddk-km ti-sgx-ddk-um libdrm libdrm-tests"<b=
r /><br />DEPENDS_remove =3D "virtual/libgl"<br />PREFERRED_PROVIDER_virtua=
l/egl=3D "ti-sgx-ddk-um"<br />PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-s=
gx-ddk-um"<br />PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"<br =
/><br />PREFERRED_PROVIDER_virtual/mesa =3D "mesa-gl"<br />PREFERRED_PROVID=
ER_libgbm =3D "libgbm"<br />PREFERRED_PROVIDER_libgbm-dev =3D "libgbm-dev"<=
br /><br />At the end of the mail you find the complete output from trying =
to build ti-sgx-ddk-km. It's the same error when I try to build the whole i=
mage.<br /><br />Some struct definitions seems not matching. Can somebody h=
elp me to fix that? I also try it with Kernel 5.10 with a similar result<br=
 /><br />/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-li=
nux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binar=
y_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linu=
x/proc.c:94:15: error: variable 'pvr_proc_operations' has initializer but i=
ncomplete type<br />&nbsp;&nbsp; 94 | static struct proc_ops pvr_proc_opera=
tions =3D<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~<br />/hom=
e/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/t=
i-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_=
nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:96:3=
: error: 'struct proc_ops' has no member named 'proc_open'<br /><br />The b=
uilds output:<br /><br />bert@kubuntu-dev:~/yocto/jumpnow-3.1/bbb/build$ bi=
tbake -c compile ti-sgx-ddk-km<br />Loading cache: 100% |##################=
###########################################################################=
###########################################################################=
###################################################################| Time: =
0:00:00<br />Loaded 3824 entries from dependency cache.<br />NOTE: Resolvin=
g any missing task queue dependencies<br /><br />Build Configuration:<br />=
BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
"1.46.0"<br />BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; =3D "x86_64-linux"<br />NATIVELSBSTRING&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; =3D "universal"<br />TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; =3D "arm-poky-linux-gnueabi"<br />MACHINE&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=
 "beaglebone"<br />DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "poky"<br />DISTRO_VERSION&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; =3D "3.1.9"<br />TUNE_FEATURES&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; =3D "arm armv7a vfp thumb neon callconvention-hard=
"<br />TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; =3D "hard"<br />meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />meta-poky&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "dunfell:43060f59ba=
60a0257864f1f7b25b51fac3f2d2cf"<br />meta-oe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />meta-networking&nbsp;=
&nbsp;&nbsp;&nbsp; &nbsp;<br />meta-perl&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br />meta-python&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "dunfell:c38d2a74f762a792046f3d3c377827b08=
aade513"<br />meta-qt5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; =3D "dunfell:b4d24d70aca75791902df5cd59a4f4a54aa4a125"<=
br />meta-security&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "dunfell:9=
3232ae6d52b0d1968aa0ce69fa745e85e3bbc6b"<br />meta-jumpnow&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "dunfell:b3995636741be0d219a50035c98ded=
8b48590888"<br />meta-arm-toolchain&nbsp; &nbsp;<br />meta-arm&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "dunfell:ce=
b42f2d6c9726528533728f90dc13830690e240"<br />meta-ti&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "dunfell:211f44=
0f5b863078bef4e3af58be00ae187a96a5"<br />meta-bbb&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D "dunfell:fa02d8e9079c1cc=
18f83527588a9dd2747293992"<br />meta-bert&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; =3D "dunfell:43060f59ba60a0257864f1f7b25b51fac3f2d2cf"=
<br /><br />Initialising tasks: 100% |#####################################=
###########################################################################=
###########################################################################=
###########################################| Time: 0:00:00<br />Sstate summ=
ary: Wanted 2 Found 2 Missed 0 Current 107 (100% match, 100% complete)<br /=
>NOTE: Executing Tasks<br />ERROR: ti-sgx-ddk-km-1.17.4948957-r22x do_compi=
le: oe_runmake failed<br />ERROR: ti-sgx-ddk-km-1.17.4948957-r22x do_compil=
e: Execution of '/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone=
-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/temp/run.do_compile.143=
49' failed with exit code 1:<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/bu=
ild/tmp/work-shared/beaglebone/kernel-source/include/linux/amba: Is a direc=
tory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beag=
lebone/kernel-source/include/linux/avf: Is a directory<br />grep: /home/ber=
t/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/incl=
ude/linux/bcma: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/=
build/tmp/work-shared/beaglebone/kernel-source/include/linux/byteorder: Is =
a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shar=
ed/beaglebone/kernel-source/include/linux/can: Is a directory<br />grep: /h=
ome/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-sour=
ce/include/linux/ceph: Is a directory<br />grep: /home/bert/yocto/jumpnow-3=
.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/clk: Is=
 a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-sha=
red/beaglebone/kernel-source/include/linux/crush: Is a directory<br />grep:=
 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-s=
ource/include/linux/decompress: Is a directory<br />grep: /home/bert/yocto/=
jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linu=
x/dma: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp=
/work-shared/beaglebone/kernel-source/include/linux/dsa: Is a directory<br =
/>grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/extcon: Is a directory<br />grep: /home/bert/yoc=
to/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/l=
inux/firmware: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/b=
uild/tmp/work-shared/beaglebone/kernel-source/include/linux/fpga: Is a dire=
ctory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/bea=
glebone/kernel-source/include/linux/fsl: Is a directory<br />grep: /home/be=
rt/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/inc=
lude/linux/gpio: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb=
/build/tmp/work-shared/beaglebone/kernel-source/include/linux/greybus: Is a=
 directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-share=
d/beaglebone/kernel-source/include/linux/hsi: Is a directory<br />grep: /ho=
me/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-sourc=
e/include/linux/i3c: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1=
/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/iio: Is a=
 directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-share=
d/beaglebone/kernel-source/include/linux/input: Is a directory<br />grep: /=
home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-sou=
rce/include/linux/irqchip: Is a directory<br />grep: /home/bert/yocto/jumpn=
ow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/isd=
n: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/wor=
k-shared/beaglebone/kernel-source/include/linux/lockd: Is a directory<br />=
grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ker=
nel-source/include/linux/mailbox: Is a directory<br />grep: /home/bert/yoct=
o/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/li=
nux/mfd: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/t=
mp/work-shared/beaglebone/kernel-source/include/linux/mlx4: Is a directory<=
br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebon=
e/kernel-source/include/linux/mlx5: Is a directory<br />grep: /home/bert/yo=
cto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/=
linux/mmc: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build=
/tmp/work-shared/beaglebone/kernel-source/include/linux/mtd: Is a directory=
<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebo=
ne/kernel-source/include/linux/mux: Is a directory<br />grep: /home/bert/yo=
cto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/=
linux/netfilter: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb=
/build/tmp/work-shared/beaglebone/kernel-source/include/linux/netfilter_arp=
: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work=
-shared/beaglebone/kernel-source/include/linux/netfilter_bridge: Is a direc=
tory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beag=
lebone/kernel-source/include/linux/netfilter_ipv4: Is a directory<br />grep=
: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-=
source/include/linux/netfilter_ipv6: Is a directory<br />grep: /home/bert/y=
octo/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include=
/linux/perf: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/bui=
ld/tmp/work-shared/beaglebone/kernel-source/include/linux/phy: Is a directo=
ry<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beagle=
bone/kernel-source/include/linux/pinctrl: Is a directory<br />grep: /home/b=
ert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/in=
clude/linux/platform_data: Is a directory<br />grep: /home/bert/yocto/jumpn=
ow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/pow=
er: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/wo=
rk-shared/beaglebone/kernel-source/include/linux/qed: Is a directory<br />g=
rep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kern=
el-source/include/linux/raid: Is a directory<br />grep: /home/bert/yocto/ju=
mpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/=
regulator: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build=
/tmp/work-shared/beaglebone/kernel-source/include/linux/remoteproc: Is a di=
rectory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/b=
eaglebone/kernel-source/include/linux/reset: Is a directory<br />grep: /hom=
e/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source=
/include/linux/rpmsg: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.=
1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/rpmsg-re=
motedev: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/t=
mp/work-shared/beaglebone/kernel-source/include/linux/rtc: Is a directory<b=
r />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone=
/kernel-source/include/linux/sched: Is a directory<br />grep: /home/bert/yo=
cto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/=
linux/soc: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build=
/tmp/work-shared/beaglebone/kernel-source/include/linux/soundwire: Is a dir=
ectory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/be=
aglebone/kernel-source/include/linux/spi: Is a directory<br />grep: /home/b=
ert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/in=
clude/linux/ssb: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb=
/build/tmp/work-shared/beaglebone/kernel-source/include/linux/sunrpc: Is a =
directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared=
/beaglebone/kernel-source/include/linux/ulpi: Is a directory<br />grep: /ho=
me/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-sourc=
e/include/linux/unaligned: Is a directory<br />grep: /home/bert/yocto/jumpn=
ow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/usb=
: Is a directory<br />grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work=
-shared/beaglebone/kernel-source/include/linux/wimax: Is a directory<br />.=
./config/compiler.mk:96: host gcc<br />../config/compiler.mk:185: target ar=
m-poky-linux-gnueabi-gcc&nbsp; -mno-thumb-interwork -marm -fuse-ld=3Dbfd -f=
macro-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebo=
ne-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x=3D/usr/src/debug/ti-s=
gx-ddk-km/1.17.4948957-r22x&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; -fdebug-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/be=
aglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x=3D/usr/src/debu=
g/ti-sgx-ddk-km/1.17.4948957-r22x&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; -fdebug-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/w=
ork/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/recipe-sy=
sroot=3D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -fdebug-prefix-=
map=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux=
-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/recipe-sysroot-native=3D&nbsp; -fd=
ebug-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/be=
aglebone/kernel-source=3D/usr/src/kernel<br />******* Multiarch build: no<b=
r />******* Primary arch:&nbsp;&nbsp;&nbsp; target_armhf<br />******* Secon=
dary arch:&nbsp; none<br />../config/core.mk:513: $(KERNELDIR)/vmlinux does=
 not exist. Kbuild may fail.<br />&nbsp; CC [M]&nbsp; /home/bert/yocto/jump=
now-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17=
.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release=
/target_armhf/kbuild/services4/srvkm/env/linux/osfunc.o<br />&nbsp; CC [M]&=
nbsp; /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux=
-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_o=
map_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/p=
roc.o<br />&nbsp; CC [M]&nbsp; /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/w=
ork/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/euras=
ia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/se=
rvices4/srvkm/env/linux/mm.o<br />&nbsp; CC [M]&nbsp; /home/bert/yocto/jump=
now-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17=
.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release=
/target_armhf/kbuild/services4/srvkm/common/buffer_manager.o<br />/home/ber=
t/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx=
-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulld=
rmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:94:15: er=
ror: variable 'pvr_proc_operations' has initializer but incomplete type<br =
/>&nbsp;&nbsp; 94 | static struct proc_ops pvr_proc_operations =3D<br />&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~<br />/home/bert/yocto/jumpn=
ow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.=
4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/=
target_armhf/kbuild/services4/srvkm/env/linux/proc.c:96:3: error: 'struct p=
roc_ops' has no member named 'proc_open'<br />&nbsp;&nbsp; 96 |&nbsp; .proc=
_open&nbsp; =3D pvr_proc_open,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; ^~~~~~~~~<br />/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beagle=
bone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eura=
siacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/sr=
vkm/env/linux/proc.c:96:16: warning: excess elements in struct initializer<=
br />&nbsp;&nbsp; 96 |&nbsp; .proc_open&nbsp; =3D pvr_proc_open,<br />&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~<br />/home/bert/yo=
cto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk=
-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws=
_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:96:16: note: =
(near initialization for 'pvr_proc_operations')<br />/home/bert/yocto/jumpn=
ow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.=
4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/=
target_armhf/kbuild/services4/srvkm/env/linux/proc.c:97:3: error: 'struct p=
roc_ops' has no member named 'proc_read'<br />&nbsp;&nbsp; 97 |&nbsp; .proc=
_read&nbsp; =3D seq_read,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
 ^~~~~~~~~<br />/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-=
poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiaco=
n/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/e=
nv/linux/proc.c:97:16: warning: excess elements in struct initializer<br />=
&nbsp;&nbsp; 97 |&nbsp; .proc_read&nbsp; =3D seq_read,<br />&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~<br />/home/bert/yocto/jumpnow-3.1=
/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.494895=
7-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target=
_armhf/kbuild/services4/srvkm/env/linux/proc.c:97:16: note: (near initializ=
ation for 'pvr_proc_operations')<br />/home/bert/yocto/jumpnow-3.1/bbb/buil=
d/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/gi=
t/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kb=
uild/services4/srvkm/env/linux/proc.c:98:3: error: 'struct proc_ops' has no=
 member named 'proc_write'<br />&nbsp;&nbsp; 98 |&nbsp; .proc_write&nbsp; =
=3D pvr_proc_write,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; ^~~~~=
~~~~~<br />/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-=
linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/bin=
ary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/li=
nux/proc.c:98:17: warning: excess elements in struct initializer<br />&nbsp=
;&nbsp; 98 |&nbsp; .proc_write&nbsp; =3D pvr_proc_write,<br />&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~<br />/home/bert/yoc=
to/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-=
km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_=
release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:98:17: note: (=
near initialization for 'pvr_proc_operations')<br />/home/bert/yocto/jumpno=
w-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4=
948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/t=
arget_armhf/kbuild/services4/srvkm/env/linux/proc.c:99:3: error: 'struct pr=
oc_ops' has no member named 'proc_lseek'<br />&nbsp;&nbsp; 99 |&nbsp; .proc=
_lseek&nbsp; =3D seq_lseek,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbs=
p; ^~~~~~~~~~<br />/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebo=
ne-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasi=
acon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvk=
m/env/linux/proc.c:99:17: warning: excess elements in struct initializer<br=
 />&nbsp;&nbsp; 99 |&nbsp; .proc_lseek&nbsp; =3D seq_lseek,<br />&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~<br />/home/bert/yocto=
/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km=
/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_re=
lease/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:99:17: note: (ne=
ar initialization for 'pvr_proc_operations')<br />/home/bert/yocto/jumpnow-=
3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.494=
8957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/tar=
get_armhf/kbuild/services4/srvkm/env/linux/proc.c:100:3: error: 'struct pro=
c_ops' has no member named 'proc_release'<br />&nbsp; 100 |&nbsp; .proc_rel=
ease =3D seq_release,<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; ^~~=
~~~~~~~~~<br />/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-p=
oky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon=
/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/en=
v/linux/proc.c:100:18: warning: excess elements in struct initializer<br />=
&nbsp; 100 |&nbsp; .proc_release =3D seq_release,<br />&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~<br />/home/bert/yocto/j=
umpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1=
.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_rele=
ase/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:100:18: note: (nea=
r initialization for 'pvr_proc_operations')<br />/home/bert/yocto/jumpnow-3=
.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948=
957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/targ=
et_armhf/kbuild/services4/srvkm/env/linux/proc.c: In function 'CreateProcEn=
tryInDirSeq':<br />/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebo=
ne-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasi=
acon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvk=
m/env/linux/proc.c:439:47: error: passing argument 4 of 'proc_create_data' =
from incompatible pointer type [-Werror=3Dincompatible-pointer-types]<br />=
&nbsp; 439 |&nbsp; ppde-&gt;pde=3Dproc_create_data(name, mode, pdir, &amp;p=
vr_proc_operations, ppde);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~~~~~~<br />&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; struct proc_ops *<br />In file included from /home/bert/yo=
cto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk=
-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws=
_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:56:<br />/hom=
e/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source=
/include/linux/proc_fs.h:45:31: note: expected 'const struct file_operation=
s *' but argument is of type 'struct proc_ops *'<br />&nbsp;&nbsp; 45 | ext=
ern struct proc_dir_entry *proc_create_data(const char *, umode_t,<br />&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~=
~<br />/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linu=
x-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_=
omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/=
proc.c: At top level:<br />/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/=
beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_k=
m/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/servic=
es4/srvkm/env/linux/proc.c:94:24: error: storage size of 'pvr_proc_operatio=
ns' isn't known<br />&nbsp;&nbsp; 94 | static struct proc_ops pvr_proc_oper=
ations =3D<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~~~~~<br />cc1: some war=
nings being treated as errors<br />/home/bert/yocto/jumpnow-3.1/bbb/build/t=
mp/work-shared/beaglebone/kernel-source/scripts/Makefile.build:261: recipe =
for target '/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky=
-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/bi=
nary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/l=
inux/proc.o' failed<br />make[4]: *** [/home/bert/yocto/jumpnow-3.1/bbb/bui=
ld/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/g=
it/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/k=
build/services4/srvkm/env/linux/proc.o] Error 1<br />make[4]: *** Waiting f=
or unfinished jobs....<br />/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work=
/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_=
km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/servi=
ces4/srvkm/env/linux/mm.c: In function '_VMallocWrapper':<br />/home/bert/y=
octo/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-dd=
k-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmw=
s_release/target_armhf/kbuild/services4/srvkm/env/linux/mm.c:540:13: error:=
 too few arguments to function '__vmalloc'<br />&nbsp; 540 |&nbsp;&nbsp;&nb=
sp;&nbsp; pvRet =3D __vmalloc(uiBytes, gfp_mask);<br />&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; ^~~~~~~~~<br />In file included from /home/bert/yocto/jumpnow-3.1=
/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.494895=
7-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target=
_armhf/kbuild/services4/srvkm/env/linux/mm.c:59:<br />/home/bert/yocto/jump=
now-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/vm=
alloc.h:99:14: note: declared here<br />&nbsp;&nbsp; 99 | extern void *__vm=
alloc(unsigned long size, gfp_t gfp_mask, pgprot_t prot);<br />&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~<br />/home/bert/yocto/jumpnow-3.1/bbb/bui=
ld/tmp/work-shared/beaglebone/kernel-source/scripts/Makefile.build:261: rec=
ipe for target '/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-=
poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiaco=
n/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/e=
nv/linux/mm.o' failed<br />make[4]: *** [/home/bert/yocto/jumpnow-3.1/bbb/b=
uild/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x=
/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf=
/kbuild/services4/srvkm/env/linux/mm.o] Error 1<br />/home/bert/yocto/jumpn=
ow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.=
4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/=
target_armhf/kbuild/services4/srvkm/env/linux/osfunc.c: In function 'OSAcqu=
irePhysPageAddr':<br />/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beag=
lebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eu=
rasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/=
srvkm/env/linux/osfunc.c:3772:5: error: implicit declaration of function 'm=
map_read_lock'; did you mean '_raw_read_lock'? [-Werror=3Dimplicit-function=
-declaration]<br />&nbsp;3772 |&nbsp;&nbsp;&nbsp;&nbsp; mmap_read_lock(curr=
ent-&gt;mm);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; =
^~~~~~~~~~~~~~<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp=
; _raw_read_lock<br />/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beagl=
ebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eur=
asiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/s=
rvkm/env/linux/osfunc.c:3971:5: error: implicit declaration of function 'mm=
ap_read_unlock'; did you mean '_raw_read_unlock'? [-Werror=3Dimplicit-funct=
ion-declaration]<br />&nbsp;3971 |&nbsp;&nbsp;&nbsp;&nbsp; mmap_read_unlock=
(current-&gt;mm);<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&n=
bsp; ^~~~~~~~~~~~~~~~<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbs=
p;&nbsp; _raw_read_unlock<br />cc1: some warnings being treated as errors<b=
r />/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kerne=
l-source/scripts/Makefile.build:261: recipe for target '/home/bert/yocto/ju=
mpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.=
17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_relea=
se/target_armhf/kbuild/services4/srvkm/env/linux/osfunc.o' failed<br />make=
[4]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-l=
inux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/bina=
ry_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/lin=
ux/osfunc.o] Error 1<br />/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-s=
hared/beaglebone/kernel-source/Makefile:1734: recipe for target '/home/bert=
/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-=
ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldr=
mws_release/target_armhf/kbuild' failed<br />make[3]: *** [/home/bert/yocto=
/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km=
/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_re=
lease/target_armhf/kbuild] Error 2<br />Makefile:179: recipe for target 'su=
b-make' failed<br />make[2]: *** [sub-make] Error 2<br />eurasiacon/build/l=
inux2/kbuild/kbuild.mk:56: recipe for target 'kbuild' failed<br />make[1]: =
*** [kbuild] Error 2<br />../config/core.mk:789: recipe for target 'build' =
failed<br />make: *** [build] Error 2<br />WARNING: exit code 1 from a shel=
l command.<br /><br />ERROR: Logfile of failure stored in: /home/bert/yocto=
/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km=
/1.17.4948957-r22x/temp/log.do_compile.14349<br />Log data follows:<br />| =
DEBUG: Executing shell function do_compile<br />| NOTE: make -j 4 KERNEL_SR=
C=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kerne=
l-source KERNELDIR=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared=
/beaglebone/kernel-source TARGET_PRODUCT=3Dti335x WINDOW_SYSTEM=3Dnulldrmws=
 KERNEL_PATH=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beagl=
ebone/kernel-source KERNEL_VERSION=3D5.4.106-g023faefa70 CC=3Darm-poky-linu=
x-gnueabi-gcc&nbsp; -mno-thumb-interwork -marm -fuse-ld=3Dbfd -fmacro-prefi=
x-map=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-lin=
ux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x=3D/usr/src/debug/ti-sgx-ddk-km/1=
.17.4948957-r22x&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -fdebug=
-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-po=
ky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x=3D/usr/src/debug/ti-sgx-dd=
k-km/1.17.4948957-r22x&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -=
fdebug-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beagleb=
one-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/recipe-sysroot=3D&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -fdebug-prefix-map=3D/home=
/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti=
-sgx-ddk-km/1.17.4948957-r22x/recipe-sysroot-native=3D&nbsp; -fdebug-prefix=
-map=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ke=
rnel-source=3D/usr/src/kernel LD=3Darm-poky-linux-gnueabi-ld.bfd&nbsp;&nbsp=
; AR=3Darm-poky-linux-gnueabi-ar&nbsp; O=3D/home/bert/yocto/jumpnow-3.1/bbb=
/build/tmp/work-shared/beaglebone/kernel-build-artifacts KBUILD_EXTRA_SYMBO=
LS=3D<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/b=
eaglebone/kernel-source/include/linux/amba: Is a directory<br />| grep: /ho=
me/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-sourc=
e/include/linux/avf: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3=
.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/bcma: I=
s a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-=
shared/beaglebone/kernel-source/include/linux/byteorder: Is a directory<br =
/>| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone=
/kernel-source/include/linux/can: Is a directory<br />| grep: /home/bert/yo=
cto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/=
linux/ceph: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/bu=
ild/tmp/work-shared/beaglebone/kernel-source/include/linux/clk: Is a direct=
ory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/bea=
glebone/kernel-source/include/linux/crush: Is a directory<br />| grep: /hom=
e/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source=
/include/linux/decompress: Is a directory<br />| grep: /home/bert/yocto/jum=
pnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/d=
ma: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/=
work-shared/beaglebone/kernel-source/include/linux/dsa: Is a directory<br /=
>| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/=
kernel-source/include/linux/extcon: Is a directory<br />| grep: /home/bert/=
yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/includ=
e/linux/firmware: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/=
bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/fpga: Is a=
 directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-sha=
red/beaglebone/kernel-source/include/linux/fsl: Is a directory<br />| grep:=
 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-s=
ource/include/linux/gpio: Is a directory<br />| grep: /home/bert/yocto/jump=
now-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/gr=
eybus: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/t=
mp/work-shared/beaglebone/kernel-source/include/linux/hsi: Is a directory<b=
r />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebo=
ne/kernel-source/include/linux/i3c: Is a directory<br />| grep: /home/bert/=
yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/includ=
e/linux/iio: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/b=
uild/tmp/work-shared/beaglebone/kernel-source/include/linux/input: Is a dir=
ectory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/=
beaglebone/kernel-source/include/linux/irqchip: Is a directory<br />| grep:=
 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-s=
ource/include/linux/isdn: Is a directory<br />| grep: /home/bert/yocto/jump=
now-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/lo=
ckd: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp=
/work-shared/beaglebone/kernel-source/include/linux/mailbox: Is a directory=
<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beagle=
bone/kernel-source/include/linux/mfd: Is a directory<br />| grep: /home/ber=
t/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/incl=
ude/linux/mlx4: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bb=
b/build/tmp/work-shared/beaglebone/kernel-source/include/linux/mlx5: Is a d=
irectory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-share=
d/beaglebone/kernel-source/include/linux/mmc: Is a directory<br />| grep: /=
home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-sou=
rce/include/linux/mtd: Is a directory<br />| grep: /home/bert/yocto/jumpnow=
-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/mux: =
Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work=
-shared/beaglebone/kernel-source/include/linux/netfilter: Is a directory<br=
 />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebon=
e/kernel-source/include/linux/netfilter_arp: Is a directory<br />| grep: /h=
ome/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-sour=
ce/include/linux/netfilter_bridge: Is a directory<br />| grep: /home/bert/y=
octo/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include=
/linux/netfilter_ipv4: Is a directory<br />| grep: /home/bert/yocto/jumpnow=
-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/netfi=
lter_ipv6: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/bui=
ld/tmp/work-shared/beaglebone/kernel-source/include/linux/perf: Is a direct=
ory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/bea=
glebone/kernel-source/include/linux/phy: Is a directory<br />| grep: /home/=
bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/i=
nclude/linux/pinctrl: Is a directory<br />| grep: /home/bert/yocto/jumpnow-=
3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/platfo=
rm_data: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build=
/tmp/work-shared/beaglebone/kernel-source/include/linux/power: Is a directo=
ry<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beag=
lebone/kernel-source/include/linux/qed: Is a directory<br />| grep: /home/b=
ert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/in=
clude/linux/raid: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/=
bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/regulator:=
 Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/wor=
k-shared/beaglebone/kernel-source/include/linux/remoteproc: Is a directory<=
br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beagleb=
one/kernel-source/include/linux/reset: Is a directory<br />| grep: /home/be=
rt/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/inc=
lude/linux/rpmsg: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/=
bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/rpmsg-remo=
tedev: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/t=
mp/work-shared/beaglebone/kernel-source/include/linux/rtc: Is a directory<b=
r />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebo=
ne/kernel-source/include/linux/sched: Is a directory<br />| grep: /home/ber=
t/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/incl=
ude/linux/soc: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb=
/build/tmp/work-shared/beaglebone/kernel-source/include/linux/soundwire: Is=
 a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-s=
hared/beaglebone/kernel-source/include/linux/spi: Is a directory<br />| gre=
p: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel=
-source/include/linux/ssb: Is a directory<br />| grep: /home/bert/yocto/jum=
pnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/s=
unrpc: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/t=
mp/work-shared/beaglebone/kernel-source/include/linux/ulpi: Is a directory<=
br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beagleb=
one/kernel-source/include/linux/unaligned: Is a directory<br />| grep: /hom=
e/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source=
/include/linux/usb: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.=
1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/wimax: I=
s a directory<br />| ../config/compiler.mk:96: host gcc<br />| ../config/co=
mpiler.mk:185: target arm-poky-linux-gnueabi-gcc&nbsp; -mno-thumb-interwork=
 -marm -fuse-ld=3Dbfd -fmacro-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb=
/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r2=
2x=3D/usr/src/debug/ti-sgx-ddk-km/1.17.4948957-r22x&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; -fdebug-prefix-map=3D/home/bert/yocto/jumpnow-3=
.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948=
957-r22x=3D/usr/src/debug/ti-sgx-ddk-km/1.17.4948957-r22x&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -fdebug-prefix-map=3D/home/bert/yocto/jum=
pnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.1=
7.4948957-r22x/recipe-sysroot=3D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; -fdebug-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/wo=
rk/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/recipe-sys=
root-native=3D&nbsp; -fdebug-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb/=
build/tmp/work-shared/beaglebone/kernel-source=3D/usr/src/kernel<br />| ***=
**** Multiarch build: no<br />| ******* Primary arch:&nbsp;&nbsp;&nbsp; tar=
get_armhf<br />| ******* Secondary arch:&nbsp; none<br />| ../config/core.m=
k:513: $(KERNELDIR)/vmlinux does not exist. Kbuild may fail.<br />|&nbsp;&n=
bsp; CC [M]&nbsp; /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebon=
e-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasia=
con/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm=
/env/linux/osfunc.o<br />|&nbsp;&nbsp; CC [M]&nbsp; /home/bert/yocto/jumpno=
w-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4=
948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/t=
arget_armhf/kbuild/services4/srvkm/env/linux/proc.o<br />|&nbsp;&nbsp; CC [=
M]&nbsp; /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-li=
nux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binar=
y_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linu=
x/mm.o<br />|&nbsp;&nbsp; CC [M]&nbsp; /home/bert/yocto/jumpnow-3.1/bbb/bui=
ld/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/g=
it/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/k=
build/services4/srvkm/common/buffer_manager.o<br />| /home/bert/yocto/jumpn=
ow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.=
4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/=
target_armhf/kbuild/services4/srvkm/env/linux/proc.c:94:15: error: variable=
 'pvr_proc_operations' has initializer but incomplete type<br />|&nbsp;&nbs=
p;&nbsp; 94 | static struct proc_ops pvr_proc_operations =3D<br />|&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~<br />| /home/bert/yocto/ju=
mpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.=
17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_relea=
se/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:96:3: error: 'struc=
t proc_ops' has no member named 'proc_open'<br />|&nbsp;&nbsp;&nbsp; 96 |&n=
bsp; .proc_open&nbsp; =3D pvr_proc_open,<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; |&nbsp;&nbsp; ^~~~~~~~~<br />| /home/bert/yocto/jumpnow-3.1/bbb/bu=
ild/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/=
git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/=
kbuild/services4/srvkm/env/linux/proc.c:96:16: warning: excess elements in =
struct initializer<br />|&nbsp;&nbsp;&nbsp; 96 |&nbsp; .proc_open&nbsp; =3D=
 pvr_proc_open,<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 ^~~~~~~~~~~~~<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beagl=
ebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eur=
asiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/s=
rvkm/env/linux/proc.c:96:16: note: (near initialization for 'pvr_proc_opera=
tions')<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-p=
oky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon=
/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/en=
v/linux/proc.c:97:3: error: 'struct proc_ops' has no member named 'proc_rea=
d'<br />|&nbsp;&nbsp;&nbsp; 97 |&nbsp; .proc_read&nbsp; =3D seq_read,<br />=
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; ^~~~~~~~~<br />| /home/=
bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-=
sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nu=
lldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:97:16:=
 warning: excess elements in struct initializer<br />|&nbsp;&nbsp;&nbsp; 97=
 |&nbsp; .proc_read&nbsp; =3D seq_read,<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~<br />| /home/bert/yocto/jumpnow-3.1/bbb/b=
uild/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x=
/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf=
/kbuild/services4/srvkm/env/linux/proc.c:97:16: note: (near initialization =
for 'pvr_proc_operations')<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tm=
p/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eu=
rasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild=
/services4/srvkm/env/linux/proc.c:98:3: error: 'struct proc_ops' has no mem=
ber named 'proc_write'<br />|&nbsp;&nbsp;&nbsp; 98 |&nbsp; .proc_write&nbsp=
; =3D pvr_proc_write,<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nb=
sp; ^~~~~~~~~~<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beagl=
ebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eur=
asiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/s=
rvkm/env/linux/proc.c:98:17: warning: excess elements in struct initializer=
<br />|&nbsp;&nbsp;&nbsp; 98 |&nbsp; .proc_write&nbsp; =3D pvr_proc_write,<=
br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~=
~~~~~<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-pok=
y-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/b=
inary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/=
linux/proc.c:98:17: note: (near initialization for 'pvr_proc_operations')<b=
r />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux=
-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_o=
map_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/p=
roc.c:99:3: error: 'struct proc_ops' has no member named 'proc_lseek'<br />=
|&nbsp;&nbsp;&nbsp; 99 |&nbsp; .proc_lseek&nbsp; =3D seq_lseek,<br />|&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; ^~~~~~~~~~<br />| /home/bert/=
yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-d=
dk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrm=
ws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:99:17: warn=
ing: excess elements in struct initializer<br />|&nbsp;&nbsp;&nbsp; 99 |&nb=
sp; .proc_lseek&nbsp; =3D seq_lseek,<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~<br />| /home/bert/yocto/jumpnow-3.1/b=
bb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-=
r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_a=
rmhf/kbuild/services4/srvkm/env/linux/proc.c:99:17: note: (near initializat=
ion for 'pvr_proc_operations')<br />| /home/bert/yocto/jumpnow-3.1/bbb/buil=
d/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/gi=
t/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kb=
uild/services4/srvkm/env/linux/proc.c:100:3: error: 'struct proc_ops' has n=
o member named 'proc_release'<br />|&nbsp;&nbsp; 100 |&nbsp; .proc_release =
=3D seq_release,<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; ^=
~~~~~~~~~~~<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebo=
ne-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasi=
acon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvk=
m/env/linux/proc.c:100:18: warning: excess elements in struct initializer<b=
r />|&nbsp;&nbsp; 100 |&nbsp; .proc_release =3D seq_release,<br />|&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~<br />=
| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.=
c:100:18: note: (near initialization for 'pvr_proc_operations')<br />| /hom=
e/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/t=
i-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_=
nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c: In =
function 'CreateProcEntryInDirSeq':<br />| /home/bert/yocto/jumpnow-3.1/bbb=
/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r2=
2x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_arm=
hf/kbuild/services4/srvkm/env/linux/proc.c:439:47: error: passing argument =
4 of 'proc_create_data' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]<br />|&nbsp;&nbsp; 439 |&nbsp; ppde-&gt;pde=3Dproc_creat=
e_data(name, mode, pdir, &amp;pvr_proc_operations, ppde);<br />|&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ^~~~~~~~~~~~~~~~~~~~<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br />|&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct=
 proc_ops *<br />| In file included from /home/bert/yocto/jumpnow-3.1/bbb/b=
uild/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x=
/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf=
/kbuild/services4/srvkm/env/linux/proc.c:56:<br />| /home/bert/yocto/jumpno=
w-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/proc=
_fs.h:45:31: note: expected 'const struct file_operations *' but argument i=
s of type 'struct proc_ops *'<br />|&nbsp;&nbsp;&nbsp; 45 | extern struct p=
roc_dir_entry *proc_create_data(const char *, umode_t,<br />|&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~~<br =
/>| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-g=
nueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_oma=
p_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/pro=
c.c: At top level:<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/b=
eaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km=
/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/service=
s4/srvkm/env/linux/proc.c:94:24: error: storage size of 'pvr_proc_operation=
s' isn't known<br />|&nbsp;&nbsp;&nbsp; 94 | static struct proc_ops pvr_pro=
c_operations =3D<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~~~~~<br />=
| cc1: some warnings being treated as errors<br />| /home/bert/yocto/jumpno=
w-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/scripts/Makefile.b=
uild:261: recipe for target '/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/wor=
k/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia=
_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/serv=
ices4/srvkm/env/linux/proc.o' failed<br />| make[4]: *** [/home/bert/yocto/=
jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/=
1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_rel=
ease/target_armhf/kbuild/services4/srvkm/env/linux/proc.o] Error 1<br />| m=
ake[4]: *** Waiting for unfinished jobs....<br />| /home/bert/yocto/jumpnow=
-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.49=
48957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/ta=
rget_armhf/kbuild/services4/srvkm/env/linux/mm.c: In function '_VMallocWrap=
per':<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-pok=
y-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/b=
inary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/=
linux/mm.c:540:13: error: too few arguments to function '__vmalloc'<br />|&=
nbsp;&nbsp; 540 |&nbsp;&nbsp;&nbsp;&nbsp; pvRet =3D __vmalloc(uiBytes, gfp_=
mask);<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~<br />| In file i=
ncluded from /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-pok=
y-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/b=
inary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/=
linux/mm.c:59:<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-share=
d/beaglebone/kernel-source/include/linux/vmalloc.h:99:14: note: declared he=
re<br />|&nbsp;&nbsp;&nbsp; 99 | extern void *__vmalloc(unsigned long size,=
 gfp_t gfp_mask, pgprot_t prot);<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ^~~~~~~~~<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shar=
ed/beaglebone/kernel-source/scripts/Makefile.build:261: recipe for target '=
/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_li=
nux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/mm.o' f=
ailed<br />| make[4]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/=
beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_k=
m/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/servic=
es4/srvkm/env/linux/mm.o] Error 1<br />| /home/bert/yocto/jumpnow-3.1/bbb/b=
uild/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x=
/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf=
/kbuild/services4/srvkm/env/linux/osfunc.c: In function 'OSAcquirePhysPageA=
ddr':<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-pok=
y-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/b=
inary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/=
linux/osfunc.c:3772:5: error: implicit declaration of function 'mmap_read_l=
ock'; did you mean '_raw_read_lock'? [-Werror=3Dimplicit-function-declarati=
on]<br />|&nbsp; 3772 |&nbsp;&nbsp;&nbsp;&nbsp; mmap_read_lock(current-&gt;=
mm);<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; ^=
~~~~~~~~~~~~~<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp=
;&nbsp; _raw_read_lock<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/wo=
rk/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasi=
a_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/ser=
vices4/srvkm/env/linux/osfunc.c:3971:5: error: implicit declaration of func=
tion 'mmap_read_unlock'; did you mean '_raw_read_unlock'? [-Werror=3Dimplic=
it-function-declaration]<br />|&nbsp; 3971 |&nbsp;&nbsp;&nbsp;&nbsp; mmap_r=
ead_unlock(current-&gt;mm);<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nb=
sp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~~<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; _raw_read_unlock<br />| cc1: some warnings=
 being treated as errors<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/=
work-shared/beaglebone/kernel-source/scripts/Makefile.build:261: recipe for=
 target '/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-li=
nux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binar=
y_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linu=
x/osfunc.o' failed<br />| make[4]: *** [/home/bert/yocto/jumpnow-3.1/bbb/bu=
ild/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/=
git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/=
kbuild/services4/srvkm/env/linux/osfunc.o] Error 1<br />| /home/bert/yocto/=
jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/Makefile:173=
4: recipe for target '/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beagl=
ebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eur=
asiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild' failed<br =
/>| make[3]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebon=
e-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasia=
con/binary_omap_linux_nulldrmws_release/target_armhf/kbuild] Error 2<br />|=
 Makefile:179: recipe for target 'sub-make' failed<br />| make[2]: *** [sub=
-make] Error 2<br />| eurasiacon/build/linux2/kbuild/kbuild.mk:56: recipe f=
or target 'kbuild' failed<br />| make[1]: *** [kbuild] Error 2<br />| ../co=
nfig/core.mk:789: recipe for target 'build' failed<br />| make: *** [build]=
 Error 2<br />| ERROR: oe_runmake failed<br />| WARNING: exit code 1 from a=
 shell command.<br />| ERROR: Execution of '/home/bert/yocto/jumpnow-3.1/bb=
b/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r=
22x/temp/run.do_compile.14349' failed with exit code 1:<br />| grep: /home/=
bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/i=
nclude/linux/amba: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1=
/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/avf: Is a=
 directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-sha=
red/beaglebone/kernel-source/include/linux/bcma: Is a directory<br />| grep=
: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-=
source/include/linux/byteorder: Is a directory<br />| grep: /home/bert/yoct=
o/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/li=
nux/can: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build=
/tmp/work-shared/beaglebone/kernel-source/include/linux/ceph: Is a director=
y<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beagl=
ebone/kernel-source/include/linux/clk: Is a directory<br />| grep: /home/be=
rt/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/inc=
lude/linux/crush: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/=
bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/decompress=
: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/wo=
rk-shared/beaglebone/kernel-source/include/linux/dma: Is a directory<br />|=
 grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ke=
rnel-source/include/linux/dsa: Is a directory<br />| grep: /home/bert/yocto=
/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/lin=
ux/extcon: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/bui=
ld/tmp/work-shared/beaglebone/kernel-source/include/linux/firmware: Is a di=
rectory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared=
/beaglebone/kernel-source/include/linux/fpga: Is a directory<br />| grep: /=
home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-sou=
rce/include/linux/fsl: Is a directory<br />| grep: /home/bert/yocto/jumpnow=
-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/gpio:=
 Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/wor=
k-shared/beaglebone/kernel-source/include/linux/greybus: Is a directory<br =
/>| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone=
/kernel-source/include/linux/hsi: Is a directory<br />| grep: /home/bert/yo=
cto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/=
linux/i3c: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/bui=
ld/tmp/work-shared/beaglebone/kernel-source/include/linux/iio: Is a directo=
ry<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beag=
lebone/kernel-source/include/linux/input: Is a directory<br />| grep: /home=
/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/=
include/linux/irqchip: Is a directory<br />| grep: /home/bert/yocto/jumpnow=
-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/isdn:=
 Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/wor=
k-shared/beaglebone/kernel-source/include/linux/lockd: Is a directory<br />=
| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/k=
ernel-source/include/linux/mailbox: Is a directory<br />| grep: /home/bert/=
yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/includ=
e/linux/mfd: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/b=
uild/tmp/work-shared/beaglebone/kernel-source/include/linux/mlx4: Is a dire=
ctory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/b=
eaglebone/kernel-source/include/linux/mlx5: Is a directory<br />| grep: /ho=
me/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-sourc=
e/include/linux/mmc: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3=
.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/mtd: Is=
 a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-s=
hared/beaglebone/kernel-source/include/linux/mux: Is a directory<br />| gre=
p: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel=
-source/include/linux/netfilter: Is a directory<br />| grep: /home/bert/yoc=
to/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/l=
inux/netfilter_arp: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.=
1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/netfilte=
r_bridge: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/buil=
d/tmp/work-shared/beaglebone/kernel-source/include/linux/netfilter_ipv4: Is=
 a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-s=
hared/beaglebone/kernel-source/include/linux/netfilter_ipv6: Is a directory=
<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beagle=
bone/kernel-source/include/linux/perf: Is a directory<br />| grep: /home/be=
rt/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/inc=
lude/linux/phy: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bb=
b/build/tmp/work-shared/beaglebone/kernel-source/include/linux/pinctrl: Is =
a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-sh=
ared/beaglebone/kernel-source/include/linux/platform_data: Is a directory<b=
r />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebo=
ne/kernel-source/include/linux/power: Is a directory<br />| grep: /home/ber=
t/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/incl=
ude/linux/qed: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb=
/build/tmp/work-shared/beaglebone/kernel-source/include/linux/raid: Is a di=
rectory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared=
/beaglebone/kernel-source/include/linux/regulator: Is a directory<br />| gr=
ep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kerne=
l-source/include/linux/remoteproc: Is a directory<br />| grep: /home/bert/y=
octo/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include=
/linux/reset: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/=
build/tmp/work-shared/beaglebone/kernel-source/include/linux/rpmsg: Is a di=
rectory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared=
/beaglebone/kernel-source/include/linux/rpmsg-remotedev: Is a directory<br =
/>| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone=
/kernel-source/include/linux/rtc: Is a directory<br />| grep: /home/bert/yo=
cto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/=
linux/sched: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/b=
uild/tmp/work-shared/beaglebone/kernel-source/include/linux/soc: Is a direc=
tory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/be=
aglebone/kernel-source/include/linux/soundwire: Is a directory<br />| grep:=
 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-s=
ource/include/linux/spi: Is a directory<br />| grep: /home/bert/yocto/jumpn=
ow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/ssb=
: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/wo=
rk-shared/beaglebone/kernel-source/include/linux/sunrpc: Is a directory<br =
/>| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone=
/kernel-source/include/linux/ulpi: Is a directory<br />| grep: /home/bert/y=
octo/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-source/include=
/linux/unaligned: Is a directory<br />| grep: /home/bert/yocto/jumpnow-3.1/=
bbb/build/tmp/work-shared/beaglebone/kernel-source/include/linux/usb: Is a =
directory<br />| grep: /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shar=
ed/beaglebone/kernel-source/include/linux/wimax: Is a directory<br />| ../c=
onfig/compiler.mk:96: host gcc<br />| ../config/compiler.mk:185: target arm=
-poky-linux-gnueabi-gcc&nbsp; -mno-thumb-interwork -marm -fuse-ld=3Dbfd -fm=
acro-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebon=
e-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x=3D/usr/src/debug/ti-sg=
x-ddk-km/1.17.4948957-r22x&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; -fdebug-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/bea=
glebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x=3D/usr/src/debug=
/ti-sgx-ddk-km/1.17.4948957-r22x&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; -fdebug-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/wo=
rk/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/recipe-sys=
root=3D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -fdebug-prefix-m=
ap=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-=
gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/recipe-sysroot-native=3D&nbsp; -fde=
bug-prefix-map=3D/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/bea=
glebone/kernel-source=3D/usr/src/kernel<br />| ******* Multiarch build: no<=
br />| ******* Primary arch:&nbsp;&nbsp;&nbsp; target_armhf<br />| ******* =
Secondary arch:&nbsp; none<br />| ../config/core.mk:513: $(KERNELDIR)/vmlin=
ux does not exist. Kbuild may fail.<br />|&nbsp;&nbsp; CC [M]&nbsp; /home/b=
ert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-s=
gx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nul=
ldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/osfunc.o<br />=
|&nbsp;&nbsp; CC [M]&nbsp; /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/=
beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_k=
m/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/servic=
es4/srvkm/env/linux/proc.o<br />|&nbsp;&nbsp; CC [M]&nbsp; /home/bert/yocto=
/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km=
/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_re=
lease/target_armhf/kbuild/services4/srvkm/env/linux/mm.o<br />|&nbsp;&nbsp;=
 CC [M]&nbsp; /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-po=
ky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/=
binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/com=
mon/buffer_manager.o<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work=
/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_=
km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/servi=
ces4/srvkm/env/linux/proc.c:94:15: error: variable 'pvr_proc_operations' ha=
s initializer but incomplete type<br />|&nbsp;&nbsp;&nbsp; 94 | static stru=
ct proc_ops pvr_proc_operations =3D<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ^~~~~~~~<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/w=
ork/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/euras=
ia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/se=
rvices4/srvkm/env/linux/proc.c:96:3: error: 'struct proc_ops' has no member=
 named 'proc_open'<br />|&nbsp;&nbsp;&nbsp; 96 |&nbsp; .proc_open&nbsp; =3D=
 pvr_proc_open,<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; ^~=
~~~~~~~<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-p=
oky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon=
/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/en=
v/linux/proc.c:96:16: warning: excess elements in struct initializer<br />|=
&nbsp;&nbsp;&nbsp; 96 |&nbsp; .proc_open&nbsp; =3D pvr_proc_open,<br />|&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~<br />| /ho=
me/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/=
ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux=
_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:96:=
16: note: (near initialization for 'pvr_proc_operations')<br />| /home/bert=
/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-=
ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldr=
mws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:97:3: erro=
r: 'struct proc_ops' has no member named 'proc_read'<br />|&nbsp;&nbsp;&nbs=
p; 97 |&nbsp; .proc_read&nbsp; =3D seq_read,<br />|&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; |&nbsp;&nbsp; ^~~~~~~~~<br />| /home/bert/yocto/jumpnow-3.1/bb=
b/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r=
22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_ar=
mhf/kbuild/services4/srvkm/env/linux/proc.c:97:16: warning: excess elements=
 in struct initializer<br />|&nbsp;&nbsp;&nbsp; 97 |&nbsp; .proc_read&nbsp;=
 =3D seq_read,<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
^~~~~~~~<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-=
poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiaco=
n/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/e=
nv/linux/proc.c:97:16: note: (near initialization for 'pvr_proc_operations'=
)<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-li=
nux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binar=
y_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linu=
x/proc.c:98:3: error: 'struct proc_ops' has no member named 'proc_write'<br=
 />|&nbsp;&nbsp;&nbsp; 98 |&nbsp; .proc_write&nbsp; =3D pvr_proc_write,<br =
/>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; ^~~~~~~~~~<br />| /ho=
me/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/=
ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux=
_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:98:=
17: warning: excess elements in struct initializer<br />|&nbsp;&nbsp;&nbsp;=
 98 |&nbsp; .proc_write&nbsp; =3D pvr_proc_write,<br />|&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~<br />| /home/bert/y=
octo/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-dd=
k-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmw=
s_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:98:17: note:=
 (near initialization for 'pvr_proc_operations')<br />| /home/bert/yocto/ju=
mpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.=
17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_relea=
se/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:99:3: error: 'struc=
t proc_ops' has no member named 'proc_lseek'<br />|&nbsp;&nbsp;&nbsp; 99 |&=
nbsp; .proc_lseek&nbsp; =3D seq_lseek,<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; ^~~~~~~~~~<br />| /home/bert/yocto/jumpnow-3.1/bbb/bui=
ld/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/g=
it/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/k=
build/services4/srvkm/env/linux/proc.c:99:17: warning: excess elements in s=
truct initializer<br />|&nbsp;&nbsp;&nbsp; 99 |&nbsp; .proc_lseek&nbsp; =3D=
 seq_lseek,<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ^~~~~~~~~<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beagleb=
one-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/euras=
iacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srv=
km/env/linux/proc.c:99:17: note: (near initialization for 'pvr_proc_operati=
ons')<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-pok=
y-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/b=
inary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/=
linux/proc.c:100:3: error: 'struct proc_ops' has no member named 'proc_rele=
ase'<br />|&nbsp;&nbsp; 100 |&nbsp; .proc_release =3D seq_release,<br />|&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; ^~~~~~~~~~~~<br />| /home/=
bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-=
sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nu=
lldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c:100:18=
: warning: excess elements in struct initializer<br />|&nbsp;&nbsp; 100 |&n=
bsp; .proc_release =3D seq_release,<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~<br />| /home/bert/yocto/jumpno=
w-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4=
948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/t=
arget_armhf/kbuild/services4/srvkm/env/linux/proc.c:100:18: note: (near ini=
tialization for 'pvr_proc_operations')<br />| /home/bert/yocto/jumpnow-3.1/=
bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957=
-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_=
armhf/kbuild/services4/srvkm/env/linux/proc.c: In function 'CreateProcEntry=
InDirSeq':<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebon=
e-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasia=
con/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm=
/env/linux/proc.c:439:47: error: passing argument 4 of 'proc_create_data' f=
rom incompatible pointer type [-Werror=3Dincompatible-pointer-types]<br />|=
&nbsp;&nbsp; 439 |&nbsp; ppde-&gt;pde=3Dproc_create_data(name, mode, pdir, =
&amp;pvr_proc_operations, ppde);<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~~~~~~<=
br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; |<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct proc_ops *<br />| In fil=
e included from /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-=
poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiaco=
n/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/e=
nv/linux/proc.c:56:<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-=
shared/beaglebone/kernel-source/include/linux/proc_fs.h:45:31: note: expect=
ed 'const struct file_operations *' but argument is of type 'struct proc_op=
s *'<br />|&nbsp;&nbsp;&nbsp; 45 | extern struct proc_dir_entry *proc_creat=
e_data(const char *, umode_t,<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~~<br />| /home/bert/yocto/jump=
now-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17=
.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release=
/target_armhf/kbuild/services4/srvkm/env/linux/proc.c: At top level:<br />|=
 /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnue=
abi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_l=
inux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/proc.c=
:94:24: error: storage size of 'pvr_proc_operations' isn't known<br />|&nbs=
p;&nbsp;&nbsp; 94 | static struct proc_ops pvr_proc_operations =3D<br />|&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~~~~~<br />| cc1: some warnings bein=
g treated as errors<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-=
shared/beaglebone/kernel-source/scripts/Makefile.build:261: recipe for targ=
et '/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-g=
nueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_oma=
p_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/pro=
c.o' failed<br />| make[4]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp=
/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eur=
asia_km/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/=
services4/srvkm/env/linux/proc.o] Error 1<br />| make[4]: *** Waiting for u=
nfinished jobs....<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/b=
eaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km=
/eurasiacon/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/service=
s4/srvkm/env/linux/mm.c: In function '_VMallocWrapper':<br />| /home/bert/y=
octo/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-dd=
k-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmw=
s_release/target_armhf/kbuild/services4/srvkm/env/linux/mm.c:540:13: error:=
 too few arguments to function '__vmalloc'<br />|&nbsp;&nbsp; 540 |&nbsp;&n=
bsp;&nbsp;&nbsp; pvRet =3D __vmalloc(uiBytes, gfp_mask);<br />|&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~<br />| In file included from /home/bert/y=
octo/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-dd=
k-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmw=
s_release/target_armhf/kbuild/services4/srvkm/env/linux/mm.c:59:<br />| /ho=
me/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-sourc=
e/include/linux/vmalloc.h:99:14: note: declared here<br />|&nbsp;&nbsp;&nbs=
p; 99 | extern void *__vmalloc(unsigned long size, gfp_t gfp_mask, pgprot_t=
 prot);<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~<br />| /h=
ome/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/kernel-sour=
ce/scripts/Makefile.build:261: recipe for target '/home/bert/yocto/jumpnow-=
3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km/1.17.494=
8957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_release/tar=
get_armhf/kbuild/services4/srvkm/env/linux/mm.o' failed<br />| make[4]: ***=
 [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnu=
eabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_=
linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/mm.o]=
 Error 1<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-=
poky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiaco=
n/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/e=
nv/linux/osfunc.c: In function 'OSAcquirePhysPageAddr':<br />| /home/bert/y=
octo/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-dd=
k-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmw=
s_release/target_armhf/kbuild/services4/srvkm/env/linux/osfunc.c:3772:5: er=
ror: implicit declaration of function 'mmap_read_lock'; did you mean '_raw_=
read_lock'? [-Werror=3Dimplicit-function-declaration]<br />|&nbsp; 3772 |&n=
bsp;&nbsp;&nbsp;&nbsp; mmap_read_lock(current-&gt;mm);<br />|&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~<br />|&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; _raw_read_lock<br=
 />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-=
gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_om=
ap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/env/linux/os=
func.c:3971:5: error: implicit declaration of function 'mmap_read_unlock'; =
did you mean '_raw_read_unlock'? [-Werror=3Dimplicit-function-declaration]<=
br />|&nbsp; 3971 |&nbsp;&nbsp;&nbsp;&nbsp; mmap_read_unlock(current-&gt;mm=
);<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp; ^~~=
~~~~~~~~~~~~~<br />|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp=
;&nbsp; _raw_read_unlock<br />| cc1: some warnings being treated as errors<=
br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work-shared/beaglebone/ke=
rnel-source/scripts/Makefile.build:261: recipe for target '/home/bert/yocto=
/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-sgx-ddk-km=
/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nulldrmws_re=
lease/target_armhf/kbuild/services4/srvkm/env/linux/osfunc.o' failed<br />|=
 make[4]: *** [/home/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-p=
oky-linux-gnueabi/ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon=
/binary_omap_linux_nulldrmws_release/target_armhf/kbuild/services4/srvkm/en=
v/linux/osfunc.o] Error 1<br />| /home/bert/yocto/jumpnow-3.1/bbb/build/tmp=
/work-shared/beaglebone/kernel-source/Makefile:1734: recipe for target '/ho=
me/bert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/=
ti-sgx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux=
_nulldrmws_release/target_armhf/kbuild' failed<br />| make[3]: *** [/home/b=
ert/yocto/jumpnow-3.1/bbb/build/tmp/work/beaglebone-poky-linux-gnueabi/ti-s=
gx-ddk-km/1.17.4948957-r22x/git/eurasia_km/eurasiacon/binary_omap_linux_nul=
ldrmws_release/target_armhf/kbuild] Error 2<br />| Makefile:179: recipe for=
 target 'sub-make' failed<br />| make[2]: *** [sub-make] Error 2<br />| eur=
asiacon/build/linux2/kbuild/kbuild.mk:56: recipe for target 'kbuild' failed=
<br />| make[1]: *** [kbuild] Error 2<br />| ../config/core.mk:789: recipe =
for target 'build' failed<br />| make: *** [build] Error 2<br />| WARNING: =
exit code 1 from a shell command.<br />| <br />ERROR: Task (/home/bert/yoct=
o/jumpnow-3.1/bbb/build/../../poky-dunfell/meta-ti/recipes-bsp/powervr-driv=
ers/ti-sgx-ddk-km_1.17.4948957.bb:do_compile) failed with exit code '1'<br =
/>NOTE: Tasks Summary: Attempted 490 tasks of which 489 didn't need to be r=
erun and 1 failed.<br /><br />Summary: 1 task failed:<br />&nbsp; /home/ber=
t/yocto/jumpnow-3.1/bbb/build/../../poky-dunfell/meta-ti/recipes-bsp/powerv=
r-drivers/ti-sgx-ddk-km_1.17.4948957.bb:do_compile<br />Summary: There were=
 2 ERROR messages shown, returning a non-zero exit code.<br />

--x71xHVtTcRcEKwWqLJKy--
