Return-Path: <aymericdumaz@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23F66E00973; Tue, 15 Dec 2015 13:27:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.215.44 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (aymeric.dumaz[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AFEE4E0088C
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 13:27:27 -0800 (PST)
Received: by mail-lf0-f44.google.com with SMTP id y184so16214871lfc.1
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 13:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Nxw/oLWaUU5wlJC2E0i3Rloxo1BTlaGOHp99wAMoEPw=;
	b=uooHmA/VJw0NAWhAcfJxjIdVPzQWbGlXYAO5ubSLeCChmcLo8tIEi5vDAhfF8Mq0nG
	A1XWLlf3fAopgdChRRpeuLIsLW3m/wlbC7M8vdVyrQJCDA/ZTVGqjBf1PUUEhM4xzMf/
	Cv+3C+KmPkW7cUzdibOhok8N3njT+/+eg83oVShRzK81/c8rBzhiINMNwxCrB8qIcMQR
	TYgT5H55i3mtzs1rizUTDDFn/Eezns7uD6Of0eedBBqThYH7YEe6vTMv3MnFdYfKCeRO
	hokfI16aM1B5Pa49Dl/ub3fDNvM9xfcGu+ynxcOqorneKtcZiVk2fz5J0ffyhoo1geNn
	dZXw==
MIME-Version: 1.0
X-Received: by 10.25.33.4 with SMTP id h4mr13590452lfh.3.1450214845986; Tue,
	15 Dec 2015 13:27:25 -0800 (PST)
Sender: aymericdumaz@gmail.com
Received: by 10.25.213.209 with HTTP; Tue, 15 Dec 2015 13:27:25 -0800 (PST)
In-Reply-To: <20151215194902.GD27464@edge>
References: <CAESSzZyP2JX1yYwgvp=BHFmja9qOPzA+_k9F3Z8GSfON2pRvmw@mail.gmail.com>
	<20151215194902.GD27464@edge>
Date: Tue, 15 Dec 2015 13:27:25 -0800
X-Google-Sender-Auth: -P1QR1QWsSJ6Y5praebUWeOKdaA
Message-ID: <CAESSzZyNzkCkb6=Hui6Os=t5+=ATmhYbwu3PWympUHdDxbU-QA@mail.gmail.com>
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
X-List-Received-Date: Tue, 15 Dec 2015 21:27:31 -0000
Content-Type: text/plain; charset=UTF-8

2015-12-15 11:49 GMT-08:00 Denys Dmytriyenko <denys@ti.com>:
> On Tue, Dec 15, 2015 at 11:41:10AM -0800, Aymeric Dumaz wrote:
>> Hello,
>>
>> I am trying to create an image with Qt5 for my BeagleBoard X15. I set
>> up the build environment as explained in the Arago wiki, and add that
>> my local.conf:
>>
>> IMAGE_INSTALL_append = " kernel-modules omap5-sgx-ddk-um-linux
>> omapdrm-pvr libgbm libdrm libdrm-omap qtbase qtbase-plugins
>> qtbase-fonts qtquick1 qtquick1-qmlplugins kmscube"
>>
>> But when it tries to compile omapdrm-pvr, it prints the following
>> errors (same if I try with the OMAP5432 uEVM).
>>
>> I am missing something?
>> Regards
>
> I see that you are using Daisy branch and 3.14 kernel. Make sure you build
> against linux-ti-staging_3.14 kernel, as it is specifically patches with
> necessary SGX API (like omap_gem_* symbols below).
>

Thank you for your answer.
I did a "cleansstate virtual/kernel" and rebuild omapdrm-pvr, which
triggered the kernel to be rebuilt too.
It is the correct version
(linux-ti-staging-3.14.49+gitAUTOINC+e9cd4cc819-r7a-arago2), but
omapdrm-pvr fails with the same errors.

> --
> Denys
>
>
>> $ MACHINE=am57xx-evm bitbake omapdrm-pvr
>> NOTE: Started PRServer with DBfile: /tisdk/build/cache/prserv.sqlite3,
>> IP: 127.0.0.1, PORT: 40922, PID: 19820
>> Loading cache: 100%
>> |########################################################| ETA:
>> 00:00:00
>> Loaded 2270 entries from dependency cache.
>> Parsing recipes: 100%
>> |######################################################| Time:
>> 00:00:00
>> Parsing of 1827 .bb files complete (1826 cached, 1 parsed). 2270
>> targets, 212 skipped, 0 masked, 0 errors.
>> WARNING: No recipes available for:
>>   /tisdk/sources/meta-arago/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1m.bbappend
>> NOTE: Resolving any missing task queue dependencies
>>
>> Build Configuration:
>> BB_VERSION        = "1.26.0"
>> BUILD_SYS         = "x86_64-linux"
>> NATIVELSBSTRING   = "Ubuntu-12.04"
>> TARGET_SYS        = "arm-linux-gnueabi"
>> MACHINE           = "am57xx-evm"
>> DISTRO            = "arago"
>> DISTRO_VERSION    = "2015.05"
>> TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa15"
>> TARGET_FPU        = "vfp-neon"
>> meta-arago-distro
>> meta-arago-extras = "daisy:dc89e06d2a64f33d9e9662e6f7fe1f8466ff167c"
>> meta-qt5          = "(nobranch):17eb158c6d2cd290b054b5bd54311aa44a02d04d"
>> toolchain-layer
>> meta-networking
>> meta-ruby
>> meta-oe           = "daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa"
>> meta-ti           = "daisy:090b02a104924886afd0fa79be7b5d08eebf071f"
>> meta-linaro-toolchain = "daisy:06008235ca752fea678953e85adaa29a491d246b"
>> meta              = "daisy:e1a2540227250d854d5bba278634bcc9e7572cda"
>>
>> NOTE: Preparing RunQueue
>> NOTE: Executing SetScene Tasks
>> NOTE: Executing RunQueue Tasks
>> ERROR: Function failed: do_compile (log file is located at
>> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/temp/log.do_compile.19911)
>> ERROR: Logfile of failure stored in:
>> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/temp/log.do_compile.19911
>> Log data follows:
>> | DEBUG: Executing shell function do_compile
>> | NOTE: make -j 8 -e MAKEFLAGS=
>> KERNELDIR=/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/src/kernel
>> KERNEL_PATH=/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/src/kernel
>> KERNEL_SRC=/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/src/kernel
>> KERNEL_VERSION=3.14.49-ge9cd4cc CC=arm-linux-gnueabihf-gcc
>> -mno-thumb-interwork -marm LD=arm-linux-gnueabihf-ld.bfd
>> AR=arm-linux-gnueabihf-ar
>> | ../config/core.mk:419: $(KERNELDIR)/vmlinux does not exist. Kbuild may fail.
>> |   CC [M]  /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.o
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
>> In function 'create_gem_wrapper':
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:480:2:
>> error: implicit declaration of function 'omap_gem_new_ext'
>> [-Werror=implicit-function-declaration]
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:480:2:
>> error: return makes pointer from integer without a cast [-Werror]
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
>> In function 'MMapVOpenExt':
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1370:2:
>> error: implicit declaration of function 'omap_gem_priv'
>> [-Werror=implicit-function-declaration]
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1370:15:
>> error: initialization makes pointer from integer without a cast
>> [-Werror]
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
>> In function 'MMapVCloseExt':
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1384:15:
>> error: initialization makes pointer from integer without a cast
>> [-Werror]
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
>> In function 'PVRMMapExt':
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1442:2:
>> error: implicit declaration of function 'omap_gem_set_priv'
>> [-Werror=implicit-function-declaration]
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:
>> At top level:
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1473:15:
>> error: variable 'gem_ops' has initializer but incomplete type
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1474:3:
>> error: unknown field 'open' specified in initializer
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1474:3:
>> error: excess elements in struct initializer [-Werror]
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1474:3:
>> error: (near initialization for 'gem_ops') [-Werror]
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1475:3:
>> error: unknown field 'close' specified in initializer
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1475:3:
>> error: excess elements in struct initializer [-Werror]
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1475:3:
>> error: (near initialization for 'gem_ops') [-Werror]
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1476:3:
>> error: unknown field 'mmap' specified in initializer
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1476:3:
>> error: excess elements in struct initializer [-Werror]
>> | /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.c:1476:3:
>> error: (near initialization for 'gem_ops') [-Werror]
>> | cc1: all warnings being treated as errors
>> | make[3]: *** [/tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.o]
>> Error 1
>> | make[2]: *** [_module_/tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/git/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild]
>> Error 2
>> | make[1]: *** [kbuild] Error 2
>> | make: *** [build] Error 2
>> | ERROR: oe_runmake failed
>> | WARNING: exit code 1 from a shell command.
>> | ERROR: Function failed: do_compile (log file is located at
>> /tisdk/build/arago-tmp-external-linaro-toolchain/work/am57xx_evm-linux-gnueabi/omapdrm-pvr/1.9.2253347-r7k/temp/log.do_compile.19911)
>> ERROR: Task 8 (/tisdk/sources/meta-ti/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb,
>> do_compile) failed with exit code '1'
>> NOTE: Tasks Summary: Attempted 406 tasks of which 403 didn't need to
>> be rerun and 1 failed.
>> NOTE: Writing buildhistory
>> Waiting for 0 running tasks to finish:
>>
>> Summary: 1 task failed:
>>   /tisdk/sources/meta-ti/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb,
>> do_compile
>> Summary: There was 1 WARNING message shown.
>> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
>> --
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti



-- 
Aymeric Dumaz
Epita 2014

