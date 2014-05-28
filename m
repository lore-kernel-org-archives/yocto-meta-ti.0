Return-Path: <dean@ripperd.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08800E00BC2; Wed, 28 May 2014 13:35:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [76.96.62.17 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 62 seconds by postgrey-1.32 at yocto-www;
	Wed, 28 May 2014 13:35:40 PDT
Received: from qmta10.westchester.pa.mail.comcast.net (unknown [76.96.62.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1FD1FE00BBC
	for <meta-ti@yoctoproject.org>; Wed, 28 May 2014 13:35:40 -0700 (PDT)
Received: from omta11.westchester.pa.mail.comcast.net ([76.96.62.36])
	by qmta10.westchester.pa.mail.comcast.net with comcast
	id 7YSg1o0030mv7h05AYadEi; Wed, 28 May 2014 20:34:37 +0000
Received: from mail.ripperd.com ([76.17.162.240])
	by omta11.westchester.pa.mail.comcast.net with comcast
	id 7Yab1o00V5BWXR03XYadWQ; Wed, 28 May 2014 20:34:37 +0000
Received: by mail.ripperd.com (Postfix, from userid 65534)
	id 6A6C1663AF; Wed, 28 May 2014 15:34:35 -0500 (CDT)
Received: from [10.0.1.6] (unknown [10.0.1.6])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.ripperd.com (Postfix) with ESMTPSA id 7BF7366398
	for <meta-ti@yoctoproject.org>; Wed, 28 May 2014 15:34:29 -0500 (CDT)
Message-ID: <53864855.8040600@ripperd.com>
Date: Wed, 28 May 2014 15:34:29 -0500
From: Dean <dean@ripperd.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <20140523191759.1158552AAF@arago-project.org>
In-Reply-To: <20140523191759.1158552AAF@arago-project.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1401309277;
	bh=/+sCHzwpsblyuwKbxEEudm/h7DJvo0D5QQ6UIKkL/aY=;
	h=Received:Received:Received:Received:Message-ID:Date:From:
	MIME-Version:To:Subject:Content-Type;
	b=BfUuQHKwsVVws+du+ahEN+9TsEZzr9usf0mjTMxTUUhsngwOM7ree2dCwaiSZ+S+H
	PD5EYhAxSwZRg+ixLOrG0Py2eucVXu8DpUnn5HdOnCd0svn5JVbR57CmKayCVP3+e1
	4CMa3H9vVTxNrgpawDljs+n6xSlpwklD84icgtOMHL98+MjUmHXpu17iAWnNPWgKch
	KeseGcCwsOpYZHzOslEkYfT/AQnPwrbAQbNhbEbwHRRXYFRnGOl98lNbg1KK5BPXgE
	tVkuRY9LMk02A2KASVhlJdg4t2/1ICdsWunDQku1qXFEAIJa1Cz0eBjHHiMHabKDV0
	jHPiE/MKyPKNw==
Subject: Re: Maupin, Chase : linux-ti-staging: Add version 3.15 of TI integration kernel
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
X-List-Received-Date: Wed, 28 May 2014 20:35:44 -0000
Content-Type: multipart/alternative;
	boundary="------------020502030307020801050702"

--------------020502030307020801050702
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I think this broke my build? I am using dora rather than daisy or 
master, so I was hoping to avoid problems.

Based on googling the error messages cryptodev might need to be updated 
for 3.13+ kernels?

Build Configuration:
BB_VERSION        = "1.20.0"
BUILD_SYS         = "i686-linux"
NATIVELSBSTRING   = "Debian-7.5"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "am335x-evm"
DISTRO            = "arago"
DISTRO_VERSION    = "2014.05"
TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa8"
TARGET_FPU        = "vfp-neon"
meta-arago-distro
meta-arago-extras = "master:dfd2d18aabc562c6cd22fac96e715b58167b19f0"
meta-qt5          = "dora:5b5616b63bdf163ea3eb2ca8857c56a393435fe3"
toolchain-layer
meta-networking
meta-ruby
meta-oe           = "dora:ee173678383683e972c7d4d6f0ef5790bfa50274"
meta-ti           = "dora:afabec7ba33b2b24298481d3325147b0f29a17fc"
meta-linaro-toolchain = "dora:503b1fe68f90a8e2b43c456ddd17a0a90816cf9c"
meta              = "dora:4c58fe468790822fe48e0a570779979c831d0f10"
meta-java         = "dora:d86d17c9d13d1117b484cb36f884709ce585a3e0"
...
ERROR: Function failed: do_compile (log file is located at 
/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/temp/log.do_compile.4071)
ERROR: Logfile of failure stored in: 
/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/temp/log.do_compile.4071
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 8 
KERNEL_DIR=/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel 
PREFIX=/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/image 
KERNEL_PATH=/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel 
KERNEL_SRC=/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel 
KERNEL_VERSION=3.15.0-rc6 CC=arm-linux-gnueabihf-gcc 
-mno-thumb-interwork -marm LD=arm-linux-gnueabihf-ld.bfd 
AR=arm-linux-gnueabihf-ar
| make -C 
/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel 
SUBDIRS=`pwd` ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- modules
| make[1]: Entering directory 
`/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel'
| make[1]: warning: jobserver unavailable: using -j1.  Add `+' to parent 
make rule.
|   CC [M] 
/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/git/cryptlib.o
| 
*/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/git/cryptlib.c: 
In function 'cryptodev_cipher_encrypt':**
**| 
/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/git/cryptlib.c:223:2: 
error: implicit declaration of function 'INIT_COMPLETION' 
[-Werror=implicit-function-declaration]*
| cc1: some warnings being treated as errors
| make[2]: *** 
[/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/git/cryptlib.o] 
Error 1
| make[1]: *** 
[_module_/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/git] 
Error 2
| make[1]: Leaving directory 
`/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel'
| make: *** [build] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at 
/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/temp/log.do_compile.4071)
ERROR: Task 2302 
(/home/deane/arago/tisdk-dora/sources/meta-arago/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb, 
do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2387 tasks of which 2346 didn't need to 
be rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
/home/deane/arago/tisdk-dora/sources/meta-arago/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb, 
do_compile
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

Thanks,
Dean

On 5/23/2014 2:17 PM, Arago Project git wrote:
> Module: meta-ti
> Branch: dora
> Commit: 5548cad9ffb24e06f645c6c8ff843ba1b79c290d
> URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5548cad9ffb24e06f645c6c8ff843ba1b79c290d
>
> Author: Maupin, Chase <chase.maupin@ti.com>
> Date:   Fri May 23 02:08:33 2014 +0000
>
> linux-ti-staging: Add version 3.15 of TI integration kernel
>
> * Add version 3.15 of the TI integration kernel.  Major changes
>    from previous version are:
>      * Config fragments now come primarily from the integration
>        tree.  Removed baseport and connectivity fragments for now
>        and the others can be removed as they are added to the
>        integration tree.
>      * Added a non-smp.cfg config to disable SMP for single core
>        devices instead of using a patch to the defconfig file as
>        we did in the past.
> * Use the right SRCREV
>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>
> ---
>
>   .../linux/linux-ti-staging-3.15/defconfig          |    1 +
>   recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg |   18 ++++++
>   .../linux/linux-ti-staging-3.15/non-smp.cfg        |    5 ++
>   .../linux/linux-ti-staging-3.15/systest.cfg        |   20 +++++++
>   recipes-kernel/linux/linux-ti-staging_3.15.bb      |   59 ++++++++++++++++++++
>   5 files changed, 103 insertions(+), 0 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/defconfig b/recipes-kernel/linux/linux-ti-staging-3.15/defconfig
> new file mode 100644
> index 0000000..926b35a
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti-staging-3.15/defconfig
> @@ -0,0 +1 @@
> +use-kernel-config=omap2plus_defconfig
> diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg b/recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg
> new file mode 100644
> index 0000000..645dfdf
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg
> @@ -0,0 +1,18 @@
> +##################################################
> +# IPC config options
> +##################################################
> +CONFIG_IOMMU_API=y
> +CONFIG_IOMMU_SUPPORT=y
> +CONFIG_OF_IOMMU=y
> +CONFIG_OMAP_IOMMU=y
> +CONFIG_OMAP_IOVMM=y
> +CONFIG_OMAP_IOMMU_DEBUG=y
> +CONFIG_VIRTIO=m
> +CONFIG_RPMSG=m
> +CONFIG_RPMSG_RPC=m
> +CONFIG_REMOTEPROC=m
> +CONFIG_OMAP_REMOTEPROC=m
> +CONFIG_OMAP_REMOTEPROC_IPU=y
> +CONFIG_OMAP_REMOTEPROC_DSP=y
> +CONFIG_OMAP_REMOTEPROC_IPU1=y
> +CONFIG_OMAP_REMOTEPROC_DSP2=y
> diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg b/recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg
> new file mode 100644
> index 0000000..d61a413
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg
> @@ -0,0 +1,5 @@
> +##################################################
> +# Non-SMP config options
> +##################################################
> +CONFIG_SMP=n
> +CONFIG_NR_CPUS=n
> diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/systest.cfg b/recipes-kernel/linux/linux-ti-staging-3.15/systest.cfg
> new file mode 100644
> index 0000000..e21602f
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti-staging-3.15/systest.cfg
> @@ -0,0 +1,20 @@
> +##################################################
> +# Systest config options
> +##################################################
> +CONFIG_DEBUG_SPINLOCK=y
> +CONFIG_DEBUG_MUTEXES=y
> +CONFIG_DEBUG_KMEMLEAK=y
> +CONFIG_DEVKMEM=y
> +CONFIG_HAVE_DEBUG_KMEMLEAK=y
> +CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=400
> +CONFIG_DEBUG_KMEMLEAK_TEST=n
> +CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=n
> +CONFIG_DEBUG_LOCK_ALLOC=y
> +CONFIG_DEBUG_INFO=y
> +CONFIG_DEBUG_FS=y
> +CONFIG_DEBUG_KERNEL=y
> +CONFIG_PM_DEBUG=y
> +CONFIG_DEBUG_GPIO=y
> +CONFIG_USB_DEBUG=y
> +CONFIG_SND_DEBUG=y
> +CONFIG_RTC_DEBUG=y
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.15.bb b/recipes-kernel/linux/linux-ti-staging_3.15.bb
> new file mode 100644
> index 0000000..308a412
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti-staging_3.15.bb
> @@ -0,0 +1,59 @@
> +SECTION = "kernel"
> +DESCRIPTION = "Linux kernel for TI devices"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> +
> +inherit kernel
> +
> +require recipes-kernel/linux/linux-dtb.inc
> +require recipes-kernel/linux/setup-defconfig.inc
> +
> +# Look in the generic major.minor directory for files
> +FILESEXTRAPATHS_append := "${THISDIR}/${PN}-3.15:"
> +
> +# Pull in the devicetree files into the rootfs
> +RDEPENDS_kernel-base += "kernel-devicetree"
> +
> +# Add a run-time dependency for the PM firmware to be installed
> +# on the target file system.
> +RDEPENDS_kernel-base_append_ti33x = " am33x-cm3"
> +RDEPENDS_kernel-base_append_ti43x = " am33x-cm3"
> +
> +# Add a run-time dependency for the VPE VPDMA firmware to be installed
> +# on the target file system.
> +RDEPENDS_kernel-base_append_dra7xx-evm = " vpe-vpdma-fw"
> +
> +# Default is to package all dtb files for ti33x devices unless building
> +# for the specific beaglebone machine.
> +KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
> +KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb"
> +KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
> +KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
> +KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
> +
> +KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
> +
> +COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
> +
> +S = "${WORKDIR}/git"
> +
> +BRANCH = "ti-linux-3.15.y"
> +
> +SRCREV = "3fd9aad17d3b4d1d7ee50ae788c0a096921e7216"
> +PV = "3.14+3.15-rc6"
> +
> +# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> +MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
> +PR = "${MACHINE_KERNEL_PR}"
> +
> +KERNEL_CONFIG_DIR = "ti_config_fragments"
> +KERNEL_CONFIG_FRAGMENTS = "${WORKDIR}/ipc.cfg"
> +KERNEL_CONFIG_FRAGMENTS_append_ti33x = "${WORKDIR}/non-smp.cfg"
> +KERNEL_CONFIG_FRAGMENTS_append_ti43x = "${WORKDIR}/non-smp.cfg"
> +
> +SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
> +           file://defconfig \
> +           file://ipc.cfg \
> +           file://systest.cfg \
> +           file://non-smp.cfg \
> +          "
>


--------------020502030307020801050702
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    I think this broke my build? I am using dora rather than daisy or
    master, so I was hoping to avoid problems.<br>
    <br>
    Based on googling the error messages cryptodev might need to be
    updated for 3.13+ kernels?<br>
    <br>
    Build Configuration:<br>
    BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "1.20.0"<br>
    BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "i686-linux"<br>
    NATIVELSBSTRING&nbsp;&nbsp; = "Debian-7.5"<br>
    TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "arm-oe-linux-gnueabi"<br>
    MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "am335x-evm"<br>
    DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "arago"<br>
    DISTRO_VERSION&nbsp;&nbsp;&nbsp; = "2014.05"<br>
    TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp; = "armv7a vfp thumb neon callconvention-hard
    cortexa8"<br>
    TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "vfp-neon"<br>
    meta-arago-distro <br>
    meta-arago-extras =
    "master:dfd2d18aabc562c6cd22fac96e715b58167b19f0"<br>
    meta-qt5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "dora:5b5616b63bdf163ea3eb2ca8857c56a393435fe3"<br>
    toolchain-layer&nbsp;&nbsp; <br>
    meta-networking&nbsp;&nbsp; <br>
    meta-ruby&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
    meta-oe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "dora:ee173678383683e972c7d4d6f0ef5790bfa50274"<br>
    meta-ti&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "dora:afabec7ba33b2b24298481d3325147b0f29a17fc"<br>
    meta-linaro-toolchain =
    "dora:503b1fe68f90a8e2b43c456ddd17a0a90816cf9c"<br>
    meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "dora:4c58fe468790822fe48e0a570779979c831d0f10"<br>
    meta-java&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; = "dora:d86d17c9d13d1117b484cb36f884709ce585a3e0"<br>
    ...<br>
    ERROR: Function failed: do_compile (log file is located at
/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/temp/log.do_compile.4071)<br>
    ERROR: Logfile of failure stored in:
/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/temp/log.do_compile.4071<br>
    Log data follows:<br>
    | DEBUG: Executing shell function do_compile<br>
    | NOTE: make -j 8
    KERNEL_DIR=/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel
    PREFIX=/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/image
    KERNEL_PATH=/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel
    KERNEL_SRC=/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel
    KERNEL_VERSION=3.15.0-rc6 CC=arm-linux-gnueabihf-gcc&nbsp;
    -mno-thumb-interwork -marm LD=arm-linux-gnueabihf-ld.bfd&nbsp;&nbsp;
    AR=arm-linux-gnueabihf-ar<br>
    | make -C
    /home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel
    SUBDIRS=`pwd` ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- modules<br>
    | make[1]: Entering directory
`/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel'<br>
    | make[1]: warning: jobserver unavailable: using -j1.&nbsp; Add `+' to
    parent make rule.<br>
    |&nbsp;&nbsp; CC [M]&nbsp;
/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/git/cryptlib.o<br>
    | <b>/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/git/cryptlib.c:
      In function 'cryptodev_cipher_encrypt':</b><b><br>
    </b><b>|
      /home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/git/cryptlib.c:223:2:
      error: implicit declaration of function 'INIT_COMPLETION'
      [-Werror=implicit-function-declaration]</b><br>
    | cc1: some warnings being treated as errors<br>
    | make[2]: ***
    [/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/git/cryptlib.o]
    Error 1<br>
    | make[1]: ***
    [_module_/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/git]
    Error 2<br>
    | make[1]: Leaving directory
`/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/sysroots/am335x-evm/usr/src/kernel'<br>
    | make: *** [build] Error 2<br>
    | ERROR: oe_runmake failed<br>
    | WARNING: exit code 1 from a shell command.<br>
    | ERROR: Function failed: do_compile (log file is located at
/home/deane/arago/tisdk-dora/build/arago-tmp-external-linaro-toolchain/work/am335x_evm-oe-linux-gnueabi/cryptodev/1.6-r1-arago1/temp/log.do_compile.4071)<br>
    ERROR: Task 2302
    (/home/deane/arago/tisdk-dora/sources/meta-arago/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb,
    do_compile) failed with exit code '1'<br>
    NOTE: Tasks Summary: Attempted 2387 tasks of which 2346 didn't need
    to be rerun and 1 failed.<br>
    Waiting for 0 running tasks to finish:<br>
    <br>
    Summary: 1 task failed:<br>
    &nbsp;
    /home/deane/arago/tisdk-dora/sources/meta-arago/meta-arago-extras/recipes-kernel/cryptodev/cryptodev_1.6.bb,
    do_compile<br>
    Summary: There was 1 WARNING message shown.<br>
    Summary: There was 1 ERROR message shown, returning a non-zero exit
    code.<br>
    <br>
    Thanks,<br>
    Dean<br>
    <br>
    <div class="moz-cite-prefix">On 5/23/2014 2:17 PM, Arago Project git
      wrote:<br>
    </div>
    <blockquote cite="mid:20140523191759.1158552AAF@arago-project.org"
      type="cite">
      <pre wrap="">Module: meta-ti
Branch: dora
Commit: 5548cad9ffb24e06f645c6c8ff843ba1b79c290d
URL:    <a class="moz-txt-link-freetext" href="http://arago-project.org/git/meta-ti.git?a=commit;h=5548cad9ffb24e06f645c6c8ff843ba1b79c290d">http://arago-project.org/git/meta-ti.git?a=commit;h=5548cad9ffb24e06f645c6c8ff843ba1b79c290d</a>

Author: Maupin, Chase <a class="moz-txt-link-rfc2396E" href="mailto:chase.maupin@ti.com">&lt;chase.maupin@ti.com&gt;</a>
Date:   Fri May 23 02:08:33 2014 +0000

linux-ti-staging: Add version 3.15 of TI integration kernel

* Add version 3.15 of the TI integration kernel.  Major changes
  from previous version are:
    * Config fragments now come primarily from the integration
      tree.  Removed baseport and connectivity fragments for now
      and the others can be removed as they are added to the
      integration tree.
    * Added a non-smp.cfg config to disable SMP for single core
      devices instead of using a patch to the defconfig file as
      we did in the past.
* Use the right SRCREV

Signed-off-by: Chase Maupin <a class="moz-txt-link-rfc2396E" href="mailto:Chase.Maupin@ti.com">&lt;Chase.Maupin@ti.com&gt;</a>
Signed-off-by: Denys Dmytriyenko <a class="moz-txt-link-rfc2396E" href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a>

---

 .../linux/linux-ti-staging-3.15/defconfig          |    1 +
 recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg |   18 ++++++
 .../linux/linux-ti-staging-3.15/non-smp.cfg        |    5 ++
 .../linux/linux-ti-staging-3.15/systest.cfg        |   20 +++++++
 recipes-kernel/linux/linux-ti-staging_3.15.bb      |   59 ++++++++++++++++++++
 5 files changed, 103 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/defconfig b/recipes-kernel/linux/linux-ti-staging-3.15/defconfig
new file mode 100644
index 0000000..926b35a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-3.15/defconfig
@@ -0,0 +1 @@
+use-kernel-config=omap2plus_defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg b/recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg
new file mode 100644
index 0000000..645dfdf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-3.15/ipc.cfg
@@ -0,0 +1,18 @@
+##################################################
+# IPC config options
+##################################################
+CONFIG_IOMMU_API=y
+CONFIG_IOMMU_SUPPORT=y
+CONFIG_OF_IOMMU=y
+CONFIG_OMAP_IOMMU=y
+CONFIG_OMAP_IOVMM=y
+CONFIG_OMAP_IOMMU_DEBUG=y
+CONFIG_VIRTIO=m
+CONFIG_RPMSG=m
+CONFIG_RPMSG_RPC=m
+CONFIG_REMOTEPROC=m
+CONFIG_OMAP_REMOTEPROC=m
+CONFIG_OMAP_REMOTEPROC_IPU=y
+CONFIG_OMAP_REMOTEPROC_DSP=y
+CONFIG_OMAP_REMOTEPROC_IPU1=y
+CONFIG_OMAP_REMOTEPROC_DSP2=y
diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg b/recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg
new file mode 100644
index 0000000..d61a413
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-3.15/non-smp.cfg
@@ -0,0 +1,5 @@
+##################################################
+# Non-SMP config options
+##################################################
+CONFIG_SMP=n
+CONFIG_NR_CPUS=n
diff --git a/recipes-kernel/linux/linux-ti-staging-3.15/systest.cfg b/recipes-kernel/linux/linux-ti-staging-3.15/systest.cfg
new file mode 100644
index 0000000..e21602f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-3.15/systest.cfg
@@ -0,0 +1,20 @@
+##################################################
+# Systest config options
+##################################################
+CONFIG_DEBUG_SPINLOCK=y
+CONFIG_DEBUG_MUTEXES=y
+CONFIG_DEBUG_KMEMLEAK=y
+CONFIG_DEVKMEM=y
+CONFIG_HAVE_DEBUG_KMEMLEAK=y
+CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=400
+CONFIG_DEBUG_KMEMLEAK_TEST=n
+CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=n
+CONFIG_DEBUG_LOCK_ALLOC=y
+CONFIG_DEBUG_INFO=y
+CONFIG_DEBUG_FS=y
+CONFIG_DEBUG_KERNEL=y
+CONFIG_PM_DEBUG=y
+CONFIG_DEBUG_GPIO=y
+CONFIG_USB_DEBUG=y
+CONFIG_SND_DEBUG=y
+CONFIG_RTC_DEBUG=y
diff --git a/recipes-kernel/linux/linux-ti-staging_3.15.bb b/recipes-kernel/linux/linux-ti-staging_3.15.bb
new file mode 100644
index 0000000..308a412
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging_3.15.bb
@@ -0,0 +1,59 @@
+SECTION = "kernel"
+DESCRIPTION = "Linux kernel for TI devices"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7">"file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"</a>
+
+inherit kernel
+
+require recipes-kernel/linux/linux-dtb.inc
+require recipes-kernel/linux/setup-defconfig.inc
+
+# Look in the generic major.minor directory for files
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}-3.15:"
+
+# Pull in the devicetree files into the rootfs
+RDEPENDS_kernel-base += "kernel-devicetree"
+
+# Add a run-time dependency for the PM firmware to be installed
+# on the target file system.
+RDEPENDS_kernel-base_append_ti33x = " am33x-cm3"
+RDEPENDS_kernel-base_append_ti43x = " am33x-cm3"
+
+# Add a run-time dependency for the VPE VPDMA firmware to be installed
+# on the target file system.
+RDEPENDS_kernel-base_append_dra7xx-evm = " vpe-vpdma-fw"
+
+# Default is to package all dtb files for ti33x devices unless building
+# for the specific beaglebone machine.
+KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
+KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb"
+KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
+KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
+KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
+
+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
+
+S = "${WORKDIR}/git"
+
+BRANCH = "ti-linux-3.15.y"
+
+SRCREV = "3fd9aad17d3b4d1d7ee50ae788c0a096921e7216"
+PV = "3.14+3.15-rc6"
+
+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+KERNEL_CONFIG_DIR = "ti_config_fragments"
+KERNEL_CONFIG_FRAGMENTS = "${WORKDIR}/ipc.cfg"
+KERNEL_CONFIG_FRAGMENTS_append_ti33x = "${WORKDIR}/non-smp.cfg"
+KERNEL_CONFIG_FRAGMENTS_append_ti43x = "${WORKDIR}/non-smp.cfg"
+
+SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
+           <a class="moz-txt-link-freetext" href="file://defconfig">file://defconfig</a> \
+           <a class="moz-txt-link-freetext" href="file://ipc.cfg">file://ipc.cfg</a> \
+           <a class="moz-txt-link-freetext" href="file://systest.cfg">file://systest.cfg</a> \
+           <a class="moz-txt-link-freetext" href="file://non-smp.cfg">file://non-smp.cfg</a> \
+          "

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------020502030307020801050702--
