Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E27E0E00A7B; Fri, 14 Aug 2015 17:50:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 661EFE00A70
	for <meta-ti@yoctoproject.org>; Fri, 14 Aug 2015 17:50:01 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7F0nv1Z027247;
	Fri, 14 Aug 2015 19:49:57 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7F0nvha017865;
	Fri, 14 Aug 2015 19:49:57 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 14 Aug 2015 19:49:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7F0nvwq029393;
	Fri, 14 Aug 2015 19:49:57 -0500
Date: Fri, 14 Aug 2015 20:49:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Benjamin Bimmermann <b.bimmermann@yahoo.de>
Message-ID: <20150815004941.GA6542@edge>
References: <2001756708.5081859.1439599310946.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <2001756708.5081859.1439599310946.JavaMail.yahoo@mail.yahoo.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: libgles-omap3 error | BeagleBoneBlack | sgx-omap.h: No such file or directory
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
X-List-Received-Date: Sat, 15 Aug 2015 00:50:13 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Benjamin,

Version 5.1.1.2 of libgles-omap3 only builds and works against version 3.14 of 
linux-ti-staging kernel in meta-ti. The corresponding update to libgles-omap3 
to build against 4.1 kernel hasn't been released yet.

-- 
Denys


On Sat, Aug 15, 2015 at 12:41:50AM +0000, Benjamin Bimmermann wrote:
> Hello,
> i like to build the libgles-omap3 for the BeagleBoneBlack, but i get the error : 
> sgx-omap.h: No such file or directory
> |  #include <linux/platform_data/sgx-omap.h>.
> I try to create QT5 for the BeagleboneBlack. I have found and work on this tutorial:http://www.embarcados.com.br/beaglebone-black-qt5-yocto-parte-1/Code: https://bitbucket.org/embarcados/meta-embarcados/src
> 
> He has the error in part2 of the tutorial and say that i must make :bitbake -c cleansstate libgles-omap3bitbake libgles-omap3
> but that not solve the Problem. Every Time I get this Error.
> I have only change the bblayer.conf and the local.conf file. All other Files are from git and I have not change anything.
> I hope you can help me.
> 
> 
> 
> ---------------------------------------------------------------------------------------------------------------------------
> My bblayer.conf:LCONF_VERSION = "6"
> BBPATH = "${TOPDIR}"
> BBFILES ?= ""
> BBLAYERS ?= " \
>           ${HOME}/bbb/meta-embarcados \
>           ${HOME}/bbb/meta-embarcados/meta-bbb \
>           ${HOME}/bbb/meta-ti \
>           ${HOME}/poky-fido/meta-qt5 \
>           ${HOME}/poky-fido/meta-openembedded/meta-oe \
>           ${HOME}/poky-fido/meta-openembedded/meta-ruby \
>           ${HOME}/poky-fido/meta-openembedded/meta-perl \
>           ${HOME}/poky-fido/meta-openembedded/meta-efl \
>           ${HOME}/poky-fido/meta-openembedded/meta-multimedia \
>           ${HOME}/poky-fido/meta \
>           ${HOME}/poky-fido/meta-yocto \ "
> BBLAYERS_NON_REMOVABLE ?= " \
>          ${HOME}/poky-fido/meta \
>          ${HOME}/poky-fido/meta-yocto \
>   "
> ---------------------------------------------------------------------------------------------------------------------------
> My local.conf:BB_NUMBER_THREADS = "7"
> PARALLEL_MAKE = "-j7"
> LICENSE_FLAGS_WHITELIST = "commercial"
> MACHINE = "beaglebone"
> DISTRO = "poky"
> PACKAGE_CLASSES = "package_deb"
> EXTRA_IMAGE_FEATURES = "debug-tweaks"
> CONF_VERSION = "1"
> DISTRO_FEATURES_remove = "x11 wayland"
> BBMASK = "meta-embarcados/recipes-browser/chromium/chromium_%.bbappend"
> 
> ---------------------------------------------------------------------------------------------------------------------------
> And the complete LOG:
> PC@PC:~/bbb/build_spain$ bitbake libgles-omap3
> WARNING: Host distribution "Ubuntu-15.04" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
> Parsing recipes: 100% |######################################################################################################################################################################| Time: 00:00:29
> Parsing of 1788 .bb files complete (0 cached, 1788 parsed). 2296 targets, 351 skipped, 1 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION        = "1.26.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-15.04"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "beaglebone"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.8"
> TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta-embarcados   
> meta-bbb          = "fido:dfb2e27bf26b109fc6ccb3bc91924fb3bb24f655"
> meta-ti           = "fido:a666b94e9c676711f1389c0628e6c883ef20d5b3"
> meta-qt5          = "fido:fc026381545650e10fdd488d5b2a3b2d78f87793"
> meta-oe           
> meta-ruby         
> meta-perl         
> meta-efl          
> meta-multimedia   = "fido:10d3c8f85280a0bf867a8e4f84bcda81c290d28e"
> meta              
> meta-yocto        = "fido:08d32590411568e7bf11612ac695a6e9c6df6286"
> 
> NOTE: Preparing RunQueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: do_compile (log file is located at /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/temp/log.do_compile.25613)
> ERROR: Logfile of failure stored in: /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/temp/log.do_compile.25613
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j7 -e MAKEFLAGS= KERNEL_SRC=/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source KERNEL_PATH=/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source KERNEL_VERSION=4.1.5 CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm LD=arm-poky-linux-gnueabi-ld.bfd   AR=arm-poky-linux-gnueabi-ar  O=/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-build-artifacts BUILD=release TI_PLATFORM=ti335x SUPPORT_XORG=
> | make -C /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source M=`pwd`
> | make[1]: Entering directory '/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source'
> | make[2]: Entering directory '/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-build-artifacts'
> |   CC [M]  /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.o
> | /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.c:51:42: fatal error: linux/platform_data/sgx-omap.h: No such file or directory
> |  #include <linux/platform_data/sgx-omap.h>
> |                                           ^
> | compilation terminated.
> | /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source/scripts/Makefile.build:258: recipe for target '/home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.o' failed
> | make[3]: *** [/home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.o] Error 1
> | /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source/Makefile:1384: recipe for target '_module_/home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM' failed
> | make[2]: *** [_module_/home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM] Error 2
> | make[2]: Leaving directory '/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-build-artifacts'
> | Makefile:146: recipe for target 'sub-make' failed
> | make[1]: *** [sub-make] Error 2
> | make[1]: Leaving directory '/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source'
> | Makefile:478: recipe for target 'all' failed
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/temp/log.do_compile.25613)
> ERROR: Task 119 (/home/PC/bbb/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb, do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 731 tasks of which 720 didn't need to be rerun and 1 failed.
> Waiting for 0 running tasks to finish:
> 
> Summary: 1 task failed:
>   /home/PC/bbb/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb, do_compile
> Summary: There was 1 WARNING message shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> PC@PC:~/bbb/build_spain
> 
> ---------------------------------------------------------------------------------------------------------------------------
> 
> Thank you for your Time and I hope you can help me.Have a nice day.

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


