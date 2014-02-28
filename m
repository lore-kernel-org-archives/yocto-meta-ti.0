Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53AD8E00969
	for <meta-ti@yoctoproject.org>; Fri, 28 Feb 2014 08:22:29 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1SGM819006069;
	Fri, 28 Feb 2014 10:22:08 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1SGM7sQ008721;
	Fri, 28 Feb 2014 10:22:08 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 28 Feb 2014 10:22:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1SGM7VY032445;
	Fri, 28 Feb 2014 10:22:07 -0600
Date: Fri, 28 Feb 2014 11:22:06 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Ashok Palaniswamy <Ashok.Palaniswamy@lntinfotech.com>
Message-ID: <20140228162206.GO22125@edge>
References: <127A5335E8FA314589D708E59E33891D2F5AD5D043@CHNINMSMBX01.chennaiodc.lntinfotech.com>
	<20140124224031.GY30525@edge>
	<127A5335E8FA314589D708E59E33891D310BE445FA@CHNINMSMBX01.chennaiodc.lntinfotech.com>
MIME-Version: 1.0
In-Reply-To: <127A5335E8FA314589D708E59E33891D310BE445FA@CHNINMSMBX01.chennaiodc.lntinfotech.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: How to build Yocto project for AM3517EVM
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Feb 2014 16:22:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2014 at 05:50:53PM +0530, Ashok Palaniswamy wrote:
> Hi Denys,
>=20
> Thanks for the details. As per the below wiki link i am able to build yoc=
to=20
> for am335x-evm machine. But i am not able to build for AM3517-evm.
>=20
> I followed the same steps mentioned in the wilki page for AM3517-evm also=
=2E=20
> Please help me to fix the issue.

Looks like something is misconfigured, as your cross-compiler toolchain is=
=20
getting confused in many places with the error like this:

error: x uses VFP register arguments, y does not

Looking at your build configuration, your TUNE_FEATURES don't match the one=
s=20
needed to use hardfp toolchain:

TUNE_FEATURES     =3D "armv7a vfp neon"

It should be more like this:

TUNE_FEATURES     =3D "armv7a vfp thumb neon callconvention-hard cortexa8"

If you actually need to build a softfp version, you may need to use another=
=20
toolchain, or configure Linaro toolchain to use softfp runtimes...

--=20
Denys


> Below i copied few error messages
>=20
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: do_compile (see /media/Data/yocto/working/tisdk/b=
uild/arago-tmp-external-linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-oe-l=
inux-gnueabi/zlib/1.2.7-r0/temp/log.do_compile.28662 for further informatio=
n)
> ERROR: Logfile of failure stored in: /media/Data/yocto/working/tisdk/buil=
d/arago-tmp-external-linaro-toolchain/work/armv7a-vfp-
>=20
>=20
> |
> | configure: exit 77
> | ERROR: oe_runconf failed
> | ERROR: Function failed: do_configure (see /media/Data/yocto/working/tis=
dk/build/arago-tmp-external-linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-=
oe-linux-gnueabi/libtool-cross/2.4.2-r6.1/temp/log.do_configure.28442 for f=
urther information)
> ERROR: Task 387 (/media/Data/yocto/working/tisdk/sources/oe-core/meta/rec=
ipes-devtools/libtool/libtool-cross_2.4.2.bb, do_configure) failed with exi=
t code '1'
> NOTE: Tasks Summary: Attempted 488 tasks of which 484 didn't need to be r=
erun and 2 failed.
> Waiting for 0 running tasks to finish:
>=20
>=20
>=20
> Thanks,
> P.Ashok
>=20
> ________________________________________
> From: Denys Dmytriyenko [denys@ti.com]
> Sent: Saturday, January 25, 2014 4:10 AM
> To: Ashok Palaniswamy
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] How to build Yocto project for AM3517EVM
>=20
> On Mon, Jan 13, 2014 at 10:48:48AM +0530, Ashok Palaniswamy wrote:
> > Hi All.
> >
> > I am working for AM3517 based custom board. We are planning to use yoct=
o for
> > our development. Please let me know how to build yocto for AM3517evm bo=
ard.
> >
> > Is there any wiki or steps by step to build yocto project for AM3517evm=
 ?
>=20
> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
>=20
> You can build for am3517-evm machine from meta-ti.
>=20
> --
> Denys
>=20
> The contents of this e-mail and any attachment(s) may contain confidentia=
l or privileged information for the intended recipient(s). Unintended recip=
ients are prohibited from taking action on the basis of information in this=
 e-mail and  using or disseminating the information,  and must notify the s=
ender and delete it from their system. L&T Infotech will not accept respons=
ibility or liability for the accuracy or completeness of, or the presence o=
f any virus or disabling code in this e-mail"
> *************************************************************************
>  This email and attachments have been scanned for
>  potential proprietary or sensitive information leakage.
>  Websense Data Security, Protecting Your Information from the Inside Out.
>  www.websense.com
>  *************************************************************************

> ashok@infch02242:/media/Data/yocto/working/tisdk/build$ MACHINE=3Dam3517-=
evm bitbake core-image-minimal
> Loading cache: 100% |####################################################=
############################################| ETA:  00:00:00
> Loaded 1970 entries from dependency cache.
> WARNING: No recipes available for:
>   /media/Data/yocto/working/tisdk/sources/meta-qt5/recipes-devtools/cmake=
/cmake-native_2.8.12.1.bbappend
>   /media/Data/yocto/working/tisdk/sources/meta-qt5/recipes-devtools/cmake=
/cmake_2.8.12.1.bbappend
>   /media/Data/yocto/working/tisdk/sources/meta-arago/meta-arago-distro/re=
cipes-qt/qt5/qtwebkit_5.2.0.bbappend
>   /media/Data/yocto/working/tisdk/sources/meta-arago/meta-arago-distro/re=
cipes-qt/qt5/qtbase_5.2.0.bbappend
>=20
> Build Configuration:
> BB_VERSION        =3D "1.18.0"
> BUILD_SYS         =3D "i686-linux"
> NATIVELSBSTRING   =3D "Ubuntu-12.04"
> TARGET_SYS        =3D "arm-oe-linux-gnueabi"
> MACHINE           =3D "am3517-evm"
> DISTRO            =3D "arago"
> DISTRO_VERSION    =3D "2013.12"
> TUNE_FEATURES     =3D "armv7a vfp neon"
> TARGET_FPU        =3D "vfp-neon"
> meta-arago-distro=20
> meta-arago-extras =3D "dylan:9c215cb3ec5621f5ea7e7deb22a3a17bbf19aaa3"
> meta-qt5          =3D "master:e55d3ef36a98574e7d4535bb03b56c9a05e6578a"
> toolchain-layer  =20
> meta-networking  =20
> meta-ruby        =20
> meta-oe           =3D "dylan:cb182019c4f7485713cb50623240c01882448ffd"
> meta-ti           =3D "dylan:e4b90a654c352e0161760d263f589a2c041533bf"
> meta-linaro-toolchain =3D "dylan:c9f78d6eff14ada3f2bc960e81883b27a10afecc"
> meta              =3D "dylan:42232782b9a3aa0ed03c5dda84fc0b865b74b2dd"
>=20
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: do_compile (see /media/Data/yocto/working/tisdk/b=
uild/arago-tmp-external-linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-oe-l=
inux-gnueabi/zlib/1.2.7-r0/temp/log.do_compile.28662 for further informatio=
n)
> ERROR: Logfile of failure stored in: /media/Data/yocto/working/tisdk/buil=
d/arago-tmp-external-linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-oe-linu=
x-gnueabi/zlib/1.2.7-r0/temp/log.do_compile.28662
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 2 -e MAKEFLAGS=3D
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -I=
=2E -c -o example.o test/example.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -i=
system/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux=
/arm-linux-gnueabihf/include  -fstack-protector  -c -o adler32.o adler32.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -i=
system/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux=
/arm-linux-gnueabihf/include  -fstack-protector  -c -o crc32.o crc32.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -i=
system/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux=
/arm-linux-gnueabihf/include  -fstack-protector  -c -o deflate.o deflate.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -i=
system/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux=
/arm-linux-gnueabihf/include  -fstack-protector  -c -o infback.o infback.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -i=
system/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux=
/arm-linux-gnueabihf/include  -fstack-protector  -c -o inffast.o inffast.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -i=
system/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux=
/arm-linux-gnueabihf/include  -fstack-protector  -c -o inflate.o inflate.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -i=
system/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux=
/arm-linux-gnueabihf/include  -fstack-protector  -c -o inftrees.o inftrees.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -i=
system/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux=
/arm-linux-gnueabihf/include  -fstack-protector  -c -o trees.o trees.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -i=
system/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux=
/arm-linux-gnueabihf/include  -fstack-protector  -c -o zutil.o zutil.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -i=
system/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux=
/arm-linux-gnueabihf/include  -fstack-protector  -c -o compress.o compress.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -i=
system/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux=
/arm-linux-gnueabihf/include  -fstack-protector  -c -o uncompr.o uncompr.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -i=
system/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux=
/arm-linux-gnueabihf/include  -fstack-protector  -c -o gzclose.o gzclose.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -i=
system/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux=
/arm-linux-gnueabihf/include  -fstack-protector  -c -o gzlib.o gzlib.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -i=
system/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux=
/arm-linux-gnueabihf/include  -fstack-protector  -c -o gzread.o gzread.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -i=
system/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux=
/arm-linux-gnueabihf/include  -fstack-protector  -c -o gzwrite.o gzwrite.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -I=
=2E -c -o minigzip.o test/minigzip.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -I=
=2E -D_FILE_OFFSET_BITS=3D64 -c -o example64.o test/example.c
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -I=
=2E -D_FILE_OFFSET_BITS=3D64 -c -o minigzip64.o test/minigzip.c
> | arm-linux-gnueabihf-ar rc libz.a adler32.o crc32.o deflate.o infback.o =
inffast.o inflate.o inftrees.o trees.o zutil.o compress.o uncompr.o gzclose=
=2Eo gzlib.o gzread.o gzwrite.o
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -o=
 example example.o -L. libz.a
> | arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=
=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/build/ar=
ago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isystem/home/ashok/g=
cc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabih=
f/include  -fstack-protector -O2 -pipe -g -feliminate-unused-debug-types -o=
 minigzip minigzip.o -L. libz.a
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: example uses VFP register arguments, example.o does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file example.o
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: example uses VFP register arguments, libz.a(deflate.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(deflate.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: example uses VFP register arguments, libz.a(inflate.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(inflate.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: example uses VFP register arguments, libz.a(inftrees.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(inftrees.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: example uses VFP register arguments, libz.a(trees.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(trees.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: example uses VFP register arguments, libz.a(zutil.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(zutil.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: example uses VFP register arguments, libz.a(compress.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(compress.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: example uses VFP register arguments, libz.a(uncompr.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(uncompr.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: example uses VFP register arguments, libz.a(gzclose.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(gzclose.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: example uses VFP register arguments, libz.a(gzlib.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(gzlib.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: example uses VFP register arguments, libz.a(gzread.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(gzread.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: example uses VFP register arguments, libz.a(gzwrite.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(gzwrite.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: example uses VFP register arguments, libz.a(adler32.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(adler32.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: example uses VFP register arguments, libz.a(crc32.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(crc32.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: example uses VFP register arguments, libz.a(inffast.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(inffast.o)
> | collect2: error: ld returned 1 exit status
> | make: *** [example] Error 1
> | make: *** Waiting for unfinished jobs....
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: minigzip uses VFP register arguments, minigzip.o does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file minigzip.o
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: minigzip uses VFP register arguments, libz.a(gzclose.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(gzclose.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: minigzip uses VFP register arguments, libz.a(gzlib.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(gzlib.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: minigzip uses VFP register arguments, libz.a(gzread.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(gzread.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: minigzip uses VFP register arguments, libz.a(gzwrite.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(gzwrite.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: minigzip uses VFP register arguments, libz.a(deflate.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(deflate.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: minigzip uses VFP register arguments, libz.a(inflate.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(inflate.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: minigzip uses VFP register arguments, libz.a(inftrees.o) does n=
ot
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(inftrees.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: minigzip uses VFP register arguments, libz.a(trees.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(trees.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: minigzip uses VFP register arguments, libz.a(zutil.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(zutil.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: minigzip uses VFP register arguments, libz.a(adler32.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(adler32.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: minigzip uses VFP register arguments, libz.a(crc32.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(crc32.o)
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: minigzip uses VFP register arguments, libz.a(inffast.o) does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file libz.a(inffast.o)
> | collect2: error: ld returned 1 exit status
> | make: *** [minigzip] Error 1
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see /media/Data/yocto/working/tisdk=
/build/arago-tmp-external-linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-oe=
-linux-gnueabi/zlib/1.2.7-r0/temp/log.do_compile.28662 for further informat=
ion)
> ERROR: Task 689 (/media/Data/yocto/working/tisdk/sources/oe-core/meta/rec=
ipes-core/zlib/zlib_1.2.7.bb, do_compile) failed with exit code '1'
> ERROR: Function failed: do_configure (see /media/Data/yocto/working/tisdk=
/build/arago-tmp-external-linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-oe=
-linux-gnueabi/libtool-cross/2.4.2-r6.1/temp/log.do_configure.28442 for fur=
ther information)
> ERROR: Logfile of failure stored in: /media/Data/yocto/working/tisdk/buil=
d/arago-tmp-external-linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-oe-linu=
x-gnueabi/libtool-cross/2.4.2-r6.1/temp/log.do_configure.28442
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-lin=
ux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing shell function do_configure
> | automake (GNU automake) 1.12.6
> | Copyright (C) 2012 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl=
-2.0.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |=20
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1.12
> | NOTE: Executing ACLOCAL=3D"aclocal --system-acdir=3D/media/Data/yocto/w=
orking/tisdk/build/arago-tmp-external-linaro-toolchain/work/armv7a-vfp-neon=
-2.6.37.2-oe-linux-gnueabi/libtool-cross/2.4.2-r6.1/libtool-2.4.2/aclocal-c=
opy/ --automake-acdir=3D/media/Data/yocto/working/tisdk/build/arago-tmp-ext=
ernal-linaro-toolchain/sysroots/i686-linux/usr/share/aclocal-1.12" autoreco=
nf --verbose --install --force --exclude=3Dlibtoolize -I /media/Data/yocto/=
working/tisdk/build/arago-tmp-external-linaro-toolchain/work/armv7a-vfp-neo=
n-2.6.37.2-oe-linux-gnueabi/libtool-cross/2.4.2-r6.1/libtool-2.4.2/tests/
> | autoreconf: Entering directory `.'
> | autoreconf: configure.ac: not using Gettext
> | autoreconf: running: aclocal --system-acdir=3D/media/Data/yocto/working=
/tisdk/build/arago-tmp-external-linaro-toolchain/work/armv7a-vfp-neon-2.6.3=
7.2-oe-linux-gnueabi/libtool-cross/2.4.2-r6.1/libtool-2.4.2/aclocal-copy/ -=
-automake-acdir=3D/media/Data/yocto/working/tisdk/build/arago-tmp-external-=
linaro-toolchain/sysroots/i686-linux/usr/share/aclocal-1.12 -I /media/Data/=
yocto/working/tisdk/build/arago-tmp-external-linaro-toolchain/work/armv7a-v=
fp-neon-2.6.37.2-oe-linux-gnueabi/libtool-cross/2.4.2-r6.1/libtool-2.4.2/te=
sts/ -I /media/Data/yocto/working/tisdk/build/arago-tmp-external-linaro-too=
lchain/work/armv7a-vfp-neon-2.6.37.2-oe-linux-gnueabi/libtool-cross/2.4.2-r=
6.1/libtool-2.4.2/tests/ --force -I libltdl/m4
> | autoreconf: configure.ac: tracing
> | autoreconf: running: /media/Data/yocto/working/tisdk/build/arago-tmp-ex=
ternal-linaro-toolchain/sysroots/i686-linux/usr/bin/autoconf --include=3D/m=
edia/Data/yocto/working/tisdk/build/arago-tmp-external-linaro-toolchain/wor=
k/armv7a-vfp-neon-2.6.37.2-oe-linux-gnueabi/libtool-cross/2.4.2-r6.1/libtoo=
l-2.4.2/tests/ --force
> | autoreconf: running: /media/Data/yocto/working/tisdk/build/arago-tmp-ex=
ternal-linaro-toolchain/sysroots/i686-linux/usr/bin/autoheader --include=3D=
/media/Data/yocto/working/tisdk/build/arago-tmp-external-linaro-toolchain/w=
ork/armv7a-vfp-neon-2.6.37.2-oe-linux-gnueabi/libtool-cross/2.4.2-r6.1/libt=
ool-2.4.2/tests/ --force
> | autoreconf: running: automake --foreign --add-missing --copy --force-mi=
ssing
> | autoreconf: running: gnu-configize
> | autoreconf: Leaving directory `.'
> | NOTE: Running /media/Data/yocto/working/tisdk/build/arago-tmp-external-=
linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-oe-linux-gnueabi/libtool-cro=
ss/2.4.2-r6.1/libtool-2.4.2/configure  --build=3Di686-linux 		  --host=3Dar=
m-oe-linux-gnueabi 		  --target=3Darm-oe-linux-gnueabi 		  --prefix=3D/usr =
		  --exec_prefix=3D/usr 		  --bindir=3D/usr/bin 		  --sbindir=3D/usr/sbin =
		  --libexecdir=3D/usr/lib/libtool 		  --datadir=3D/media/Data/yocto/worki=
ng/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm/usr/=
share 		  --sysconfdir=3D/etc 		  --sharedstatedir=3D/com 	  --localstatedi=
r=3D/var 		  --libdir=3D/usr/lib 		  --includedir=3D/usr/include 		  --oldi=
ncludedir=3D/usr/include 		  --infodir=3D/media/Data/yocto/working/tisdk/bu=
ild/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm/usr/share/info =
		  --mandir=3D/media/Data/yocto/working/tisdk/build/arago-tmp-external-lin=
aro-toolchain/sysroots/am3517-evm/usr/share/man 		  --disable-silent-rules =
		  --disable-dependency-tracking 		  --with-libtool-sysroot=3D/media/Data/=
yocto/worki
> ng/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm --=
with-sysroot
> | configure: WARNING: unrecognized options: --disable-silent-rules, --wit=
h-sysroot
> | configure: loading site script /media/Data/yocto/working/tisdk/sources/=
meta-openembedded/meta-oe/site/endian-little
> | configure: loading site script /media/Data/yocto/working/tisdk/sources/=
oe-core/meta/site/endian-little
> | configure: loading site script /media/Data/yocto/working/tisdk/sources/=
oe-core/meta/site/arm-common
> | configure: loading site script /media/Data/yocto/working/tisdk/sources/=
oe-core/meta/site/common-linux
> | configure: loading site script /media/Data/yocto/working/tisdk/sources/=
oe-core/meta/site/common-glibc
> | configure: loading site script /media/Data/yocto/working/tisdk/sources/=
oe-core/meta/site/arm-linux
> | configure: loading site script /media/Data/yocto/working/tisdk/sources/=
oe-core/meta/site/common
> | ## ------------------------- ##
> | ## Configuring libtool 2.4.2 ##
> | ## ------------------------- ##
> |=20
> | checking for a BSD-compatible install... /usr/bin/install -c
> | checking whether build environment is sane... yes
> | checking for arm-oe-linux-gnueabi-strip... arm-linux-gnueabihf-strip
> | checking for a thread-safe mkdir -p... /bin/mkdir -p
> | checking for gawk... gawk
> | checking whether make sets $(MAKE)... yes
> | checking build system type... i686-pc-linux-gnu
> | checking host system type... arm-oe-linux-gnueabi
> | configure: autobuild project... GNU Libtool
> | configure: autobuild revision... 2.4.2 ()
> | configure: autobuild hostname... infch02242
> | configure: autobuild mode... default
> | configure: autobuild timestamp... 20140228T121041Z
> | checking for arm-oe-linux-gnueabi-gcc... arm-linux-gnueabihf-gcc  -marc=
h=3Darmv7-a -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=
=3D/media/Data/yocto/working/tisdk/build/arago-tmp-external-linaro-toolchai=
n/sysroots/am3517-evm
> | checking whether the C compiler works... no
> | configure: error: in `/media/Data/yocto/working/tisdk/build/arago-tmp-e=
xternal-linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-oe-linux-gnueabi/lib=
tool-cross/2.4.2-r6.1/libtool-2.4.2':
> | configure: error: C compiler cannot create executables
> | See `config.log' for more details
> | Configure failed. The contents of all config.log files follows to aid d=
ebugging
> | /media/Data/yocto/working/tisdk/build/arago-tmp-external-linaro-toolcha=
in/work/armv7a-vfp-neon-2.6.37.2-oe-linux-gnueabi/libtool-cross/2.4.2-r6.1/=
libtool-2.4.2/config.log
> | This file contains any messages produced by compilers while
> | running configure, to aid debugging if configure makes a mistake.
> |=20
> | It was created by GNU Libtool configure 2.4.2, which was
> | generated by GNU Autoconf 2.69.  Invocation command line was
> |=20
> |   $ /media/Data/yocto/working/tisdk/build/arago-tmp-external-linaro-too=
lchain/work/armv7a-vfp-neon-2.6.37.2-oe-linux-gnueabi/libtool-cross/2.4.2-r=
6.1/libtool-2.4.2/configure --build=3Di686-linux --host=3Darm-oe-linux-gnue=
abi --target=3Darm-oe-linux-gnueabi --prefix=3D/usr --exec_prefix=3D/usr --=
bindir=3D/usr/bin --sbindir=3D/usr/sbin --libexecdir=3D/usr/lib/libtool --d=
atadir=3D/media/Data/yocto/working/tisdk/build/arago-tmp-external-linaro-to=
olchain/sysroots/am3517-evm/usr/share --sysconfdir=3D/etc --sharedstatedir=
=3D/com --localstatedir=3D/var --libdir=3D/usr/lib --includedir=3D/usr/incl=
ude --oldincludedir=3D/usr/include --infodir=3D/media/Data/yocto/working/ti=
sdk/build/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm/usr/share=
/info --mandir=3D/media/Data/yocto/working/tisdk/build/arago-tmp-external-l=
inaro-toolchain/sysroots/am3517-evm/usr/share/man --disable-silent-rules --=
disable-dependency-tracking --with-libtool-sysroot=3D/media/Data/yocto/work=
ing/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm --w=
ith-sysroot
> |=20
> | ## --------- ##
> | ## Platform. ##
> | ## --------- ##
> |=20
> | hostname =3D infch02242
> | uname -m =3D i686
> | uname -r =3D 3.2.0-59-generic-pae
> | uname -s =3D Linux
> | uname -v =3D #90-Ubuntu SMP Tue Jan 7 23:07:06 UTC 2014
> |=20
> | /usr/bin/uname -p =3D unknown
> | /bin/uname -X     =3D unknown
> |=20
> | /bin/arch              =3D unknown
> | /usr/bin/arch -k       =3D unknown
> | /usr/convex/getsysinfo =3D unknown
> | /usr/bin/hostinfo      =3D unknown
> | /bin/machine           =3D unknown
> | /usr/bin/oslevel       =3D unknown
> | /bin/universe          =3D unknown
> |=20
> | PATH: /media/Data/yocto/working/tisdk/sources/oe-core/scripts
> | PATH: /media/Data/yocto/working/tisdk/build/arago-tmp-external-linaro-t=
oolchain/sysroots/i686-linux/usr/bin/armv7a-vfp-neon-oe-linux-gnueabi
> | PATH: /media/Data/yocto/working/tisdk/build/arago-tmp-external-linaro-t=
oolchain/sysroots/am3517-evm/usr/bin/crossscripts
> | PATH: /media/Data/yocto/working/tisdk/build/arago-tmp-external-linaro-t=
oolchain/sysroots/i686-linux/usr/sbin
> | PATH: /media/Data/yocto/working/tisdk/build/arago-tmp-external-linaro-t=
oolchain/sysroots/i686-linux/usr/bin
> | PATH: /media/Data/yocto/working/tisdk/build/arago-tmp-external-linaro-t=
oolchain/sysroots/i686-linux/sbin
> | PATH: /media/Data/yocto/working/tisdk/build/arago-tmp-external-linaro-t=
oolchain/sysroots/i686-linux//bin
> | PATH: /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_l=
inux/bin
> | PATH: /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_l=
inux/bin
> | PATH: /media/Data/yocto/working/tisdk/sources/oe-core/scripts
> | PATH: /media/Data/yocto/working/tisdk/sources/bitbake/bin
> | PATH: /usr/local/ti-sdk-am3517-evm-05.07/linux-devkit/bin
> | PATH: /usr/lib/lightdm/lightdm
> | PATH: /usr/local/sbin
> | PATH: /usr/local/bin
> | PATH: /usr/sbin
> | PATH: /usr/bin
> | PATH: /sbin
> | PATH: /bin
> | PATH: /usr/games
> |=20
> |=20
> | ## ----------- ##
> | ## Core tests. ##
> | ## ----------- ##
> |=20
> | configure:2475: loading site script /media/Data/yocto/working/tisdk/sou=
rces/meta-openembedded/meta-oe/site/endian-little
> | | # rp-pppoe
> | | rpppoe_cv_pack_bitfields=3D${rpppoe_cv_pack_bitfields=3Drev}
> | configure:2475: loading site script /media/Data/yocto/working/tisdk/sou=
rces/oe-core/meta/site/endian-little
> | | ac_cv_c_littleendian=3D${ac_cv_c_littleendian=3Dyes}
> | | ac_cv_c_bigendian=3D${ac_cv_c_bigendian=3Dno}
> | |
> | | # libnet
> | | ac_cv_libnet_endianess=3D${ac_cv_libnet_endianess=3Dlil}
> | |
> | | # libmemcached
> | | ac_cv_c_endian=3Dlittle
> | configure:2475: loading site script /media/Data/yocto/working/tisdk/sou=
rces/oe-core/meta/site/arm-common
> | | # general
> | | ac_cv_va_val_copy=3D${ac_cv_va_val_copy=3Dyes}
> | | ac_cv_func_lstat_dereferences_slashed_symlink=3D${ac_cv_func_lstat_de=
references_slashed_symlink=3Dyes}
> | | ac_cv_func_lstat_empty_string_bug=3D${ac_cv_func_lstat_empty_string_b=
ug=3Dno}
> | | ac_cv_func_stat_empty_string_bug=3D${ac_cv_func_stat_empty_string_bug=
=3Dno}
> | | ac_cv_func_stat_ignores_trailing_slash=3D${ac_cv_func_stat_ignores_tr=
ailing_slash=3Dno}
> | | ac_cv_header_netinet_sctp_h=3D${ac_cv_header_netinet_sctp_h=3Dno}
> | | ac_cv_header_netinet_sctp_uio_h=3D${ac_cv_header_netinet_sctp_uio_h=
=3Dno}
> | | ac_cv_sctp=3D${ac_cv_sctp=3Dno}
> | |
> | | # apache
> | | ac_cv_func_pthread_key_delete=3D${ac_cv_func_pthread_key_delete=3Dyes}
> | | apr_cv_process_shared_works=3D${apr_cv_process_shared_works=3Dno}
> | | ac_cv_sizeof_ssize_t=3D${ac_cv_sizeof_ssize_t=3D4}
> | | apr_cv_tcp_nodelay_with_cork=3D${apr_cv_tcp_nodelay_with_cork=3Dyes}
> | |
> | | # bash
> | | ac_cv_c_long_double=3D${ac_cv_c_long_double=3Dyes}
> | | bash_cv_func_sigsetjmp=3D${bash_cv_func_sigsetjmp=3Dmissing}
> | |
> | | # coreutils
> | | utils_cv_sys_open_max=3D${utils_cv_sys_open_max=3D1019}
> | |
> | | # cvs
> | | cvs_cv_func_printf_ptr=3D${cvs_cv_func_printf_ptr=3Dyes}
> | |
> | | # db (sleepycat)
> | | db_cv_fcntl_f_setfd=3D${db_cv_fcntl_f_setfd=3Dyes}
> | | db_cv_sprintf_count=3D${db_cv_sprintf_count=3Dyes}
> | | db_cv_align_t=3D${db_cv_align_t=3D'unsigned long long'}
> | | db_cv_alignp_t=3D${db_cv_alignp_t=3D'unsigned long'}
> | |
> | | # D-BUS
> | | ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwnam_r=3Dyes}
> | |
> | | # edb
> | | db_cv_spinlocks=3D${db_cv_spinlocks=3Dno}
> | |
> | | # ettercap
> | | ettercap_cv_type_socklen_t=3D${ettercap_cv_type_socklen_t=3Dyes}
> | |
> | | # fget
> | | compat_cv_func_snprintf_works=3D${compat_cv_func_snprintf_works=3Dyes}
> | | compat_cv_func_basename_works=3D${compat_cv_func_basename_works=3Dno}
> | | compat_cv_func_dirname_works=3D${compat_cv_func_dirname_works=3Dno}
> | |
> | | # fnmatch
> | | ac_cv_func_fnmatch_works=3D${ac_cv_func_fnmatch_works=3Dyes}
> | |
> | | # gettext
> | | am_cv_func_working_getline=3D${am_cv_func_working_getline=3Dyes}
> | |
> | | # glib
> | | glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> | | glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
> | | glib_cv_stack_grows=3D${glib_cv_stack_grows=3Dno}
> | | glib_cv_uscore=3D${glib_cv_uscore=3Dno}
> | | glib_cv_use_pid_surrogate=3D${glib_cv_use_pid_surrogate=3Dyes}
> | | glib_cv_has__inline=3D${glib_cv_has__inline=3Dyes}
> | | glib_cv_has__inline__=3D${glib_cv_has__inline__=3Dyes}
> | | glib_cv_hasinline=3D${glib_cv_hasinline=3Dyes}
> | | glib_cv_sane_realloc=3D${glib_cv_sane_realloc=3Dyes}
> | | glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> | | glib_cv_uscore=3D${glib_cv_uscore=3Dno}
> | | glib_cv_va_val_copy=3D${glib_cv_va_val_copy=3Dyes}
> | | glib_cv_rtldglobal_broken=3D${glib_cv_rtldglobal_broken=3Dno}
> | | glib_cv_sys_pthread_mutex_trylock_posix=3D${glib_cv_sys_pthread_mutex=
_trylock_posix=3Dyes}
> | | glib_cv_sys_pthread_getspecific_posix=3D${glib_cv_sys_pthread_getspec=
ific_posix=3Dyes}
> | | glib_cv_sys_pthread_cond_timedwait_posix=3D${glib_cv_sys_pthread_cond=
_timedwait_posix=3Dyes}
> | |
> | | # glib-2.0
> | | glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
> | | glib_cv_sizeof_gmutex=3D${glib_cv_sizeof_gmutex=3D24}
> | | glib_cv_sizeof_intmax_t=3D${glib_cv_sizeof_intmax_t=3D8}
> | | glib_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}
> | | glib_cv_sizeof_size_t=3D${glib_cv_sizeof_size_t=3D4}
> | | glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}
> | | glib_cv_sys_use_pid_niceness_surrogate=3D${glib_cv_sys_use_pid_nicene=
ss_surrogate=3Dyes}
> | | ac_cv_alignof_guint32=3D4
> | | ac_cv_alignof_guint64=3D8
> | | ac_cv_alignof_unsigned_long=3D4
> | |
> | | #gstreamer
> | | as_cv_unaligned_access=3D${as_cv_unaligned_access=3Dno}
> | |
> | | # httppc
> | | ac_cv_strerror_r_SUSv3=3D${ac_cv_strerror_r_SUSv3=3Dno}
> | |
> | | # jikes
> | | ac_cv_sizeof_wchar_t=3D4
> | |
> | | # lftp
> | | ac_cv_need_trio=3D${ac_cv_need_trio=3Dno}
> | | lftp_cv_va_val_copy=3D${lftp_cv_va_val_copy=3Dyes}
> | |
> | | # libesmtp
> | | acx_working_snprintf=3D${acx_working_snprintf=3Dyes}
> | |
> | | # libidl
> | | libIDL_cv_long_long_format=3D${libIDL_cv_long_long_format=3Dll}
> | |
> | | # libnet
> | | ac_libnet_have_packet_socket=3D${ac_libnet_have_packet_socket=3Dyes}
> | |
> | | # libpcap
> | | ac_cv_linux_vers=3D${ac_cv_linux_vers=3D2}
> | |
> | | # libxfce4util
> | | with_broken_putenv=3D${with_broken_putenv=3Dno}
> | |
> | | # links
> | | ac_cv_lib_png_png_create_info_struct=3D${ac_cv_lib_png_png_create_inf=
o_struct=3Dyes}
> | |
> | | # mysql
> | | mysql_cv_func_atomic_sub=3D${mysql_cv_func_atomic_sub=3Dno}
> | | mysql_cv_func_atomic_add=3D${mysql_cv_func_atomic_add=3Dno}
> | |
> | | # nano
> | | ac_cv_regexec_segfault_emptystr=3D${ac_cv_regexec_segfault_emptystr=
=3Dno}
> | | nano_cv_func_regexec_segv_emptystr=3D${nano_cv_func_regexec_segv_empt=
ystr=3Dno}
> | |
> | | # ORBit2
> | | ac_cv_alignof_CORBA_boolean=3D1
> | | ac_cv_alignof_CORBA_char=3D1
> | | ac_cv_alignof_CORBA_double=3D8
> | | ac_cv_alignof_CORBA_float=3D4
> | | ac_cv_alignof_CORBA_long=3D4
> | | ac_cv_alignof_CORBA_long_double=3D8
> | | ac_cv_alignof_CORBA_long_long=3D8
> | | ac_cv_alignof_CORBA_octet=3D1
> | | ac_cv_alignof_CORBA_pointer=3D4
> | | ac_cv_alignof_CORBA_short=3D2
> | | ac_cv_alignof_CORBA_struct=3D1
> | | ac_cv_alignof_CORBA_wchar=3D2
> | |
> | | # php
> | | ac_cv_pread=3D${ac_cv_pread=3Dno}
> | | ac_cv_pwrite=3D${ac_cv_pwrite=3Dno}
> | | php_cv_lib_cookie_io_functions_use_off64_t=3D${php_cv_lib_cookie_io_f=
unctions_use_off64_t=3Dyes}
> | |
> | | # rsync
> | | rsync_cv_HAVE_BROKEN_LARGEFILE=3D${rsync_cv_HAVE_BROKEN_LARGEFILE=3Dn=
o}
> | | rsync_cv_HAVE_SOCKETPAIR=3D${rsync_cv_HAVE_SOCKETPAIR=3Dyes}
> | | rsync_cv_HAVE_LONGLONG=3D${rsync_cv_HAVE_LONGLONG=3Dyes}
> | | rsync_cv_HAVE_OFF64_T=3D${rsync_cv_HAVE_OFF64_T=3Dno}
> | | rsync_cv_HAVE_SHORT_INO_T=3D${rsync_cv_HAVE_SHORT_INO_T=3Dno}
> | | rsync_cv_HAVE_UNSIGNED_CHAR=3D${rsync_cv_HAVE_UNSIGNED_CHAR=3Dno}
> | | rsync_cv_HAVE_BROKEN_READDIR=3D${rsync_cv_HAVE_BROKEN_READDIR=3Dno}
> | | rsync_cv_HAVE_GETTIMEOFDAY_TZ=3D${rsync_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
> | | rsync_cv_HAVE_C99_VSNPRINTF=3D${rsync_cv_HAVE_C99_VSNPRINTF=3Dyes}
> | | rsync_cv_HAVE_SECURE_MKSTEMP=3D${rsync_cv_HAVE_SECURE_MKSTEMP=3Dyes}
> | | rsync_cv_REPLACE_INET_NTOA=3D${rsync_cv_REPLACE_INET_NTOA=3Dno}
> | | rsync_cv_REPLACE_INET_ATON=3D${rsync_cv_REPLACE_INET_ATON=3Dno}
> | |
> | | # screen
> | | screen_cv_sys_bcopy_overlap=3D${screen_cv_sys_bcopy_overlap=3Dno}
> | | screen_cv_sys_memcpy_overlap=3D${screen_cv_sys_memcpy_overlap=3Dno}
> | | screen_cv_sys_memmove_overlap=3D${screen_cv_sys_memmove_overlap=3Dno}
> | | screen_cv_sys_fifo_broken_impl=3D${screen_cv_sys_fifo_broken_impl=3Dy=
es}
> | | screen_cv_sys_fifo_usable=3D${screen_cv_sys_fifo_usable=3Dyes}
> | | screen_cv_sys_select_broken_retval=3D${screen_cv_sys_select_broken_re=
tval=3Dno}
> | | screen_cv_sys_sockets_nofs=3D${screen_cv_sys_sockets_nofs=3Dno}
> | | screen_cv_sys_sockets_usable=3D${screen_cv_sys_sockets_usable=3Dyes}
> | | screen_cv_sys_terminfo_used=3D${screen_cv_sys_terminfo_used=3Dyes}
> | |
> | | # slrn
> | | slrn_cv_va_val_copy=3D${slrn_cv_va_val_copy=3Dyes}
> | |
> | | # socat
> | | ac_cv_ispeed_offset=3D${ac_cv_ispeed_offset=3D13}
> | | sc_cv_termios_ispeed=3D${sc_cv_termios_ispeed=3Dyes}
> | |
> | | # ssh
> | | ac_cv_have_space_d_name_in_struct_dirent=3D${ac_cv_dirent_have_space_=
d_name=3Dyes}
> | | ac_cv_have_broken_snprintf=3D${ac_cv_have_broken_snprintf=3Dno}
> | | ac_cv_have_accrights_in_msghdr=3D${ac_cv_have_accrights_in_msghdr=3Dn=
o}
> | | ac_cv_have_control_in_msghdr=3D${ac_cv_have_control_in_msghdr=3Dyes}
> | | ac_cv_have_openpty_ctty_bug=3D${ac_cv_have_openpty_ctty_bug=3Dyes}
> | |
> | | # startup-notification
> | | lf_cv_sane_realloc=3Dyes
> | |
> | | # xffm
> | | jm_cv_func_working_readdir=3Dyes
> | |
> | | # evolution-data-server
> | | ac_cv_libiconv_utf8=3D${ac_cv_libiconv_utf8=3Dyes}
> | configure:2475: loading site script /media/Data/yocto/working/tisdk/sou=
rces/oe-core/meta/site/common-linux
> | | # apr
> | | ac_cv_file__dev_zero=3D${ac_cv_file__dev_zero=3Dyes}
> | | ac_cv_sizeof_pid_t=3D${ac_cv_sizeof_pid_t=3D4}
> | |
> | | # samba
> | | samba_cv_HAVE_IFACE_AIX=3D${samba_cv_HAVE_IFACE_AIX=3Dno}
> | | samba_cv_HAVE_IFACE_IFCONF=3D${samba_cv_HAVE_IFACE_IFCONF=3Dyes}
> | | samba_cv_HAVE_IFACE_IFREQ=3D${samba_cv_HAVE_IFACE_IFREQ=3Dyes}
> | | samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=3D${samba_cv_HAVE_IRIX_SPECI=
FIC_CAPABILITIES=3Dno}
> | |
> | | # db
> | | db_cv_path_ar=3D${db_cv_path_ar=3D/usr/bin/ar}
> | | db_cv_path_chmod=3D${db_cv_path_chmod=3D/bin/chmod}
> | | db_cv_path_cp=3D${db_cv_path_cp=3D/bin/cp}
> | | db_cv_path_ln=3D${db_cv_path_ln=3D/bin/ln}
> | | db_cv_path_mkdir=3D${db_cv_path_mkdir=3D/bin/mkdir}
> | | db_cv_path_ranlib=3D${db_cv_path_ranlib=3D/usr/bin/ranlib}
> | | db_cv_path_rm=3D${db_cv_path_rm=3D/bin/rm}
> | | db_cv_path_sh=3D${db_cv_path_sh=3D/bin/sh}
> | | db_cv_path_strip=3D${db_cv_path_strip=3D/usr/bin/strip}
> | |
> | | # bash
> | | bash_cv_have_mbstate_t=3D${bash_cv_have_mbstate_t=3Dyes}
> | | bash_cv_must_reinstall_sighandlers=3D${bash_cv_must_reinstall_sighand=
lers=3Dno}
> | | bash_cv_func_strcoll_broken=3D${bash_cv_func_strcoll_broken=3Dno}
> | | bash_cv_dup2_broken=3D${bash_cv_dup2_broken=3Dno}
> | | bash_cv_opendir_not_robust=3D${bash_cv_opendir_not_robust=3Dno}
> | | bash_cv_type_rlimit=3D${bash_cv_type_rlimit=3Drlim_t}
> | | bash_cv_getenv_redef=3D${bash_cv_getenv_redef=3Dyes}
> | | bash_cv_ulimit_maxfds=3D${bash_cv_ulimit_maxfds=3Dyes}
> | | bash_cv_getcwd_calls_popen=3D${bash_cv_getcwd_calls_popen=3Dno}
> | | bash_cv_printf_a_format=3D${bash_cv_printf_a_format=3Dyes}
> | | bash_cv_pgrp_pipe=3D${bash_cv_pgrp_pipe=3Dno}
> | | bash_cv_job_control_missing=3D${bash_cv_job_control_missing=3Dpresent}
> | | bash_cv_sys_named_pipes=3D${bash_cv_sys_named_pipes=3Dpresent}
> | | bash_cv_unusable_rtsigs=3D${bash_cv_unusable_rtsigs=3Dno}
> | |
> | | # coreutils
> | | gl_cv_func_fstatat_zero_flag=3D${gl_cv_func_fstatat_zero_flag=3Dyes}
> | |
> | | # mysql
> | | ac_cv_sys_restartable_syscalls=3D${ac_cv_sys_restartable_syscalls=3Dy=
es}
> | | ac_cv_conv_longlong_to_float=3D${ac_cv_conv_longlong_to_float=3Dyes}
> | |
> | | # TCL
> | | tcl_cv_api_serial=3D${tcl_cv_api_serial=3Dtermios}
> | |
> | | # python
> | | ac_cv_have_long_long_format=3Dyes
> | |
> | | # apache
> | | ac_cv_o_nonblock_inherited=3D${ac_cv_o_nonblock_inherited=3Dno}
> | configure:2475: loading site script /media/Data/yocto/working/tisdk/sou=
rces/oe-core/meta/site/common-glibc
> | | # general
> | | ac_cv_have_decl_sys_siglist=3D${ac_cv_have_decl_sys_siglist=3Dyes}
> | | ac_cv_func_realloc_works=3D${ac_cv_func_realloc_works=3Dyes}
> | | ac_cv_func_realloc_0_nonnull=3D${ac_cv_func_realloc_0_nonnull=3Dyes}
> | | ac_cv_func_malloc_works=3D${ac_cv_func_malloc_works=3Dyes}
> | | ac_cv_func_malloc_0_nonnull=3D${ac_cv_func_malloc_0_nonnull=3Dyes}
> | | ac_cv_func_memcmp_working=3D${ac_cv_func_memcmp_working=3Dyes}
> | | ac_cv_func_getpgrp_void=3Dyes
> | | ac_cv_func_setpgrp_void=3Dyes
> | | ac_cv_func_setgrent_void=3Dyes
> | | ac_cv_func_getgrgid_r=3D${ac_cv_func_getgrgid_r=3Dyes}
> | | ac_cv_func_getpwuid_r=3D${ac_cv_func_getpwuid_r=3Dyes}
> | | ac_cv_func_posix_getpwuid_r=3D${ac_cv_func_posix_getpwuid_r=3Dyes}
> | | ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrgid_r=3Dyes}
> | | ac_cv_type_uid_t=3D{ac_cv_type_uid_t=3Dyes}
> | | ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dyes}
> | |
> | | # bash
> | | bash_cv_under_sys_siglist=3D${bash_cv_under_sys_siglist=3Dyes}
> | | bash_cv_sys_siglist=3D${bash_cv_sys_siglist=3Dyes}
> | |
> | | # clamav
> | | clamav_av_func_working_snprintf_long=3D${clamav_av_func_working_snpri=
ntf_long=3Dyes}
> | | clamav_av_have_in_port_t=3D${clamav_av_have_in_port_t=3Dyes}
> | | clamav_av_have_in_addr_t=3D${clamav_av_have_in_addr_t=3Dyes}
> | | ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}
> | |
> | | # coreutils
> | | fu_cv_sys_stat_statfs2_bsize=3D${fu_cv_sys_stat_statfs2_bsize=3Dyes}
> | |
> | | # glib
> | | glib_cv_strlcpy=3D${glib_cv_strlcpy=3Dno}
> | | ac_cv_func_printf_unix98=3D${ac_cv_func_printf_unix98=3Dyes}
> | | ac_cv_func_snprintf_c99=3D${ac_cv_func_snprintf_c99=3Dyes}
> | | ac_cv_func_vsnprintf_c99=3D${ac_cv_func_vsnprintf_c99=3Dyes}
> | | glib_cv_compliant_posix_memalign=3D${glib_cv_compliant_posix_memalign=
=3D1}
> | | glib_cv_long_long_format=3D${glib_cv_long_long_format=3Dll}
> | | # glib-1.x requires this and pkgconfig-native / pkgconfig-nativesdk u=
se
> | | # that to avoid a dependency loop.
> | | glib_cv___va_copy=3D${glib_cv___va_copy=3Dyes}
> | | glib_cv_va_copy=3D${glib_cv_va_copy=3Dyes}
> | | glib_cv_have_qsort_r=3D${glib_cv_have_qsort_r=3Dyes}
> | |
> | | #dbus-glib
> | | ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
> | |
> | | # gnucash
> | | am_cv_scanf_lld=3D${am_cv_scanf_lld=3Dyes}
> | |
> | | # guile
> | | ac_cv_func_pthread_attr_getstack=3D${ac_cv_func_pthread_attr_getstack=
=3Dyes}
> | |
> | | #gcc-zlib
> | | ac_cv_func_getpagesize=3D${ac_cv_func_getpagesize=3Dyes}
> | | ac_cv_func_memcpy=3D${ac_cv_func_memcpy=3Dyes}
> | | ac_cv_func_strerror=3D${ac_cv_func_strerror=3Dyes}
> | |
> | | # squid
> | | ac_cv_af_unix_large_dgram=3D${ac_cv_af_unix_large_dgram=3Dyes}
> | | ac_cv_func_setresuid=3D${ac_cv_func_setresuid=3Dyes}
> | | ac_cv_func_va_copy=3D${ac_cv_func_va_copy=3Dyes}
> | | ac_cv_func___va_copy=3D${ac_cv_func___va_copy=3Dyes}
> | | ac_cv_epoll_works=3D${ac_cv_epoll_works=3Dyes}
> | |
> | | ac_cv_check_sjlj=3Dssjlj
> | |
> | | # m4
> | | gt_cv_locale_fr=3D${gt_cv_locale_fr=3Dfr_FR}
> | | gl_cv_func_btowc_eof=3D${gl_cv_func_btowc_eof=3Dyes}
> | | gl_cv_func_wcrtomb_retval=3D${gl_cv_func_wcrtomb_retval=3Dyes}
> | | gl_cv_func_wctob_works=3D${gl_cv_func_wctob_works=3Dyes}
> | | gl_cv_func_mbrtowc_incomplete_state=3D${gl_cv_func_mbrtowc_incomplete=
_state=3Dyes}
> | | gl_cv_func_mbrtowc_sanitycheck=3D${gl_cv_func_mbrtowc_sanitycheck=3Dy=
es}
> | | gl_cv_func_mbrtowc_null_arg=3D${gl_cv_func_mbrtowc_null_arg=3Dyes}
> | | gl_cv_func_mbrtowc_retval=3D${gl_cv_func_mbrtowc_retval=3Dyes}
> | | gl_cv_func_mbrtowc_nul_retval=3D${gl_cv_func_mbrtowc_nul_retval=3Dyes}
> | |
> | | # va_copy and _va_copy
> | | ac_cv_va_copy=3D${ac_cv_va_copy=3Dyes}
> | | ac_cv___va_copy=3D${ac_cv___va_copy=3Dyes}
> | | ac_cv_func_va_copy=3D${ac_cv_func_va_copy=3Dyes}
> | | ac_cv_func___va_copy=3D${ac_cv_func___va_copy=3Dyes}
> | configure:2475: loading site script /media/Data/yocto/working/tisdk/sou=
rces/oe-core/meta/site/arm-linux
> | | ac_cv_func_setvbuf_reversed=3Dno
> | | ac_cv_sizeof___int64=3D${ac_cv_sizeof___int64=3D0}
> | | ac_cv_sizeof_char=3D${ac_cv_sizeof_char=3D1}
> | | ac_cv_sizeof_wchar_t=3D${ac_cv_sizeof_wchar_t=3D1}
> | | ac_cv_sizeof_unsigned_char=3D${ac_cv_sizeof_unsigned_char=3D1}
> | | ac_cv_sizeof_bool=3D${ac_cv_sizeof_bool=3D1}
> | | ac_cv_sizeof_char_p=3D${ac_cv_sizeof_int_p=3D4}
> | | ac_cv_sizeof_int=3D${ac_cv_sizeof_int=3D4}
> | | ac_cv_sizeof_int_p=3D${ac_cv_sizeof_int_p=3D4}
> | | ac_cv_sizeof_long=3D${ac_cv_sizeof_long=3D4}
> | | ac_cv_sizeof_long_int=3D${ac_cv_sizeof_long_int=3D4}
> | | ac_cv_sizeof_long_long=3D${ac_cv_sizeof_long_long=3D8}
> | | ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
> | | ac_cv_sizeof_short=3D${ac_cv_sizeof_short=3D2}
> | | ac_cv_sizeof_short_int=3D${ac_cv_sizeof_short_int=3D2}
> | | ac_cv_sizeof_size_t=3D${ac_cv_sizeof_size_t=3D4}
> | | ac_cv_sizeof_void_p=3D${ac_cv_sizeof_void_p=3D4}
> | | ac_cv_sizeof_long_p=3D${ac_cv_sizeof_long_p=3D4}
> | | ac_cv_sizeof_float=3D${ac_cv_sizeof_float=3D4}
> | | ac_cv_sizeof_double=3D${ac_cv_sizeof_double=3D8}
> | | ac_cv_sizeof_long_double=3D${ac_cv_sizeof_long_double=3D8}
> | | ac_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}
> | | ac_cv_sizeof_unsigned_short=3D${ac_cv_sizeof_unsigned_short=3D2}
> | | ac_cv_sizeof_unsigned=3D${ac_cv_sizeof_unsigned=3D4}
> | | ac_cv_sizeof_unsigned_int=3D${ac_cv_sizeof_unsigned_int=3D4}
> | | ac_cv_sizeof_unsigned_long=3D${ac_cv_sizeof_unsigned_long=3D4}
> | | ac_cv_sizeof_unsigned_long_long=3D${ac_cv_sizeof_unsigned_long_long=
=3D8}
> | | ac_cv_sizeof_signed_char=3D${ac_cv_sizeof_signed_char=3D1}
> | |
> | | ac_cv_uchar=3D${ac_cv_uchar=3Dno}
> | | ac_cv_uint=3D${ac_cv_uint=3Dyes}
> | | ac_cv_ulong=3D${ac_cv_ulong=3Dyes}
> | | ac_cv_ushort=3D${ac_cv_ushort=3Dyes}
> | | ac_cv_time_r_type=3D${ac_cv_time_r_type=3DPOSIX}
> | |
> | | # samba
> | | samba_cv_BROKEN_NISPLUS_INCLUDE_FILES=3D${samba_cv_BROKEN_NISPLUS_INC=
LUDE_FILES=3Dyes}
> | | samba_cv_BROKEN_REDHAT_7_SYSTEM_HEADERS=3D${samba_cv_BROKEN_REDHAT_7_=
SYSTEM_HEADERS=3Dno}
> | | samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=3D${samba_cv_HAVE_BROKEN_FCNTL64_L=
OCKS=3Dno}
> | | samba_cv_HAVE_BROKEN_GETGROUPS=3D${samba_cv_HAVE_BROKEN_GETGROUPS=3Dn=
o}
> | | samba_cv_HAVE_BROKEN_LINUX_SENDFILE=3D${samba_cv_HAVE_BROKEN_LINUX_SE=
NDFILE=3Dyes}
> | | samba_cv_HAVE_BROKEN_READDIR=3D${samba_cv_HAVE_BROKEN_READDIR=3Dyes}
> | | samba_cv_HAVE_BROKEN_READDIR_NAME=3D${samba_cv_HAVE_BROKEN_READDIR_NA=
ME=3Dno}
> | | samba_cv_HAVE_C99_VSNPRINTF=3D${samba_cv_HAVE_C99_VSNPRINTF=3Dyes}
> | | samba_cv_HAVE_DEV64_T=3D${samba_cv_HAVE_DEV64_T=3Dno}
> | | samba_cv_HAVE_DEVICE_MAJOR_FN=3D${samba_cv_HAVE_DEVICE_MAJOR_FN=3Dyes}
> | | samba_cv_HAVE_DEVICE_MINOR_FN=3D${samba_cv_HAVE_DEVICE_MINOR_FN=3Dyes}
> | | samba_cv_HAVE_DQB_FSOFTLIMIT=3D${samba_cv_HAVE_DQB_FSOFTLIMIT=3Dno}
> | | samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=3D${samba_cv_HAVE_EXPLICIT_L=
ARGEFILE_SUPPORT=3Dyes}
> | | samba_cv_HAVE_FAM_H=3D${samba_cv_HAVE_FAM_H=3Dno}
> | | samba_cv_HAVE_FCNTL_LOCK=3D${samba_cv_HAVE_FCNTL_LOCK=3Dyes}
> | | samba_cv_HAVE_FTRUNCATE_EXTEND=3D${samba_cv_HAVE_FTRUNCATE_EXTEND=3Dy=
es}
> | | samba_cv_HAVE_FUNCTION_MACRO=3D${samba_cv_HAVE_FUNCTION_MACRO=3Dyes}
> | | samba_cv_HAVE_GETTIMEOFDAY_TZ=3D${samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes}
> | | samba_cv_HAVE_INO64_T=3D${samba_cv_HAVE_INO64_T=3Dno}
> | | samba_cv_HAVE_INT16_FROM_RPC_RPC_H=3D${samba_cv_HAVE_INT16_FROM_RPC_R=
PC_H=3Dno}
> | | samba_cv_HAVE_INT32_FROM_RPC_RPC_H=3D${samba_cv_HAVE_INT32_FROM_RPC_R=
PC_H=3Dno}
> | | samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=3D${samba_cv_HAVE_KERNEL_CHANGE_NO=
TIFY=3Dyes}
> | | samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=3D${samba_cv_HAVE_KERNEL_OPLOCKS_L=
INUX=3Dyes}
> | | samba_cv_HAVE_KERNEL_SHARE_MODES=3D${samba_cv_HAVE_KERNEL_SHARE_MODES=
=3Dyes}
> | | samba_cv_HAVE_MAKEDEV=3D${samba_cv_HAVE_MAKEDEV=3Dyes}
> | | samba_cv_HAVE_MMAP=3D${samba_cv_HAVE_MMAP=3Dyes}
> | | samba_cv_HAVE_NATIVE_ICONV=3D${samba_cv_HAVE_NATIVE_ICONV=3Dyes}
> | | samba_cv_HAVE_OFF64_T=3D${samba_cv_HAVE_OFF64_T=3Dno}
> | | samba_cv_HAVE_ROOT=3D${samba_cv_HAVE_ROOT=3Dyes}
> | | samba_cv_HAVE_RPC_AUTH_ERROR_CONFLICT=3D${samba_cv_HAVE_RPC_AUTH_ERRO=
R_CONFLICT=3Dno}
> | | samba_cv_HAVE_SECURE_MKSTEMP=3D${samba_cv_HAVE_SECURE_MKSTEMP=3Dyes}
> | | samba_cv_HAVE_SENDFILE=3D${samba_cv_HAVE_SENDFILE=3Dyes}
> | | samba_cv_HAVE_SENDFILE64=3D${samba_cv_HAVE_SENDFILE64=3Dyes}
> | | samba_cv_HAVE_SOCK_SIN_LEN=3D${samba_cv_HAVE_SOCK_SIN_LEN=3Dno}
> | | samba_cv_HAVE_STAT_ST_BLKSIZE=3D${samba_cv_HAVE_STAT_ST_BLKSIZE=3Dyes}
> | | samba_cv_HAVE_STAT_ST_BLOCKS=3D${samba_cv_HAVE_STAT_ST_BLOCKS=3Dyes}
> | | samba_cv_HAVE_STRUCT_DIR64=3D${samba_cv_HAVE_STRUCT_DIR64=3Dno}
> | | samba_cv_HAVE_STRUCT_DIRENT64=3D${samba_cv_HAVE_STRUCT_DIRENT64=3Dyes}
> | | samba_cv_HAVE_STRUCT_FLOCK64=3D${samba_cv_HAVE_STRUCT_FLOCK64=3Dyes}
> | | samba_cv_HAVE_TRUNCATED_SALT=3D${samba_cv_HAVE_TRUNCATED_SALT=3Dno}
> | | samba_cv_HAVE_UINT16_FROM_RPC_RPC_H=3D${samba_cv_HAVE_UINT16_FROM_RPC=
_RPC_H=3Dno}
> | | samba_cv_HAVE_UINT32_FROM_RPC_RPC_H=3D${samba_cv_HAVE_UINT32_FROM_RPC=
_RPC_H=3Dno}
> | | samba_cv_HAVE_UNSIGNED_CHAR=3D${samba_cv_HAVE_UNSIGNED_CHAR=3Dyes}
> | | samba_cv_HAVE_UTIMBUF=3D${samba_cv_HAVE_UTIMBUF=3Dyes}
> | | samba_cv_HAVE_UT_UT_ADDR=3D${samba_cv_HAVE_UT_UT_ADDR=3Dyes}
> | | samba_cv_HAVE_UT_UT_EXIT=3D${samba_cv_HAVE_UT_UT_EXIT=3Dyes}
> | | samba_cv_HAVE_UT_UT_HOST=3D${samba_cv_HAVE_UT_UT_HOST=3Dyes}
> | | samba_cv_HAVE_UT_UT_ID=3D${samba_cv_HAVE_UT_UT_ID=3Dyes}
> | | samba_cv_HAVE_UT_UT_NAME=3D${samba_cv_HAVE_UT_UT_NAME=3Dyes}
> | | samba_cv_HAVE_UT_UT_PID=3D${samba_cv_HAVE_UT_UT_PID=3Dyes}
> | | samba_cv_HAVE_UT_UT_TIME=3D${samba_cv_HAVE_UT_UT_TIME=3Dyes}
> | | samba_cv_HAVE_UT_UT_TV=3D${samba_cv_HAVE_UT_UT_TV=3Dyes}
> | | samba_cv_HAVE_UT_UT_TYPE=3D${samba_cv_HAVE_UT_UT_TYPE=3Dyes}
> | | samba_cv_HAVE_UT_UT_USER=3D${samba_cv_HAVE_UT_UT_USER=3Dyes}
> | | samba_cv_HAVE_UX_UT_SYSLEN=3D${samba_cv_HAVE_UX_UT_SYSLEN=3Dno}
> | | samba_cv_HAVE_VA_COPY=3D${samba_cv_HAVE_VA_COPY=3Dyes}
> | | samba_cv_HAVE_WORKING_AF_LOCAL=3D${samba_cv_HAVE_WORKING_AF_LOCAL=3Dy=
es}
> | | samba_cv_HAVE_Werror=3D${samba_cv_HAVE_Werror=3Dyes}
> | | samba_cv_PUTUTLINE_RETURNS_UTMP=3D${samba_cv_PUTUTLINE_RETURNS_UTMP=
=3Dyes}
> | | samba_cv_QUOTA_WORKS=3D${samba_cv_QUOTA_WORKS=3Dyes}
> | | samba_cv_REALPATH_TAKES_NULL=3D${samba_cv_REALPATH_TAKES_NULL=3Dyes}
> | | samba_cv_REPLACE_GETPASS=3D${samba_cv_REPLACE_GETPASS=3Dyes}
> | | samba_cv_REPLACE_INET_NTOA=3D${samba_cv_REPLACE_INET_NTOA=3Dno}
> | | samba_cv_REPLACE_READDIR=3D${samba_cv_REPLACE_READDIR=3Dno}
> | | samba_cv_RUN_QUOTA_TESTS=3D${samba_cv_RUN_QUOTA_TESTS=3Dyes}
> | | samba_cv_SEEKDIR_RETURNS_VOID=3D${samba_cv_SEEKDIR_RETURNS_VOID=3Dyes}
> | | samba_cv_SIZEOF_DEV_T=3D${samba_cv_SIZEOF_DEV_T=3Dyes}
> | | samba_cv_SIZEOF_INO_T=3D${samba_cv_SIZEOF_INO_T=3Dyes}
> | | samba_cv_SIZEOF_OFF_T=3D${samba_cv_SIZEOF_OFF_T=3Dyes}
> | | samba_cv_SYSCONF_SC_NGROUPS_MAX=3D${samba_cv_SYSCONF_SC_NGROUPS_MAX=
=3Dyes}
> | | samba_cv_SYSCONF_SC_NPROCESSORS_ONLN=3D${samba_cv_SYSCONF_SC_NPROCESS=
ORS_ONLN=3Dyes}
> | | samba_cv_SYSCONF_SC_NPROC_ONLN=3D${samba_cv_SYSCONF_SC_NPROC_ONLN=3Dn=
o}
> | | samba_cv_SYSCONF_SC_PAGESIZE=3D${samba_cv_SYSCONF_SC_PAGESIZE=3Dyes}
> | | samba_cv_SYSQUOTA_FOUND=3D${samba_cv_SYSQUOTA_FOUND=3Dyes}
> | | samba_cv_SYSQUOTA_WORKS=3D${samba_cv_SYSQUOTA_WORKS=3Dyes}
> | | samba_cv_SYSQUOTA_WORKS_XFS=3D${samba_cv_SYSQUOTA_WORKS_XFS=3Dyes}
> | | samba_cv_TRY_QUOTAS=3D${samba_cv_TRY_QUOTAS=3Dno}
> | | samba_cv_TRY_SYS_QUOTAS=3D${samba_cv_TRY_SYS_QUOTAS=3Dyes}
> | | samba_cv_USE_SETRESUID=3D${samba_cv_USE_SETRESUID=3Dyes}
> | | samba_cv_WE_USE_SYS_QUOTAS=3D${samba_cv_WE_USE_SYS_QUOTAS=3Dyes}
> | | samba_cv_WITH_AFS=3D${samba_cv_WITH_AFS=3Dno}
> | | samba_cv_WITH_FAKE_KASERVER=3D${samba_cv_WITH_FAKE_KASERVER=3Dno}
> | | samba_cv_WITH_QUOTAS=3D${samba_cv_WITH_QUOTAS=3Dauto}
> | | samba_cv_WITH_SYS_QUOTAS=3D${samba_cv_WITH_SYS_QUOTAS=3Dauto}
> | | samba_cv_WITH_VFS_AFSACL=3D${samba_cv_WITH_VFS_AFSACL=3Dno}
> | | samba_cv_compiler_supports_ll=3D${samba_cv_compiler_supports_ll=3Dyes}
> | | samba_cv_found_xfs_header=3D${samba_cv_found_xfs_header=3Dyes}
> | | samba_cv_have_longlong=3D${samba_cv_have_longlong=3Dyes}
> | | samba_cv_have_setresgid=3D${samba_cv_have_setresgid=3Dyes}
> | | samba_cv_have_setresuid=3D${samba_cv_have_setresuid=3Dyes}
> | | samba_cv_immediate_structures=3D${samba_cv_immediate_structures=3Dyes}
> | | samba_cv_optimize_out_funcation_calls=3D${samba_cv_optimize_out_funca=
tion_calls=3Dyes}
> | | samba_cv_sig_atomic_t=3D${samba_cv_sig_atomic_t=3Dyes}
> | | samba_cv_socklen_t=3D${samba_cv_socklen_t=3Dyes}
> | | samba_cv_struct_timespec=3D${samba_cv_struct_timespec=3Dyes}
> | | samba_cv_sysquotas_file=3D${samba_cv_sysquotas_file=3Dlib/sysquotas_l=
inux.c}
> | | samba_cv_unixsocket=3D${samba_cv_unixsocket=3Dyes}
> | | samba_cv_volatile=3D${samba_cv_volatile=3Dyes}
> | |
> | | #older sambe defines
> | | samba_cv_USE_SETEUID=3D${samba_cv_USE_SETEUID=3Dyes}
> | | samba_cv_USE_SETREUID=3D${samba_cv_USE_SETREUID=3Dyes}
> | | samba_cv_USE_SETUIDX=3D${samba_cv_USE_SETUIDX=3Dyes}
> | | samba_cv_LINUX_LFS_SUPPORT=3D${samba_cv_LINUX_LFS_SUPPORT=3Dyes}
> | |
> | | # clamav
> | | clamav_av_func_working_snprintf_long=3D${clamav_av_func_working_snpri=
ntf_long=3Dyes}
> | | clamav_av_have_in_port_t=3D${clamav_av_have_in_port_t=3Dyes}
> | | clamav_av_have_in_addr_t=3D${clamav_av_have_in_addr_t=3Dyes}
> | | ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}
> | |
> | | #dbus
> | | ac_cv_have_abstract_sockets=3D${ac_cv_have_abstract_sockets=3Dyes}
> | |
> | | # lftp
> | | ac_cv_file___dev_ptc_=3Dyes
> | |
> | | # guile
> | | ac_cv_func_pthread_attr_getstack=3D${ac_cv_func_pthread_attr_getstack=
=3Dyes}
> | |
> | | # gnet
> | | ac_cv_member_struct_sockaddr_sa_len=3D${ac_cv_member_struct_sockaddr_=
sa_len=3Dno}
> | | ac_cv_gnet_have_abstract_sockets=3D${ac_cv_gnet_have_abstract_sockets=
=3Dno}
> | | gnet_sockaddr_family_field_name=3D${gnet_sockaddr_family_field_name=
=3Dss_family}
> | configure:2475: loading site script /media/Data/yocto/working/tisdk/sou=
rces/oe-core/meta/site/common
> | | # libelf
> | | mr_cv_target_elf=3D${mr_cv_target_elf=3Dyes}
> | |
> | | # Normally kernels have /dev/random enabled
> | | ac_cv_file__dev_random=3D${ac_cv_file__dev_random=3Dyes}
> | |
> | | # Avoid sudo to assume void for unsetenv in cross environment, or els=
e it conflicts with
> | | # target stdlib.h prototype which follows POSIX compiliance. Mark for=
 upstream.
> | | sudo_cv_func_unsetenv_void=3Dno
> | |
> | | # shadow dir info, to avoid searching build system
> | | shadow_cv_maildir=3D${localstatedir}/spool/mail
> | | shadow_cv_mailfile=3DMailbox
> | | shadow_cv_utmpdir=3D${localstatedir}/run
> | | shadow_cv_logdir=3D${localstatedir}/log
> | | shadow_cv_passwd_dir=3D${bindir}
> | |
> | | # python: deactivate a runtime check for ipv6-support in python >=3D2=
=2E7.1 that fails when cross-compiling
> | | ac_cv_buggy_getaddrinfo=3Dno
> | configure:2718: checking for a BSD-compatible install
> | configure:2786: result: /usr/bin/install -c
> | configure:2797: checking whether build environment is sane
> | configure:2852: result: yes
> | configure:2911: checking for arm-oe-linux-gnueabi-strip
> | configure:2938: result: arm-linux-gnueabihf-strip
> | configure:3003: checking for a thread-safe mkdir -p
> | configure:3042: result: /bin/mkdir -p
> | configure:3049: checking for gawk
> | configure:3065: found /usr/bin/gawk
> | configure:3076: result: gawk
> | configure:3087: checking whether make sets $(MAKE)
> | configure:3109: result: yes
> | configure:3209: checking build system type
> | configure:3223: result: i686-pc-linux-gnu
> | configure:3243: checking host system type
> | configure:3256: result: arm-oe-linux-gnueabi
> | configure:3283: autobuild project... GNU Libtool
> | configure:3289: autobuild revision... 2.4.2 ()
> | configure:3294: autobuild hostname... infch02242
> | configure:3298: autobuild mode... default
> | configure:3306: autobuild timestamp... 20140228T121041Z
> | configure:3365: checking for arm-oe-linux-gnueabi-gcc
> | configure:3392: result: arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthu=
mb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yoct=
o/working/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am3517-e=
vm
> | configure:3661: checking for C compiler version
> | configure:3670: arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-inter=
work -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/workin=
g/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm --ver=
sion >&5
> | arm-linux-gnueabihf-gcc (crosstool-NG linaro-1.13.1-4.7-2013.03-2013031=
3 - Linaro GCC 2013.03) 4.7.3 20130226 (prerelease)
> | Copyright (C) 2012 Free Software Foundation, Inc.
> | This is free software; see the source for copying conditions.  There is=
 NO
> | warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURP=
OSE.
> |=20
> | configure:3681: $? =3D 0
> | configure:3670: arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-inter=
work -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/workin=
g/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm -v >&5
> | Using built-in specs.
> | COLLECT_GCC=3Darm-linux-gnueabihf-gcc
> | COLLECT_LTO_WRAPPER=3D/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-20=
13.03-20130313_linux/bin/../libexec/gcc/arm-linux-gnueabihf/4.7.3/lto-wrapp=
er
> | Target: arm-linux-gnueabihf
> | Configured with: /cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnu=
eabihf-linux/.build/src/gcc-linaro-4.7-2013.03/configure --build=3Di686-bui=
ld_pc-linux-gnu --host=3Di686-build_pc-linux-gnu --target=3Darm-linux-gnuea=
bihf --prefix=3D/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabih=
f-linux/install --with-sysroot=3D/cbuild/slaves/oorts/crosstool-ng/builds/a=
rm-linux-gnueabihf-linux/install/arm-linux-gnueabihf/libc --enable-language=
s=3Dc,c++,fortran --enable-multilib --with-arch=3Darmv7-a --with-tune=3Dcor=
tex-a9 --with-fpu=3Dvfpv3-d16 --with-float=3Dhard --with-pkgversion=3D'cros=
stool-NG linaro-1.13.1-4.7-2013.03-20130313 - Linaro GCC 2013.03' --with-bu=
gurl=3Dhttps://bugs.launchpad.net/gcc-linaro --enable-__cxa_atexit --enable=
-libmudflap --enable-libgomp --enable-libssp --with-gmp=3D/cbuild/slaves/oo=
rts/crosstool-ng/builds/arm-linux-gnueabihf-linux/.build/arm-linux-gnueabih=
f/build/static --with-mpfr=3D/cbuild/slaves/oorts/crosstool-ng/builds/arm-l=
inux-gnueabihf-linux/.build/arm-linux-gnueabihf/build/static --with-mpc=3D/=
cbuil
> d/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-linux/.build/arm-l=
inux-gnueabihf/build/static --with-ppl=3D/cbuild/slaves/oorts/crosstool-ng/=
builds/arm-linux-gnueabihf-linux/.build/arm-linux-gnueabihf/build/static --=
with-cloog=3D/cbuild/slaves/oorts/crosstool-ng/builds/arm-linux-gnueabihf-l=
inux/.build/arm-linux-gnueabihf/build/static --with-libelf=3D/cbuild/slaves=
/oorts/crosstool-ng/builds/arm-linux-gnueabihf-linux/.build/arm-linux-gnuea=
bihf/build/static --with-host-libstdcxx=3D'-L/cbuild/slaves/oorts/crosstool=
-ng/builds/arm-linux-gnueabihf-linux/.build/arm-linux-gnueabihf/build/stati=
c/lib -lpwl' --enable-threads=3Dposix --disable-libstdcxx-pch --enable-link=
er-build-id --enable-gold --with-local-prefix=3D/cbuild/slaves/oorts/crosst=
ool-ng/builds/arm-linux-gnueabihf-linux/install/arm-linux-gnueabihf/libc --=
enable-c99 --enable-long-long --with-mode=3Dthumb
> | Thread model: posix
> | gcc version 4.7.3 20130226 (prerelease) (crosstool-NG linaro-1.13.1-4.7=
-2013.03-20130313 - Linaro GCC 2013.03)
> | configure:3681: $? =3D 0
> | configure:3670: arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-inter=
work -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/workin=
g/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm -V >&5
> | arm-linux-gnueabihf-gcc: error: unrecognized command line option '-V'
> | arm-linux-gnueabihf-gcc: fatal error: no input files
> | compilation terminated.
> | configure:3681: $? =3D 1
> | configure:3670: arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-inter=
work -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/workin=
g/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm -qver=
sion >&5
> | arm-linux-gnueabihf-gcc: error: unrecognized command line option '-qver=
sion'
> | arm-linux-gnueabihf-gcc: fatal error: no input files
> | compilation terminated.
> | configure:3681: $? =3D 1
> | configure:3701: checking whether the C compiler works
> | configure:3723: arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-inter=
work -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/workin=
g/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm -isys=
tem/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/ar=
m-linux-gnueabihf/include  -fstack-protector -O2 -pipe -g -feliminate-unuse=
d-debug-types -isystem/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.0=
3-20130313_linux/arm-linux-gnueabihf/include  -fstack-protector -L/home/ash=
ok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnue=
abihf/lib -Wl,-rpath-link,/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-20=
13.03-20130313_linux/arm-linux-gnueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu=
 conftest.c  >&5
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: error: a.out uses VFP register arguments, /tmp/ccvDTDFf.o does not
> | /home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/b=
in/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin=
/ld: failed to merge target specific data of file /tmp/ccvDTDFf.o
> | collect2: error: ld returned 1 exit status
> | configure:3727: $? =3D 1
> | configure:3765: result: no
> | configure: failed program was:
> | | /* confdefs.h */
> | | #define PACKAGE_NAME "GNU Libtool"
> | | #define PACKAGE_TARNAME "libtool"
> | | #define PACKAGE_VERSION "2.4.2"
> | | #define PACKAGE_STRING "GNU Libtool 2.4.2"
> | | #define PACKAGE_BUGREPORT "bug-libtool@gnu.org"
> | | #define PACKAGE_URL "http://www.gnu.org/software/libtool/"
> | | #define PACKAGE "libtool"
> | | #define VERSION "2.4.2"
> | | /* end confdefs.h.  */
> | |
> | | int
> | | main ()
> | | {
> | |
> | |   ;
> | |   return 0;
> | | }
> | configure:3770: error: in `/media/Data/yocto/working/tisdk/build/arago-=
tmp-external-linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-oe-linux-gnueab=
i/libtool-cross/2.4.2-r6.1/libtool-2.4.2':
> | configure:3772: error: C compiler cannot create executables
> | See `config.log' for more details
> |=20
> | ## ---------------- ##
> | ## Cache variables. ##
> | ## ---------------- ##
> |=20
> | ac_cv___va_copy=3Dyes
> | ac_cv_af_unix_large_dgram=3Dyes
> | ac_cv_alignof_CORBA_boolean=3D1
> | ac_cv_alignof_CORBA_char=3D1
> | ac_cv_alignof_CORBA_double=3D8
> | ac_cv_alignof_CORBA_float=3D4
> | ac_cv_alignof_CORBA_long=3D4
> | ac_cv_alignof_CORBA_long_double=3D8
> | ac_cv_alignof_CORBA_long_long=3D8
> | ac_cv_alignof_CORBA_octet=3D1
> | ac_cv_alignof_CORBA_pointer=3D4
> | ac_cv_alignof_CORBA_short=3D2
> | ac_cv_alignof_CORBA_struct=3D1
> | ac_cv_alignof_CORBA_wchar=3D2
> | ac_cv_alignof_guint32=3D4
> | ac_cv_alignof_guint64=3D8
> | ac_cv_alignof_unsigned_long=3D4
> | ac_cv_buggy_getaddrinfo=3Dno
> | ac_cv_build=3Di686-pc-linux-gnu
> | ac_cv_c_bigendian=3Dno
> | ac_cv_c_endian=3Dlittle
> | ac_cv_c_littleendian=3Dyes
> | ac_cv_c_long_double=3Dyes
> | ac_cv_check_sjlj=3Dssjlj
> | ac_cv_conv_longlong_to_float=3Dyes
> | ac_cv_dirent_have_space_d_name=3Dyes
> | ac_cv_env_CCC_set=3D
> | ac_cv_env_CCC_value=3D
> | ac_cv_env_CC_set=3Dset
> | ac_cv_env_CC_value=3D'arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb=
-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/=
working/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm'
> | ac_cv_env_CFLAGS_set=3Dset
> | ac_cv_env_CFLAGS_value=3D'-isystem/home/ashok/gcc-linaro-arm-linux-gnue=
abihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/include  -fstack-prote=
ctor -O2 -pipe -g -feliminate-unused-debug-types'
> | ac_cv_env_CPPFLAGS_set=3Dset
> | ac_cv_env_CPPFLAGS_value=3D'-isystem/home/ashok/gcc-linaro-arm-linux-gn=
ueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/include  -fstack-pro=
tector'
> | ac_cv_env_CPP_set=3Dset
> | ac_cv_env_CPP_value=3D'arm-linux-gnueabihf-gcc -E --sysroot=3D/media/Da=
ta/yocto/working/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/a=
m3517-evm  -march=3Darmv7-a -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3D=
neon'
> | ac_cv_env_CXXCPP_set=3D
> | ac_cv_env_CXXCPP_value=3D
> | ac_cv_env_CXXFLAGS_set=3Dset
> | ac_cv_env_CXXFLAGS_value=3D'-isystem/home/ashok/gcc-linaro-arm-linux-gn=
ueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/include  -fstack-pro=
tector -O2 -pipe -g -feliminate-unused-debug-types -fpermissive'
> | ac_cv_env_CXX_set=3Dset
> | ac_cv_env_CXX_value=3D'arm-linux-gnueabihf-g++  -march=3Darmv7-a -mthum=
b-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto=
/working/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am3517-ev=
m'
> | ac_cv_env_F77_set=3Dset
> | ac_cv_env_F77_value=3D'arm-linux-gnueabihf-g77  -march=3Darmv7-a -mthum=
b-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto=
/working/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am3517-ev=
m'
> | ac_cv_env_FCFLAGS_set=3D
> | ac_cv_env_FCFLAGS_value=3D
> | ac_cv_env_FC_set=3D
> | ac_cv_env_FC_value=3D
> | ac_cv_env_FFLAGS_set=3D
> | ac_cv_env_FFLAGS_value=3D
> | ac_cv_env_LDFLAGS_set=3Dset
> | ac_cv_env_LDFLAGS_value=3D'-L/home/ashok/gcc-linaro-arm-linux-gnueabihf=
-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/lib -Wl,-rpath-link,/home/a=
shok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gn=
ueabihf/lib -Wl,-O1 -Wl,--hash-style=3Dgnu'
> | ac_cv_env_LIBS_set=3D
> | ac_cv_env_LIBS_value=3D
> | ac_cv_env_build_alias_set=3Dset
> | ac_cv_env_build_alias_value=3Di686-linux
> | ac_cv_env_host_alias_set=3Dset
> | ac_cv_env_host_alias_value=3Darm-oe-linux-gnueabi
> | ac_cv_env_target_alias_set=3Dset
> | ac_cv_env_target_alias_value=3Darm-oe-linux-gnueabi
> | ac_cv_epoll_works=3Dyes
> | ac_cv_file___dev_ptc_=3Dyes
> | ac_cv_file__dev_random=3Dyes
> | ac_cv_file__dev_zero=3Dyes
> | ac_cv_func___va_copy=3Dyes
> | ac_cv_func_fnmatch_works=3Dyes
> | ac_cv_func_getaddrinfo=3Dyes
> | ac_cv_func_getgrgid_r=3Dyes
> | ac_cv_func_getpagesize=3Dyes
> | ac_cv_func_getpgrp_void=3Dyes
> | ac_cv_func_getpwuid_r=3Dyes
> | ac_cv_func_lstat_dereferences_slashed_symlink=3Dyes
> | ac_cv_func_lstat_empty_string_bug=3Dno
> | ac_cv_func_malloc_0_nonnull=3Dyes
> | ac_cv_func_malloc_works=3Dyes
> | ac_cv_func_memcmp_working=3Dyes
> | ac_cv_func_memcpy=3Dyes
> | ac_cv_func_mmap_fixed_mapped=3Dyes
> | ac_cv_func_posix_getgrgid_r=3Dyes
> | ac_cv_func_posix_getpwnam_r=3Dyes
> | ac_cv_func_posix_getpwuid_r=3Dyes
> | ac_cv_func_printf_unix98=3Dyes
> | ac_cv_func_pthread_attr_getstack=3Dyes
> | ac_cv_func_pthread_key_delete=3Dyes
> | ac_cv_func_realloc_0_nonnull=3Dyes
> | ac_cv_func_realloc_works=3Dyes
> | ac_cv_func_setgrent_void=3Dyes
> | ac_cv_func_setpgrp_void=3Dyes
> | ac_cv_func_setresuid=3Dyes
> | ac_cv_func_setvbuf_reversed=3Dno
> | ac_cv_func_snprintf_c99=3Dyes
> | ac_cv_func_stat_empty_string_bug=3Dno
> | ac_cv_func_stat_ignores_trailing_slash=3Dno
> | ac_cv_func_strerror=3Dyes
> | ac_cv_func_va_copy=3Dyes
> | ac_cv_func_vsnprintf_c99=3Dyes
> | ac_cv_gnet_have_abstract_sockets=3Dno
> | ac_cv_have_abstract_sockets=3Dyes
> | ac_cv_have_accrights_in_msghdr=3Dno
> | ac_cv_have_broken_snprintf=3Dno
> | ac_cv_have_control_in_msghdr=3Dyes
> | ac_cv_have_decl_sys_siglist=3Dyes
> | ac_cv_have_long_long_format=3Dyes
> | ac_cv_have_openpty_ctty_bug=3Dyes
> | ac_cv_have_space_d_name_in_struct_dirent=3Dyes
> | ac_cv_header_netinet_sctp_h=3Dno
> | ac_cv_header_netinet_sctp_uio_h=3Dno
> | ac_cv_host=3Darm-oe-linux-gnueabi
> | ac_cv_ispeed_offset=3D13
> | ac_cv_lib_png_png_create_info_struct=3Dyes
> | ac_cv_libiconv_utf8=3Dyes
> | ac_cv_libnet_endianess=3Dlil
> | ac_cv_linux_vers=3D2
> | ac_cv_member_struct_sockaddr_sa_len=3Dno
> | ac_cv_need_trio=3Dno
> | ac_cv_o_nonblock_inherited=3Dno
> | ac_cv_path_SED=3Dsed
> | ac_cv_path_install=3D'/usr/bin/install -c'
> | ac_cv_path_mkdir=3D/bin/mkdir
> | ac_cv_pread=3Dno
> | ac_cv_prog_AWK=3Dgawk
> | ac_cv_prog_CC=3D'arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-inte=
rwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/worki=
ng/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm'
> | ac_cv_prog_STRIP=3Darm-linux-gnueabihf-strip
> | ac_cv_prog_make_make_set=3Dyes
> | ac_cv_pwrite=3Dno
> | ac_cv_regexec_segfault_emptystr=3Dno
> | ac_cv_sctp=3Dno
> | ac_cv_sizeof___int64=3D0
> | ac_cv_sizeof_bool=3D1
> | ac_cv_sizeof_char=3D1
> | ac_cv_sizeof_char_p=3D4
> | ac_cv_sizeof_double=3D8
> | ac_cv_sizeof_float=3D4
> | ac_cv_sizeof_int=3D4
> | ac_cv_sizeof_int_p=3D4
> | ac_cv_sizeof_long=3D4
> | ac_cv_sizeof_long_double=3D8
> | ac_cv_sizeof_long_int=3D4
> | ac_cv_sizeof_long_long=3D8
> | ac_cv_sizeof_long_p=3D4
> | ac_cv_sizeof_off_t=3D4
> | ac_cv_sizeof_pid_t=3D4
> | ac_cv_sizeof_ptrdiff_t=3D4
> | ac_cv_sizeof_short=3D2
> | ac_cv_sizeof_short_int=3D2
> | ac_cv_sizeof_signed_char=3D1
> | ac_cv_sizeof_size_t=3D4
> | ac_cv_sizeof_ssize_t=3D4
> | ac_cv_sizeof_unsigned=3D4
> | ac_cv_sizeof_unsigned_char=3D1
> | ac_cv_sizeof_unsigned_int=3D4
> | ac_cv_sizeof_unsigned_long=3D4
> | ac_cv_sizeof_unsigned_long_long=3D8
> | ac_cv_sizeof_unsigned_short=3D2
> | ac_cv_sizeof_void_p=3D4
> | ac_cv_sizeof_wchar_t=3D4
> | ac_cv_strerror_r_SUSv3=3Dno
> | ac_cv_sys_restartable_syscalls=3Dyes
> | ac_cv_time_r_type=3DPOSIX
> | ac_cv_type_uid_t=3D'{ac_cv_type_uid_t=3Dyes}'
> | ac_cv_uchar=3Dno
> | ac_cv_uint=3Dyes
> | ac_cv_ulong=3Dyes
> | ac_cv_ushort=3Dyes
> | ac_cv_va_copy=3Dyes
> | ac_cv_va_val_copy=3Dyes
> | am_cv_func_working_getline=3Dyes
> | am_cv_scanf_lld=3Dyes
> | apr_cv_process_shared_works=3Dno
> | apr_cv_tcp_nodelay_with_cork=3Dyes
> | as_cv_unaligned_access=3Dno
> | bash_cv_dup2_broken=3Dno
> | bash_cv_func_sigsetjmp=3Dmissing
> | bash_cv_func_strcoll_broken=3Dno
> | bash_cv_getcwd_calls_popen=3Dno
> | bash_cv_getenv_redef=3Dyes
> | bash_cv_have_mbstate_t=3Dyes
> | bash_cv_job_control_missing=3Dpresent
> | bash_cv_must_reinstall_sighandlers=3Dno
> | bash_cv_opendir_not_robust=3Dno
> | bash_cv_pgrp_pipe=3Dno
> | bash_cv_printf_a_format=3Dyes
> | bash_cv_sys_named_pipes=3Dpresent
> | bash_cv_sys_siglist=3Dyes
> | bash_cv_type_rlimit=3Drlim_t
> | bash_cv_ulimit_maxfds=3Dyes
> | bash_cv_under_sys_siglist=3Dyes
> | bash_cv_unusable_rtsigs=3Dno
> | compat_cv_func_basename_works=3Dno
> | compat_cv_func_dirname_works=3Dno
> | compat_cv_func_snprintf_works=3Dyes
> | cvs_cv_func_printf_ptr=3Dyes
> | db_cv_align_t=3D'unsigned long long'
> | db_cv_alignp_t=3D'unsigned long'
> | db_cv_fcntl_f_setfd=3Dyes
> | db_cv_path_ar=3D/usr/bin/ar
> | db_cv_path_chmod=3D/bin/chmod
> | db_cv_path_cp=3D/bin/cp
> | db_cv_path_ln=3D/bin/ln
> | db_cv_path_mkdir=3D/bin/mkdir
> | db_cv_path_ranlib=3D/usr/bin/ranlib
> | db_cv_path_rm=3D/bin/rm
> | db_cv_path_sh=3D/bin/sh
> | db_cv_path_strip=3D/usr/bin/strip
> | db_cv_spinlocks=3Dno
> | db_cv_sprintf_count=3Dyes
> | ettercap_cv_type_socklen_t=3Dyes
> | fu_cv_sys_stat_statfs2_bsize=3Dyes
> | gl_cv_func_btowc_eof=3Dyes
> | gl_cv_func_fstatat_zero_flag=3Dyes
> | gl_cv_func_mbrtowc_incomplete_state=3Dyes
> | gl_cv_func_mbrtowc_nul_retval=3Dyes
> | gl_cv_func_mbrtowc_null_arg=3Dyes
> | gl_cv_func_mbrtowc_retval=3Dyes
> | gl_cv_func_mbrtowc_sanitycheck=3Dyes
> | gl_cv_func_wcrtomb_retval=3Dyes
> | gl_cv_func_wctob_works=3Dyes
> | glib_cv___va_copy=3Dyes
> | glib_cv_compliant_posix_memalign=3D1
> | glib_cv_has__inline=3Dyes
> | glib_cv_has__inline__=3Dyes
> | glib_cv_hasinline=3Dyes
> | glib_cv_have_qsort_r=3Dyes
> | glib_cv_long_long_format=3Dll
> | glib_cv_rtldglobal_broken=3Dno
> | glib_cv_sane_realloc=3Dyes
> | glib_cv_sizeof_gmutex=3D24
> | glib_cv_sizeof_intmax_t=3D8
> | glib_cv_sizeof_ptrdiff_t=3D4
> | glib_cv_sizeof_size_t=3D4
> | glib_cv_sizeof_system_thread=3D4
> | glib_cv_stack_grows=3Dno
> | glib_cv_strlcpy=3Dno
> | glib_cv_sys_pthread_cond_timedwait_posix=3Dyes
> | glib_cv_sys_pthread_getspecific_posix=3Dyes
> | glib_cv_sys_pthread_mutex_trylock_posix=3Dyes
> | glib_cv_sys_use_pid_niceness_surrogate=3Dyes
> | glib_cv_uscore=3Dno
> | glib_cv_use_pid_surrogate=3Dyes
> | glib_cv_va_copy=3Dyes
> | glib_cv_va_val_copy=3Dyes
> | gt_cv_locale_fr=3Dfr_FR
> | jm_cv_func_working_readdir=3Dyes
> | lf_cv_sane_realloc=3Dyes
> | lftp_cv_va_val_copy=3Dyes
> | libIDL_cv_long_long_format=3Dll
> | lt_cv_sys_lib_dlsearch_path_spec=3D'/usr/lib /lib'
> | mr_cv_target_elf=3Dyes
> | mysql_cv_func_atomic_add=3Dno
> | mysql_cv_func_atomic_sub=3Dno
> | nano_cv_func_regexec_segv_emptystr=3Dno
> | php_cv_lib_cookie_io_functions_use_off64_t=3Dyes
> | rpppoe_cv_pack_bitfields=3Drev
> | rsync_cv_HAVE_BROKEN_LARGEFILE=3Dno
> | rsync_cv_HAVE_BROKEN_READDIR=3Dno
> | rsync_cv_HAVE_C99_VSNPRINTF=3Dyes
> | rsync_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes
> | rsync_cv_HAVE_LONGLONG=3Dyes
> | rsync_cv_HAVE_OFF64_T=3Dno
> | rsync_cv_HAVE_SECURE_MKSTEMP=3Dyes
> | rsync_cv_HAVE_SHORT_INO_T=3Dno
> | rsync_cv_HAVE_SOCKETPAIR=3Dyes
> | rsync_cv_HAVE_UNSIGNED_CHAR=3Dno
> | rsync_cv_REPLACE_INET_ATON=3Dno
> | rsync_cv_REPLACE_INET_NTOA=3Dno
> | samba_cv_BROKEN_NISPLUS_INCLUDE_FILES=3Dyes
> | samba_cv_BROKEN_REDHAT_7_SYSTEM_HEADERS=3Dno
> | samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=3Dno
> | samba_cv_HAVE_BROKEN_GETGROUPS=3Dno
> | samba_cv_HAVE_BROKEN_LINUX_SENDFILE=3Dyes
> | samba_cv_HAVE_BROKEN_READDIR=3Dyes
> | samba_cv_HAVE_BROKEN_READDIR_NAME=3Dno
> | samba_cv_HAVE_C99_VSNPRINTF=3Dyes
> | samba_cv_HAVE_DEV64_T=3Dno
> | samba_cv_HAVE_DEVICE_MAJOR_FN=3Dyes
> | samba_cv_HAVE_DEVICE_MINOR_FN=3Dyes
> | samba_cv_HAVE_DQB_FSOFTLIMIT=3Dno
> | samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=3Dyes
> | samba_cv_HAVE_FAM_H=3Dno
> | samba_cv_HAVE_FCNTL_LOCK=3Dyes
> | samba_cv_HAVE_FTRUNCATE_EXTEND=3Dyes
> | samba_cv_HAVE_FUNCTION_MACRO=3Dyes
> | samba_cv_HAVE_GETTIMEOFDAY_TZ=3Dyes
> | samba_cv_HAVE_IFACE_AIX=3Dno
> | samba_cv_HAVE_IFACE_IFCONF=3Dyes
> | samba_cv_HAVE_IFACE_IFREQ=3Dyes
> | samba_cv_HAVE_INO64_T=3Dno
> | samba_cv_HAVE_INT16_FROM_RPC_RPC_H=3Dno
> | samba_cv_HAVE_INT32_FROM_RPC_RPC_H=3Dno
> | samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=3Dno
> | samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=3Dyes
> | samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=3Dyes
> | samba_cv_HAVE_KERNEL_SHARE_MODES=3Dyes
> | samba_cv_HAVE_MAKEDEV=3Dyes
> | samba_cv_HAVE_MMAP=3Dyes
> | samba_cv_HAVE_NATIVE_ICONV=3Dyes
> | samba_cv_HAVE_OFF64_T=3Dno
> | samba_cv_HAVE_ROOT=3Dyes
> | samba_cv_HAVE_RPC_AUTH_ERROR_CONFLICT=3Dno
> | samba_cv_HAVE_SECURE_MKSTEMP=3Dyes
> | samba_cv_HAVE_SENDFILE64=3Dyes
> | samba_cv_HAVE_SENDFILE=3Dyes
> | samba_cv_HAVE_SOCK_SIN_LEN=3Dno
> | samba_cv_HAVE_STAT_ST_BLKSIZE=3Dyes
> | samba_cv_HAVE_STAT_ST_BLOCKS=3Dyes
> | samba_cv_HAVE_STRUCT_DIR64=3Dno
> | samba_cv_HAVE_STRUCT_DIRENT64=3Dyes
> | samba_cv_HAVE_STRUCT_FLOCK64=3Dyes
> | samba_cv_HAVE_TRUNCATED_SALT=3Dno
> | samba_cv_HAVE_UINT16_FROM_RPC_RPC_H=3Dno
> | samba_cv_HAVE_UINT32_FROM_RPC_RPC_H=3Dno
> | samba_cv_HAVE_UNSIGNED_CHAR=3Dyes
> | samba_cv_HAVE_UTIMBUF=3Dyes
> | samba_cv_HAVE_UT_UT_ADDR=3Dyes
> | samba_cv_HAVE_UT_UT_EXIT=3Dyes
> | samba_cv_HAVE_UT_UT_HOST=3Dyes
> | samba_cv_HAVE_UT_UT_ID=3Dyes
> | samba_cv_HAVE_UT_UT_NAME=3Dyes
> | samba_cv_HAVE_UT_UT_PID=3Dyes
> | samba_cv_HAVE_UT_UT_TIME=3Dyes
> | samba_cv_HAVE_UT_UT_TV=3Dyes
> | samba_cv_HAVE_UT_UT_TYPE=3Dyes
> | samba_cv_HAVE_UT_UT_USER=3Dyes
> | samba_cv_HAVE_UX_UT_SYSLEN=3Dno
> | samba_cv_HAVE_VA_COPY=3Dyes
> | samba_cv_HAVE_WORKING_AF_LOCAL=3Dyes
> | samba_cv_HAVE_Werror=3Dyes
> | samba_cv_LINUX_LFS_SUPPORT=3Dyes
> | samba_cv_PUTUTLINE_RETURNS_UTMP=3Dyes
> | samba_cv_QUOTA_WORKS=3Dyes
> | samba_cv_REALPATH_TAKES_NULL=3Dyes
> | samba_cv_REPLACE_GETPASS=3Dyes
> | samba_cv_REPLACE_INET_NTOA=3Dno
> | samba_cv_REPLACE_READDIR=3Dno
> | samba_cv_RUN_QUOTA_TESTS=3Dyes
> | samba_cv_SEEKDIR_RETURNS_VOID=3Dyes
> | samba_cv_SIZEOF_DEV_T=3Dyes
> | samba_cv_SIZEOF_INO_T=3Dyes
> | samba_cv_SIZEOF_OFF_T=3Dyes
> | samba_cv_SYSCONF_SC_NGROUPS_MAX=3Dyes
> | samba_cv_SYSCONF_SC_NPROCESSORS_ONLN=3Dyes
> | samba_cv_SYSCONF_SC_NPROC_ONLN=3Dno
> | samba_cv_SYSCONF_SC_PAGESIZE=3Dyes
> | samba_cv_SYSQUOTA_FOUND=3Dyes
> | samba_cv_SYSQUOTA_WORKS=3Dyes
> | samba_cv_SYSQUOTA_WORKS_XFS=3Dyes
> | samba_cv_TRY_QUOTAS=3Dno
> | samba_cv_TRY_SYS_QUOTAS=3Dyes
> | samba_cv_USE_SETEUID=3Dyes
> | samba_cv_USE_SETRESUID=3Dyes
> | samba_cv_USE_SETREUID=3Dyes
> | samba_cv_USE_SETUIDX=3Dyes
> | samba_cv_WE_USE_SYS_QUOTAS=3Dyes
> | samba_cv_WITH_AFS=3Dno
> | samba_cv_WITH_FAKE_KASERVER=3Dno
> | samba_cv_WITH_QUOTAS=3Dauto
> | samba_cv_WITH_SYS_QUOTAS=3Dauto
> | samba_cv_WITH_VFS_AFSACL=3Dno
> | samba_cv_compiler_supports_ll=3Dyes
> | samba_cv_found_xfs_header=3Dyes
> | samba_cv_have_longlong=3Dyes
> | samba_cv_have_setresgid=3Dyes
> | samba_cv_have_setresuid=3Dyes
> | samba_cv_immediate_structures=3Dyes
> | samba_cv_optimize_out_funcation_calls=3Dyes
> | samba_cv_sig_atomic_t=3Dyes
> | samba_cv_socklen_t=3Dyes
> | samba_cv_struct_timespec=3Dyes
> | samba_cv_sysquotas_file=3Dlib/sysquotas_linux.c
> | samba_cv_unixsocket=3Dyes
> | samba_cv_volatile=3Dyes
> | sc_cv_termios_ispeed=3Dyes
> | screen_cv_sys_bcopy_overlap=3Dno
> | screen_cv_sys_fifo_broken_impl=3Dyes
> | screen_cv_sys_fifo_usable=3Dyes
> | screen_cv_sys_memcpy_overlap=3Dno
> | screen_cv_sys_memmove_overlap=3Dno
> | screen_cv_sys_select_broken_retval=3Dno
> | screen_cv_sys_sockets_nofs=3Dno
> | screen_cv_sys_sockets_usable=3Dyes
> | screen_cv_sys_terminfo_used=3Dyes
> | shadow_cv_logdir=3D/var/log
> | shadow_cv_maildir=3D/var/spool/mail
> | shadow_cv_mailfile=3DMailbox
> | shadow_cv_passwd_dir=3D/usr/bin
> | shadow_cv_utmpdir=3D/var/run
> | slrn_cv_va_val_copy=3Dyes
> | sudo_cv_func_unsetenv_void=3Dno
> | tcl_cv_api_serial=3Dtermios
> | utils_cv_sys_open_max=3D1019
> |=20
> | ## ----------------- ##
> | ## Output variables. ##
> | ## ----------------- ##
> |=20
> | ACLOCAL=3D'${SHELL} /media/Data/yocto/working/tisdk/build/arago-tmp-ext=
ernal-linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-oe-linux-gnueabi/libto=
ol-cross/2.4.2-r6.1/libtool-2.4.2/libltdl/config/missing --run aclocal-1.12'
> | AMDEPBACKSLASH=3D''
> | AMDEP_FALSE=3D''
> | AMDEP_TRUE=3D''
> | AMTAR=3D'$${TAR-tar}'
> | AR=3D'arm-linux-gnueabihf-ar'
> | ARGZ_H=3D''
> | AS=3D'arm-linux-gnueabihf-as'
> | AUTOCONF=3D'${SHELL} /media/Data/yocto/working/tisdk/build/arago-tmp-ex=
ternal-linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-oe-linux-gnueabi/libt=
ool-cross/2.4.2-r6.1/libtool-2.4.2/libltdl/config/missing --run autoconf'
> | AUTOHEADER=3D'${SHELL} /media/Data/yocto/working/tisdk/build/arago-tmp-=
external-linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-oe-linux-gnueabi/li=
btool-cross/2.4.2-r6.1/libtool-2.4.2/libltdl/config/missing --run autoheade=
r'
> | AUTOM4TE=3D'autom4te'
> | AUTOMAKE=3D'${SHELL} /media/Data/yocto/working/tisdk/build/arago-tmp-ex=
ternal-linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-oe-linux-gnueabi/libt=
ool-cross/2.4.2-r6.1/libtool-2.4.2/libltdl/config/missing --run automake-1.=
12'
> | AUTOTEST=3D'$(AUTOM4TE) --language=3Dautotest'
> | AWK=3D'gawk'
> | CC=3D'arm-linux-gnueabihf-gcc  -march=3Darmv7-a -mthumb-interwork -mflo=
at-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/bu=
ild/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm'
> | CCDEPMODE=3D''
> | CFLAGS=3D'-isystem/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.0=
3-20130313_linux/arm-linux-gnueabihf/include  -fstack-protector -O2 -pipe -=
g -feliminate-unused-debug-types'
> | CONFIG_STATUS_DEPENDENCIES=3D'$(top_srcdir)/ChangeLog'
> | CONF_SUBDIRS=3D'tests/cdemo tests/demo tests/depdemo tests/f77demo test=
s/fcdemo 	tests/mdemo tests/mdemo2 tests/pdemo tests/tagdemo'
> | CONVENIENCE_LTDL_FALSE=3D''
> | CONVENIENCE_LTDL_TRUE=3D''
> | CPP=3D'arm-linux-gnueabihf-gcc -E --sysroot=3D/media/Data/yocto/working=
/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm  -marc=
h=3Darmv7-a -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon'
> | CPPFLAGS=3D'-isystem/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013=
=2E03-20130313_linux/arm-linux-gnueabihf/include  -fstack-protector'
> | CXX=3D'arm-linux-gnueabihf-g++  -march=3Darmv7-a -mthumb-interwork -mfl=
oat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/b=
uild/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm'
> | CXXCPP=3D''
> | CXXDEPMODE=3D''
> | CXXFLAGS=3D'-isystem/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013=
=2E03-20130313_linux/arm-linux-gnueabihf/include  -fstack-protector -O2 -pi=
pe -g -feliminate-unused-debug-types -fpermissive'
> | CYGPATH_W=3D'echo'
> | DEFS=3D''
> | DEPDIR=3D''
> | DIST_MAKEFILE_LIST=3D'tests/cdemo/Makefile tests/demo/Makefile tests/de=
pdemo/Makefile tests/f77demo/Makefile tests/fcdemo/Makefile tests/mdemo/Mak=
efile tests/mdemo2/Makefile tests/pdemo/Makefile tests/tagdemo/Makefile '
> | DLLTOOL=3D''
> | DSYMUTIL=3D''
> | DUMPBIN=3D''
> | ECHO_C=3D''
> | ECHO_N=3D'-n'
> | ECHO_T=3D''
> | EGREP=3D''
> | EXEEXT=3D''
> | F77=3D'arm-linux-gnueabihf-g77  -march=3Darmv7-a -mthumb-interwork -mfl=
oat-abi=3Dsoftfp -mfpu=3Dneon --sysroot=3D/media/Data/yocto/working/tisdk/b=
uild/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm'
> | FC=3D''
> | FCFLAGS=3D''
> | FFLAGS=3D''
> | FGREP=3D''
> | GCJ=3D''
> | GCJFLAGS=3D''
> | GOC=3D''
> | GREP=3D''
> | HAVE_CXX_FALSE=3D''
> | HAVE_CXX_TRUE=3D''
> | HAVE_F77_FALSE=3D''
> | HAVE_F77_TRUE=3D''
> | HAVE_FC_FALSE=3D''
> | HAVE_FC_TRUE=3D''
> | HAVE_GCJ_FALSE=3D''
> | HAVE_GCJ_TRUE=3D''
> | HAVE_RC_FALSE=3D''
> | HAVE_RC_TRUE=3D''
> | HELP2MAN=3D''
> | INSTALL_DATA=3D'${INSTALL} -m 644'
> | INSTALL_LTDL_FALSE=3D''
> | INSTALL_LTDL_TRUE=3D''
> | INSTALL_PROGRAM=3D'${INSTALL}'
> | INSTALL_SCRIPT=3D'${INSTALL}'
> | INSTALL_STRIP_PROGRAM=3D'$(install_sh) -c -s'
> | LASTRELEASE=3D'2.4.1'
> | LD=3D'arm-linux-gnueabihf-ld --sysroot=3D/media/Data/yocto/working/tisd=
k/build/arago-tmp-external-linaro-toolchain/sysroots/am3517-evm'
> | LDFLAGS=3D'-L/home/ashok/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-201=
30313_linux/arm-linux-gnueabihf/lib -Wl,-rpath-link,/home/ashok/gcc-linaro-=
arm-linux-gnueabihf-4.7-2013.03-20130313_linux/arm-linux-gnueabihf/lib -Wl,=
-O1 -Wl,--hash-style=3Dgnu'
> | LIBADD_DL=3D''
> | LIBADD_DLD_LINK=3D''
> | LIBADD_DLOPEN=3D''
> | LIBADD_SHL_LOAD=3D''
> | LIBOBJS=3D''
> | LIBS=3D''
> | LIBTOOL=3D''
> | LIPO=3D''
> | LN_S=3D''
> | LTDLOPEN=3D''
> | LTLIBOBJS=3D''
> | LT_CONFIG_H=3D''
> | LT_DLLOADERS=3D''
> | LT_DLPREOPEN=3D''
> | M4SH=3D'$(AUTOM4TE) --language=3Dm4sh'
> | MAKEINFO=3D'${SHELL} /media/Data/yocto/working/tisdk/build/arago-tmp-ex=
ternal-linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-oe-linux-gnueabi/libt=
ool-cross/2.4.2-r6.1/libtool-2.4.2/libltdl/config/missing --run makeinfo'
> | MANIFEST_TOOL=3D''
> | MKDIR_P=3D'/bin/mkdir -p'
> | NM=3D'arm-linux-gnueabihf-nm'
> | NMEDIT=3D''
> | OBJDUMP=3D'arm-linux-gnueabihf-objdump'
> | OBJEXT=3D''
> | ORDER=3D''
> | OTOOL64=3D''
> | OTOOL=3D''
> | PACKAGE=3D'libtool'
> | PACKAGE_BUGREPORT=3D'bug-libtool@gnu.org'
> | PACKAGE_NAME=3D'GNU Libtool'
> | PACKAGE_STRING=3D'GNU Libtool 2.4.2'
> | PACKAGE_TARNAME=3D'libtool'
> | PACKAGE_URL=3D'http://www.gnu.org/software/libtool/'
> | PACKAGE_VERSION=3D'2.4.2'
> | PATH_SEPARATOR=3D':'
> | RANLIB=3D'arm-linux-gnueabihf-ranlib'
> | RC=3D''
> | SED=3D''
> | SET_MAKE=3D''
> | SHELL=3D'/bin/bash'
> | STRIP=3D'arm-linux-gnueabihf-strip'
> | TIMESTAMP=3D''
> | VERSION=3D'2.4.2'
> | ac_ct_AR=3D''
> | ac_ct_CC=3D''
> | ac_ct_CXX=3D''
> | ac_ct_DUMPBIN=3D''
> | ac_ct_F77=3D''
> | ac_ct_FC=3D''
> | aclocaldir=3D'${datadir}/aclocal'
> | am__EXEEXT_FALSE=3D''
> | am__EXEEXT_TRUE=3D''
> | am__fastdepCC_FALSE=3D''
> | am__fastdepCC_TRUE=3D''
> | am__fastdepCXX_FALSE=3D''
> | am__fastdepCXX_TRUE=3D''
> | am__include=3D''
> | am__isrc=3D''
> | am__leading_dot=3D'.'
> | am__nodep=3D''
> | am__quote=3D''
> | am__tar=3D'$${TAR-tar} chof - "$$tardir"'
> | am__untar=3D'$${TAR-tar} xf -'
> | bindir=3D'/usr/bin'
> | build=3D'i686-pc-linux-gnu'
> | build_alias=3D'i686-linux'
> | build_cpu=3D'i686'
> | build_os=3D'linux-gnu'
> | build_vendor=3D'pc'
> | datadir=3D'/media/Data/yocto/working/tisdk/build/arago-tmp-external-lin=
aro-toolchain/sysroots/am3517-evm/usr/share'
> | datarootdir=3D'${prefix}/share'
> | docdir=3D'${datarootdir}/doc/${PACKAGE_TARNAME}'
> | dvidir=3D'${docdir}'
> | exec_prefix=3D'/usr'
> | host=3D'arm-oe-linux-gnueabi'
> | host_alias=3D'arm-oe-linux-gnueabi'
> | host_cpu=3D'arm'
> | host_os=3D'linux-gnueabi'
> | host_vendor=3D'oe'
> | htmldir=3D'${docdir}'
> | includedir=3D'/usr/include'
> | infodir=3D'/media/Data/yocto/working/tisdk/build/arago-tmp-external-lin=
aro-toolchain/sysroots/am3517-evm/usr/share/info'
> | install_sh=3D'${SHELL} /media/Data/yocto/working/tisdk/build/arago-tmp-=
external-linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-oe-linux-gnueabi/li=
btool-cross/2.4.2-r6.1/libtool-2.4.2/libltdl/config/install-sh'
> | libdir=3D'/usr/lib'
> | libexecdir=3D'/usr/lib/libtool'
> | localedir=3D'${datarootdir}/locale'
> | localstatedir=3D'/var'
> | mandir=3D'/media/Data/yocto/working/tisdk/build/arago-tmp-external-lina=
ro-toolchain/sysroots/am3517-evm/usr/share/man'
> | mkdir_p=3D'$(MKDIR_P)'
> | oldincludedir=3D'/usr/include'
> | package_revision=3D'1.3337'
> | pdfdir=3D'${docdir}'
> | pkgdatadir=3D'${datadir}/libtool'
> | prefix=3D'/usr'
> | program_transform_name=3D's,x,x,'
> | psdir=3D'${docdir}'
> | sbindir=3D'/usr/sbin'
> | sharedstatedir=3D'/com'
> | sys_symbol_underscore=3D''
> | sysconfdir=3D'/etc'
> | target_alias=3D'arm-oe-linux-gnueabi'
> | to_host_file_cmd=3D''
> | to_tool_file_cmd=3D''
> |=20
> | ## ----------- ##
> | ## confdefs.h. ##
> | ## ----------- ##
> |=20
> | /* confdefs.h */
> | #define PACKAGE_NAME "GNU Libtool"
> | #define PACKAGE_TARNAME "libtool"
> | #define PACKAGE_VERSION "2.4.2"
> | #define PACKAGE_STRING "GNU Libtool 2.4.2"
> | #define PACKAGE_BUGREPORT "bug-libtool@gnu.org"
> | #define PACKAGE_URL "http://www.gnu.org/software/libtool/"
> | #define PACKAGE "libtool"
> | #define VERSION "2.4.2"
> |=20
> | configure: exit 77
> | ERROR: oe_runconf failed
> | ERROR: Function failed: do_configure (see /media/Data/yocto/working/tis=
dk/build/arago-tmp-external-linaro-toolchain/work/armv7a-vfp-neon-2.6.37.2-=
oe-linux-gnueabi/libtool-cross/2.4.2-r6.1/temp/log.do_configure.28442 for f=
urther information)
> ERROR: Task 387 (/media/Data/yocto/working/tisdk/sources/oe-core/meta/rec=
ipes-devtools/libtool/libtool-cross_2.4.2.bb, do_configure) failed with exi=
t code '1'
> NOTE: Tasks Summary: Attempted 488 tasks of which 484 didn't need to be r=
erun and 2 failed.
> Waiting for 0 running tasks to finish:
>=20
> Summary: 2 tasks failed:
>   /media/Data/yocto/working/tisdk/sources/oe-core/meta/recipes-core/zlib/=
zlib_1.2.7.bb, do_compile
>   /media/Data/yocto/working/tisdk/sources/oe-core/meta/recipes-devtools/l=
ibtool/libtool-cross_2.4.2.bb, do_configure
> Summary: There was 1 WARNING message shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit cod=
e.
>=20


