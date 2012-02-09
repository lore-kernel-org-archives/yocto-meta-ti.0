Return-Path: <jfabernathy@gmail.com>
Received: from mail-qy0-f176.google.com (mail-qy0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCFC1E01370
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 04:37:43 -0800 (PST)
Received: by qcsd1 with SMTP id d1so1104101qcs.35
	for <meta-ti@yoctoproject.org>; Thu, 09 Feb 2012 04:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type; bh=QirLQIuSlkgQ/ZlTfbpiIdkk78UK4VU02XssNYRhmd0=;
	b=Hf/+QlpwbiTPwh4uB1dAG/aocF705Bn+YUOsqpQzu5danK592Ic+l00aJ6QhixwP10
	fXKpOBQSb5k3i7NJfWnVYr4BX5JvbHVRXfFCDQoYUNWYCFdHilZhgR+7+Hx2rS8ks1p2
	jvsYBvp1L2kNFCeu73TqAeiFAkApuuZvhbwvQ=
Received: by 10.229.137.18 with SMTP id u18mr1072044qct.153.1328791063072;
	Thu, 09 Feb 2012 04:37:43 -0800 (PST)
Received: from [10.0.1.54] (nc-184-3-54-63.dhcp.embarqhsd.net. [184.3.54.63])
	by mx.google.com with ESMTPS id
	dk2sm5507348qab.12.2012.02.09.04.37.41 (version=SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 04:37:42 -0800 (PST)
Message-ID: <4F33BE16.2080802@gmail.com>
Date: Thu, 09 Feb 2012 07:37:42 -0500
From: jfabernathy <jfabernathy@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: build error on machine omap4330-panda
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Feb 2012 12:37:44 -0000
X-Groupsio-MsgNum: 492
Content-Type: multipart/mixed; boundary="------------040808020808010301080401"

--------------040808020808010301080401
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

While trying to build core-image-sato for machine= omap4430-panda, I'm 
getting a build error a good ways into the build.  My bblayers.conf file 
just adds meta-ti and my local.conf is standard with the following key 
lines:

MACHINE ??= "omap4430-panda"
BBMASK = ".*/meta-ti/recipes-misc/"

The error I'm getting with bitbake -D -v core-image-sato is below and 
I've attached the log.do_compile_perf file.

Anyone know the fix?  Not sure the all warings being treated as errors 
message.

JIm A


| make: Entering directory 
`/build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf'
|     CC bench/sched-pipe.o
| bench/sched-pipe.c: In function 'bench_sched_pipe':
| bench/sched-pipe.c:58:6: error: variable 'ret' set but
|  not used [-Werror=unused-but-set-variable]
| cc1: all warnings being treated as errors
|
| make: *** [bench/sched-pipe.o] Error 1
| make: Leaving directory 
`/build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf'
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
|
| t libdir=/usr/lib
| + libdir=/usr/lib
| + export 'F77=arm-poky-linux-gnueabi-g77  -march=armv7-a 
-fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon 
-mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
| + F77='arm-poky-linux-gnueabi-g77  -march=armv7-a 
-fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon 
-mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
| + export BUILD_CXX=g++
| + BUILD_CXX=g++
| + export mandir=/usr/share/man
| + mandir=/usr/share/man
| + export QTDIR=/build/pandaboard/tmp/sysroots/omap4430-panda/qt2
| + QTDIR=/build/pandaboard/tmp/sysroots/omap4430-panda/qt2
| + unset TARGET_ARCH
| + export 
CCACHE_DIR=/build/pandaboard/tmp/ccache/omap4430_panda-poky-linux-gnueabi/linux-omap4
| + 
CCACHE_DIR=/build/pandaboard/tmp/ccache/omap4430_panda-poky-linux-gnueabi/linux-omap4
| + export BUILD_RANLIB=ranlib
| + BUILD_RANLIB=ranlib
| + export palmqtdir=/usr/lib/opie
| + palmqtdir=/usr/lib/opie
| + export base_sbindir=/sbin
| + base_sbindir=/sbin
| + export 
BUILD_CPPFLAGS=-isystem/build/pandaboard/tmp/sysroots/x86_64-linux/usr/include
| + 
BUILD_CPPFLAGS=-isystem/build/pandaboard/tmp/sysroots/x86_64-linux/usr/include
| + export 'TARGET_CFLAGS=-O2 -pipe -g -feliminate-unused-debug-types'
| + TARGET_CFLAGS='-O2 -pipe -g -feliminate-unused-debug-types'
| + export OBJDUMP=arm-poky-linux-gnueabi-objdump
| + OBJDUMP=arm-poky-linux-gnueabi-objdump
| + unset DISTRO
| + export docdir=/usr/share/doc
| + docdir=/usr/share/doc
| + export SHELL=/bin/bash
| + SHELL=/bin/bash
| + cd 
/build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git
| + do_compile_perf
| + '[' yes = yes ']'
| + oe_runmake -C 
/build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf 
'CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      
-mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 
--sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda' 
'LD=arm-poky-linux-gnueabi-ld 
--sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda ' prefix=/usr 
NO_NEWT=1 NO_DWARF=1
| + '[' xmake = x ']'
| + bbnote make -j 1 -C 
/build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf 
'CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      
-mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 
--sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda' 
'LD=arm-poky-linux-gnueabi-ld 
--sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda ' prefix=/usr 
NO_NEWT=1 NO_DWARF=1
| + echo 'NOTE: make -j 1 -C 
/build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf 
CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      
-mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 
--sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda 
LD=arm-poky-linux-gnueabi-ld 
--sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda  prefix=/usr 
NO_NEWT=1 NO_DWARF=1'
| NOTE: make -j 1 -C 
/build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf 
CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      
-mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 
--sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda 
LD=arm-poky-linux-gnueabi-ld 
--sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda  prefix=/usr 
NO_NEWT=1 NO_DWARF=1
| + make -j 1 -C 
/build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf 
'CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      
-mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 
--sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda' 
'LD=arm-poky-linux-gnueabi-ld 
--sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda ' prefix=/usr 
NO_NEWT=1 NO_DWARF=1
| make: Entering directory 
`/build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf'
|     CC bench/sched-pipe.o
| bench/sched-pipe.c: In function 'bench_sched_pipe':
| bench/sched-pipe.c:58:6: error: variable 'ret' set butERROR: Function 
failed: do_compile_perf (see 
/build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/temp/log.do_compile_perf.31362 
for further information)
|  not used [-Werror=unused-but-set-variable]
| cc1: all warnings being treated as errors
|
| make: *** [bench/sched-pipe.o] Error 1
| make: Leaving directory 
`/build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf'
| + die 'oe_runmake failed'
| + bbfatal 'oe_runmake failed'
| + echo 'ERROR: oe_runmake failed'
| ERROR: oe_runmake failed
| + exit 1
NOTE: package linux-omap4-2.6.35.7-r0: task do_compile_perf: Failed
ERROR: Task 578 
(/home/jim/poky/meta-ti/recipes-kernel/linux/linux-omap4_2.6.35.7.bb, 
do_compile_perf) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2196 tasks of which 2195 didn't need to 
be rerun and 1 failed.

Summary: 1 task failed:
   /home/jim/poky/meta-ti/recipes-kernel/linux/linux-omap4_2.6.35.7.bb, 
do_compile_perf
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
jim@ubuntu-x64:/build/pandaboard$


--------------040808020808010301080401
Content-Type: text/plain;
 name="log.do_compile_perf.31362"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="log.do_compile_perf.31362"

+ export localstatedir=/var
+ localstatedir=/var
+ export prefix=/usr
+ prefix=/usr
+ export 'LD=arm-poky-linux-gnueabi-ld --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ LD='arm-poky-linux-gnueabi-ld --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ export palmtopdir=/usr/lib/opie
+ palmtopdir=/usr/lib/opie
+ export 'CXX=arm-poky-linux-gnueabi-g++  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sys
roots/omap4430-panda'
+ CXX='arm-poky-linux-gnueabi-g++  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ export servicedir=/srv
+ servicedir=/srv
+ export sysconfdir=/etc
+ sysconfdir=/etc
+ export 'TARGET_LDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed'
+ TARGET_LDFLAGS='-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed'
+ export PKG_CONFIG_DISABLE_UNINSTALLED=yes
+ PKG_CONFIG_DISABLE_UNINSTA
LLED=yes
+ export NM=arm-poky-linux-gnueabi-nm
+ NM=arm-poky-linux-gnueabi-nm
+ export USER=jim
+ USER=jim
+ export BUILD_CCLD=gcc
+ BUILD_CCLD=gcc
+ export QPEDIR=/build/pandaboard/tmp/sysroots/omap4430-panda
+ QPEDIR=/build/pandaboard/tmp/sysroots/omap4430-panda
+ export 'BUILD_CFLAGS=-isystem/build/pandaboard/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe'
+ BUILD_CFLAGS='-isystem/build/pandaboard/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe'
+ export 'CPP=arm-poky-linux-gnueabi-gcc -E --sysroot=/bui
ld/pandaboard/tmp/sysroots/omap4430-panda  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8'
+ CPP='arm-poky-linux-gnueabi-gcc -E --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8'
+ export LOGNAME=jim
+ LOGNAME=jim
+ export sharedstatedir=/com
+ sharedstatedir=/com
+ export CROSS_COMPILE=arm-poky-linux-gnueabi-
+ CROSS_COMPILE=arm-poky-linux
-gnueabi-
+ export STRIP=arm-poky-linux-gnueabi-strip
+ STRIP=arm-poky-linux-gnueabi-strip
+ export datadir=/usr/share
+ datadir=/usr/share
+ export bindir=/usr/bin
+ bindir=/usr/bin
+ export AR=arm-poky-linux-gnueabi-ar
+ AR=arm-poky-linux-gnueabi-ar
+ export RANLIB=arm-poky-linux-gnueabi-ranlib
+ RANLIB=arm-poky-linux-gnueabi-ranlib
+ export PATCH_GET=0
+ PATCH_GET=0
+ export 'LDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed'
+ LDFLAGS='-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed'
+ export MAKE=make

+ MAKE=make
+ export infodir=/usr/share/info
+ infodir=/usr/share/info
+ export PKG_CONFIG_PATH=/build/pandaboard/tmp/sysroots/omap4430-panda//usr/lib/pkgconfig:/build/pandaboard/tmp/sysroots/omap4430-panda/usr/share/pkgconfig
+ PKG_CONFIG_PATH=/build/pandaboard/tmp/sysroots/omap4430-panda//usr/lib/pkgconfig:/build/pandaboard/tmp/sysroots/omap4430-panda/usr/share/pkgconfig
+ export AS=arm-poky-linux-gnueabi-as
+ AS=arm-poky-linux-gnueabi-as
+ export exec_prefix=/usr
+ exec_prefix=/usr
+ export base_libdir=/
lib
+ base_libdir=/lib
+ export PATH=/build/pandaboard/tmp/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi:/build/pandaboard/tmp/sysroots/omap4430-panda/usr/bin/crossscripts:/build/pandaboard/tmp/sysroots/x86_64-linux/usr/sbin:/build/pandaboard/tmp/sysroots/x86_64-linux/usr/bin:/build/pandaboard/tmp/sysroots/x86_64-linux/sbin:/build/pandaboard/tmp/sysroots/x86_64-linux//bin:/home/jim/poky/scripts:/home/jim/poky/bitbake/bin/:/home/jim/poky/scripts:/home/jim/poky/bitbake/bin/:/usr/lib/lightdm
/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/jim/poky/scripts
+ PATH=/build/pandaboard/tmp/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi:/build/pandaboard/tmp/sysroots/omap4430-panda/usr/bin/crossscripts:/build/pandaboard/tmp/sysroots/x86_64-linux/usr/sbin:/build/pandaboard/tmp/sysroots/x86_64-linux/usr/bin:/build/pandaboard/tmp/sysroots/x86_64-linux/sbin:/build/pandaboard/tmp/sysroots/x86_64-linux//bin:/home/jim/poky/scripts:/home/jim/poky/bitbak
e/bin/:/home/jim/poky/scripts:/home/jim/poky/bitbake/bin/:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/jim/poky/scripts
+ export BUILD_AR=ar
+ BUILD_AR=ar
+ export UBOOT_ARCH=arm
+ UBOOT_ARCH=arm
+ export CMDLINE_CONSOLE=console=ttyS0
+ CMDLINE_CONSOLE=console=ttyS0
+ export 'BUILD_LDFLAGS=-L/build/pandaboard/tmp/sysroots/x86_64-linux/usr/lib -L/build/pandaboard/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/build/pandaboard/tmp/sysroots/x86_64-linux
+ export localstatedir=/var
+ localstatedir=/var
+ export prefix=/usr
+ prefix=/usr
+ export 'LD=arm-poky-linux-gnueabi-ld --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ LD='arm-poky-linux-gnueabi-ld --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ export palmtopdir=/usr/lib/opie
+ palmtopdir=/usr/lib/opie
+ export 'CXX=arm-poky-linux-gnueabi-g++  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ CXX='arm-poky-linux-gnueabi-g++  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ export servicedir=/srv
+ servicedir=/srv
+ export sysconfdir=/etc
+ sysconfdir=/etc
+ export 'TARGET_LDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed'
+ TARGET_LDFLAGS='-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed'
+ export PKG_CONFIG_DISABLE_UNINSTALLED=yes
+ PKG_CONFIG_DISABLE_UNINSTALLED=yes
+ export NM=arm-poky-linux-gnueabi-nm
+ NM=arm-poky-linux-gnueabi-nm
+ export USER=jim
+ USER=jim
+ export BUILD_CCLD=gcc
+ BUILD_CCLD=gcc
+ export QPEDIR=/build/pandaboard/tmp/sysroots/omap4430-panda
+ QPEDIR=/build/pandaboard/tmp/sysroots/omap4430-panda
+ export 'BUILD_CFLAGS=-isystem/build/pandaboard/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe'
+ BUILD_CFLAGS='-isystem/build/pandaboard/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe'
+ export 'CPP=arm-poky-linux-gnueabi-gcc -E --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8'
+ CPP='arm-poky-linux-gnueabi-gcc -E --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8'
+ export LOGNAME=jim
+ LOGNAME=jim
+ export sharedstatedir=/com
+ sharedstatedir=/com
+ export CROSS_COMPILE=arm-poky-linux-gnueabi-
+ CROSS_COMPILE=arm-poky-linux-gnueabi-
+ export STRIP=arm-poky-linux-gnueabi-strip
+ STRIP=arm-poky-linux-gnueabi-strip
+ export datadir=/usr/share
+ datadir=/usr/share
+ export bindir=/usr/bin
+ bindir=/usr/bin
+ export AR=arm-poky-linux-gnueabi-ar
+ AR=arm-poky-linux-gnueabi-ar
+ export RANLIB=arm-poky-linux-gnueabi-ranlib
+ RANLIB=arm-poky-linux-gnueabi-ranlib
+ export PATCH_GET=0
+ PATCH_GET=0
+ export 'LDFLAGS=-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed'
+ LDFLAGS='-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed'
+ export MAKE=make
+ MAKE=make
+ export infodir=/usr/share/info
+ infodir=/usr/share/info
+ export PKG_CONFIG_PATH=/build/pandaboard/tmp/sysroots/omap4430-panda//usr/lib/pkgconfig:/build/pandaboard/tmp/sysroots/omap4430-panda/usr/share/pkgconfig
+ PKG_CONFIG_PATH=/build/pandaboard/tmp/sysroots/omap4430-panda//usr/lib/pkgconfig:/build/pandaboard/tmp/sysroots/omap4430-panda/usr/share/pkgconfig
+ export AS=arm-poky-linux-gnueabi-as
+ AS=arm-poky-linux-gnueabi-as
+ export exec_prefix=/usr
+ exec_prefix=/usr
+ export base_libdir=/lib
+ base_libdir=/lib
+ export PATH=/build/pandaboard/tmp/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi:/build/pandaboard/tmp/sysroots/omap4430-panda/usr/bin/crossscripts:/build/pandaboard/tmp/sysroots/x86_64-linux/usr/sbin:/build/pandaboard/tmp/sysroots/x86_64-linux/usr/bin:/build/pandaboard/tmp/sysroots/x86_64-linux/sbin:/build/pandaboard/tmp/sysroots/x86_64-linux//bin:/home/jim/poky/scripts:/home/jim/poky/bitbake/bin/:/home/jim/poky/scripts:/home/jim/poky/bitbake/bin/:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/jim/poky/scripts
+ PATH=/build/pandaboard/tmp/sysroots/x86_64-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi:/build/pandaboard/tmp/sysroots/omap4430-panda/usr/bin/crossscripts:/build/pandaboard/tmp/sysroots/x86_64-linux/usr/sbin:/build/pandaboard/tmp/sysroots/x86_64-linux/usr/bin:/build/pandaboard/tmp/sysroots/x86_64-linux/sbin:/build/pandaboard/tmp/sysroots/x86_64-linux//bin:/home/jim/poky/scripts:/home/jim/poky/bitbak/usr/lib -Wl,-rpath-link,/build/pandaboard/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/build/pandaboard/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/build/pandaboard/tmp/sysroots/x86_64-linux/lib -Wl,-O1'
+ BUILD_LDFLAGS='-L/build/pandaboard/tmp/sysroots/x86_64-linux/usr/lib -L/build/pandaboard/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/build/pandaboard/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/build/pandaboard/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/build/pandaboard/tmp/sysroots/x86_64-linux/
usr/lib -Wl,-rpath,/build/pandaboard/tmp/sysroots/x86_64-linux/lib -Wl,-O1'
+ export OS=linux-gnueabi
+ OS=linux-gnueabi
+ export 'CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ CC='arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430
-panda'
+ export BUILD_CC=gcc
+ BUILD_CC=gcc
+ export PKG_CONFIG_SYSROOT_DIR=/build/pandaboard/tmp/sysroots/omap4430-panda
+ PKG_CONFIG_SYSROOT_DIR=/build/pandaboard/tmp/sysroots/omap4430-panda
+ export LC_ALL=C
+ LC_ALL=C
+ export PKG_CONFIG_DIR=/build/pandaboard/tmp/sysroots/omap4430-panda//usr/lib/pkgconfig
+ PKG_CONFIG_DIR=/build/pandaboard/tmp/sysroots/omap4430-panda//usr/lib/pkgconfig
+ export base_bindir=/bin
+ base_bindir=/bin
+ export PKG_CONFIG_LIBDIR=/build/pandaboard/tmp/sysroots/omap4430-panda/
/usr/lib/pkgconfig
+ PKG_CONFIG_LIBDIR=/build/pandaboard/tmp/sysroots/omap4430-panda//usr/lib/pkgconfig
+ export sbindir=/usr/sbin
+ sbindir=/usr/sbin
+ export 'CFLAGS=-O2 -pipe -g -feliminate-unused-debug-types'
+ CFLAGS='-O2 -pipe -g -feliminate-unused-debug-types'
+ export 'CXXFLAGS=-O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden'
+ CXXFLAGS='-O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden'
+ export BUILD_CPP=cpp
+ BUILD_CPP=cpp
+ 
export ARCH=arm
+ ARCH=arm
+ export TERM=xterm
+ TERM=xterm
+ export 'BUILD_CXXFLAGS=-isystem/build/pandaboard/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -fpermissive'
+ BUILD_CXXFLAGS='-isystem/build/pandaboard/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -fpermissive'
+ export OBJCOPY=arm-poky-linux-gnueabi-objcopy
+ OBJCOPY=arm-poky-linux-gnueabi-objcopy
+ export HOME=/home/jim
+ HOME=/home/jim
+ unset MACHINE
+ export BUILD_STRIP=strip
+ BUILD_STRIP=strip
+ export libexecdir=/usr/libexec
+ libex
ecdir=/usr/libexec
+ export 'TARGET_CXXFLAGS=-O2 -pipe -g -feliminate-unused-debug-types -fpermissive'
+ TARGET_CXXFLAGS='-O2 -pipe -g -feliminate-unused-debug-types -fpermissive'
+ export includedir=/usr/include
+ includedir=/usr/include
+ export BUILD_LD=ld
+ BUILD_LD=ld
+ export oldincludedir=/usr/include
+ oldincludedir=/usr/include
+ export 'CCLD=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboa
rd/tmp/sysroots/omap4430-panda'
+ CCLD='arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ export BUILD_NM=nm
+ BUILD_NM=nm
+ export BUILD_AS=as
+ BUILD_AS=as
+ export OPIEDIR=/build/pandaboard/tmp/sysroots/omap4430-panda
+ OPIEDIR=/build/pandaboard/tmp/sysroots/omap4430-panda
+ export PSEUDO_DISABLED=1
+ PSEUDO_DISABLED=1
+ export BUILD_F77=g77
+ BUILD_F77=g77
+ expor
t libdir=/usr/lib
+ libdir=/usr/lib
+ export 'F77=arm-poky-linux-gnueabi-g77  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ F77='arm-poky-linux-gnueabi-g77  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ export BUILD_CXX=g++
+ BUILD_CXX=g++
+ export mandir=/usr/share/man
+ man
e/bin/:/home/jim/poky/scripts:/home/jim/poky/bitbake/bin/:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/jim/poky/scripts
+ export BUILD_AR=ar
+ BUILD_AR=ar
+ export UBOOT_ARCH=arm
+ UBOOT_ARCH=arm
+ export CMDLINE_CONSOLE=console=ttyS0
+ CMDLINE_CONSOLE=console=ttyS0
+ export 'BUILD_LDFLAGS=-L/build/pandaboard/tmp/sysroots/x86_64-linux/usr/lib -L/build/pandaboard/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/build/pandaboard/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/build/pandaboard/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/build/pandaboard/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/build/pandaboard/tmp/sysroots/x86_64-linux/lib -Wl,-O1'
+ BUILD_LDFLAGS='-L/build/pandaboard/tmp/sysroots/x86_64-linux/usr/lib -L/build/pandaboard/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/build/pandaboard/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/build/pandaboard/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/build/pandaboard/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/build/pandaboard/tmp/sysroots/x86_64-linux/lib -Wl,-O1'
+ export OS=linux-gnueabi
+ OS=linux-gnueabi
+ export 'CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ CC='arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ export BUILD_CC=gcc
+ BUILD_CC=gcc
+ export PKG_CONFIG_SYSROOT_DIR=/build/pandaboard/tmp/sysroots/omap4430-panda
+ PKG_CONFIG_SYSROOT_DIR=/build/pandaboard/tmp/sysroots/omap4430-panda
+ export LC_ALL=C
+ LC_ALL=C
+ export PKG_CONFIG_DIR=/build/pandaboard/tmp/sysroots/omap4430-panda//usr/lib/pkgconfig
+ PKG_CONFIG_DIR=/build/pandaboard/tmp/sysroots/omap4430-panda//usr/lib/pkgconfig
+ export base_bindir=/bin
+ base_bindir=/bin
+ export PKG_CONFIG_LIBDIR=/build/pandaboard/tmp/sysroots/omap4430-panda//usr/lib/pkgconfig
+ PKG_CONFIG_LIBDIR=/build/pandaboard/tmp/sysroots/omap4430-panda//usr/lib/pkgconfig
+ export sbindir=/usr/sbin
+ sbindir=/usr/sbin
+ export 'CFLAGS=-O2 -pipe -g -feliminate-unused-debug-types'
+ CFLAGS='-O2 -pipe -g -feliminate-unused-debug-types'
+ export 'CXXFLAGS=-O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden'
+ CXXFLAGS='-O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden'
+ export BUILD_CPP=cpp
+ BUILD_CPP=cpp
+ export ARCH=arm
+ ARCH=arm
+ export TERM=xterm
+ TERM=xterm
+ export 'BUILD_CXXFLAGS=-isystem/build/pandaboard/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -fpermissive'
+ BUILD_CXXFLAGS='-isystem/build/pandaboard/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -fpermissive'
+ export OBJCOPY=arm-poky-linux-gnueabi-objcopy
+ OBJCOPY=arm-poky-linux-gnueabi-objcopy
+ export HOME=/home/jim
+ HOME=/home/jim
+ unset MACHINE
+ export BUILD_STRIP=strip
+ BUILD_STRIP=strip
+ export libexecdir=/usr/libexec
+ libexecdir=/usr/libexec
+ export 'TARGET_CXXFLAGS=-O2 -pipe -g -feliminate-unused-debug-types -fpermissive'
+ TARGET_CXXFLAGS='-O2 -pipe -g -feliminate-unused-debug-types -fpermissive'
+ export includedir=/usr/include
+ includedir=/usr/include
+ export BUILD_LD=ld
+ BUILD_LD=ld
+ export oldincludedir=/usr/include
+ oldincludedir=/usr/include
+ export 'CCLD=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ CCLD='arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ export BUILD_NM=nm
+ BUILD_NM=nm
+ export BUILD_AS=as
+ BUILD_AS=as
+ export OPIEDIR=/build/pandaboard/tmp/sysroots/omap4430-panda
+ OPIEDIR=/build/pandaboard/tmp/sysroots/omap4430-panda
+ export PSEUDO_DISABLED=1
+ PSEUDO_DISABLED=1
+ export BUILD_F77=g77
+ BUILD_F77=g77
+ expordir=/usr/share/man
+ export QTDIR=/build/pandaboard/tmp/sysroots/omap4430-panda/qt2
+ QTDIR=/build/pandaboard/tmp/sysroots/omap4430-panda/qt2
+ unset TARGET_ARCH
+ export CCACHE_DIR=/build/pandaboard/tmp/ccache/omap4430_panda-poky-linux-gnueabi/linux-omap4
+ CCACHE_DIR=/build/pandaboard/tmp/ccache/omap4430_panda-poky-linux-gnueabi/linux-omap4
+ export BUILD_RANLIB=ranlib
+ BUILD_RANLIB=ranlib
+ export palmqtdir=/usr/lib/opie
+ palmqtdir=/usr/lib/opie
+ export base_sbindir=/sbin
+ base_sbindir=/sbin
+ export
 BUILD_CPPFLAGS=-isystem/build/pandaboard/tmp/sysroots/x86_64-linux/usr/include
+ BUILD_CPPFLAGS=-isystem/build/pandaboard/tmp/sysroots/x86_64-linux/usr/include
+ export 'TARGET_CFLAGS=-O2 -pipe -g -feliminate-unused-debug-types'
+ TARGET_CFLAGS='-O2 -pipe -g -feliminate-unused-debug-types'
+ export OBJDUMP=arm-poky-linux-gnueabi-objdump
+ OBJDUMP=arm-poky-linux-gnueabi-objdump
+ unset DISTRO
+ export docdir=/usr/share/doc
+ docdir=/usr/share/doc
+ export SHELL=/bin/bash
+ SHELL=/bin/bash
+ cd /build/pandab
oard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git
+ do_compile_perf
+ '[' yes = yes ']'
+ oe_runmake -C /build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf 'CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda' 'LD=arm-poky-linux-gnueabi-ld --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda ' 
prefix=/usr NO_NEWT=1 NO_DWARF=1
+ '[' xmake = x ']'
+ bbnote make -j 1 -C /build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf 'CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda' 'LD=arm-poky-linux-gnueabi-ld --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda ' prefix=/usr NO_NEWT=1 NO_DWARF=1
+ echo 'NOTE: make -j 
1 -C /build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda LD=arm-poky-linux-gnueabi-ld --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda  prefix=/usr NO_NEWT=1 NO_DWARF=1'
NOTE: make -j 1 -C /build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6
.35.7-r0/git/tools/perf CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda LD=arm-poky-linux-gnueabi-ld --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda  prefix=/usr NO_NEWT=1 NO_DWARF=1
+ make -j 1 -C /build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf 'CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vecto
rize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda' 'LD=arm-poky-linux-gnueabi-ld --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda ' prefix=/usr NO_NEWT=1 NO_DWARF=1
make: Entering directory `/build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf'
    CC bench/sched-pipe.o
bench/sched-pipe.c: In function 'bench_sched_pipe':
bench/sched-pipe.c:58:6: error: variable 'ret' set but
 not used [-Werror=unused-but-set-variable]
cc1: all warnings being treated as errors

make: *** [bench/sched-pipe.o] Error 1
make: Leaving directory `/build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf'
+ die 'oe_runmake failed'
+ bbfatal 'oe_runmake failed'
+ echo 'ERROR: oe_runmake failed'
ERROR: oe_runmake failed
+ exit 1

t libdir=/usr/lib
+ libdir=/usr/lib
+ export 'F77=arm-poky-linux-gnueabi-g77  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ F77='arm-poky-linux-gnueabi-g77  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda'
+ export BUILD_CXX=g++
+ BUILD_CXX=g++
+ export mandir=/usr/share/man
+ mandir=/usr/share/man
+ export QTDIR=/build/pandaboard/tmp/sysroots/omap4430-panda/qt2
+ QTDIR=/build/pandaboard/tmp/sysroots/omap4430-panda/qt2
+ unset TARGET_ARCH
+ export CCACHE_DIR=/build/pandaboard/tmp/ccache/omap4430_panda-poky-linux-gnueabi/linux-omap4
+ CCACHE_DIR=/build/pandaboard/tmp/ccache/omap4430_panda-poky-linux-gnueabi/linux-omap4
+ export BUILD_RANLIB=ranlib
+ BUILD_RANLIB=ranlib
+ export palmqtdir=/usr/lib/opie
+ palmqtdir=/usr/lib/opie
+ export base_sbindir=/sbin
+ base_sbindir=/sbin
+ export BUILD_CPPFLAGS=-isystem/build/pandaboard/tmp/sysroots/x86_64-linux/usr/include
+ BUILD_CPPFLAGS=-isystem/build/pandaboard/tmp/sysroots/x86_64-linux/usr/include
+ export 'TARGET_CFLAGS=-O2 -pipe -g -feliminate-unused-debug-types'
+ TARGET_CFLAGS='-O2 -pipe -g -feliminate-unused-debug-types'
+ export OBJDUMP=arm-poky-linux-gnueabi-objdump
+ OBJDUMP=arm-poky-linux-gnueabi-objdump
+ unset DISTRO
+ export docdir=/usr/share/doc
+ docdir=/usr/share/doc
+ export SHELL=/bin/bash
+ SHELL=/bin/bash
+ cd /build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git
+ do_compile_perf
+ '[' yes = yes ']'
+ oe_runmake -C /build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf 'CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda' 'LD=arm-poky-linux-gnueabi-ld --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda ' prefix=/usr NO_NEWT=1 NO_DWARF=1
+ '[' xmake = x ']'
+ bbnote make -j 1 -C /build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf 'CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda' 'LD=arm-poky-linux-gnueabi-ld --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda ' prefix=/usr NO_NEWT=1 NO_DWARF=1
+ echo 'NOTE: make -j 1 -C /build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda LD=arm-poky-linux-gnueabi-ld --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda  prefix=/usr NO_NEWT=1 NO_DWARF=1'
NOTE: make -j 1 -C /build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda LD=arm-poky-linux-gnueabi-ld --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda  prefix=/usr NO_NEWT=1 NO_DWARF=1
+ make -j 1 -C /build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf 'CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda' 'LD=arm-poky-linux-gnueabi-ld --sysroot=/build/pandaboard/tmp/sysroots/omap4430-panda ' prefix=/usr NO_NEWT=1 NO_DWARF=1
make: Entering directory `/build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf'
    CC bench/sched-pipe.o
bench/sched-pipe.c: In function 'bench_sched_pipe':
bench/sched-pipe.c:58:6: error: variable 'ret' set butERROR: Function failed: do_compile_perf (see /build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/temp/log.do_compile_perf.31362 for further information)
 not used [-Werror=unused-but-set-variable]
cc1: all warnings being treated as errors

make: *** [bench/sched-pipe.o] Error 1
make: Leaving directory `/build/pandaboard/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf'
+ die 'oe_runmake failed'
+ bbfatal 'oe_runmake failed'
+ echo 'ERROR: oe_runmake failed'
ERROR: oe_runmake failed
+ exit 1

--------------040808020808010301080401--
