Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F168E00D0A; Thu, 14 Jul 2016 09:29:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 813A0E0095F
	for <meta-ti@yoctoproject.org>; Thu, 14 Jul 2016 09:29:15 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6EGTEVd017261;
	Thu, 14 Jul 2016 11:29:14 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6EGTERG019405;
	Thu, 14 Jul 2016 11:29:14 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 14 Jul 2016 11:29:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6EGTEPG012404;
	Thu, 14 Jul 2016 11:29:14 -0500
Date: Thu, 14 Jul 2016 12:29:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Daniel Gomez <dgomez@iseebcn.com>
Message-ID: <20160714162913.GF32054@edge>
References: <CADqvwgO+fJYtxOf4pq7LaGWsMC0H_nrpQGR7Zf3zP_pSvnGqnw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADqvwgO+fJYtxOf4pq7LaGWsMC0H_nrpQGR7Zf3zP_pSvnGqnw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: omap3-sgx-modules kernel 3.14
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
X-List-Received-Date: Thu, 14 Jul 2016 16:29:21 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jul 14, 2016 at 05:57:42PM +0200, Daniel Gomez wrote:
> Hi,
> 
> I'm trying to compile omap3-sgx-modules for the omap3 platform (omap3630)
> against 3.14 kernel version but several errors have appeared on bc_cat.c
> file compilation.
> 
> Is it possible to compile SDK 4.05 or higher against 3.13 or 3.14 kernel
> versions and get SGX acceleration?

What kernel recipe/tree is being used?


> Thank you
> 
> HOST Environment:
> * Kernel
> Linux xubuntu-VirtualBox 3.2.0-104-generic #145-Ubuntu SMP Thu Jun 9
> 09:53:59 UTC 2016 i686 i686 i386 GNU/Linux
> 
> * Distro
> Distributor ID:    Ubuntu
> Description:    Ubuntu 12.04.5 LTS
> Release:    12.04
> Codename:    precise
> 
> * poky:
> repo: git://git.yoctoproject.org/poky
> branch: fido
> 
> * meta-ti
> repo: git://git.yoctoproject.org/meta-ti
> branch: fido
> 
> * machine
> MACHINE=beagleboard
> 
> * recipe omap3-sgx-modules
> meta-ti/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
> TI_PLATFORM_omap3 = "omap3630"
> 
> # output
> $ MACHINE=beagleboard bitbake omap3-sgx-modules
> WARNING: Host distribution "Ubuntu-12.04" has not been validated with this
> version of the build system; you may possibly experience unexpected
> failures. It is recommended that you use a tested distribution.
> Loading cache: 100%
> |########################################################################################################################################################################################################|
> ETA:  00:00:00
> Loaded 2 entries from dependency cache.
> Parsing recipes: 100%
> |######################################################################################################################################################################################################|
> Time: 00:01:37
> Parsing of 1059 .bb files complete (1 cached, 1058 parsed). 1469 targets,
> 151 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION        = "1.26.0"
> BUILD_SYS         = "i686-linux"
> NATIVELSBSTRING   = "Ubuntu-12.04"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "beagleboard"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.8.2"
> TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta
> meta-yocto
> meta-yocto-bsp    = "fido:c9f0a99050ec0050f0dbcd55d0cd2ab18848113f"
> meta-ti           = "fido:632ea21d490022bbca34ee43bda31bbe5678a779"
> 
> NOTE: Preparing RunQueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: Failed to fetch URL
> http://www.openssl.org/source/old/1.0.2/openssl-1.0.2h.tar.gz, attempting
> MIRRORS if available
> WARNING:
> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM
> ('S') doesn't exist, please set 'S' to a proper value
> WARNING: TI installer requires 32bit glibc libraries for proper operation
> run 'yum install glibc.i686' on Fedora or 'apt-get install ia32-libs' on
> Ubuntu/Debian
> ERROR: Function failed: do_compile (log file is located at
> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/temp/log.do_compile.6024)
> ERROR: Logfile of failure stored in:
> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/temp/log.do_compile.6024
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 2 -e MAKEFLAGS=
> KERNEL_SRC=/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
> KERNEL_PATH=/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
> KERNEL_VERSION=3.14.43-g1325370701 CC=arm-poky-linux-gnueabi-gcc
>  -mno-thumb-interwork -marm LD=arm-poky-linux-gnueabi-ld.bfd
> AR=arm-poky-linux-gnueabi-ar
>  O=/<path>/poky/build/tmp/work-shared/beagleboard/kernel-build-artifacts
> BUILD=release TI_PLATFORM=omap3630
> | make -C /<path>/poky/build/tmp/work-shared/beagleboard/kernel-source
> M=`pwd`
> | make[1]: Entering directory
> `/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source'
> |   LD
>  /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/built-in.o
> |   CC [M]
>  /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bc_cat.o
> |
> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bc_cat.c:
> In function 'bc_cat_init':
> |
> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bc_cat.c:612:6:
> error: implicit declaration of function 'cpu_is_omap3530'
> [-Werror=implicit-function-declaration]
> |       width_align = cpu_is_omap3530() && ( omap_rev() <
> OMAP3430_REV_ES3_0 ) ? 32 : 8;
> |       ^
> |
> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bc_cat.c:612:6:
> error: implicit declaration of function 'omap_rev'
> [-Werror=implicit-function-declaration]
> |
> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bc_cat.c:612:56:
> error: 'OMAP3430_REV_ES3_0' undeclared (first use in this function)
> |       width_align = cpu_is_omap3530() && ( omap_rev() <
> OMAP3430_REV_ES3_0 ) ? 32 : 8;
> |                                                         ^
> |
> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bc_cat.c:612:56:
> note: each undeclared identifier is reported only once for each function it
> appears in
> | cc1: some warnings being treated as errors
> | make[4]: ***
> [/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty/bufferclass_ti/bc_cat.o]
> Error 1
> | make[3]: ***
> [/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM/services4/3rdparty/bufferclass_ti]
> Error 2
> | make[2]: ***
> [_module_/<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/Graphics_SDK_4_05_00_03/GFX_Linux_KM]
> Error 2
> | make[1]: *** [sub-make] Error 2
> | make[1]: Leaving directory
> `/<path>/poky/build/tmp/work-shared/beagleboard/kernel-source'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> /<path>/poky/build/tmp/work/beagleboard-poky-linux-gnueabi/omap3-sgx-modules/4.05.00.03-r126c/temp/log.do_compile.6024)
> ERROR: Task 7 (/<path>/poky/meta-ti/recipes-bsp/powervr-drivers/
> omap3-sgx-modules_4.05.00.03.bb, do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 417 tasks of which 0 didn't need to be rerun
> and 1 failed.
> Waiting for 0 running tasks to finish:
> 
> Summary: 1 task failed:
>   /<path>/poky/meta-ti/recipes-bsp/powervr-drivers/
> omap3-sgx-modules_4.05.00.03.bb, do_compile
> Summary: There were 4 WARNING messages shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> 
> Daniel Gómez

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


