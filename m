Return-Path: <jdvdt2@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70080E00869; Wed, 16 Dec 2015 12:10:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, URI_HEX, 
	WEIRD_PORT autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jdvdt2[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.51 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A32C8E002F9
	for <meta-ti@yoctoproject.org>; Wed, 16 Dec 2015 12:10:06 -0800 (PST)
Received: by mail-vk0-f51.google.com with SMTP id j66so33506189vkg.1
	for <meta-ti@yoctoproject.org>; Wed, 16 Dec 2015 12:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=f5boDhBQYf/TtGf5Ay+kcOTDZtSBarIm6powkWR6rVA=;
	b=sSqpp3/IaGLbCpKD3HqpToTTerC5PyyPa8NJqhz/1SnpIn/JS2x8+cW6wZ1a1qSyJs
	vpzB7BtJ9A9EaVEEh7TR4tV+WxJ3BOL26bU4Ga8kotZwwIs45a8lGN/VDq3GwVYKBztN
	vVtkND2jN7Ax3iuiARrZYU+LfeHl9BZVQq3mFs5pKHHILNCO4A20KFGoQ/vWPAl2SaEe
	nL7hFNfWCb+dXTwQY8iOfu50RGB7jG3jZg1FJZGXLS5KfU5iQJmawng1b2VHueoaR6/r
	ZYSeUT9JZo/JNFtt9I/f0unXPXkkaT/74fZlCBCKuhRc4s3azBg5qoN8sP9RUxTa9S3z
	xLOA==
MIME-Version: 1.0
X-Received: by 10.31.157.76 with SMTP id g73mr23883224vke.7.1450296605455;
	Wed, 16 Dec 2015 12:10:05 -0800 (PST)
Received: by 10.31.93.69 with HTTP; Wed, 16 Dec 2015 12:10:05 -0800 (PST)
In-Reply-To: <CAESSzZwMzHbxR+BLMaNV=ciMps=-ogsJ_+xYFpS=mjirT-_iLw@mail.gmail.com>
References: <CAESSzZyP2JX1yYwgvp=BHFmja9qOPzA+_k9F3Z8GSfON2pRvmw@mail.gmail.com>
	<20151215194902.GD27464@edge>
	<CAESSzZzUhzzCxMWQP_OUOG1BMpBFc+BRzB3y1d97F-VL9sqnUg@mail.gmail.com>
	<20151216174450.GH27464@edge>
	<CAESSzZwMzHbxR+BLMaNV=ciMps=-ogsJ_+xYFpS=mjirT-_iLw@mail.gmail.com>
Date: Wed, 16 Dec 2015 15:10:05 -0500
Message-ID: <CAAjA2M+ukzZuS=q6+Vhwrba9Axc7NXXChn4F42KzakR8RDXREw@mail.gmail.com>
From: Joshua Vanderpool <jdvdt2@gmail.com>
To: Aymeric Dumaz <aymeric.dumaz@gmail.com>
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
X-List-Received-Date: Wed, 16 Dec 2015 20:10:10 -0000
Content-Type: multipart/alternative; boundary=001a114168a8fcb9f40527097df5

--001a114168a8fcb9f40527097df5
Content-Type: text/plain; charset=UTF-8

Aymeric,

They have switched to the 2015 linaro toolchain.

$ wget
http://releases.linaro.org/15.05/components/toolchain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz

$ tar xf gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz

$ export
PATH=$HOME/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/bin:$PATH

Also make sure to have dos2unix installed or the build of the omapdrm will
fail as well.

I am sure the wiki will be updated soon.


Josh

On Wed, Dec 16, 2015 at 2:40 PM, Aymeric Dumaz <aymeric.dumaz@gmail.com>
wrote:

> 2015-12-16 9:44 GMT-08:00 Denys Dmytriyenko <denys@ti.com>:
> > On Tue, Dec 15, 2015 at 12:40:30PM -0800, Aymeric Dumaz wrote:
> >> 2015-12-15 11:49 GMT-08:00 Denys Dmytriyenko <denys@ti.com>:
> >> > On Tue, Dec 15, 2015 at 11:41:10AM -0800, Aymeric Dumaz wrote:
> >> >> Hello,
> >> >>
> >> >> I am trying to create an image with Qt5 for my BeagleBoard X15. I set
> >> >> up the build environment as explained in the Arago wiki, and add that
> >> >> my local.conf:
> >> >>
> >> >> IMAGE_INSTALL_append = " kernel-modules omap5-sgx-ddk-um-linux
> >> >> omapdrm-pvr libgbm libdrm libdrm-omap qtbase qtbase-plugins
> >> >> qtbase-fonts qtquick1 qtquick1-qmlplugins kmscube"
> >> >>
> >> >> But when it tries to compile omapdrm-pvr, it prints the following
> >> >> errors (same if I try with the OMAP5432 uEVM).
> >> >>
> >> >> I am missing something?
> >> >> Regards
> >> >
> >> > I see that you are using Daisy branch and 3.14 kernel. Make sure you
> build
> >> > against linux-ti-staging_3.14 kernel, as it is specifically patches
> with
> >> > necessary SGX API (like omap_gem_* symbols below).
> >>
> >> Thank you for your answer.
> >> I did a "cleansstate virtual/kernel" and rebuild omapdrm-pvr, which
> >> triggered the kernel to be rebuilt too.
> >> It is the correct version
> >> (linux-ti-staging-3.14.49+gitAUTOINC+e9cd4cc819-r7a-arago2), but
> >> omapdrm-pvr fails with the same errors.
> >
> > Aymeric,
> >
> > We've moved on to Fido setup with 4.1 kernel some time back and I
> personally
> > haven't tried Daisy/3.14 recently. Can you try Fido/4.1 as well?
>
> My bad, I followed the "Setting Up Build Environment" wiki page.
> I tried with Fido (configs/arago-fido-config.txt), but I have some
> issues with the toolchain now; I tried the 2013.10 version but it has
> the same problems.
> Should I use another toolchain?
>
> |
> /linaro_toolchain/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
> cannot find ../../lib/libc.so.6
> | collect2: error: ld returned 1 exit status
> | make: *** [example] Error 1
> | make: *** Waiting for unfinished jobs....
> |
> /linaro_toolchain/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
> cannot find ../../lib/libc.so.6
> | collect2: error: ld returned 1 exit status
> | make: *** [minigzip] Error 1
> |
> /linaro_toolchain/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
> cannot find ../../lib/libc.so.6
> | collect2: error: ld returned 1 exit status
> | make: *** [example64] Error 1
> |
> /linaro_toolchain/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
> cannot find ../../lib/libc.so.6
> | collect2: error: ld returned 1 exit status
> | make: *** [minigzip64] Error 1
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
>
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/zlib/1.2.8-r0/temp/log.do_compile.22964)
> ERROR: Task 894
> (/tisdk/sources/oe-core/meta/recipes-core/zlib/zlib_1.2.8.bb,
> do_compile) failed with exit code '1'
> ERROR: Function failed: do_configure (log file is located at
>
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.18450)
> ERROR: Logfile of failure stored in:
>
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.18450
>
> [...]
>
> | ## ------------------------- ##
> | ## Configuring libtool 2.4.6 ##
> | ## ------------------------- ##
> |
> | checking for GNU M4 that supports accurate traces...
>
> /tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/m4
> | checking whether
>
> /tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/m4
> accepts --gnu... yes
> | checking how m4 supports trace files... --debugfile
> | checking for a BSD-compatible install... /usr/bin/install -c
> | checking whether build environment is sane... yes
> | checking for arm-linux-gnueabi-strip... arm-linux-gnueabihf-strip
> | checking for a thread-safe mkdir -p... /bin/mkdir -p
> | checking for gawk... gawk
> | checking whether make sets $(MAKE)... yes
> | checking whether make supports nested variables... yes
> | checking whether make supports nested variables... (cached) yes
> | checking build system type... x86_64-pc-linux-gnu
> | checking host system type... arm-unknown-linux-gnueabi
> | configure: autobuild project... GNU Libtool
> | configure: autobuild revision... 2.4.6
> | configure: autobuild hostname... ubuntu_precise
> | configure: autobuild mode... default
> | configure: autobuild timestamp... 20151216T191217Z
> | checking for arm-linux-gnueabi-gcc... arm-linux-gnueabihf-gcc
> -march=armv7-a -marm  -mthumb-interwork -mfloat-abi=hard -mfpu=neon
> -mtune=cortex-a15
>
> --sysroot=/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm
> | checking whether the C compiler works... no
> | configure: error: in
>
> `/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/build':
> | configure: error: C compiler cannot create executables
> | See `config.log' for more details
> | Configure failed. The contents of all config.log files follows to
> aid debugging
> | ERROR: oe_runconf failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
>
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.18450)
> ERROR: Task 530
> (/tisdk/sources/oe-core/meta/recipes-devtools/libtool/
> libtool-cross_2.4.6.bb,
> do_configure) failed with exit code '1'
>
>
> >
> > Karthik,
> >
> > Were you still using Daisy with 3.14 kernel? Have you had any issues with
> > omapdrm-pvr?
> >
> > --
> > Denys
> >
> >
> >> >> $ MACHINE=am57xx-evm bitbake omapdrm-pvr
> >> >> NOTE: Started PRServer with DBfile:
> /tisdk/build/cache/prserv.sqlite3,
> >> >> IP: 127.0.0.1, PORT: 40922, PID: 19820
> >> >> Loading cache: 100%
> >> >> |########################################################| ETA:
> >> >> 00:00:00
> >> >> Loaded 2270 entries from dependency cache.
> >> >> Parsing recipes: 100%
> >> >> |######################################################| Time:
> >> >> 00:00:00
> >> >> Parsing of 1827 .bb files complete (1826 cached, 1 parsed). 2270
> >> >> targets, 212 skipped, 0 masked, 0 errors.
> >> >> WARNING: No recipes available for:
> >> >>
>  /tisdk/sources/meta-arago/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1m.bbappend
> >> >> NOTE: Resolving any missing task queue dependencies
> >> >>
> >> >> Build Configuration:
> >> >> BB_VERSION        = "1.26.0"
> >> >> BUILD_SYS         = "x86_64-linux"
> >> >> NATIVELSBSTRING   = "Ubuntu-12.04"
> >> >> TARGET_SYS        = "arm-linux-gnueabi"
> >> >> MACHINE           = "am57xx-evm"
> >> >> DISTRO            = "arago"
> >> >> DISTRO_VERSION    = "2015.05"
> >> >> TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard
> cortexa15"
> >> >> TARGET_FPU        = "vfp-neon"
> >> >> meta-arago-distro
> >> >> meta-arago-extras = "daisy:dc89e06d2a64f33d9e9662e6f7fe1f8466ff167c"
> >> >> meta-qt5          =
> "(nobranch):17eb158c6d2cd290b054b5bd54311aa44a02d04d"
> >> >> toolchain-layer
> >> >> meta-networking
> >> >> meta-ruby
> >> >> meta-oe           = "daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa"
> >> >> meta-ti           = "daisy:090b02a104924886afd0fa79be7b5d08eebf071f"
> >> >> meta-linaro-toolchain =
> "daisy:06008235ca752fea678953e85adaa29a491d246b"
> >> >> meta              = "daisy:e1a2540227250d854d5bba278634bcc9e7572cda"
> >> >>
> >> >> NOTE: Preparing RunQueue
> >> >> NOTE: Executing SetScene Tasks
> >> >> NOTE: Executing RunQueue Tasks
> >> >> ERROR: Function failed: do_compile (log file is located at
> >> >>
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/temp/log.do_compile.19911)
> >> >> ERROR: Logfile of failure stored in:
> >> >>
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/temp/log.do_compile.19911
> >> >> Log data follows:
> >> >> | DEBUG: Executing shell function do_compile
> >> >> | NOTE: make -j 8 -e MAKEFLAGS=
> >> >>
> KERNELDIR=/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/src/kernel
> >> >>
> KERNEL_PATH=/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/src/kernel
> >> >>
> KERNEL_SRC=/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/src/kernel
> >> >> KERNEL_VERSION=3.14.49-ge9cd4cc CC=arm-linux-gnueabihf-gcc
> >> >> -mno-thumb-interwork -marm LD=arm-linux-gnueabihf-ld.bfd
> >> >> AR=arm-linux-gnueabihf-ar
> >> >> | ../config/core.mk:419: $(KERNELDIR)/vmlinux does not exist.
> Kbuild may fail.
> >> >> |   CC [M]
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.o
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
> >> >> In function 'create_gem_wrapper':
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:480:2:
> >> >> error: implicit declaration of function 'omap_gem_new_ext'
> >> >> [-Werror=implicit-function-declaration]
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:480:2:
> >> >> error: return makes pointer from integer without a cast [-Werror]
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
> >> >> In function 'MMapVOpenExt':
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1370:2:
> >> >> error: implicit declaration of function 'omap_gem_priv'
> >> >> [-Werror=implicit-function-declaration]
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1370:15:
> >> >> error: initialization makes pointer from integer without a cast
> >> >> [-Werror]
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
> >> >> In function 'MMapVCloseExt':
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1384:15:
> >> >> error: initialization makes pointer from integer without a cast
> >> >> [-Werror]
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
> >> >> In function 'PVRMMapExt':
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1442:2:
> >> >> error: implicit declaration of function 'omap_gem_set_priv'
> >> >> [-Werror=implicit-function-declaration]
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
> >> >> At top level:
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1473:15:
> >> >> error: variable 'gem_ops' has initializer but incomplete type
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1474:3:
> >> >> error: unknown field 'open' specified in initializer
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1474:3:
> >> >> error: excess elements in struct initializer [-Werror]
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1474:3:
> >> >> error: (near initialization for 'gem_ops') [-Werror]
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1475:3:
> >> >> error: unknown field 'close' specified in initializer
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1475:3:
> >> >> error: excess elements in struct initializer [-Werror]
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1475:3:
> >> >> error: (near initialization for 'gem_ops') [-Werror]
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1476:3:
> >> >> error: unknown field 'mmap' specified in initializer
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1476:3:
> >> >> error: excess elements in struct initializer [-Werror]
> >> >> |
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1476:3:
> >> >> error: (near initialization for 'gem_ops') [-Werror]
> >> >> | cc1: all warnings being treated as errors
> >> >> | make[3]: ***
> [/tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.o]
> >> >> Error 1
> >> >> | make[2]: ***
> [_module_/tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild]
> >> >> Error 2
> >> >> | make[1]: *** [kbuild] Error 2
> >> >> | make: *** [build] Error 2
> >> >> | ERROR: oe_runmake failed
> >> >> | WARNING: exit code 1 from a shell command.
> >> >> | ERROR: Function failed: do_compile (log file is located at
> >> >>
> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/temp/log.do_compile.19911)
> >> >> ERROR: Task 8 (/tisdk/sources/meta-ti/recipes-bsp/powervr-drivers/
> omapdrm-pvr_1.9.2253347.bb,
> >> >> do_compile) failed with exit code '1'
> >> >> NOTE: Tasks Summary: Attempted 406 tasks of which 403 didn't need to
> >> >> be rerun and 1 failed.
> >> >> NOTE: Writing buildhistory
> >> >> Waiting for 0 running tasks to finish:
> >> >>
> >> >> Summary: 1 task failed:
> >> >>   /tisdk/sources/meta-ti/recipes-bsp/powervr-drivers/
> omapdrm-pvr_1.9.2253347.bb,
> >> >> do_compile
> >> >> Summary: There was 1 WARNING message shown.
> >> >> Summary: There was 1 ERROR message shown, returning a non-zero exit
> code.
> >> >> --
> >> >> _______________________________________________
> >> >> meta-ti mailing list
> >> >> meta-ti@yoctoproject.org
> >> >> https://lists.yoctoproject.org/listinfo/meta-ti
> >>
> >>
> >>
> >> --
> >> Aymeric Dumaz
> >> Epita 2014
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

--001a114168a8fcb9f40527097df5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px;font-weight:bold;white-spa=
ce:nowrap">Aymeric,</span><br><div><span style=3D"font-size:12.8px;font-wei=
ght:bold;white-space:nowrap"><br></span></div><div><span style=3D"font-size=
:12.8px;font-weight:bold;white-space:nowrap">They have switched to the 2015=
 linaro toolchain.</span></div><div><p style=3D"margin:6px 0px 0px;color:rg=
b(92,93,94);font-family:&#39;Source Sans Pro&#39;,&#39;Helvetica Neue&#39;,=
Helvetica,Arial,sans-serif;font-size:15px;line-height:21.4286px">$ wget=C2=
=A0<a href=3D"http://releases.linaro.org/15.05/components/toolchain/binarie=
s/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar=
.xz" rel=3D"nofollow" style=3D"color:rgb(48,132,187);text-decoration:none;m=
argin-top:0px;background-color:transparent">http://releases.linaro.org/15.0=
5/components/toolchain/binaries/arm-linux-gnueabihf/gcc-linaro-4.9-2015.05-=
x86_64_arm-linux-gnueabihf.tar.xz</a></p><p style=3D"margin:6px 0px 0px;col=
or:rgb(92,93,94);font-family:&#39;Source Sans Pro&#39;,&#39;Helvetica Neue&=
#39;,Helvetica,Arial,sans-serif;font-size:15px;line-height:21.4286px">$ tar=
 xf gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf.tar.xz</p><p style=3D=
"margin:6px 0px 0px;color:rgb(92,93,94);font-family:&#39;Source Sans Pro&#3=
9;,&#39;Helvetica Neue&#39;,Helvetica,Arial,sans-serif;font-size:15px;line-=
height:21.4286px"><span style=3D"line-height:21.4286px">$ export PATH=3D$HO=
ME/gcc-linaro-4.9-2015.05-x86_64_arm-linux-gnueabihf/bin:$PATH</span><br></=
p><p style=3D"margin:6px 0px 0px;color:rgb(92,93,94);font-family:&#39;Sourc=
e Sans Pro&#39;,&#39;Helvetica Neue&#39;,Helvetica,Arial,sans-serif;font-si=
ze:15px;line-height:21.4286px">Also make sure to have dos2unix installed or=
 the build of the omapdrm will fail as well.</p><p style=3D"margin:6px 0px =
0px;color:rgb(92,93,94);font-family:&#39;Source Sans Pro&#39;,&#39;Helvetic=
a Neue&#39;,Helvetica,Arial,sans-serif;font-size:15px;line-height:21.4286px=
">I am sure the wiki will be updated soon.</p><p style=3D"margin:6px 0px 0p=
x;color:rgb(92,93,94);font-family:&#39;Source Sans Pro&#39;,&#39;Helvetica =
Neue&#39;,Helvetica,Arial,sans-serif;font-size:15px;line-height:21.4286px">=
<br></p><p style=3D"margin:6px 0px 0px;color:rgb(92,93,94);font-family:&#39=
;Source Sans Pro&#39;,&#39;Helvetica Neue&#39;,Helvetica,Arial,sans-serif;f=
ont-size:15px;line-height:21.4286px">Josh</p></div></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Wed, Dec 16, 2015 at 2:40 PM, Ay=
meric Dumaz <span dir=3D"ltr">&lt;<a href=3D"mailto:aymeric.dumaz@gmail.com=
" target=3D"_blank">aymeric.dumaz@gmail.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">2015-12-16=
 9:44 GMT-08:00 Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys=
@ti.com</a>&gt;:<br>
&gt; On Tue, Dec 15, 2015 at 12:40:30PM -0800, Aymeric Dumaz wrote:<br>
&gt;&gt; 2015-12-15 11:49 GMT-08:00 Denys Dmytriyenko &lt;<a href=3D"mailto=
:denys@ti.com">denys@ti.com</a>&gt;:<br>
&gt;&gt; &gt; On Tue, Dec 15, 2015 at 11:41:10AM -0800, Aymeric Dumaz wrote=
:<br>
&gt;&gt; &gt;&gt; Hello,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I am trying to create an image with Qt5 for my BeagleBoar=
d X15. I set<br>
&gt;&gt; &gt;&gt; up the build environment as explained in the Arago wiki, =
and add that<br>
&gt;&gt; &gt;&gt; my local.conf:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; IMAGE_INSTALL_append =3D &quot; kernel-modules omap5-sgx-=
ddk-um-linux<br>
&gt;&gt; &gt;&gt; omapdrm-pvr libgbm libdrm libdrm-omap qtbase qtbase-plugi=
ns<br>
&gt;&gt; &gt;&gt; qtbase-fonts qtquick1 qtquick1-qmlplugins kmscube&quot;<b=
r>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; But when it tries to compile omapdrm-pvr, it prints the f=
ollowing<br>
&gt;&gt; &gt;&gt; errors (same if I try with the OMAP5432 uEVM).<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I am missing something?<br>
&gt;&gt; &gt;&gt; Regards<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I see that you are using Daisy branch and 3.14 kernel. Make s=
ure you build<br>
&gt;&gt; &gt; against linux-ti-staging_3.14 kernel, as it is specifically p=
atches with<br>
&gt;&gt; &gt; necessary SGX API (like omap_gem_* symbols below).<br>
&gt;&gt;<br>
&gt;&gt; Thank you for your answer.<br>
&gt;&gt; I did a &quot;cleansstate virtual/kernel&quot; and rebuild omapdrm=
-pvr, which<br>
&gt;&gt; triggered the kernel to be rebuilt too.<br>
&gt;&gt; It is the correct version<br>
&gt;&gt; (linux-ti-staging-3.14.49+gitAUTOINC+e9cd4cc819-r7a-arago2), but<b=
r>
&gt;&gt; omapdrm-pvr fails with the same errors.<br>
&gt;<br>
&gt; Aymeric,<br>
&gt;<br>
&gt; We&#39;ve moved on to Fido setup with 4.1 kernel some time back and I =
personally<br>
&gt; haven&#39;t tried Daisy/3.14 recently. Can you try Fido/4.1 as well?<b=
r>
<br>
</div></div>My bad, I followed the &quot;Setting Up Build Environment&quot;=
 wiki page.<br>
I tried with Fido (configs/arago-fido-config.txt), but I have some<br>
issues with the toolchain now; I tried the 2013.10 version but it has<br>
the same problems.<br>
Should I use another toolchain?<br>
<br>
| /linaro_toolchain/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_lin=
ux/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf=
/bin/ld:<br>
cannot find ../../lib/libc.so.6<br>
| collect2: error: ld returned 1 exit status<br>
| make: *** [example] Error 1<br>
| make: *** Waiting for unfinished jobs....<br>
| /linaro_toolchain/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_lin=
ux/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf=
/bin/ld:<br>
cannot find ../../lib/libc.so.6<br>
| collect2: error: ld returned 1 exit status<br>
| make: *** [minigzip] Error 1<br>
| /linaro_toolchain/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_lin=
ux/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf=
/bin/ld:<br>
cannot find ../../lib/libc.so.6<br>
| collect2: error: ld returned 1 exit status<br>
| make: *** [example64] Error 1<br>
| /linaro_toolchain/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_lin=
ux/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf=
/bin/ld:<br>
cannot find ../../lib/libc.so.6<br>
| collect2: error: ld returned 1 exit status<br>
| make: *** [minigzip64] Error 1<br>
<span class=3D"">| ERROR: oe_runmake failed<br>
| WARNING: exit code 1 from a shell command.<br>
| ERROR: Function failed: do_compile (log file is located at<br>
</span>/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vf=
p-neon-linux-gnueabi/zlib/1.2.8-r0/temp/log.do_compile.22964)<br>
ERROR: Task 894<br>
(/tisdk/sources/oe-core/meta/recipes-core/zlib/<a href=3D"http://zlib_1.2.8=
.bb" rel=3D"noreferrer" target=3D"_blank">zlib_1.2.8.bb</a>,<br>
<span class=3D"">do_compile) failed with exit code &#39;1&#39;<br>
</span>ERROR: Function failed: do_configure (log file is located at<br>
/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-=
linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.18450)<br>
<span class=3D"">ERROR: Logfile of failure stored in:<br>
</span>/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vf=
p-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.18450<br>
<br>
[...]<br>
<br>
| ## ------------------------- ##<br>
| ## Configuring libtool 2.4.6 ##<br>
| ## ------------------------- ##<br>
|<br>
| checking for GNU M4 that supports accurate traces...<br>
/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/=
bin/m4<br>
| checking whether<br>
/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/=
bin/m4<br>
accepts --gnu... yes<br>
| checking how m4 supports trace files... --debugfile<br>
| checking for a BSD-compatible install... /usr/bin/install -c<br>
| checking whether build environment is sane... yes<br>
| checking for arm-linux-gnueabi-strip... arm-linux-gnueabihf-strip<br>
| checking for a thread-safe mkdir -p... /bin/mkdir -p<br>
| checking for gawk... gawk<br>
| checking whether make sets $(MAKE)... yes<br>
| checking whether make supports nested variables... yes<br>
| checking whether make supports nested variables... (cached) yes<br>
| checking build system type... x86_64-pc-linux-gnu<br>
| checking host system type... arm-unknown-linux-gnueabi<br>
| configure: autobuild project... GNU Libtool<br>
| configure: autobuild revision... 2.4.6<br>
| configure: autobuild hostname... ubuntu_precise<br>
| configure: autobuild mode... default<br>
| configure: autobuild timestamp... 20151216T191217Z<br>
| checking for arm-linux-gnueabi-gcc... arm-linux-gnueabihf-gcc<br>
-march=3Darmv7-a -marm=C2=A0 -mthumb-interwork -mfloat-abi=3Dhard -mfpu=3Dn=
eon<br>
-mtune=3Dcortex-a15<br>
--sysroot=3D/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57x=
x-evm<br>
| checking whether the C compiler works... no<br>
| configure: error: in<br>
`/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon=
-linux-gnueabi/libtool-cross/2.4.6-r0/build&#39;:<br>
| configure: error: C compiler cannot create executables<br>
| See `config.log&#39; for more details<br>
| Configure failed. The contents of all config.log files follows to<br>
aid debugging<br>
| ERROR: oe_runconf failed<br>
<span class=3D"">| WARNING: exit code 1 from a shell command.<br>
</span>| ERROR: Function failed: do_configure (log file is located at<br>
/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-=
linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.18450)<br>
ERROR: Task 530<br>
(/tisdk/sources/oe-core/meta/recipes-devtools/libtool/<a href=3D"http://lib=
tool-cross_2.4.6.bb" rel=3D"noreferrer" target=3D"_blank">libtool-cross_2.4=
.6.bb</a>,<br>
do_configure) failed with exit code &#39;1&#39;<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt;<br>
&gt; Karthik,<br>
&gt;<br>
&gt; Were you still using Daisy with 3.14 kernel? Have you had any issues w=
ith<br>
&gt; omapdrm-pvr?<br>
&gt;<br>
&gt; --<br>
&gt; Denys<br>
&gt;<br>
&gt;<br>
&gt;&gt; &gt;&gt; $ MACHINE=3Dam57xx-evm bitbake omapdrm-pvr<br>
&gt;&gt; &gt;&gt; NOTE: Started PRServer with DBfile: /tisdk/build/cache/pr=
serv.sqlite3,<br>
&gt;&gt; &gt;&gt; IP: 127.0.0.1, PORT: 40922, PID: 19820<br>
&gt;&gt; &gt;&gt; Loading cache: 100%<br>
&gt;&gt; &gt;&gt; |########################################################=
| ETA:<br>
&gt;&gt; &gt;&gt; 00:00:00<br>
&gt;&gt; &gt;&gt; Loaded 2270 entries from dependency cache.<br>
&gt;&gt; &gt;&gt; Parsing recipes: 100%<br>
&gt;&gt; &gt;&gt; |######################################################| =
Time:<br>
&gt;&gt; &gt;&gt; 00:00:00<br>
&gt;&gt; &gt;&gt; Parsing of 1827 .bb files complete (1826 cached, 1 parsed=
). 2270<br>
&gt;&gt; &gt;&gt; targets, 212 skipped, 0 masked, 0 errors.<br>
&gt;&gt; &gt;&gt; WARNING: No recipes available for:<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0/tisdk/sources/meta-arago/meta-arago-distro/r=
ecipes-connectivity/openssl/openssl_1.0.1m.bbappend<br>
&gt;&gt; &gt;&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Build Configuration:<br>
&gt;&gt; &gt;&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.26.0&qu=
ot;<br>
&gt;&gt; &gt;&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_=
64-linux&quot;<br>
&gt;&gt; &gt;&gt; NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;Ubuntu-12.04&quot;<=
br>
&gt;&gt; &gt;&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm-linux=
-gnueabi&quot;<br>
&gt;&gt; &gt;&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;am57xx-evm&quot;<br>
&gt;&gt; &gt;&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot=
;arago&quot;<br>
&gt;&gt; &gt;&gt; DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;2015.05&quot;<br>
&gt;&gt; &gt;&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;armv7a vfp thu=
mb neon callconvention-hard cortexa15&quot;<br>
&gt;&gt; &gt;&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;vfp-neon&=
quot;<br>
&gt;&gt; &gt;&gt; meta-arago-distro<br>
&gt;&gt; &gt;&gt; meta-arago-extras =3D &quot;daisy:dc89e06d2a64f33d9e9662e=
6f7fe1f8466ff167c&quot;<br>
&gt;&gt; &gt;&gt; meta-qt5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;(nob=
ranch):17eb158c6d2cd290b054b5bd54311aa44a02d04d&quot;<br>
&gt;&gt; &gt;&gt; toolchain-layer<br>
&gt;&gt; &gt;&gt; meta-networking<br>
&gt;&gt; &gt;&gt; meta-ruby<br>
&gt;&gt; &gt;&gt; meta-oe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa&quot;<br>
&gt;&gt; &gt;&gt; meta-ti=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;daisy:090b02a104924886afd0fa79be7b5d08eebf071f&quot;<br>
&gt;&gt; &gt;&gt; meta-linaro-toolchain =3D &quot;daisy:06008235ca752fea678=
953e85adaa29a491d246b&quot;<br>
&gt;&gt; &gt;&gt; meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
&quot;daisy:e1a2540227250d854d5bba278634bcc9e7572cda&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; NOTE: Preparing RunQueue<br>
&gt;&gt; &gt;&gt; NOTE: Executing SetScene Tasks<br>
&gt;&gt; &gt;&gt; NOTE: Executing RunQueue Tasks<br>
&gt;&gt; &gt;&gt; ERROR: Function failed: do_compile (log file is located a=
t<br>
&gt;&gt; &gt;&gt; /tisdk/build/arago-tmp-external-linaro-toolchain/work/am5=
7xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/temp/log.do_compile.19911=
)<br>
&gt;&gt; &gt;&gt; ERROR: Logfile of failure stored in:<br>
&gt;&gt; &gt;&gt; /tisdk/build/arago-tmp-external-linaro-toolchain/work/am5=
7xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/temp/log.do_compile.19911=
<br>
&gt;&gt; &gt;&gt; Log data follows:<br>
&gt;&gt; &gt;&gt; | DEBUG: Executing shell function do_compile<br>
&gt;&gt; &gt;&gt; | NOTE: make -j 8 -e MAKEFLAGS=3D<br>
&gt;&gt; &gt;&gt; KERNELDIR=3D/tisdk/build/arago-tmp-external-linaro-toolch=
ain/sysroots/am57xx-evm/usr/src/kernel<br>
&gt;&gt; &gt;&gt; KERNEL_PATH=3D/tisdk/build/arago-tmp-external-linaro-tool=
chain/sysroots/am57xx-evm/usr/src/kernel<br>
&gt;&gt; &gt;&gt; KERNEL_SRC=3D/tisdk/build/arago-tmp-external-linaro-toolc=
hain/sysroots/am57xx-evm/usr/src/kernel<br>
&gt;&gt; &gt;&gt; KERNEL_VERSION=3D3.14.49-ge9cd4cc CC=3Darm-linux-gnueabih=
f-gcc<br>
&gt;&gt; &gt;&gt; -mno-thumb-interwork -marm LD=3Darm-linux-gnueabihf-ld.bf=
d<br>
&gt;&gt; &gt;&gt; AR=3Darm-linux-gnueabihf-ar<br>
&gt;&gt; &gt;&gt; | ../config/<a href=3D"http://core.mk:419" rel=3D"norefer=
rer" target=3D"_blank">core.mk:419</a>: $(KERNELDIR)/vmlinux does not exist=
. Kbuild may fail.<br>
&gt;&gt; &gt;&gt; |=C2=A0 =C2=A0CC [M]=C2=A0 /tisdk/build/arago-tmp-externa=
l-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7=
k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/se=
rvices4/srvkm/env/linux/mmap.o<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:<br>
&gt;&gt; &gt;&gt; In function &#39;create_gem_wrapper&#39;:<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:480:2:<br>
&gt;&gt; &gt;&gt; error: implicit declaration of function &#39;omap_gem_new=
_ext&#39;<br>
&gt;&gt; &gt;&gt; [-Werror=3Dimplicit-function-declaration]<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:480:2:<br>
&gt;&gt; &gt;&gt; error: return makes pointer from integer without a cast [=
-Werror]<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:<br>
&gt;&gt; &gt;&gt; In function &#39;MMapVOpenExt&#39;:<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:1370:2:<br>
&gt;&gt; &gt;&gt; error: implicit declaration of function &#39;omap_gem_pri=
v&#39;<br>
&gt;&gt; &gt;&gt; [-Werror=3Dimplicit-function-declaration]<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:1370:15:<br>
&gt;&gt; &gt;&gt; error: initialization makes pointer from integer without =
a cast<br>
&gt;&gt; &gt;&gt; [-Werror]<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:<br>
&gt;&gt; &gt;&gt; In function &#39;MMapVCloseExt&#39;:<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:1384:15:<br>
&gt;&gt; &gt;&gt; error: initialization makes pointer from integer without =
a cast<br>
&gt;&gt; &gt;&gt; [-Werror]<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:<br>
&gt;&gt; &gt;&gt; In function &#39;PVRMMapExt&#39;:<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:1442:2:<br>
&gt;&gt; &gt;&gt; error: implicit declaration of function &#39;omap_gem_set=
_priv&#39;<br>
&gt;&gt; &gt;&gt; [-Werror=3Dimplicit-function-declaration]<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:<br>
&gt;&gt; &gt;&gt; At top level:<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:1473:15:<br>
&gt;&gt; &gt;&gt; error: variable &#39;gem_ops&#39; has initializer but inc=
omplete type<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:1474:3:<br>
&gt;&gt; &gt;&gt; error: unknown field &#39;open&#39; specified in initiali=
zer<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:1474:3:<br>
&gt;&gt; &gt;&gt; error: excess elements in struct initializer [-Werror]<br=
>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:1474:3:<br>
&gt;&gt; &gt;&gt; error: (near initialization for &#39;gem_ops&#39;) [-Werr=
or]<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:1475:3:<br>
&gt;&gt; &gt;&gt; error: unknown field &#39;close&#39; specified in initial=
izer<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:1475:3:<br>
&gt;&gt; &gt;&gt; error: excess elements in struct initializer [-Werror]<br=
>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:1475:3:<br>
&gt;&gt; &gt;&gt; error: (near initialization for &#39;gem_ops&#39;) [-Werr=
or]<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:1476:3:<br>
&gt;&gt; &gt;&gt; error: unknown field &#39;mmap&#39; specified in initiali=
zer<br>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:1476:3:<br>
&gt;&gt; &gt;&gt; error: excess elements in struct initializer [-Werror]<br=
>
&gt;&gt; &gt;&gt; | /tisdk/build/arago-tmp-external-linaro-toolchain/work/a=
m57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiac=
on/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/m=
map.c:1476:3:<br>
&gt;&gt; &gt;&gt; error: (near initialization for &#39;gem_ops&#39;) [-Werr=
or]<br>
&gt;&gt; &gt;&gt; | cc1: all warnings being treated as errors<br>
&gt;&gt; &gt;&gt; | make[3]: *** [/tisdk/build/arago-tmp-external-linaro-to=
olchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/euras=
ia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srv=
km/env/linux/mmap.o]<br>
&gt;&gt; &gt;&gt; Error 1<br>
&gt;&gt; &gt;&gt; | make[2]: *** [_module_/tisdk/build/arago-tmp-external-l=
inaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/g=
it/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild]<br>
&gt;&gt; &gt;&gt; Error 2<br>
&gt;&gt; &gt;&gt; | make[1]: *** [kbuild] Error 2<br>
&gt;&gt; &gt;&gt; | make: *** [build] Error 2<br>
&gt;&gt; &gt;&gt; | ERROR: oe_runmake failed<br>
&gt;&gt; &gt;&gt; | WARNING: exit code 1 from a shell command.<br>
&gt;&gt; &gt;&gt; | ERROR: Function failed: do_compile (log file is located=
 at<br>
&gt;&gt; &gt;&gt; /tisdk/build/arago-tmp-external-linaro-toolchain/work/am5=
7xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/temp/log.do_compile.19911=
)<br>
&gt;&gt; &gt;&gt; ERROR: Task 8 (/tisdk/sources/meta-ti/recipes-bsp/powervr=
-drivers/<a href=3D"http://omapdrm-pvr_1.9.2253347.bb" rel=3D"noreferrer" t=
arget=3D"_blank">omapdrm-pvr_1.9.2253347.bb</a>,<br>
&gt;&gt; &gt;&gt; do_compile) failed with exit code &#39;1&#39;<br>
&gt;&gt; &gt;&gt; NOTE: Tasks Summary: Attempted 406 tasks of which 403 did=
n&#39;t need to<br>
&gt;&gt; &gt;&gt; be rerun and 1 failed.<br>
&gt;&gt; &gt;&gt; NOTE: Writing buildhistory<br>
&gt;&gt; &gt;&gt; Waiting for 0 running tasks to finish:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Summary: 1 task failed:<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0/tisdk/sources/meta-ti/recipes-bsp/powervr-dr=
ivers/<a href=3D"http://omapdrm-pvr_1.9.2253347.bb" rel=3D"noreferrer" targ=
et=3D"_blank">omapdrm-pvr_1.9.2253347.bb</a>,<br>
&gt;&gt; &gt;&gt; do_compile<br>
&gt;&gt; &gt;&gt; Summary: There was 1 WARNING message shown.<br>
&gt;&gt; &gt;&gt; Summary: There was 1 ERROR message shown, returning a non=
-zero exit code.<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; _______________________________________________<br>
&gt;&gt; &gt;&gt; meta-ti mailing list<br>
&gt;&gt; &gt;&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yocto=
project.org</a><br>
&gt;&gt; &gt;&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-t=
i" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/list=
info/meta-ti</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Aymeric Dumaz<br>
&gt;&gt; Epita 2014<br>
--<br>
_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"noreferr=
er" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><b=
r>
</div></div></blockquote></div><br></div>

--001a114168a8fcb9f40527097df5--
