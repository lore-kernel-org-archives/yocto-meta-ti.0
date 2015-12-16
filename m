Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1763CE00BE3; Wed, 16 Dec 2015 12:22:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B8B3E002F9
	for <meta-ti@yoctoproject.org>; Wed, 16 Dec 2015 12:22:13 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBGKMCPA021081;
	Wed, 16 Dec 2015 14:22:12 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBGKMCD8001903;
	Wed, 16 Dec 2015 14:22:12 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Dec 2015 14:22:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBGKMCID002251;
	Wed, 16 Dec 2015 14:22:12 -0600
Date: Wed, 16 Dec 2015 15:21:56 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Joshua Vanderpool <jdvdt2@gmail.com>
Message-ID: <20151216202156.GI27464@edge>
References: <CAESSzZyP2JX1yYwgvp=BHFmja9qOPzA+_k9F3Z8GSfON2pRvmw@mail.gmail.com>
	<20151215194902.GD27464@edge>
	<CAESSzZzUhzzCxMWQP_OUOG1BMpBFc+BRzB3y1d97F-VL9sqnUg@mail.gmail.com>
	<20151216174450.GH27464@edge>
	<CAESSzZwMzHbxR+BLMaNV=ciMps=-ogsJ_+xYFpS=mjirT-_iLw@mail.gmail.com>
	<CAAjA2M+ukzZuS=q6+Vhwrba9Axc7NXXChn4F42KzakR8RDXREw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAjA2M+ukzZuS=q6+Vhwrba9Axc7NXXChn4F42KzakR8RDXREw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Cannot compile omapdrm-pvr for A15
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
X-List-Received-Date: Wed, 16 Dec 2015 20:22:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Dec 16, 2015 at 03:10:05PM -0500, Joshua Vanderpool wrote:
> Aymeric,
> 
> They have switched to the 2015 linaro toolchain.
> 
> $ wget
> http://releases.linaro.org/15.05/components/toolchain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz
> 
> $ tar xf gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz
> 
> $ export
> PATH=$HOME/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/bin:$PATH
> 
> Also make sure to have dos2unix installed or the build of the omapdrm will
> fail as well.
> 
> I am sure the wiki will be updated soon.

Yes, the Wiki has been updated to reflect Fido and Linaro 2015.05 toolchain.

-- 
Denys


> On Wed, Dec 16, 2015 at 2:40 PM, Aymeric Dumaz <aymeric.dumaz@gmail.com>
> wrote:
> 
> > 2015-12-16 9:44 GMT-08:00 Denys Dmytriyenko <denys@ti.com>:
> > > On Tue, Dec 15, 2015 at 12:40:30PM -0800, Aymeric Dumaz wrote:
> > >> 2015-12-15 11:49 GMT-08:00 Denys Dmytriyenko <denys@ti.com>:
> > >> > On Tue, Dec 15, 2015 at 11:41:10AM -0800, Aymeric Dumaz wrote:
> > >> >> Hello,
> > >> >>
> > >> >> I am trying to create an image with Qt5 for my BeagleBoard X15. I set
> > >> >> up the build environment as explained in the Arago wiki, and add that
> > >> >> my local.conf:
> > >> >>
> > >> >> IMAGE_INSTALL_append = " kernel-modules omap5-sgx-ddk-um-linux
> > >> >> omapdrm-pvr libgbm libdrm libdrm-omap qtbase qtbase-plugins
> > >> >> qtbase-fonts qtquick1 qtquick1-qmlplugins kmscube"
> > >> >>
> > >> >> But when it tries to compile omapdrm-pvr, it prints the following
> > >> >> errors (same if I try with the OMAP5432 uEVM).
> > >> >>
> > >> >> I am missing something?
> > >> >> Regards
> > >> >
> > >> > I see that you are using Daisy branch and 3.14 kernel. Make sure you
> > build
> > >> > against linux-ti-staging_3.14 kernel, as it is specifically patches
> > with
> > >> > necessary SGX API (like omap_gem_* symbols below).
> > >>
> > >> Thank you for your answer.
> > >> I did a "cleansstate virtual/kernel" and rebuild omapdrm-pvr, which
> > >> triggered the kernel to be rebuilt too.
> > >> It is the correct version
> > >> (linux-ti-staging-3.14.49+gitAUTOINC+e9cd4cc819-r7a-arago2), but
> > >> omapdrm-pvr fails with the same errors.
> > >
> > > Aymeric,
> > >
> > > We've moved on to Fido setup with 4.1 kernel some time back and I
> > personally
> > > haven't tried Daisy/3.14 recently. Can you try Fido/4.1 as well?
> >
> > My bad, I followed the "Setting Up Build Environment" wiki page.
> > I tried with Fido (configs/arago-fido-config.txt), but I have some
> > issues with the toolchain now; I tried the 2013.10 version but it has
> > the same problems.
> > Should I use another toolchain?
> >
> > |
> > /linaro_toolchain/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
> > cannot find ../../lib/libc.so.6
> > | collect2: error: ld returned 1 exit status
> > | make: *** [example] Error 1
> > | make: *** Waiting for unfinished jobs....
> > |
> > /linaro_toolchain/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
> > cannot find ../../lib/libc.so.6
> > | collect2: error: ld returned 1 exit status
> > | make: *** [minigzip] Error 1
> > |
> > /linaro_toolchain/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
> > cannot find ../../lib/libc.so.6
> > | collect2: error: ld returned 1 exit status
> > | make: *** [example64] Error 1
> > |
> > /linaro_toolchain/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
> > cannot find ../../lib/libc.so.6
> > | collect2: error: ld returned 1 exit status
> > | make: *** [minigzip64] Error 1
> > | ERROR: oe_runmake failed
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_compile (log file is located at
> >
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/zlib/1.2.8-r0/temp/log.do_compile.22964)
> > ERROR: Task 894
> > (/tisdk/sources/oe-core/meta/recipes-core/zlib/zlib_1.2.8.bb,
> > do_compile) failed with exit code '1'
> > ERROR: Function failed: do_configure (log file is located at
> >
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.18450)
> > ERROR: Logfile of failure stored in:
> >
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.18450
> >
> > [...]
> >
> > | ## ------------------------- ##
> > | ## Configuring libtool 2.4.6 ##
> > | ## ------------------------- ##
> > |
> > | checking for GNU M4 that supports accurate traces...
> >
> > /tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/m4
> > | checking whether
> >
> > /tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/m4
> > accepts --gnu... yes
> > | checking how m4 supports trace files... --debugfile
> > | checking for a BSD-compatible install... /usr/bin/install -c
> > | checking whether build environment is sane... yes
> > | checking for arm-linux-gnueabi-strip... arm-linux-gnueabihf-strip
> > | checking for a thread-safe mkdir -p... /bin/mkdir -p
> > | checking for gawk... gawk
> > | checking whether make sets $(MAKE)... yes
> > | checking whether make supports nested variables... yes
> > | checking whether make supports nested variables... (cached) yes
> > | checking build system type... x86_64-pc-linux-gnu
> > | checking host system type... arm-unknown-linux-gnueabi
> > | configure: autobuild project... GNU Libtool
> > | configure: autobuild revision... 2.4.6
> > | configure: autobuild hostname... ubuntu_precise
> > | configure: autobuild mode... default
> > | configure: autobuild timestamp... 20151216T191217Z
> > | checking for arm-linux-gnueabi-gcc... arm-linux-gnueabihf-gcc
> > -march=armv7-a -marm  -mthumb-interwork -mfloat-abi=hard -mfpu=neon
> > -mtune=cortex-a15
> >
> > --sysroot=/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm
> > | checking whether the C compiler works... no
> > | configure: error: in
> >
> > `/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/build':
> > | configure: error: C compiler cannot create executables
> > | See `config.log' for more details
> > | Configure failed. The contents of all config.log files follows to
> > aid debugging
> > | ERROR: oe_runconf failed
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_configure (log file is located at
> >
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.18450)
> > ERROR: Task 530
> > (/tisdk/sources/oe-core/meta/recipes-devtools/libtool/
> > libtool-cross_2.4.6.bb,
> > do_configure) failed with exit code '1'
> >
> >
> > >
> > > Karthik,
> > >
> > > Were you still using Daisy with 3.14 kernel? Have you had any issues with
> > > omapdrm-pvr?
> > >
> > > --
> > > Denys
> > >
> > >
> > >> >> $ MACHINE=am57xx-evm bitbake omapdrm-pvr
> > >> >> NOTE: Started PRServer with DBfile:
> > /tisdk/build/cache/prserv.sqlite3,
> > >> >> IP: 127.0.0.1, PORT: 40922, PID: 19820
> > >> >> Loading cache: 100%
> > >> >> |########################################################| ETA:
> > >> >> 00:00:00
> > >> >> Loaded 2270 entries from dependency cache.
> > >> >> Parsing recipes: 100%
> > >> >> |######################################################| Time:
> > >> >> 00:00:00
> > >> >> Parsing of 1827 .bb files complete (1826 cached, 1 parsed). 2270
> > >> >> targets, 212 skipped, 0 masked, 0 errors.
> > >> >> WARNING: No recipes available for:
> > >> >>
> >  /tisdk/sources/meta-arago/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1m.bbappend
> > >> >> NOTE: Resolving any missing task queue dependencies
> > >> >>
> > >> >> Build Configuration:
> > >> >> BB_VERSION        = "1.26.0"
> > >> >> BUILD_SYS         = "x86_64-linux"
> > >> >> NATIVELSBSTRING   = "Ubuntu-12.04"
> > >> >> TARGET_SYS        = "arm-linux-gnueabi"
> > >> >> MACHINE           = "am57xx-evm"
> > >> >> DISTRO            = "arago"
> > >> >> DISTRO_VERSION    = "2015.05"
> > >> >> TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard
> > cortexa15"
> > >> >> TARGET_FPU        = "vfp-neon"
> > >> >> meta-arago-distro
> > >> >> meta-arago-extras = "daisy:dc89e06d2a64f33d9e9662e6f7fe1f8466ff167c"
> > >> >> meta-qt5          =
> > "(nobranch):17eb158c6d2cd290b054b5bd54311aa44a02d04d"
> > >> >> toolchain-layer
> > >> >> meta-networking
> > >> >> meta-ruby
> > >> >> meta-oe           = "daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa"
> > >> >> meta-ti           = "daisy:090b02a104924886afd0fa79be7b5d08eebf071f"
> > >> >> meta-linaro-toolchain =
> > "daisy:06008235ca752fea678953e85adaa29a491d246b"
> > >> >> meta              = "daisy:e1a2540227250d854d5bba278634bcc9e7572cda"
> > >> >>
> > >> >> NOTE: Preparing RunQueue
> > >> >> NOTE: Executing SetScene Tasks
> > >> >> NOTE: Executing RunQueue Tasks
> > >> >> ERROR: Function failed: do_compile (log file is located at
> > >> >>
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/temp/log.do_compile.19911)
> > >> >> ERROR: Logfile of failure stored in:
> > >> >>
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/temp/log.do_compile.19911
> > >> >> Log data follows:
> > >> >> | DEBUG: Executing shell function do_compile
> > >> >> | NOTE: make -j 8 -e MAKEFLAGS=
> > >> >>
> > KERNELDIR=/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/src/kernel
> > >> >>
> > KERNEL_PATH=/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/src/kernel
> > >> >>
> > KERNEL_SRC=/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/src/kernel
> > >> >> KERNEL_VERSION=3.14.49-ge9cd4cc CC=arm-linux-gnueabihf-gcc
> > >> >> -mno-thumb-interwork -marm LD=arm-linux-gnueabihf-ld.bfd
> > >> >> AR=arm-linux-gnueabihf-ar
> > >> >> | ../config/core.mk:419: $(KERNELDIR)/vmlinux does not exist.
> > Kbuild may fail.
> > >> >> |   CC [M]
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.o
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
> > >> >> In function 'create_gem_wrapper':
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:480:2:
> > >> >> error: implicit declaration of function 'omap_gem_new_ext'
> > >> >> [-Werror=implicit-function-declaration]
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:480:2:
> > >> >> error: return makes pointer from integer without a cast [-Werror]
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
> > >> >> In function 'MMapVOpenExt':
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1370:2:
> > >> >> error: implicit declaration of function 'omap_gem_priv'
> > >> >> [-Werror=implicit-function-declaration]
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1370:15:
> > >> >> error: initialization makes pointer from integer without a cast
> > >> >> [-Werror]
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
> > >> >> In function 'MMapVCloseExt':
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1384:15:
> > >> >> error: initialization makes pointer from integer without a cast
> > >> >> [-Werror]
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
> > >> >> In function 'PVRMMapExt':
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1442:2:
> > >> >> error: implicit declaration of function 'omap_gem_set_priv'
> > >> >> [-Werror=implicit-function-declaration]
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
> > >> >> At top level:
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1473:15:
> > >> >> error: variable 'gem_ops' has initializer but incomplete type
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1474:3:
> > >> >> error: unknown field 'open' specified in initializer
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1474:3:
> > >> >> error: excess elements in struct initializer [-Werror]
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1474:3:
> > >> >> error: (near initialization for 'gem_ops') [-Werror]
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1475:3:
> > >> >> error: unknown field 'close' specified in initializer
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1475:3:
> > >> >> error: excess elements in struct initializer [-Werror]
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1475:3:
> > >> >> error: (near initialization for 'gem_ops') [-Werror]
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1476:3:
> > >> >> error: unknown field 'mmap' specified in initializer
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1476:3:
> > >> >> error: excess elements in struct initializer [-Werror]
> > >> >> |
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1476:3:
> > >> >> error: (near initialization for 'gem_ops') [-Werror]
> > >> >> | cc1: all warnings being treated as errors
> > >> >> | make[3]: ***
> > [/tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.o]
> > >> >> Error 1
> > >> >> | make[2]: ***
> > [_module_/tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild]
> > >> >> Error 2
> > >> >> | make[1]: *** [kbuild] Error 2
> > >> >> | make: *** [build] Error 2
> > >> >> | ERROR: oe_runmake failed
> > >> >> | WARNING: exit code 1 from a shell command.
> > >> >> | ERROR: Function failed: do_compile (log file is located at
> > >> >>
> > /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/temp/log.do_compile.19911)
> > >> >> ERROR: Task 8 (/tisdk/sources/meta-ti/recipes-bsp/powervr-drivers/
> > omapdrm-pvr_1.9.2253347.bb,
> > >> >> do_compile) failed with exit code '1'
> > >> >> NOTE: Tasks Summary: Attempted 406 tasks of which 403 didn't need to
> > >> >> be rerun and 1 failed.
> > >> >> NOTE: Writing buildhistory
> > >> >> Waiting for 0 running tasks to finish:
> > >> >>
> > >> >> Summary: 1 task failed:
> > >> >>   /tisdk/sources/meta-ti/recipes-bsp/powervr-drivers/
> > omapdrm-pvr_1.9.2253347.bb,
> > >> >> do_compile
> > >> >> Summary: There was 1 WARNING message shown.
> > >> >> Summary: There was 1 ERROR message shown, returning a non-zero exit
> > code.
> > >> >> --
> > >> >> _______________________________________________
> > >> >> meta-ti mailing list
> > >> >> meta-ti@yoctoproject.org
> > >> >> https://lists.yoctoproject.org/listinfo/meta-ti
> > >>
> > >>
> > >>
> > >> --
> > >> Aymeric Dumaz
> > >> Epita 2014
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >

