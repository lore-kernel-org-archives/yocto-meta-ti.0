Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3ED27E00AAA; Tue, 18 Aug 2015 15:14:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 507CDE00A7D
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2015 15:14:55 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7IMEpLq013525;
	Tue, 18 Aug 2015 17:14:51 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7IMEp2S001680;
	Tue, 18 Aug 2015 17:14:51 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 18 Aug 2015 17:14:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7IMEokT010049;
	Tue, 18 Aug 2015 17:14:50 -0500
Date: Tue, 18 Aug 2015 18:14:35 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Benjamin Bimmermann <b.bimmermann@yahoo.de>
Message-ID: <20150818221434.GH6542@edge>
References: <1319594131.5095777.1439627373982.JavaMail.yahoo@mail.yahoo.com>
	<203232546.5605769.1439737469482.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <203232546.5605769.1439737469482.JavaMail.yahoo@mail.yahoo.com>
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
X-List-Received-Date: Tue, 18 Aug 2015 22:14:59 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Yeah, that's a relatively new warning and in this case is harmless, as long as 
you install the resulting packages with corresponding libraries into your 
rootfs.
The new version for 4.1 is not yet ready, sorry.

-- 
Denys


On Sun, Aug 16, 2015 at 03:04:29PM +0000, Benjamin Bimmermann wrote:
> >>Denys>>Version 5.1.1.2 of libgles-omap3 only builds and works against version 3.14 of  linux-ti-staging kernel in meta-ti
> >Benjamin
> >Three Questions:>1. What must I add / change to build with the Kernel 3.14?
> I have found it out, I think.I have added to the local.conf :PREFERRED_VERSION_linux-yocto = "3.14%"
> PREFERRED_VERSION_linux-ti-staging = "3.14%"
> I think now he builds the 3.14 Kernel ;). 
> 
> But now I have a warning and I don't know exactly what it means and what I should do.The Warning :WARNING: QA Issue: libgles-omap3-frontwsegl-es3 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> I think that means, that I can get a possible Runtime-Error, because libgles-omap3 needs at the runtime libpvr2d.
> Three more Questions:
> 1.:How can I check that bitbake has build the libpvr2d ?2.: What I can add to the local.conf to be sure that the libpvr2d is build every time ?3.: Is there an unstable / inprogress libgles-omap3 Version for the Kernel 4.1 which I can try? 
>      Is it possible to be involved in the programming of the libgles-omap3 driver ?
> 
> Have a nice day.
> 
> 
> --------------------------------------------------------------------------------------------------
> 
> 
> The Log:
> PC@PC:~/bbb/build_spain$ bitbake libgles-omap3
> WARNING: Host distribution "Ubuntu-15.04" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
> Parsing recipes: 100% |######################################################################################################################################################################| Time: 00:00:51
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
> WARNING: /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/fbset-modes/0.1.0-r6/fbset-modes-0.1.0 ('S') doesn't exist, please set 'S' to a proper value
> WARNING: /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM ('S') doesn't exist, please set 'S' to a proper value
> WARNING: /home/PC/bbb/build_spain/tmp/work/cortexa8hf-vfp-neon-poky-linux-gnueabi/libgles-omap3/5.01.01.02-r38.1/Graphics_SDK_5_01_01_02 ('S') doesn't exist, please set 'S' to a proper value
> WARNING: QA Issue: libgles-omap3-blitwsegl-es3 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-blitwsegl-es5 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-blitwsegl-es6 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-blitwsegl-es8 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-blitwsegl-es9 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-flipwsegl-es3 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-flipwsegl-es5 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-flipwsegl-es6 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-flipwsegl-es8 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-flipwsegl-es9 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-frontwsegl-es3 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-frontwsegl-es5 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-frontwsegl-es6 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-frontwsegl-es8 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-frontwsegl-es9 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-linuxfbwsegl-es3 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-linuxfbwsegl-es5 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-linuxfbwsegl-es6 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-linuxfbwsegl-es8 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-linuxfbwsegl-es9 requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-blitwsegl requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-flipwsegl requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-frontwsegl requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-linuxfbwsegl requires libpvr2d.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-es3 requires libEGL.so, libIMGegl.so, libews.so, libXext.so.6, libusc.so, libpvr2d.so, libsrv_init.so, libX11.so.6, libdrm.so.2, libGLES_CM.so, libGLESv2.so, libsrv_um.so, libXfixes.so.3, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-es5 requires libEGL.so, libIMGegl.so, libews.so, libXext.so.6, libusc.so, libpvr2d.so, libsrv_init.so, libX11.so.6, ld-linux.so.3(GLIBC_2.4), ld-linux.so.3, libdrm.so.2, libGLES_CM.so, libGLESv2.so, libsrv_um.so, libXfixes.so.3, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-es6 requires libIMGegl.so, libXext.so.6, libusc.so, libpvr2d.so, libsrv_init.so, libX11.so.6, libdrm.so.2, libsrv_um.so, libXfixes.so.3, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-es8 requires libIMGegl.so, libXext.so.6, libusc.so, libpvr2d.so, libsrv_init.so, libX11.so.6, libdrm.so.2, libsrv_um.so, libXfixes.so.3, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-es9 requires libIMGegl.so, libXext.so.6, libusc.so, libpvr2d.so, libsrv_init.so, libX11.so.6, libdrm.so.2, libsrv_um.so, libXfixes.so.3, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-rawdemos requires libEGL.so, libGLESv2.so, libGLES_CM.so, but no providers in its RDEPENDS [file-rdeps]
> WARNING: QA Issue: libgles-omap3-tests requires libpvr2d.so, libsrv_um.so, but no providers in its RDEPENDS [file-rdeps]
> NOTE: Tasks Summary: Attempted 791 tasks of which 0 didn't need to be rerun and all succeeded.
> 
> Summary: There were 35 WARNING messages shown.
> PC@PC:~/bbb/build_spain$ 
> PC@PC:~/bbb/build_spain$ 
> PC@PC:~/bbb/build_spain$ 
> 
> 
>  
> 
> 
>      Benjamin Bimmermann <b.bimmermann@yahoo.de> schrieb am 10:30 Samstag, 15.August 2015:
>    
> 
>  Denys, ok. So if I like to use libgles-omap3 I must use the old Linux 3.14 Kernel? Three Questions:1. What I must add / Change to build with the Kernel 3.14?2. Is for the new Kernel a Driver, with full grafic support that worked with QT5 ?
> 2.1.: Best without X11.3. What would you think it is better the Driver with the”old” Kernel 3.14 or theanswer of question two? Thanks for the fast answer.  Benjamin 
> 
> 
>      Denys Dmytriyenko <denys@ti.com> schrieb am 2:50 Samstag, 15.August 2015:
>    
> 
>  Benjamin,
> 
> Version 5.1.1.2 of libgles-omap3 only builds and works against version 3.14 of 
> linux-ti-staging kernel in meta-ti. The corresponding update to libgles-omap3 
> to build against 4.1 kernel hasn't been released yet.
> 
> -- 
> Denys
> 
> 
> On Sat, Aug 15, 2015 at 12:41:50AM +0000, Benjamin Bimmermann wrote:
> > Hello,
> > i like to build the libgles-omap3 for the BeagleBoneBlack, but i get the error : 
> > sgx-omap.h: No such file or directory
> > |  #include <linux/platform_data/sgx-omap.h>.
> > I try to create QT5 for the BeagleboneBlack. I have found and work on this tutorial:http://www.embarcados.com.br/beaglebone-black-qt5-yocto-parte-1/Code: https://bitbucket.org/embarcados/meta-embarcados/src
> > 
> > He has the error in part2 of the tutorial and say that i must make :bitbake -c cleansstate libgles-omap3bitbake libgles-omap3
> > but that not solve the Problem. Every Time I get this Error.
> > I have only change the bblayer.conf and the local.conf file. All other Files are from git and I have not change anything.
> > I hope you can help me.
> > 
> > 
> > 
> > ---------------------------------------------------------------------------------------------------------------------------
> > My bblayer.conf:LCONF_VERSION = "6"
> > BBPATH = "${TOPDIR}"
> > BBFILES ?= ""
> > BBLAYERS ?= " \
> >           ${HOME}/bbb/meta-embarcados \
> >           ${HOME}/bbb/meta-embarcados/meta-bbb \
> >           ${HOME}/bbb/meta-ti \
> >           ${HOME}/poky-fido/meta-qt5 \
> >           ${HOME}/poky-fido/meta-openembedded/meta-oe \
> >           ${HOME}/poky-fido/meta-openembedded/meta-ruby \
> >           ${HOME}/poky-fido/meta-openembedded/meta-perl \
> >           ${HOME}/poky-fido/meta-openembedded/meta-efl \
> >           ${HOME}/poky-fido/meta-openembedded/meta-multimedia \
> >           ${HOME}/poky-fido/meta \
> >           ${HOME}/poky-fido/meta-yocto \ "
> > BBLAYERS_NON_REMOVABLE ?= " \
> >          ${HOME}/poky-fido/meta \
> >          ${HOME}/poky-fido/meta-yocto \
> >   "
> > ---------------------------------------------------------------------------------------------------------------------------
> > My local.conf:BB_NUMBER_THREADS = "7"
> > PARALLEL_MAKE = "-j7"
> > LICENSE_FLAGS_WHITELIST = "commercial"
> > MACHINE = "beaglebone"
> > DISTRO = "poky"
> > PACKAGE_CLASSES = "package_deb"
> > EXTRA_IMAGE_FEATURES = "debug-tweaks"
> > CONF_VERSION = "1"
> > DISTRO_FEATURES_remove = "x11 wayland"
> > BBMASK = "meta-embarcados/recipes-browser/chromium/chromium_%.bbappend"
> > 
> > ---------------------------------------------------------------------------------------------------------------------------
> > And the complete LOG:
> > PC@PC:~/bbb/build_spain$ bitbake libgles-omap3
> > WARNING: Host distribution "Ubuntu-15.04" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
> > Parsing recipes: 100% |######################################################################################################################################################################| Time: 00:00:29
> > Parsing of 1788 .bb files complete (0 cached, 1788 parsed). 2296 targets, 351 skipped, 1 masked, 0 errors.
> > NOTE: Resolving any missing task queue dependencies
> > 
> > Build Configuration:
> > BB_VERSION        = "1.26.0"
> > BUILD_SYS         = "x86_64-linux"
> > NATIVELSBSTRING   = "Ubuntu-15.04"
> > TARGET_SYS        = "arm-poky-linux-gnueabi"
> > MACHINE           = "beaglebone"
> > DISTRO            = "poky"
> > DISTRO_VERSION    = "1.8"
> > TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard cortexa8"
> > TARGET_FPU        = "vfp-neon"
> > meta-embarcados   
> > meta-bbb          = "fido:dfb2e27bf26b109fc6ccb3bc91924fb3bb24f655"
> > meta-ti           = "fido:a666b94e9c676711f1389c0628e6c883ef20d5b3"
> > meta-qt5          = "fido:fc026381545650e10fdd488d5b2a3b2d78f87793"
> > meta-oe           
> > meta-ruby         
> > meta-perl         
> > meta-efl          
> > meta-multimedia   = "fido:10d3c8f85280a0bf867a8e4f84bcda81c290d28e"
> > meta              
> > meta-yocto        = "fido:08d32590411568e7bf11612ac695a6e9c6df6286"
> > 
> > NOTE: Preparing RunQueue
> > NOTE: Executing SetScene Tasks
> > NOTE: Executing RunQueue Tasks
> > ERROR: Function failed: do_compile (log file is located at /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/temp/log.do_compile.25613)
> > ERROR: Logfile of failure stored in: /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/temp/log.do_compile.25613
> > Log data follows:
> > | DEBUG: Executing shell function do_compile
> > | NOTE: make -j7 -e MAKEFLAGS= KERNEL_SRC=/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source KERNEL_PATH=/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source KERNEL_VERSION=4.1.5 CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm LD=arm-poky-linux-gnueabi-ld.bfd   AR=arm-poky-linux-gnueabi-ar  O=/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-build-artifacts BUILD=release TI_PLATFORM=ti335x SUPPORT_XORG=
> > | make -C /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source M=`pwd`
> > | make[1]: Entering directory '/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source'
> > | make[2]: Entering directory '/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-build-artifacts'
> > |   CC [M]  /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.o
> > | /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.c:51:42: fatal error: linux/platform_data/sgx-omap.h: No such file or directory
> > |  #include <linux/platform_data/sgx-omap.h>
> > |                                           ^
> > | compilation terminated.
> > | /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source/scripts/Makefile.build:258: recipe for target '/home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.o' failed
> > | make[3]: *** [/home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM/services4/srvkm/env/linux/module.o] Error 1
> > | /home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source/Makefile:1384: recipe for target '_module_/home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM' failed
> > | make[2]: *** [_module_/home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/Graphics_SDK_5_01_01_02/GFX_Linux_KM] Error 2
> > | make[2]: Leaving directory '/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-build-artifacts'
> > | Makefile:146: recipe for target 'sub-make' failed
> > | make[1]: *** [sub-make] Error 2
> > | make[1]: Leaving directory '/home/PC/bbb/build_spain/tmp/work-shared/beaglebone/kernel-source'
> > | Makefile:478: recipe for target 'all' failed
> > | make: *** [all] Error 2
> > | ERROR: oe_runmake failed
> > | WARNING: exit code 1 from a shell command.
> > | ERROR: Function failed: do_compile (log file is located at /home/PC/bbb/build_spain/tmp/work/beaglebone-poky-linux-gnueabi/omap3-sgx-modules/5.01.01.02-r22b/temp/log.do_compile.25613)
> > ERROR: Task 119 (/home/PC/bbb/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb, do_compile) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 731 tasks of which 720 didn't need to be rerun and 1 failed.
> > Waiting for 0 running tasks to finish:
> > 
> > Summary: 1 task failed:
> >   /home/PC/bbb/meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.01.01.02.bb, do_compile
> > Summary: There was 1 WARNING message shown.
> > Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> > PC@PC:~/bbb/build_spain
> > 
> > ---------------------------------------------------------------------------------------------------------------------------
> > 
> > Thank you for your Time and I hope you can help me.Have a nice day.
> 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> 
> 
> 
>    
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 
> 
>   

