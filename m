Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E25CFC50B
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 22:15:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22918.1763763320118703430
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Nov 2025 14:15:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7DBAD40C81;
	Fri, 21 Nov 2025 22:15:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MUT1XrvzgSeI; Fri, 21 Nov 2025 22:15:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2F79140BD6;
	Fri, 21 Nov 2025 22:15:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E33B61758EA; Fri, 21 Nov 2025 17:15:13 -0500 (EST)
Date: Fri, 21 Nov 2025 17:15:13 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: rs@ti.com, afd@ti.com, a-christidis@ti.com,
	meta-ti@lists.yoctoproject.org, denys@konsulko.com
Subject: Re: [meta-ti][master][PATCH] ti-img-rogue-*: Migrate GPU driver
 version 24.2 -> 25.2
Message-ID: <20251121221513.GL3125@denix.org>
References: <20251117211517.785176-1-a-christidis@ti.com>
 <3165a1de-6525-4f7a-9795-dd00ffeccdab@ti.com>
 <20251118190921.GD3125@denix.org>
 <DEC9K3CR2WGF.2TLJJ2M5QQ6Q7@ti.com>
 <20251119145251.GG3125@denix.org>
 <c09abe97-c3cd-41e5-be55-dd611c7d65a9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c09abe97-c3cd-41e5-be55-dd611c7d65a9@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 21 Nov 2025 22:15:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19302

On Wed, Nov 19, 2025 at 11:19:59AM -0600, Ryan Eatmon wrote:
> 
> 
> On 11/19/2025 8:52 AM, Denys Dmytriyenko wrote:
> >On Tue, Nov 18, 2025 at 07:00:52PM -0600, Randolph Sapp via lists.yoctoproject.org wrote:
> >>On Tue Nov 18, 2025 at 1:09 PM CST, Denys Dmytriyenko wrote:
> >>>On Mon, Nov 17, 2025 at 05:22:51PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> >>>>On 11/17/25 3:15 PM, Antonios Christidis via lists.yoctoproject.org wrote:
> >>>>>From: Antonios Christidis <a-christidis@ti.com>
> >>>>>
> >>>>>New recipes for GPU DDK 25.2. Update BSP configuration files with new
> >>>>>preferred recipe versions.
> >>>>>
> >>>>>For the driver recipe, specifically unset the CC variable due to yocto
> >>>>>appending CROSS_COMPILE and CC, resulting in a warning for the
> >>>>>do_compile task:
> >>>>>
> >>>>>make[1]: aarch64-oe-linux-aarch64-oe-linux-gcc: No such file or directory
> >>>>>
> >>>>>Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> >>>>>---
> >>>>>  meta-beagle/conf/machine/include/beagle-bsp.inc        |  4 ++--
> >>>>>  meta-ti-bsp/conf/machine/include/ti-bsp.inc            |  4 ++--
> >>>>>  ....6643903.bb => ti-img-rogue-driver_25.2.6850647.bb} | 10 ++++++++--
> >>>>>  ....6643903.bb => ti-img-rogue-umlibs_25.2.6850647.bb} |  4 +---
> >>>>>  4 files changed, 13 insertions(+), 9 deletions(-)
> >>>>>  rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_24.2.6643903.bb => ti-img-rogue-driver_25.2.6850647.bb} (83%)
> >>>>>  rename meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_24.2.6643903.bb => ti-img-rogue-umlibs_25.2.6850647.bb} (98%)
> >>>>>
> >>>>>diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/conf/machine/include/beagle-bsp.inc
> >>>>>index 448e2086..5060e286 100644
> >>>>>--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
> >>>>>+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
> >>>>>@@ -19,7 +19,7 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_12 = ""
> >>>>>  BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_12 = "ti-sgx-ddk-km"
> >>>>>  BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_12 = "1.17%"
> >>>>>  BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_12 = "ti-img-rogue-driver"
> >>>>>-BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 = "24%"
> >>>>>+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 = "25%"
> >>>>>  BSP_MESA_PVR_VERSION:bsp-bb_org-6_12 = "24%"
> >>>>>  # GC320 support requires out-of-tree drivers not yet available in bb.org 6.12
> >>>>>@@ -40,7 +40,7 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_6 = ""
> >>>>>  BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-sgx-ddk-km"
> >>>>>  BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_6 = "1.17%"
> >>>>>  BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-img-rogue-driver"
> >>>>>-BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 = "24%"
> >>>>>+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 = "25%"
> >>>>>  BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 = "24%"
> >>>>>  # GC320 support requires out-of-tree drivers not yet available in bb.org 6.6
> >>>>>diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> >>>>>index 0ea7bd7b..eaa501c3 100644
> >>>>>--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> >>>>>+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> >>>>>@@ -45,7 +45,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2025.01%"
> >>>>>  BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_12 = "ti-sgx-ddk-km"
> >>>>>  BSP_SGX_DRIVER_VERSION:bsp-ti-6_12 = "1.17%"
> >>>>>  BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_12 = "ti-img-rogue-driver"
> >>>>>-BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 = "24%"
> >>>>>+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 = "25%"
> >>>>>  BSP_MESA_PVR_VERSION:bsp-ti-6_12 = "24%"
> >>>>>  # ==========
> >>>>>@@ -60,7 +60,7 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024.04%"
> >>>>>  BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-sgx-ddk-km"
> >>>>>  BSP_SGX_DRIVER_VERSION:bsp-ti-6_6 = "1.17%"
> >>>>>  BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
> >>>>>-BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
> >>>>>+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "25%"
> >>>>>  BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "24%"
> >>>>>  # GC320 support requires out-of-tree drivers not yet available in 6.6
> >>>>>diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850647.bb
> >>>>>similarity index 83%
> >>>>>rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
> >>>>>rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850647.bb
> >>>>>index ddb401a5..b2f5e4ea 100644
> >>>>>--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.2.6643903.bb
> >>>>>+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_25.2.6850647.bb
> >>>>>@@ -17,7 +17,8 @@ BRANCH = "linuxws/scarthgap/k6.12/${PV}"
> >>>>>  SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
> >>>>>-SRCREV = "8eaff654a8871118c08cfafe53795f57e3b6b396"
> >>>>>+SRCREV = "72723eea0cab47c20e5734c1c7b9a441ed2d74c2"
> >>>>>+
> >>>>
> >>>>Extra newline?
> >>>>
> >>>>>  TARGET_PRODUCT:j721e = "j721e_linux"
> >>>>>  TARGET_PRODUCT:j721s2 = "j721s2_linux"
> >>>>>@@ -29,7 +30,12 @@ TARGET_PRODUCT:j722s = "j722s_linux"
> >>>>>  PVR_BUILD = "release"
> >>>>>  PVR_WS = "lws-generic"
> >>>>>-EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
> >>>>>+EXTRA_OEMAKE += 'KERNELDIR="${KBUILD_OUTPUT}" BUILD=${PVR_BUILD} PVR_BUILD_DIR=${TARGET_PRODUCT} WINDOW_SYSTEM=${PVR_WS}'
> >>>>>+
> >>>>>+do_compile(){
> >>>>>+    unset CC
> >>>>
> >>>>This feels like something that could be fixed in the driver's makefile..
> >>>
> >>>I agree with Andrew - this seems like a bug in the corresponding Makefile,
> >>>where CC is already defined (with all the necessary flags), but it gets
> >>>composed again directly from CROSS_COMPILE, hence causing double-prefix.
> >>
> >>I disagree. The CC variable in their build system is supposed to either be a
> >>full host toolchain, gcc, or clang. It was never intended to be a cross
> >>compiler. If it is a cross compiler, then it's not to be used in conjunction
> >>with the CROSS_COMPILE variable.
> >
> >>In either case any extra arguments provided to
> >>the compiler in the CC variable will be stripped away.
> >
> >Not correct - from the make manual, see the clarification in parenthesis:
> >
> >The variables used in implicit rules fall into two classes: those that are
> >names of programs (like CC) and those that contain arguments for the programs
> >(like CFLAGS). (The "name of a program" may also contain some command
> >arguments, but it must start with an actual executable program name.) If a
> >variable value contains more than one argument, separate them with spaces.
> >
> >https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html
> >
> >As make itself doesn't care about host vs. cross compilation, it's a common
> >practice to set CC (or CXX, etc.) accordingly:
> >
> >$ make CC=$(PREFIX)-gcc
> 
> 
> I am all in support of doing this the "right way", but I'm going to
> take this specific patch because we have the same patch on scarthgap
> already.

Sorry for being a PITA, but scarthgap version of this patch didn't have any 
issues with CC. Just saying...


>  So we need to iterate on a second patch that cleans up
> this one, please.
> 
> 
> >
> >>The build system used on the km and um are the same, and the user mode
> >>components produce intermediaries that are executed on the host during
> >>compilation. This requirement dictated the above variable interaction.
> >>
> >>Yocto in particular is mixing CC and CROSS_COMPILE in ways I haven't seen on
> >>other build systems. It's also only doing this for kernel modules. Seems a
> >>little too niche.
> >>
> >>- Randolph
> >>
> >>>>>+    oe_runmake
> >>>>>+}
> >>>>>  do_install() {
> >>>>>      make -C ${STAGING_KERNEL_DIR} M=${B}/binary_${TARGET_PRODUCT}_${PVR_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=${D}${root_prefix} PREFIX=${STAGING_DIR_HOST} modules_install
> >>>>>diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.6850647.bb
> >>>>>similarity index 98%
> >>>>>rename from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
> >>>>>rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.6850647.bb
> >>>>>index 949c2d5d..e4b95f8e 100644
> >>>>>--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.2.6643903.bb
> >>>>>+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_25.2.6850647.bb
> >>>>>@@ -6,11 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
> >>>>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>>>>  COMPATIBLE_MACHINE = "j721e|j721s2|j784s4|j742s2|am62xx|am62pxx|j722s"
> >>>>>-PR = "r4"
> >>>>>-
> >>>>>  BRANCH = "linuxws/scarthgap/k6.12/${PV}"
> >>>>>  SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> >>>>>-SRCREV = "1ed9ee185cd876200e6747192854015b8e94a7b0"
> >>>>>+SRCREV = "adcbb5c620ff172da4152c02a2fee8f42dc4c472"
> >>>>>  TARGET_PRODUCT:j721e = "j721e_linux"
> >>>>>  TARGET_PRODUCT:j721s2 = "j721s2_linux"

