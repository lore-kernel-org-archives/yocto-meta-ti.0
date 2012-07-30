Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81F5DE0027D
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 15:10:51 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6UMAoLX009621;
	Mon, 30 Jul 2012 17:10:50 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6UMAoRA015013;
	Mon, 30 Jul 2012 17:10:50 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 30 Jul 2012 17:10:50 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q6UMAowd014485;
	Mon, 30 Jul 2012 17:10:50 -0500
Date: Mon, 30 Jul 2012 18:10:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <20120730221049.GB23003@edge>
References: <1343126062-26998-1-git-send-email-vladimir_zapolskiy@mentor.com>
	<5016E705.7040806@mentor.com>
MIME-Version: 1.0
In-Reply-To: <5016E705.7040806@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] linux-omap-psp 2.6.32: fix am37x-evm failing build
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
X-List-Received-Date: Mon, 30 Jul 2012 22:10:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 30, 2012 at 10:56:53PM +0300, Vladimir Zapolskiy wrote:
> Hi,
> 
> any comments about the issue? Should I firstly create a bug in
> http://bugzilla.yoctoproject.org, if I want to fix the problem?

I would rather try updating it to 2.6.37 - hopefully that one doesn't have 
this issue with recent binutils... Do you have any specific requirements to 
stay with 2.6.32 instead? If not, 2.6.37 is what is being released as part of 
SDK for AM37x EVM - I'll look into porting it into meta-ti...

-- 
Denys


> On 24.07.2012 13:34, Vladimir Zapolskiy wrote:
> >This change adds an additional patch to the Linux kernel to avoid a
> >compilation time problem with recent toolchains:
> >
> >  Error: selected processor does not support ARM mode `smc #0'
> >
> >With recent toolchains the `smc #0' instruction may be used either in
> >assembler sources without .arch directive, or `.arch_extension sec' shall
> >precede it.
> >
> >Signed-off-by: Vladimir Zapolskiy<vladimir_zapolskiy@mentor.com>
> >---
> >Changes from v1 to v2:
> >  * instead of exclusion of problematic pathes this version fixes them,
> >    one more patch is added
> >
> >  ...7-add-explicit-.arch_extension-into-assem.patch |   59 ++++++++++++++++++++
> >  recipes-kernel/linux/linux-omap-psp_2.6.32.bb      |    1 +
> >  2 files changed, 60 insertions(+)
> >  create mode 100644 recipes-kernel/linux/linux-omap-psp-2.6.32/0001-ARM-sysfs_v7-add-explicit-.arch_extension-into-assem.patch
> >
> >diff --git a/recipes-kernel/linux/linux-omap-psp-2.6.32/0001-ARM-sysfs_v7-add-explicit-.arch_extension-into-assem.patch b/recipes-kernel/linux/linux-omap-psp-2.6.32/0001-ARM-sysfs_v7-add-explicit-.arch_extension-into-assem.patch
> >new file mode 100644
> >index 0000000..438605f
> >--- /dev/null
> >+++ b/recipes-kernel/linux/linux-omap-psp-2.6.32/0001-ARM-sysfs_v7-add-explicit-.arch_extension-into-assem.patch
> >@@ -0,0 +1,59 @@
> >+From 9ef8994ca43905bfee6af59e0fb0cedde9872f6c Mon Sep 17 00:00:00 2001
> >+From: Vladimir Zapolskiy<vladimir_zapolskiy@mentor.com>
> >+Date: Mon, 23 Jul 2012 22:18:29 +0300
> >+Subject: [PATCH] ARM: sysfs_v7: add explicit .arch_extension into assembler
> >+ code
> >+
> >+The change fixes a compilation problem with binutils-2.21 or higher:
> >+
> >+  Error: selected processor does not support ARM mode `smc #0'
> >+
> >+With recent toolchains the `smc #0' instruction may be used either in
> >+assembler sources without .arch directive, or `.arch_extension sec' shall
> >+precede it.
> >+
> >+Signed-off-by: Vladimir Zapolskiy<vladimir_zapolskiy@mentor.com>
> >+---
> >+ arch/arm/kernel/Makefile   |    1 +
> >+ arch/arm/kernel/sysfs_v7.c |    6 ++++++
> >+ 2 files changed, 7 insertions(+)
> >+
> >+diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
> >+index ee20134..bb3bc7e 100644
> >+--- a/arch/arm/kernel/Makefile
> >++++ b/arch/arm/kernel/Makefile
> >+@@ -39,6 +39,7 @@ obj-$(CONFIG_KGDB)		+= kgdb.o
> >+ obj-$(CONFIG_ARM_UNWIND)	+= unwind.o
> >+ obj-$(CONFIG_HAVE_TCM)		+= tcm.o
> >+ obj-$(CONFIG_CPU_V7_SYSFS)	+= sysfs_v7.o
> >++CFLAGS_sysfs_v7.o	:=$(call as-instr,.arch_extension sec,-DREQUIRES_SEC=1)
> >+
> >+ obj-$(CONFIG_CRUNCH)		+= crunch.o crunch-bits.o
> >+ AFLAGS_crunch-bits.o		:= -Wa,-mcpu=ep9312
> >+diff --git a/arch/arm/kernel/sysfs_v7.c b/arch/arm/kernel/sysfs_v7.c
> >+index 5ed32fb..d357b52 100644
> >+--- a/arch/arm/kernel/sysfs_v7.c
> >++++ b/arch/arm/kernel/sysfs_v7.c
> >+@@ -78,6 +78,9 @@ static ssize_t aux_ctl_store(struct sys_device *dev,
> >+ 	val&= ~2;
> >+ 	asm ("mov r0,  %0	\n\t"
> >+ 	     "mov r12, #3	\n\t"
> >++#ifdef REQUIRES_SEC
> >++	     ".arch_extension sec\n\t"
> >++#endif
> >+ 	     "smc #0		\n\t"
> >+ 	     :: "r"(val) : "r0", "r12");
> >+
> >+@@ -109,6 +112,9 @@ static ssize_t l2_aux_ctl_store(struct sys_device *dev,
> >+ 	SETBITS(val, 0xbc00000, new);
> >+ 	asm ("mov r0,  %0	\n\t"
> >+ 	     "mov r12, #2	\n\t"
> >++#ifdef REQUIRES_SEC
> >++	     ".arch_extension sec\n\t"
> >++#endif
> >+ 	     "smc #0		\n\t"
> >+ 	     :: "r"(val) : "r0", "r12");
> >+
> >+--
> >+1.7.10
> >+
> >diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.32.bb b/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
> >index 61fc24f..2cfad0c 100644
> >--- a/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
> >+++ b/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
> >@@ -139,6 +139,7 @@ SRC_URI += "git://arago-project.org/git/projects/linux-omap3.git;protocol=git;br
> >             file://0001-PSP-3.0.1.6-kernel-source-patched-with-OCF-Linux.patch \
> >             file://porches.patch \
> >             file://0001-cgroupfs-create-sys-fs-cgroup-to-mount-cgroupfs-on.patch \
> >+           file://0001-ARM-sysfs_v7-add-explicit-.arch_extension-into-assem.patch \
> >             file://defconfig"
> >
> >  SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \

