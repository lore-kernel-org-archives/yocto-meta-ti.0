Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E050DE003FA
	for <meta-ti@yoctoproject.org>; Thu,  8 Aug 2013 10:04:09 -0700 (PDT)
Received: by mail-oa0-f43.google.com with SMTP id i10so5696124oag.16
	for <meta-ti@yoctoproject.org>; Thu, 08 Aug 2013 10:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=ACsKntM0AHx4dwKZy7yLmWVXdSyXsgSIOeEA8MHvshU=;
	b=vRd7CmmTDEwAXaYnS3hRfk6IHFXPCGtnj+UVBX0njZe3K+E+nrzcoD2yDAM7mM0PcD
	a4yYV/w0w+fgSfwXUXz6W3te80HoStWO3b3FZNBtjfXLg+4qfQq3cr2Xsx2+ksdJHWpW
	Yo2wDzZjNTX+127Vrf8HKwNGUdqBkAyHYmkzPyTK/NtJTwxVlJ5o8GIgCzf/OpYHbDYh
	Z4oie6oMKhk0xxtCrSp/N3vT0+ci9+isVLl4nU0Et8wueoRRoN37Jqbvug8wcwqmw1Fc
	rDKCzaAJ4GsWCy1d2n/BFR7rnIxDixccJztQRdn8glDxQjxGro/fYrs/9SrmDObc87Zi
	jiHw==
MIME-Version: 1.0
X-Received: by 10.182.186.36 with SMTP id fh4mr6994078obc.73.1375981448708;
	Thu, 08 Aug 2013 10:04:08 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 8 Aug 2013 10:04:08 -0700 (PDT)
Date: Thu, 8 Aug 2013 13:04:08 -0400
Message-ID: <CAFZh4h9NOEKpS1P+WU9r7EXCA4wUx1dQ85CZ+Z0LB5Vk-fAfPQ@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: meta-ti@yoctoproject.org
Subject: populate_sdk for am1808-evm image causes binutils errors (yocto master, meta-ti master, oe master) x86_64-linux-libtool: line 552: CDPATH: command not found
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
X-List-Received-Date: Thu, 08 Aug 2013 17:04:13 -0000
Content-Type: multipart/alternative; boundary=089e013cb96077c8bf04e372a5a3

--089e013cb96077c8bf04e372a5a3
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Not sure if this one needs to go to the main Yocto list or not.  I created
a image based on core-image-minimal and below the the output when I try to
bitbake my image with -c populate_sdk.  I get the same output if I do the
same for the core-image-minimal image with -c populate_sdk:

hutch@neo:~/yocto_master_davinci/poky/build$ bitbake core-image-nodea -c
populate_sdk
WARNING: Host distribution "Debian-7.1" has not been validated with this
version of the build system; you may possibly experience unexpected
failures. It is recommended that you use a tested distribution.
Loading cache: 100%
|##########################################################################=
#########################|
ETA:  00:00:00
Loaded 1802 entries from dependency cache.

Build Configuration:
BB_VERSION        =3D "1.19.1"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "Debian-7.1"
TARGET_SYS        =3D "arm-poky-linux-gnueabi"
MACHINE           =3D "am180x-evm"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "1.4+snapshot-20130808"
TUNE_FEATURES     =3D "armv5 thumb dsp"
TARGET_FPU        =3D "soft"
meta
meta-yocto
meta-yocto-bsp    =3D "master:f63e7f4323368c0d6fe7a1d44393a7e15652d4f2"
meta-ti           =3D "master:3f3f05eea39d0f13bc140747984e202e9288b2fe"
meta-oe
meta-networking
meta-webserver    =3D "master:6b50a7d6621eba239380b11606110caab814eb51"



NOTE: Resolving any missing task queue dependencies


NOTE: multiple providers are available for jpeg (jpeg, libjpeg-turbo)
NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_compile (log file is located at
/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bin=
utils-crosssdk/2.23.2-r4/temp/log.do_compile.6539)
ERROR: Logfile of failure stored in:
/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bin=
utils-crosssdk/2.23.2-r4/temp/log.do_compile.6539
Log data follows:
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
'bit-64', 'x86_64-linux', 'common']
| DEBUG: Executing shell function do_compile
| NOTE: make -j 6
| make[1]: Entering directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux'
| make[1]: Nothing to be done for `all-target'.
| make[2]: Entering directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/intl'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/intl'
| make[2]: Entering directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/libiberty'
| make[2]: Entering directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/etc'
| for f in standards.info configure.info; do \
|         if test -f
/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bin=
utils-crosssdk/2.23.2-r4/binutils-2.23.2/etc/`echo
$f | sed -e 's/.info$/.texi/'`; then \
|           if make "MAKEINFO=3Dmakeinfo --split-size=3D5000000
--split-size=3D5000000" $f; then \
|             true; \
|           else \
|             exit 1; \
|           fi; \
|         fi; \
|       done
| make[3]: Entering directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/libiberty/testsuite'
| make[3]: Nothing to be done for `all'.
| make[3]: Leaving directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/libiberty/testsuite'
| make[2]: Leaving directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/libiberty'
| make[3]: Entering directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/etc'
| make[3]:
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/etc/
standards.info' is up to date.
| make[3]: Leaving directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/etc'
| make[3]: Entering directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/etc'
| make[3]:
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/etc/
configure.info' is up to date.
| make[3]: Leaving directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/etc'
| make[2]: Leaving directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/etc'
| make[2]: Entering directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/bfd'
| Making info in doc
| make[3]: Entering directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/bfd/doc'
| make[3]: Nothing to be done for `info'.
| make[3]: Leaving directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/bfd/doc'
| Making info in po
| make[3]: Entering directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/bfd/po'
| make[3]: Nothing to be done for `info'.
| make[3]: Leaving directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/bfd/po'
| make[3]: Entering directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/bfd'
| make[3]: Nothing to be done for `info-am'.
| make[3]: Leaving directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/bfd'
| make  all-recursive
| make[3]: Entering directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/bfd'
| Making all in doc
| make[4]: Entering directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/bfd/doc'
| make[4]: Nothing to be done for `all'.
| make[4]: Leaving directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/bfd/doc'
| Making all in po
| make[4]: Entering directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/bfd/po'
| make[4]: Nothing to be done for `all'.
| make[4]: Leaving directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/bfd/po'
| make[4]: Entering directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/bfd'
| /bin/sh ./x86_64-linux-libtool --tag=3DCC   --mode=3Dcompile gcc
-DHAVE_CONFIG_H -I.
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd
-I.
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/../include
 -DHAVE_bfd_elf32_i386_vec -DHAVE_i386linux_vec -DHAVE_i386pei_vec
-DHAVE_bfd_elf64_x86_64_vec -DHAVE_bfd_elf32_x86_64_vec
-DHAVE_bfd_elf64_l1om_vec -DHAVE_bfd_elf64_k1om_vec
-DHAVE_bfd_elf64_little_generic_vec -DHAVE_bfd_elf64_big_generic_vec
-DHAVE_bfd_elf32_little_generic_vec -DHAVE_bfd_elf32_big_generic_vec
-DHAVE_plugin_vec
 -DBINDIR=3D'"/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_=
64-linux/usr/bin/i686-pokysdk-linux"'
-isystem/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/include
-W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow
-isystem/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/include
-O2 -pipe -c -o archive.lo
/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bin=
utils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/archive.c
| /bin/sh ./x86_64-linux-libtool --tag=3DCC   --mode=3Dcompile gcc
-DHAVE_CONFIG_H -I.
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd
-I.
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/../include
 -DHAVE_bfd_elf32_i386_vec -DHAVE_i386linux_vec -DHAVE_i386pei_vec
-DHAVE_bfd_elf64_x86_64_vec -DHAVE_bfd_elf32_x86_64_vec
-DHAVE_bfd_elf64_l1om_vec -DHAVE_bfd_elf64_k1om_vec
-DHAVE_bfd_elf64_little_generic_vec -DHAVE_bfd_elf64_big_generic_vec
-DHAVE_bfd_elf32_little_generic_vec -DHAVE_bfd_elf32_big_generic_vec
-DHAVE_plugin_vec
 -DBINDIR=3D'"/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_=
64-linux/usr/bin/i686-pokysdk-linux"'
-isystem/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/include
-W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow
-isystem/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/include
-O2 -pipe -c -o archures.lo -DDEFAULT_VECTOR=3Dbfd_elf32_i386_vec
-DSELECT_VECS=3D'&bfd_elf32_i386_vec,&i386linux_vec,&i386pei_vec,&bfd_elf64=
_x86_64_vec,&bfd_elf32_x86_64_vec,&bfd_elf64_l1om_vec,&bfd_elf64_k1om_vec,&=
bfd_elf64_little_generic_vec,&bfd_elf64_big_generic_vec,&bfd_elf32_little_g=
eneric_vec,&bfd_elf32_big_generic_vec,&plugin_vec'
-DSELECT_ARCHITECTURES=3D'&bfd_i386_arch,&bfd_l1om_arch,&bfd_k1om_arch,&bfd=
_plugin_arch'
/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bin=
utils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/archures.c
| /bin/sh ./x86_64-linux-libtool --tag=3DCC   --mode=3Dcompile gcc
-DHAVE_CONFIG_H -I.
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd
-I.
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/../include
 -DHAVE_bfd_elf32_i386_vec -DHAVE_i386linux_vec -DHAVE_i386pei_vec
-DHAVE_bfd_elf64_x86_64_vec -DHAVE_bfd_elf32_x86_64_vec
-DHAVE_bfd_elf64_l1om_vec -DHAVE_bfd_elf64_k1om_vec
-DHAVE_bfd_elf64_little_generic_vec -DHAVE_bfd_elf64_big_generic_vec
-DHAVE_bfd_elf32_little_generic_vec -DHAVE_bfd_elf32_big_generic_vec
-DHAVE_plugin_vec
 -DBINDIR=3D'"/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_=
64-linux/usr/bin/i686-pokysdk-linux"'
-isystem/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/include
-W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow
-isystem/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/include
-O2 -pipe -c -o bfd.lo
/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bin=
utils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/bfd.c
| /bin/sh ./x86_64-linux-libtool --tag=3DCC   --mode=3Dcompile gcc
-DHAVE_CONFIG_H -I.
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd
-I.
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/../include
 -DHAVE_bfd_elf32_i386_vec -DHAVE_i386linux_vec -DHAVE_i386pei_vec
-DHAVE_bfd_elf64_x86_64_vec -DHAVE_bfd_elf32_x86_64_vec
-DHAVE_bfd_elf64_l1om_vec -DHAVE_bfd_elf64_k1om_vec
-DHAVE_bfd_elf64_little_generic_vec -DHAVE_bfd_elf64_big_generic_vec
-DHAVE_bfd_elf32_little_generic_vec -DHAVE_bfd_elf32_big_generic_vec
-DHAVE_plugin_vec
 -DBINDIR=3D'"/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_=
64-linux/usr/bin/i686-pokysdk-linux"'
-isystem/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/include
-W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow
-isystem/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/include
-O2 -pipe -c -o bfdio.lo
/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bin=
utils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/bfdio.c
| /bin/sh ./x86_64-linux-libtool --tag=3DCC   --mode=3Dcompile gcc
-DHAVE_CONFIG_H -I.
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd
-I.
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/../include
 -DHAVE_bfd_elf32_i386_vec -DHAVE_i386linux_vec -DHAVE_i386pei_vec
-DHAVE_bfd_elf64_x86_64_vec -DHAVE_bfd_elf32_x86_64_vec
-DHAVE_bfd_elf64_l1om_vec -DHAVE_bfd_elf64_k1om_vec
-DHAVE_bfd_elf64_little_generic_vec -DHAVE_bfd_elf64_big_generic_vec
-DHAVE_bfd_elf32_little_generic_vec -DHAVE_bfd_elf32_big_generic_vec
-DHAVE_plugin_vec
 -DBINDIR=3D'"/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_=
64-linux/usr/bin/i686-pokysdk-linux"'
-isystem/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/include
-W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow
-isystem/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/include
-O2 -pipe -c -o bfdwin.lo
/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bin=
utils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/bfdwin.c
| ./x86_64-linux-libtool: line 552: CDPATH: command not found
| /bin/sh ./x86_64-linux-libtool --tag=3DCC   --mode=3Dcompile gcc
-DHAVE_CONFIG_H -I.
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd
-I.
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd
-I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/../include
 -DHAVE_bfd_elf32_i386_vec -DHAVE_i386linux_vec -DHAVE_i386pei_vec
-DHAVE_bfd_elf64_x86_64_vec -DHAVE_bfd_elf32_x86_64_vec
-DHAVE_bfd_elf64_l1om_vec -DHAVE_bfd_elf64_k1om_vec
-DHAVE_bfd_elf64_little_generic_vec -DHAVE_bfd_elf64_big_generic_vec
-DHAVE_bfd_elf32_little_generic_vec -DHAVE_bfd_elf32_big_generic_vec
-DHAVE_plugin_vec
 -DBINDIR=3D'"/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_=
64-linux/usr/bin/i686-pokysdk-linux"'
-isystem/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/include
-W -Wall -Wstrict-prototypes -Wmissing-prototypes -Wshadow
-isystem/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/include
-O2 -pipe -c -o cache.lo
/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bin=
utils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/cache.c
| ./x86_64-linux-libtool: line 552: CDPATH: command not found
| ./x86_64-linux-libtool: line 552: CDPATH: command not found
| ./x86_64-linux-libtool: line 552: CDPATH: command not found
| ./x86_64-linux-libtool: line 552: CDPATH: command not found
| ./x86_64-linux-libtool: line 552: CDPATH: command not found
| x86_64-linux-libtool: Version mismatch error.  This is libtool 2.4, but
the
| x86_64-linux-libtool: definition of this LT_INIT comes from an older
release.
| x86_64-linux-libtool: You should recreate aclocal.m4 with macros from
libtool 2.4
| x86_64-linux-libtool: and run autoconf again.
| x86_64-linux-libtool: Version mismatch error.  This is libtool 2.4, but
the
| x86_64-linux-libtool: definition of this LT_INIT comes from an older
release.
| x86_64-linux-libtool: You should recreate aclocal.m4 with macros from
libtool 2.4
| x86_64-linux-libtool: and run autoconf again.
| make[4]: *** [archures.lo] Error 63
| make[4]: *** Waiting for unfinished jobs....
| make[4]: *** [archive.lo] Error 63
| x86_64-linux-libtool: Version mismatch error.  This is libtool 2.4, but
the
| x86_64-linux-libtool: definition of this LT_INIT comes from an older
release.
| x86_64-linux-libtool: You should recreate aclocal.m4 with macros from
libtool 2.4
| x86_64-linux-libtool: and run autoconf again.
| make[4]: *** [bfd.lo] Error 63
| x86_64-linux-libtool: Version mismatch error.  This is libtool 2.4, but
the
| x86_64-linux-libtool: definition of this LT_INIT comes from an older
release.
| x86_64-linux-libtool: You should recreate aclocal.m4 with macros from
libtool 2.4
| x86_64-linux-libtool: and run autoconf again.
| make[4]: *** [bfdwin.lo] Error 63
| x86_64-linux-libtool: Version mismatch error.  This is libtool 2.4, but
the
| x86_64-linux-libtool: definition of this LT_INIT comes from an older
release.
| x86_64-linux-libtool: You should recreate aclocal.m4 with macros from
libtool 2.4
| x86_64-linux-libtool: and run autoconf again.
| make[4]: *** [cache.lo] Error 63
| x86_64-linux-libtool: Version mismatch error.  This is libtool 2.4, but
the
| x86_64-linux-libtool: definition of this LT_INIT comes from an older
release.
| x86_64-linux-libtool: You should recreate aclocal.m4 with macros from
libtool 2.4
| x86_64-linux-libtool: and run autoconf again.
| make[4]: *** [bfdio.lo] Error 63
| make[4]: Leaving directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/bfd'
| make[3]: *** [all-recursive] Error 1
| make[3]: Leaving directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/bfd'
| make[2]: *** [all] Error 2
| make[2]: Leaving directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux/bfd'
| make[1]: *** [all-bfd] Error 2
| make[1]: Leaving directory
`/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bi=
nutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-l=
inux'
| make: *** [all] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (log file is located at
/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bin=
utils-crosssdk/2.23.2-r4/temp/log.do_compile.6539)
ERROR: Task 1806
(/home/hutch/yocto_master_davinci/poky/meta/recipes-devtools/binutils/
binutils-crosssdk_2.23.2.bb, do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 829 tasks of which 828 didn't need to be
rerun and 1 failed.
No currently running tasks (193 of 2817)

Summary: 1 task failed:
  /home/hutch/yocto_master_davinci/poky/meta/recipes-devtools/binutils/
binutils-crosssdk_2.23.2.bb, do_compile
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Regards,

Brian

--089e013cb96077c8bf04e372a5a3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div><div><br></div><div>Not sure if this one needs to go to the m=
ain Yocto list or not. =A0I created a image based on core-image-minimal and=
 below the the output when I try to bitbake my image with -c populate_sdk. =
=A0I get the same output if I do the same for the core-image-minimal image =
with -c populate_sdk:=A0</div>
<div><br></div><div>hutch@neo:~/yocto_master_davinci/poky/build$ bitbake co=
re-image-nodea -c populate_sdk</div><div>WARNING: Host distribution &quot;D=
ebian-7.1&quot; has not been validated with this version of the build syste=
m; you may possibly experience unexpected failures. It is recommended that =
you use a tested distribution.</div>
<div>Loading cache: 100% |#################################################=
##################################################| ETA: =A000:00:00</div><=
div>Loaded 1802 entries from dependency cache.</div><div><br></div><div>Bui=
ld Configuration:</div>
<div>BB_VERSION =A0 =A0 =A0 =A0=3D &quot;1.19.1&quot;</div><div>BUILD_SYS =
=A0 =A0 =A0 =A0 =3D &quot;x86_64-linux&quot;</div><div>NATIVELSBSTRING =A0 =
=3D &quot;Debian-7.1&quot;</div><div>TARGET_SYS =A0 =A0 =A0 =A0=3D &quot;ar=
m-poky-linux-gnueabi&quot;</div>
<div>MACHINE =A0 =A0 =A0 =A0 =A0 =3D &quot;am180x-evm&quot;</div><div>DISTR=
O =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;poky&quot;</div><div>DISTRO_VERSION =A0 =
=A0=3D &quot;1.4+snapshot-20130808&quot;</div><div>TUNE_FEATURES =A0 =A0 =
=3D &quot;armv5 thumb dsp&quot;</div>
<div>TARGET_FPU =A0 =A0 =A0 =A0=3D &quot;soft&quot;</div><div>meta =A0 =A0 =
=A0 =A0 =A0 =A0 =A0</div><div>meta-yocto =A0 =A0 =A0 =A0</div><div>meta-yoc=
to-bsp =A0 =A0=3D &quot;master:f63e7f4323368c0d6fe7a1d44393a7e15652d4f2&quo=
t;</div><div>meta-ti =A0 =A0 =A0 =A0 =A0 =3D &quot;master:3f3f05eea39d0f13b=
c140747984e202e9288b2fe&quot;</div>
<div>meta-oe =A0 =A0 =A0 =A0 =A0=A0</div><div>meta-networking =A0=A0</div><=
div>meta-webserver =A0 =A0=3D &quot;master:6b50a7d6621eba239380b11606110caa=
b814eb51&quot;</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0</div>
<div>NOTE: Resolving any missing task queue dependencies =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0</div><div>NO=
TE: multiple providers are available for jpeg (jpeg, libjpeg-turbo)</div>
<div>NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg</div>=
<div>NOTE: Preparing runqueue</div><div>NOTE: Executing SetScene Tasks</div=
><div>NOTE: Executing RunQueue Tasks</div><div>ERROR: Function failed: do_c=
ompile (log file is located at /home/hutch/yocto_master_davinci/poky/build/=
tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/temp/log.do_compile=
.6539)</div>
<div>ERROR: Logfile of failure stored in: /home/hutch/yocto_master_davinci/=
poky/build/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/temp/log=
.do_compile.6539</div><div>Log data follows:</div><div>| DEBUG: SITE files =
[&#39;endian-little&#39;, &#39;common-linux&#39;, &#39;common-glibc&#39;, &=
#39;bit-64&#39;, &#39;x86_64-linux&#39;, &#39;common&#39;]</div>
<div>| DEBUG: Executing shell function do_compile</div><div>| NOTE: make -j=
 6</div><div>| make[1]: Entering directory `/home/hutch/yocto_master_davinc=
i/poky/build/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binuti=
ls-2.23.2/build.x86_64-linux.i686-pokysdk-linux&#39;</div>
<div>| make[1]: Nothing to be done for `all-target&#39;.</div><div>| make[2=
]: Entering directory `/home/hutch/yocto_master_davinci/poky/build/tmp/work=
/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_6=
4-linux.i686-pokysdk-linux/intl&#39;</div>
<div>| make[2]: Nothing to be done for `all&#39;.</div><div>| make[2]: Leav=
ing directory `/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-po=
kysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.=
i686-pokysdk-linux/intl&#39;</div>
<div>| make[2]: Entering directory `/home/hutch/yocto_master_davinci/poky/b=
uild/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.=
2/build.x86_64-linux.i686-pokysdk-linux/libiberty&#39;</div><div>| make[2]:=
 Entering directory `/home/hutch/yocto_master_davinci/poky/build/tmp/work/i=
686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-=
linux.i686-pokysdk-linux/etc&#39;</div>
<div>| for f in <a href=3D"http://standards.info">standards.info</a> <a hre=
f=3D"http://configure.info">configure.info</a>; do \</div><div>| =A0 =A0 =
=A0 =A0 if test -f /home/hutch/yocto_master_davinci/poky/build/tmp/work/i68=
6-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/etc/`echo $f | =
sed -e &#39;s/.info$/.texi/&#39;`; then \</div>
<div>| =A0 =A0 =A0 =A0 =A0 if make &quot;MAKEINFO=3Dmakeinfo --split-size=
=3D5000000 --split-size=3D5000000&quot; $f; then \</div><div>| =A0 =A0 =A0 =
=A0 =A0 =A0 true; \</div><div>| =A0 =A0 =A0 =A0 =A0 else \</div><div>| =A0 =
=A0 =A0 =A0 =A0 =A0 exit 1; \</div><div>| =A0 =A0 =A0 =A0 =A0 fi; \</div>
<div>| =A0 =A0 =A0 =A0 fi; \</div><div>| =A0 =A0 =A0 done</div><div>| make[=
3]: Entering directory `/home/hutch/yocto_master_davinci/poky/build/tmp/wor=
k/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_=
64-linux.i686-pokysdk-linux/libiberty/testsuite&#39;</div>
<div>| make[3]: Nothing to be done for `all&#39;.</div><div>| make[3]: Leav=
ing directory `/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-po=
kysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.=
i686-pokysdk-linux/libiberty/testsuite&#39;</div>
<div>| make[2]: Leaving directory `/home/hutch/yocto_master_davinci/poky/bu=
ild/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2=
/build.x86_64-linux.i686-pokysdk-linux/libiberty&#39;</div><div>| make[3]: =
Entering directory `/home/hutch/yocto_master_davinci/poky/build/tmp/work/i6=
86-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-l=
inux.i686-pokysdk-linux/etc&#39;</div>
<div>| make[3]: `/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-=
pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/etc/<a href=3D"ht=
tp://standards.info">standards.info</a>&#39; is up to date.</div><div>| mak=
e[3]: Leaving directory `/home/hutch/yocto_master_davinci/poky/build/tmp/wo=
rk/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86=
_64-linux.i686-pokysdk-linux/etc&#39;</div>
<div>| make[3]: Entering directory `/home/hutch/yocto_master_davinci/poky/b=
uild/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.=
2/build.x86_64-linux.i686-pokysdk-linux/etc&#39;</div><div>| make[3]: `/hom=
e/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/binutil=
s-crosssdk/2.23.2-r4/binutils-2.23.2/etc/<a href=3D"http://configure.info">=
configure.info</a>&#39; is up to date.</div>
<div>| make[3]: Leaving directory `/home/hutch/yocto_master_davinci/poky/bu=
ild/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2=
/build.x86_64-linux.i686-pokysdk-linux/etc&#39;</div><div>| make[2]: Leavin=
g directory `/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-poky=
sdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i6=
86-pokysdk-linux/etc&#39;</div>
<div>| make[2]: Entering directory `/home/hutch/yocto_master_davinci/poky/b=
uild/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.=
2/build.x86_64-linux.i686-pokysdk-linux/bfd&#39;</div><div>| Making info in=
 doc</div>
<div>| make[3]: Entering directory `/home/hutch/yocto_master_davinci/poky/b=
uild/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.=
2/build.x86_64-linux.i686-pokysdk-linux/bfd/doc&#39;</div><div>| make[3]: N=
othing to be done for `info&#39;.</div>
<div>| make[3]: Leaving directory `/home/hutch/yocto_master_davinci/poky/bu=
ild/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2=
/build.x86_64-linux.i686-pokysdk-linux/bfd/doc&#39;</div><div>| Making info=
 in po</div>
<div>| make[3]: Entering directory `/home/hutch/yocto_master_davinci/poky/b=
uild/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.=
2/build.x86_64-linux.i686-pokysdk-linux/bfd/po&#39;</div><div>| make[3]: No=
thing to be done for `info&#39;.</div>
<div>| make[3]: Leaving directory `/home/hutch/yocto_master_davinci/poky/bu=
ild/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2=
/build.x86_64-linux.i686-pokysdk-linux/bfd/po&#39;</div><div>| make[3]: Ent=
ering directory `/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-=
pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linu=
x.i686-pokysdk-linux/bfd&#39;</div>
<div>| make[3]: Nothing to be done for `info-am&#39;.</div><div>| make[3]: =
Leaving directory `/home/hutch/yocto_master_davinci/poky/build/tmp/work/i68=
6-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-li=
nux.i686-pokysdk-linux/bfd&#39;</div>
<div>| make =A0all-recursive</div><div>| make[3]: Entering directory `/home=
/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/binutils=
-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-linux/b=
fd&#39;</div>
<div>| Making all in doc</div><div>| make[4]: Entering directory `/home/hut=
ch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/binutils-cro=
sssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-linux/bfd/d=
oc&#39;</div>
<div>| make[4]: Nothing to be done for `all&#39;.</div><div>| make[4]: Leav=
ing directory `/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-po=
kysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.=
i686-pokysdk-linux/bfd/doc&#39;</div>
<div>| Making all in po</div><div>| make[4]: Entering directory `/home/hutc=
h/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/binutils-cros=
ssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-linux/bfd/po=
&#39;</div>
<div>| make[4]: Nothing to be done for `all&#39;.</div><div>| make[4]: Leav=
ing directory `/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-po=
kysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.=
i686-pokysdk-linux/bfd/po&#39;</div>
<div>| make[4]: Entering directory `/home/hutch/yocto_master_davinci/poky/b=
uild/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.=
2/build.x86_64-linux.i686-pokysdk-linux/bfd&#39;</div><div>| /bin/sh ./x86_=
64-linux-libtool --tag=3DCC =A0 --mode=3Dcompile gcc -DHAVE_CONFIG_H -I. -I=
/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/bin=
utils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd -I. -I/home/hutch/yocto_master=
_davinci/poky/build/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4=
/binutils-2.23.2/bfd -I/home/hutch/yocto_master_davinci/poky/build/tmp/work=
/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/../incl=
ude =A0-DHAVE_bfd_elf32_i386_vec -DHAVE_i386linux_vec -DHAVE_i386pei_vec -D=
HAVE_bfd_elf64_x86_64_vec -DHAVE_bfd_elf32_x86_64_vec -DHAVE_bfd_elf64_l1om=
_vec -DHAVE_bfd_elf64_k1om_vec -DHAVE_bfd_elf64_little_generic_vec -DHAVE_b=
fd_elf64_big_generic_vec -DHAVE_bfd_elf32_little_generic_vec -DHAVE_bfd_elf=
32_big_generic_vec -DHAVE_plugin_vec =A0-DBINDIR=3D&#39;&quot;/home/hutch/y=
octo_master_davinci/poky/build/tmp/sysroots/x86_64-linux/usr/bin/i686-pokys=
dk-linux&quot;&#39; -isystem/home/hutch/yocto_master_davinci/poky/build/tmp=
/sysroots/x86_64-linux/usr/include -W -Wall -Wstrict-prototypes -Wmissing-p=
rototypes -Wshadow -isystem/home/hutch/yocto_master_davinci/poky/build/tmp/=
sysroots/x86_64-linux/usr/include -O2 -pipe -c -o archive.lo /home/hutch/yo=
cto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/binutils-crosssdk=
/2.23.2-r4/binutils-2.23.2/bfd/archive.c</div>
<div>| /bin/sh ./x86_64-linux-libtool --tag=3DCC =A0 --mode=3Dcompile gcc -=
DHAVE_CONFIG_H -I. -I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i=
686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd -I. -I/ho=
me/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/binuti=
ls-crosssdk/2.23.2-r4/binutils-2.23.2/bfd -I/home/hutch/yocto_master_davinc=
i/poky/build/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binuti=
ls-2.23.2/bfd/../include =A0-DHAVE_bfd_elf32_i386_vec -DHAVE_i386linux_vec =
-DHAVE_i386pei_vec -DHAVE_bfd_elf64_x86_64_vec -DHAVE_bfd_elf32_x86_64_vec =
-DHAVE_bfd_elf64_l1om_vec -DHAVE_bfd_elf64_k1om_vec -DHAVE_bfd_elf64_little=
_generic_vec -DHAVE_bfd_elf64_big_generic_vec -DHAVE_bfd_elf32_little_gener=
ic_vec -DHAVE_bfd_elf32_big_generic_vec -DHAVE_plugin_vec =A0-DBINDIR=3D&#3=
9;&quot;/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/bin/i686-pokysdk-linux&quot;&#39; -isystem/home/hutch/yocto_master_d=
avinci/poky/build/tmp/sysroots/x86_64-linux/usr/include -W -Wall -Wstrict-p=
rototypes -Wmissing-prototypes -Wshadow -isystem/home/hutch/yocto_master_da=
vinci/poky/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c -o arch=
ures.lo -DDEFAULT_VECTOR=3Dbfd_elf32_i386_vec -DSELECT_VECS=3D&#39;&amp;bfd=
_elf32_i386_vec,&amp;i386linux_vec,&amp;i386pei_vec,&amp;bfd_elf64_x86_64_v=
ec,&amp;bfd_elf32_x86_64_vec,&amp;bfd_elf64_l1om_vec,&amp;bfd_elf64_k1om_ve=
c,&amp;bfd_elf64_little_generic_vec,&amp;bfd_elf64_big_generic_vec,&amp;bfd=
_elf32_little_generic_vec,&amp;bfd_elf32_big_generic_vec,&amp;plugin_vec&#3=
9; -DSELECT_ARCHITECTURES=3D&#39;&amp;bfd_i386_arch,&amp;bfd_l1om_arch,&amp=
;bfd_k1om_arch,&amp;bfd_plugin_arch&#39; /home/hutch/yocto_master_davinci/p=
oky/build/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-=
2.23.2/bfd/archures.c</div>
<div>| /bin/sh ./x86_64-linux-libtool --tag=3DCC =A0 --mode=3Dcompile gcc -=
DHAVE_CONFIG_H -I. -I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i=
686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd -I. -I/ho=
me/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/binuti=
ls-crosssdk/2.23.2-r4/binutils-2.23.2/bfd -I/home/hutch/yocto_master_davinc=
i/poky/build/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binuti=
ls-2.23.2/bfd/../include =A0-DHAVE_bfd_elf32_i386_vec -DHAVE_i386linux_vec =
-DHAVE_i386pei_vec -DHAVE_bfd_elf64_x86_64_vec -DHAVE_bfd_elf32_x86_64_vec =
-DHAVE_bfd_elf64_l1om_vec -DHAVE_bfd_elf64_k1om_vec -DHAVE_bfd_elf64_little=
_generic_vec -DHAVE_bfd_elf64_big_generic_vec -DHAVE_bfd_elf32_little_gener=
ic_vec -DHAVE_bfd_elf32_big_generic_vec -DHAVE_plugin_vec =A0-DBINDIR=3D&#3=
9;&quot;/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/bin/i686-pokysdk-linux&quot;&#39; -isystem/home/hutch/yocto_master_d=
avinci/poky/build/tmp/sysroots/x86_64-linux/usr/include -W -Wall -Wstrict-p=
rototypes -Wmissing-prototypes -Wshadow -isystem/home/hutch/yocto_master_da=
vinci/poky/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c -o bfd.=
lo /home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/=
binutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/bfd.c</div>
<div>| /bin/sh ./x86_64-linux-libtool --tag=3DCC =A0 --mode=3Dcompile gcc -=
DHAVE_CONFIG_H -I. -I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i=
686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd -I. -I/ho=
me/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/binuti=
ls-crosssdk/2.23.2-r4/binutils-2.23.2/bfd -I/home/hutch/yocto_master_davinc=
i/poky/build/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binuti=
ls-2.23.2/bfd/../include =A0-DHAVE_bfd_elf32_i386_vec -DHAVE_i386linux_vec =
-DHAVE_i386pei_vec -DHAVE_bfd_elf64_x86_64_vec -DHAVE_bfd_elf32_x86_64_vec =
-DHAVE_bfd_elf64_l1om_vec -DHAVE_bfd_elf64_k1om_vec -DHAVE_bfd_elf64_little=
_generic_vec -DHAVE_bfd_elf64_big_generic_vec -DHAVE_bfd_elf32_little_gener=
ic_vec -DHAVE_bfd_elf32_big_generic_vec -DHAVE_plugin_vec =A0-DBINDIR=3D&#3=
9;&quot;/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/bin/i686-pokysdk-linux&quot;&#39; -isystem/home/hutch/yocto_master_d=
avinci/poky/build/tmp/sysroots/x86_64-linux/usr/include -W -Wall -Wstrict-p=
rototypes -Wmissing-prototypes -Wshadow -isystem/home/hutch/yocto_master_da=
vinci/poky/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c -o bfdi=
o.lo /home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linu=
x/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/bfdio.c</div>
<div>| /bin/sh ./x86_64-linux-libtool --tag=3DCC =A0 --mode=3Dcompile gcc -=
DHAVE_CONFIG_H -I. -I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i=
686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd -I. -I/ho=
me/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/binuti=
ls-crosssdk/2.23.2-r4/binutils-2.23.2/bfd -I/home/hutch/yocto_master_davinc=
i/poky/build/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binuti=
ls-2.23.2/bfd/../include =A0-DHAVE_bfd_elf32_i386_vec -DHAVE_i386linux_vec =
-DHAVE_i386pei_vec -DHAVE_bfd_elf64_x86_64_vec -DHAVE_bfd_elf32_x86_64_vec =
-DHAVE_bfd_elf64_l1om_vec -DHAVE_bfd_elf64_k1om_vec -DHAVE_bfd_elf64_little=
_generic_vec -DHAVE_bfd_elf64_big_generic_vec -DHAVE_bfd_elf32_little_gener=
ic_vec -DHAVE_bfd_elf32_big_generic_vec -DHAVE_plugin_vec =A0-DBINDIR=3D&#3=
9;&quot;/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-lin=
ux/usr/bin/i686-pokysdk-linux&quot;&#39; -isystem/home/hutch/yocto_master_d=
avinci/poky/build/tmp/sysroots/x86_64-linux/usr/include -W -Wall -Wstrict-p=
rototypes -Wmissing-prototypes -Wshadow -isystem/home/hutch/yocto_master_da=
vinci/poky/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c -o bfdw=
in.lo /home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-lin=
ux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/bfdwin.c</div>
<div>| ./x86_64-linux-libtool: line 552: CDPATH: command not found</div><di=
v>| /bin/sh ./x86_64-linux-libtool --tag=3DCC =A0 --mode=3Dcompile gcc -DHA=
VE_CONFIG_H -I. -I/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686=
-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd -I. -I/home/=
hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/binutils-=
crosssdk/2.23.2-r4/binutils-2.23.2/bfd -I/home/hutch/yocto_master_davinci/p=
oky/build/tmp/work/i686-pokysdk-linux/binutils-crosssdk/2.23.2-r4/binutils-=
2.23.2/bfd/../include =A0-DHAVE_bfd_elf32_i386_vec -DHAVE_i386linux_vec -DH=
AVE_i386pei_vec -DHAVE_bfd_elf64_x86_64_vec -DHAVE_bfd_elf32_x86_64_vec -DH=
AVE_bfd_elf64_l1om_vec -DHAVE_bfd_elf64_k1om_vec -DHAVE_bfd_elf64_little_ge=
neric_vec -DHAVE_bfd_elf64_big_generic_vec -DHAVE_bfd_elf32_little_generic_=
vec -DHAVE_bfd_elf32_big_generic_vec -DHAVE_plugin_vec =A0-DBINDIR=3D&#39;&=
quot;/home/hutch/yocto_master_davinci/poky/build/tmp/sysroots/x86_64-linux/=
usr/bin/i686-pokysdk-linux&quot;&#39; -isystem/home/hutch/yocto_master_davi=
nci/poky/build/tmp/sysroots/x86_64-linux/usr/include -W -Wall -Wstrict-prot=
otypes -Wmissing-prototypes -Wshadow -isystem/home/hutch/yocto_master_davin=
ci/poky/build/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c -o cache.l=
o /home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/b=
inutils-crosssdk/2.23.2-r4/binutils-2.23.2/bfd/cache.c</div>
<div>| ./x86_64-linux-libtool: line 552: CDPATH: command not found</div><di=
v>| ./x86_64-linux-libtool: line 552: CDPATH: command not found</div><div>|=
 ./x86_64-linux-libtool: line 552: CDPATH: command not found</div><div>
| ./x86_64-linux-libtool: line 552: CDPATH: command not found</div><div>| .=
/x86_64-linux-libtool: line 552: CDPATH: command not found</div><div>| x86_=
64-linux-libtool: Version mismatch error. =A0This is libtool 2.4, but the</=
div>
<div>| x86_64-linux-libtool: definition of this LT_INIT comes from an older=
 release.</div><div>| x86_64-linux-libtool: You should recreate aclocal.m4 =
with macros from libtool 2.4</div><div>| x86_64-linux-libtool: and run auto=
conf again.</div>
<div>| x86_64-linux-libtool: Version mismatch error. =A0This is libtool 2.4=
, but the</div><div>| x86_64-linux-libtool: definition of this LT_INIT come=
s from an older release.</div><div>| x86_64-linux-libtool: You should recre=
ate aclocal.m4 with macros from libtool 2.4</div>
<div>| x86_64-linux-libtool: and run autoconf again.</div><div>| make[4]: *=
** [archures.lo] Error 63</div><div>| make[4]: *** Waiting for unfinished j=
obs....</div><div>| make[4]: *** [archive.lo] Error 63</div><div>| x86_64-l=
inux-libtool: Version mismatch error. =A0This is libtool 2.4, but the</div>
<div>| x86_64-linux-libtool: definition of this LT_INIT comes from an older=
 release.</div><div>| x86_64-linux-libtool: You should recreate aclocal.m4 =
with macros from libtool 2.4</div><div>| x86_64-linux-libtool: and run auto=
conf again.</div>
<div>| make[4]: *** [bfd.lo] Error 63</div><div>| x86_64-linux-libtool: Ver=
sion mismatch error. =A0This is libtool 2.4, but the</div><div>| x86_64-lin=
ux-libtool: definition of this LT_INIT comes from an older release.</div>
<div>| x86_64-linux-libtool: You should recreate aclocal.m4 with macros fro=
m libtool 2.4</div><div>| x86_64-linux-libtool: and run autoconf again.</di=
v><div>| make[4]: *** [bfdwin.lo] Error 63</div><div>| x86_64-linux-libtool=
: Version mismatch error. =A0This is libtool 2.4, but the</div>
<div>| x86_64-linux-libtool: definition of this LT_INIT comes from an older=
 release.</div><div>| x86_64-linux-libtool: You should recreate aclocal.m4 =
with macros from libtool 2.4</div><div>| x86_64-linux-libtool: and run auto=
conf again.</div>
<div>| make[4]: *** [cache.lo] Error 63</div><div>| x86_64-linux-libtool: V=
ersion mismatch error. =A0This is libtool 2.4, but the</div><div>| x86_64-l=
inux-libtool: definition of this LT_INIT comes from an older release.</div>
<div>| x86_64-linux-libtool: You should recreate aclocal.m4 with macros fro=
m libtool 2.4</div><div>| x86_64-linux-libtool: and run autoconf again.</di=
v><div>| make[4]: *** [bfdio.lo] Error 63</div><div>| make[4]: Leaving dire=
ctory `/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-li=
nux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pok=
ysdk-linux/bfd&#39;</div>
<div>| make[3]: *** [all-recursive] Error 1</div><div>| make[3]: Leaving di=
rectory `/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-=
linux/binutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-p=
okysdk-linux/bfd&#39;</div>
<div>| make[2]: *** [all] Error 2</div><div>| make[2]: Leaving directory `/=
home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/binu=
tils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk-lin=
ux/bfd&#39;</div>
<div>| make[1]: *** [all-bfd] Error 2</div><div>| make[1]: Leaving director=
y `/home/hutch/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/=
binutils-crosssdk/2.23.2-r4/binutils-2.23.2/build.x86_64-linux.i686-pokysdk=
-linux&#39;</div>
<div>| make: *** [all] Error 2</div><div>| ERROR: oe_runmake failed</div><d=
iv>| ERROR: Function failed: do_compile (log file is located at /home/hutch=
/yocto_master_davinci/poky/build/tmp/work/i686-pokysdk-linux/binutils-cross=
sdk/2.23.2-r4/temp/log.do_compile.6539)</div>
<div>ERROR: Task 1806 (/home/hutch/yocto_master_davinci/poky/meta/recipes-d=
evtools/binutils/<a href=3D"http://binutils-crosssdk_2.23.2.bb">binutils-cr=
osssdk_2.23.2.bb</a>, do_compile) failed with exit code &#39;1&#39;</div>
<div>NOTE: Tasks Summary: Attempted 829 tasks of which 828 didn&#39;t need =
to be rerun and 1 failed.</div><div>No currently running tasks (193 of 2817=
)</div><div><br></div><div>Summary: 1 task failed:</div><div>=A0 /home/hutc=
h/yocto_master_davinci/poky/meta/recipes-devtools/binutils/<a href=3D"http:=
//binutils-crosssdk_2.23.2.bb">binutils-crosssdk_2.23.2.bb</a>, do_compile<=
/div>
<div>Summary: There was 1 WARNING message shown.</div><div>Summary: There w=
as 1 ERROR message shown, returning a non-zero exit code.</div><div><br></d=
iv><div>Regards,</div><div><br></div><div>Brian</div><div><br></div>

--089e013cb96077c8bf04e372a5a3--
