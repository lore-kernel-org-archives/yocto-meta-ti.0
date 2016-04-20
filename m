Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E781CE00F07; Wed, 20 Apr 2016 10:19:58 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88489E00F0D
	for <meta-ti@yoctoproject.org>; Wed, 20 Apr 2016 10:19:50 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3KHJZwm022223;
	Wed, 20 Apr 2016 12:19:35 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3KHJYac026566;
	Wed, 20 Apr 2016 12:19:34 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 Apr 2016 12:19:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3KHJYl0009841;
	Wed, 20 Apr 2016 12:19:34 -0500
Date: Wed, 20 Apr 2016 13:19:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Daniel Ammann <daniel.ammann@bytesatwork.ch>
Message-ID: <20160420171918.GC10048@edge>
References: <571795F9.8000505@bytesatwork.ch>
MIME-Version: 1.0
In-Reply-To: <571795F9.8000505@bytesatwork.ch>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: omapdrm-pvr for am335x-evm with yocto 2.1
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
X-List-Received-Date: Wed, 20 Apr 2016 17:19:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

kernel 4.4 is not yet ready for SGX. There are patches pending with ETA of 
next week. Meanwhile you have to use 4.1 if you need 3D graphics.

-- 
Denys

On Wed, Apr 20, 2016 at 04:45:13PM +0200, Daniel Ammann wrote:
> Hi
> 
> I'm trying to build omapdrm-pvr for yocto 2.1 for am335x-evm, but the 
> build errors out. When I use yocto 1.8, it builds cleanly.
> Obviously, I have to use master branch for meta-ti layer as krogoth is 
> not released yet. When I use master branches for poky and meta-openembedded 
> as well, it doesn't build either.
> Should this work like this or do I have to wait for krogoth branch with 
> meta-ti layer?
> 
> Thanks and kind regards
> 
> Daniel
> 
> 
> 0$
> 0$ bitbake omapdrm-pvr -c cleansstate && bitbake omapdrm-pvr
> Loading cache: 100% |#########################################################################################################################################################| ETA:  00:00:00
> Loaded 2478 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION        = "1.30.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "universal"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "am335x-evm"
> DISTRO            = "poky"
> DISTRO_VERSION    = "2.1"
> TUNE_FEATURES     = "arm armv7a vfp thumb neon       callconvention-hard       cortexa8"
> TARGET_FPU        = "hard"
> meta
> meta-poky
> meta-yocto-bsp    = "krogoth:6c1c01392d91f512e2949ad1d57a75a8077478ba"
> meta-oe
> meta-networking
> meta-python       = "krogoth:abd1795729501a13608da67054b9cbf185404be3"
> meta-ti           = "master:161173fd66ecab996b9902f7b635918a6824703b"
> 
> NOTE: Preparing RunQueue
> NOTE: Executing RunQueue Tasks
> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
> Loading cache: 100% |#########################################################################################################################################################| ETA:  00:00:00
> Loaded 2478 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION        = "1.30.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "universal"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "am335x-evm"
> DISTRO            = "poky"
> DISTRO_VERSION    = "2.1"
> TUNE_FEATURES     = "arm armv7a vfp thumb neon       callconvention-hard       cortexa8"
> TARGET_FPU        = "hard"
> meta
> meta-poky
> meta-yocto-bsp    = "krogoth:6c1c01392d91f512e2949ad1d57a75a8077478ba"
> meta-oe
> meta-networking
> meta-python       = "krogoth:abd1795729501a13608da67054b9cbf185404be3"
> meta-ti           = "master:161173fd66ecab996b9902f7b635918a6824703b"
> 
> NOTE: Preparing RunQueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: omapdrm-pvr-1.14.3699939-r22i do_compile: oe_runmake failed
> ERROR: omapdrm-pvr-1.14.3699939-r22i do_compile: Function failed: do_compile (log file is located at /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work/am335x_evm-poky-linux-gnueabi/omapdrm-pvr/1.14.3699939-r22i/temp/log.do_compile.22811)
> ERROR: Logfile of failure stored in: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work/am335x_evm-poky-linux-gnueabi/omapdrm-pvr/1.14.3699939-r22i/temp/log.do_compile.22811
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 4 KERNEL_SRC=/home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source KERNELDIR=/home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source TARGET_PRODUCT=ti335x KERNEL_PATH=/home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source KERNEL_VERSION=4.4.7-ga4f797e3ab CC=arm-poky-linux-gnueabi-gcc  -mno-thumb-interwork -marm -fuse-ld=bfd LD=arm-poky-linux-gnueabi-ld.bfd   AR=arm-poky-linux-gnueabi-ar  O=/home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-build-artifacts
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/amba: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/bcma: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/byteorder: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/can: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/ceph: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/clk: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/crush: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/decompress: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/dma: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/extcon: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/fpga: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/fsl: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/gpio: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/hsi: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/i2c: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/iio: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/input: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/irqchip: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/isdn: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/lockd: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/mfd: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/mlx4: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/mlx5: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/mmc: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/mtd: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/netfilter: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/netfilter_arp: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/netfilter_bridge: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/netfilter_ipv4: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/netfilter_ipv6: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/perf: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/phy: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/pinctrl: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/platform_data: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/power: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/qed: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/raid: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/regulator: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/reset: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/rtc: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/sched: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/soc: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/spi: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/ssb: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/sunrpc: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/ulpi: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/unaligned: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/usb: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/uwb: Is a directory
> | grep: /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/include/linux/wimax: Is a directory
> | ../config/core.mk:447: $(KERNELDIR)/vmlinux does not exist. Kbuild may fail.
> | eurasiacon/build/linux2/tools/cc-check.sh: 52: eurasiacon/build/linux2/tools/cc-check.sh: arm-poky-linux-gnueabi-arm-poky-linux-gnueabi-gcc: not found
> | eurasiacon/build/linux2/tools/cc-check.sh: 52: eurasiacon/build/linux2/tools/cc-check.sh: arm-poky-linux-gnueabi-arm-poky-linux-gnueabi-gcc: not found
> | eurasiacon/build/linux2/tools/cc-check.sh: 52: eurasiacon/build/linux2/tools/cc-check.sh: arm-poky-linux-gnueabi-arm-poky-linux-gnueabi-gcc: not found
> | eurasiacon/build/linux2/tools/cc-check.sh: 52: eurasiacon/build/linux2/tools/cc-check.sh: arm-poky-linux-gnueabi-arm-poky-linux-gnueabi-gcc: not found
> | eurasiacon/build/linux2/tools/cc-check.sh: 52: eurasiacon/build/linux2/tools/cc-check.sh: arm-poky-linux-gnueabi-arm-poky-linux-gnueabi-gcc: not found
> | eurasiacon/build/linux2/tools/cc-check.sh: 52: eurasiacon/build/linux2/tools/cc-check.sh: arm-poky-linux-gnueabi-arm-poky-linux-gnueabi-gcc: not found
> | eurasiacon/build/linux2/tools/cc-check.sh: 52: eurasiacon/build/linux2/tools/cc-check.sh: arm-poky-linux-gnueabi-arm-poky-linux-gnueabi-gcc: not found
> | eurasiacon/build/linux2/tools/cc-check.sh: 52: eurasiacon/build/linux2/tools/cc-check.sh: arm-poky-linux-gnueabi-arm-poky-linux-gnueabi-gcc: not found
> |   LD      /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work/am335x_evm-poky-linux-gnueabi/omapdrm-pvr/1.14.3699939-r22i/git/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild/built-in.o
> |   CC [M]  /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work/am335x_evm-poky-linux-gnueabi/omapdrm-pvr/1.14.3699939-r22i/git/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild/services4/srvkm/env/linux/osfunc.o
> |   CC [M]  /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work/am335x_evm-poky-linux-gnueabi/omapdrm-pvr/1.14.3699939-r22i/git/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild/services4/srvkm/env/linux/mutils.o
> |   CC [M]  /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work/am335x_evm-poky-linux-gnueabi/omapdrm-pvr/1.14.3699939-r22i/git/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild/services4/srvkm/env/linux/mmap.o
> |   CC [M]  /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work/am335x_evm-poky-linux-gnueabi/omapdrm-pvr/1.14.3699939-r22i/git/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild/services4/srvkm/env/linux/module.o
> | /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work/am335x_evm-poky-linux-gnueabi/omapdrm-pvr/1.14.3699939-r22i/git/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild/services4/srvkm/env/linux/module.c:50:42: fatal error: linux/platform_data/sgx-omap.h: No such file or directory
> | compilation terminated.
> | /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/scripts/Makefile.build:258: recipe for target '/home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work/am335x_evm-poky-linux-gnueabi/omapdrm-pvr/1.14.3699939-r22i/git/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild/services4/srvkm/env/linux/module.o' failed
> | make[4]: *** [/home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work/am335x_evm-poky-linux-gnueabi/omapdrm-pvr/1.14.3699939-r22i/git/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild/services4/srvkm/env/linux/module.o] Error 1
> | make[4]: *** Waiting for unfinished jobs....
> | /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work-shared/am335x-evm/kernel-source/Makefile:1384: recipe for target '_module_/home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work/am335x_evm-poky-linux-gnueabi/omapdrm-pvr/1.14.3699939-r22i/git/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild' failed
> | make[3]: *** [_module_/home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work/am335x_evm-poky-linux-gnueabi/omapdrm-pvr/1.14.3699939-r22i/git/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild] Error 2
> | Makefile:146: recipe for target 'sub-make' failed
> | make[2]: *** [sub-make] Error 2
> | eurasiacon/build/linux2/kbuild/kbuild.mk:56: recipe for target 'kbuild' failed
> | make[1]: *** [kbuild] Error 2
> | ../config/core.mk:675: recipe for target 'build' failed
> | make: *** [build] Error 2
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (log file is located at /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/build/tmp/work/am335x_evm-poky-linux-gnueabi/omapdrm-pvr/1.14.3699939-r22i/temp/log.do_compile.22811)
> ERROR: Task 7 (/home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/meta-ti/recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb, do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 406 tasks of which 399 didn't need to be rerun and 1 failed.
> No currently running tasks (406 of 413)
> 
> Summary: 1 task failed:
>   /home/daniel/workspace/yoctotest/yocto/yocto21-am335x-evm/meta-ti/recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb, do_compile
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> 1$
> 1$
> 1$
> 1$
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

