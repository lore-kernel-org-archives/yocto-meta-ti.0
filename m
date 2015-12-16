Return-Path: <aymericdumaz@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C757E00AA5; Wed, 16 Dec 2015 11:41:04 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (aymeric.dumaz[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A18C6E00321
	for <meta-ti@yoctoproject.org>; Wed, 16 Dec 2015 11:41:00 -0800 (PST)
Received: by mail-lf0-f52.google.com with SMTP id p203so37340351lfa.0
	for <meta-ti@yoctoproject.org>; Wed, 16 Dec 2015 11:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=g1iQYZqt7MqJeTlacT4XJ2Wo76eofZKJsg04rQ7XCCU=;
	b=fXeVvNE4weSyl0+to0pESnaFI5ZFF23HHWcOOe+ZXlnnb13lXtZkiyvLUuV6d8cros
	kjBebLN6C/pfBWqrz3gqM/FsDezZmVHhPqtUvseiL9NnQTPX/fH+CWx48i9kGeNTe3EQ
	9cIWQ1uoHoUmh6cDeSwnj7A/NaMEvtIk7T3Kyvqt4bZ6xAYFaR5N2GGbpeuVejsEsjUz
	tjnb9WNZlj6okq5tbjM557VyoY206ZiPCk+IhQ3OLVImW0ZWo9GovUIZE39vxke33HoM
	yNtC9069TC0lfq/UIH1GNgEUsng2wW/yGpnZOVEmnStquh3VOTKsgwv/BwkRVbHzFQ+d
	5sTw==
MIME-Version: 1.0
X-Received: by 10.25.32.144 with SMTP id g138mr16891647lfg.26.1450294858913;
	Wed, 16 Dec 2015 11:40:58 -0800 (PST)
Sender: aymericdumaz@gmail.com
Received: by 10.25.213.209 with HTTP; Wed, 16 Dec 2015 11:40:58 -0800 (PST)
In-Reply-To: <20151216174450.GH27464@edge>
References: <CAESSzZyP2JX1yYwgvp=BHFmja9qOPzA+_k9F3Z8GSfON2pRvmw@mail.gmail.com>
	<20151215194902.GD27464@edge>
	<CAESSzZzUhzzCxMWQP_OUOG1BMpBFc+BRzB3y1d97F-VL9sqnUg@mail.gmail.com>
	<20151216174450.GH27464@edge>
Date: Wed, 16 Dec 2015 11:40:58 -0800
X-Google-Sender-Auth: LtbVdvy8GPdPXoXpuiJmbqoZf-E
Message-ID: <CAESSzZwMzHbxR+BLMaNV=ciMps=-ogsJ_+xYFpS=mjirT-_iLw@mail.gmail.com>
From: Aymeric Dumaz <aymeric.dumaz@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Wed, 16 Dec 2015 19:41:04 -0000
Content-Type: text/plain; charset=UTF-8

2015-12-16 9:44 GMT-08:00 Denys Dmytriyenko <denys@ti.com>:
> On Tue, Dec 15, 2015 at 12:40:30PM -0800, Aymeric Dumaz wrote:
>> 2015-12-15 11:49 GMT-08:00 Denys Dmytriyenko <denys@ti.com>:
>> > On Tue, Dec 15, 2015 at 11:41:10AM -0800, Aymeric Dumaz wrote:
>> >> Hello,
>> >>
>> >> I am trying to create an image with Qt5 for my BeagleBoard X15. I set
>> >> up the build environment as explained in the Arago wiki, and add that
>> >> my local.conf:
>> >>
>> >> IMAGE_INSTALL_append = " kernel-modules omap5-sgx-ddk-um-linux
>> >> omapdrm-pvr libgbm libdrm libdrm-omap qtbase qtbase-plugins
>> >> qtbase-fonts qtquick1 qtquick1-qmlplugins kmscube"
>> >>
>> >> But when it tries to compile omapdrm-pvr, it prints the following
>> >> errors (same if I try with the OMAP5432 uEVM).
>> >>
>> >> I am missing something?
>> >> Regards
>> >
>> > I see that you are using Daisy branch and 3.14 kernel. Make sure you build
>> > against linux-ti-staging_3.14 kernel, as it is specifically patches with
>> > necessary SGX API (like omap_gem_* symbols below).
>>
>> Thank you for your answer.
>> I did a "cleansstate virtual/kernel" and rebuild omapdrm-pvr, which
>> triggered the kernel to be rebuilt too.
>> It is the correct version
>> (linux-ti-staging-3.14.49+gitAUTOINC+e9cd4cc819-r7a-arago2), but
>> omapdrm-pvr fails with the same errors.
>
> Aymeric,
>
> We've moved on to Fido setup with 4.1 kernel some time back and I personally
> haven't tried Daisy/3.14 recently. Can you try Fido/4.1 as well?

My bad, I followed the "Setting Up Build Environment" wiki page.
I tried with Fido (configs/arago-fido-config.txt), but I have some
issues with the toolchain now; I tried the 2013.10 version but it has
the same problems.
Should I use another toolchain?

| /linaro_toolchain/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
cannot find ../../lib/libc.so.6
| collect2: error: ld returned 1 exit status
| make: *** [example] Error 1
| make: *** Waiting for unfinished jobs....
| /linaro_toolchain/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
cannot find ../../lib/libc.so.6
| collect2: error: ld returned 1 exit status
| make: *** [minigzip] Error 1
| /linaro_toolchain/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
cannot find ../../lib/libc.so.6
| collect2: error: ld returned 1 exit status
| make: *** [example64] Error 1
| /linaro_toolchain/gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux/bin/../lib/gcc/arm-linux-gnueabihf/4.7.3/../../../../arm-linux-gnueabihf/bin/ld:
cannot find ../../lib/libc.so.6
| collect2: error: ld returned 1 exit status
| make: *** [minigzip64] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/zlib/1.2.8-r0/temp/log.do_compile.22964)
ERROR: Task 894
(/tisdk/sources/oe-core/meta/recipes-core/zlib/zlib_1.2.8.bb,
do_compile) failed with exit code '1'
ERROR: Function failed: do_configure (log file is located at
/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.18450)
ERROR: Logfile of failure stored in:
/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.18450

[...]

| ## ------------------------- ##
| ## Configuring libtool 2.4.6 ##
| ## ------------------------- ##
|
| checking for GNU M4 that supports accurate traces...
/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/m4
| checking whether
/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/m4
accepts --gnu... yes
| checking how m4 supports trace files... --debugfile
| checking for a BSD-compatible install... /usr/bin/install -c
| checking whether build environment is sane... yes
| checking for arm-linux-gnueabi-strip... arm-linux-gnueabihf-strip
| checking for a thread-safe mkdir -p... /bin/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether make supports nested variables... (cached) yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... arm-unknown-linux-gnueabi
| configure: autobuild project... GNU Libtool
| configure: autobuild revision... 2.4.6
| configure: autobuild hostname... ubuntu_precise
| configure: autobuild mode... default
| configure: autobuild timestamp... 20151216T191217Z
| checking for arm-linux-gnueabi-gcc... arm-linux-gnueabihf-gcc
-march=armv7-a -marm  -mthumb-interwork -mfloat-abi=hard -mfpu=neon
-mtune=cortex-a15
--sysroot=/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm
| checking whether the C compiler works... no
| configure: error: in
`/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/build':
| configure: error: C compiler cannot create executables
| See `config.log' for more details
| Configure failed. The contents of all config.log files follows to
aid debugging
| ERROR: oe_runconf failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.18450)
ERROR: Task 530
(/tisdk/sources/oe-core/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb,
do_configure) failed with exit code '1'


>
> Karthik,
>
> Were you still using Daisy with 3.14 kernel? Have you had any issues with
> omapdrm-pvr?
>
> --
> Denys
>
>
>> >> $ MACHINE=am57xx-evm bitbake omapdrm-pvr
>> >> NOTE: Started PRServer with DBfile: /tisdk/build/cache/prserv.sqlite3,
>> >> IP: 127.0.0.1, PORT: 40922, PID: 19820
>> >> Loading cache: 100%
>> >> |########################################################| ETA:
>> >> 00:00:00
>> >> Loaded 2270 entries from dependency cache.
>> >> Parsing recipes: 100%
>> >> |######################################################| Time:
>> >> 00:00:00
>> >> Parsing of 1827 .bb files complete (1826 cached, 1 parsed). 2270
>> >> targets, 212 skipped, 0 masked, 0 errors.
>> >> WARNING: No recipes available for:
>> >>   /tisdk/sources/meta-arago/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1m.bbappend
>> >> NOTE: Resolving any missing task queue dependencies
>> >>
>> >> Build Configuration:
>> >> BB_VERSION        = "1.26.0"
>> >> BUILD_SYS         = "x86_64-linux"
>> >> NATIVELSBSTRING   = "Ubuntu-12.04"
>> >> TARGET_SYS        = "arm-linux-gnueabi"
>> >> MACHINE           = "am57xx-evm"
>> >> DISTRO            = "arago"
>> >> DISTRO_VERSION    = "2015.05"
>> >> TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa15"
>> >> TARGET_FPU        = "vfp-neon"
>> >> meta-arago-distro
>> >> meta-arago-extras = "daisy:dc89e06d2a64f33d9e9662e6f7fe1f8466ff167c"
>> >> meta-qt5          = "(nobranch):17eb158c6d2cd290b054b5bd54311aa44a02d04d"
>> >> toolchain-layer
>> >> meta-networking
>> >> meta-ruby
>> >> meta-oe           = "daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa"
>> >> meta-ti           = "daisy:090b02a104924886afd0fa79be7b5d08eebf071f"
>> >> meta-linaro-toolchain = "daisy:06008235ca752fea678953e85adaa29a491d246b"
>> >> meta              = "daisy:e1a2540227250d854d5bba278634bcc9e7572cda"
>> >>
>> >> NOTE: Preparing RunQueue
>> >> NOTE: Executing SetScene Tasks
>> >> NOTE: Executing RunQueue Tasks
>> >> ERROR: Function failed: do_compile (log file is located at
>> >> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/temp/log.do_compile.19911)
>> >> ERROR: Logfile of failure stored in:
>> >> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/temp/log.do_compile.19911
>> >> Log data follows:
>> >> | DEBUG: Executing shell function do_compile
>> >> | NOTE: make -j 8 -e MAKEFLAGS=
>> >> KERNELDIR=/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/src/kernel
>> >> KERNEL_PATH=/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/src/kernel
>> >> KERNEL_SRC=/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/src/kernel
>> >> KERNEL_VERSION=3.14.49-ge9cd4cc CC=arm-linux-gnueabihf-gcc
>> >> -mno-thumb-interwork -marm LD=arm-linux-gnueabihf-ld.bfd
>> >> AR=arm-linux-gnueabihf-ar
>> >> | ../config/core.mk:419: $(KERNELDIR)/vmlinux does not exist. Kbuild may fail.
>> >> |   CC [M]  /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.o
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
>> >> In function 'create_gem_wrapper':
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:480:2:
>> >> error: implicit declaration of function 'omap_gem_new_ext'
>> >> [-Werror=implicit-function-declaration]
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:480:2:
>> >> error: return makes pointer from integer without a cast [-Werror]
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
>> >> In function 'MMapVOpenExt':
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1370:2:
>> >> error: implicit declaration of function 'omap_gem_priv'
>> >> [-Werror=implicit-function-declaration]
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1370:15:
>> >> error: initialization makes pointer from integer without a cast
>> >> [-Werror]
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
>> >> In function 'MMapVCloseExt':
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1384:15:
>> >> error: initialization makes pointer from integer without a cast
>> >> [-Werror]
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
>> >> In function 'PVRMMapExt':
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1442:2:
>> >> error: implicit declaration of function 'omap_gem_set_priv'
>> >> [-Werror=implicit-function-declaration]
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
>> >> At top level:
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1473:15:
>> >> error: variable 'gem_ops' has initializer but incomplete type
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1474:3:
>> >> error: unknown field 'open' specified in initializer
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1474:3:
>> >> error: excess elements in struct initializer [-Werror]
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1474:3:
>> >> error: (near initialization for 'gem_ops') [-Werror]
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1475:3:
>> >> error: unknown field 'close' specified in initializer
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1475:3:
>> >> error: excess elements in struct initializer [-Werror]
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1475:3:
>> >> error: (near initialization for 'gem_ops') [-Werror]
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1476:3:
>> >> error: unknown field 'mmap' specified in initializer
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1476:3:
>> >> error: excess elements in struct initializer [-Werror]
>> >> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1476:3:
>> >> error: (near initialization for 'gem_ops') [-Werror]
>> >> | cc1: all warnings being treated as errors
>> >> | make[3]: *** [/tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.o]
>> >> Error 1
>> >> | make[2]: *** [_module_/tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild]
>> >> Error 2
>> >> | make[1]: *** [kbuild] Error 2
>> >> | make: *** [build] Error 2
>> >> | ERROR: oe_runmake failed
>> >> | WARNING: exit code 1 from a shell command.
>> >> | ERROR: Function failed: do_compile (log file is located at
>> >> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/temp/log.do_compile.19911)
>> >> ERROR: Task 8 (/tisdk/sources/meta-ti/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb,
>> >> do_compile) failed with exit code '1'
>> >> NOTE: Tasks Summary: Attempted 406 tasks of which 403 didn't need to
>> >> be rerun and 1 failed.
>> >> NOTE: Writing buildhistory
>> >> Waiting for 0 running tasks to finish:
>> >>
>> >> Summary: 1 task failed:
>> >>   /tisdk/sources/meta-ti/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb,
>> >> do_compile
>> >> Summary: There was 1 WARNING message shown.
>> >> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>> >> --
>> >> _______________________________________________
>> >> meta-ti mailing list
>> >> meta-ti@yoctoproject.org
>> >> https://lists.yoctoproject.org/listinfo/meta-ti
>>
>>
>>
>> --
>> Aymeric Dumaz
>> Epita 2014

