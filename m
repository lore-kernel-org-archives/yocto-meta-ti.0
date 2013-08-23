Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10124E003D2
	for <meta-ti@yoctoproject.org>; Fri, 23 Aug 2013 13:05:50 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NK5nnA024319;
	Fri, 23 Aug 2013 15:05:49 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NK5ng9029380;
	Fri, 23 Aug 2013 15:05:49 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 23 Aug 2013 15:05:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NK5mNS016045;
	Fri, 23 Aug 2013 15:05:48 -0500
Date: Fri, 23 Aug 2013 16:05:47 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130823200546.GB27308@edge>
References: <1377287906-17115-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED101596DEF1F@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101596DEF1F@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/4] linux-ti-staging: add the latest integration tree in prep for 3.12 release
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
X-List-Received-Date: Fri, 23 Aug 2013 20:05:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 23, 2013 at 08:03:43PM +0000, Maupin, Chase wrote:
> Acked-by: Chase Maupin <chase.maupin@ti.com>
> 
> Although, I would ask why not call it _3.12 instead of _git.  But I'm OK 
> either way, just we will need to cut an _3.12 at some point.

Because it's 3.10+3.11-rc6 now :) Once 3.12 is released, I'll rename it. Same 
we did with 3.8 before.


> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> >Sent: Friday, August 23, 2013 2:58 PM
> >To: meta-ti@yoctoproject.org
> >Subject: [meta-ti] [PATCH 1/4] linux-ti-staging: add the latest
> >integration tree in prep for 3.12 release
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > recipes-kernel/linux/linux-ti-staging_git.bb | 42
> >++++++++++++++++++++++++++++
> > 1 file changed, 42 insertions(+)
> > create mode 100644 recipes-kernel/linux/linux-ti-staging_git.bb
> >
> >diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb
> >b/recipes-kernel/linux/linux-ti-staging_git.bb
> >new file mode 100644
> >index 0000000..cb59dbb
> >--- /dev/null
> >+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> >@@ -0,0 +1,42 @@
> >+SECTION = "kernel"
> >+DESCRIPTION = "Linux kernel for TI devices"
> >+LICENSE = "GPLv2"
> >+LIC_FILES_CHKSUM =
> >"file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> >+KERNEL_IMAGETYPE = "uImage"
> >+
> >+inherit kernel
> >+
> >+require recipes-kernel/linux/linux-dtb.inc
> >+require recipes-kernel/linux/setup-defconfig.inc
> >+
> >+# Add a run-time dependency for the PM firmware to be installed
> >+# on the target file system.
> >+RDEPENDS_kernel-base_ti33x += "am33x-cm3 am33x-cm3-initscript"
> >+
> >+# Default is to package all dts files for ti33x devices unless
> >building
> >+# for the specific beaglebone machine.
> >+KERNEL_DEVICETREE_ti33x = "arch/arm/boot/dts/am335x-evm.dts
> >arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-
> >bone.dts"
> >+KERNEL_DEVICETREE_am437x-evm = "arch/arm/boot/dts/am43x-epos-
> >evm.dts"
> >+KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-
> >bone.dts"
> >+KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-sevm.dts
> >arch/arm/boot/dts/omap5-uevm.dts"
> >+KERNEL_DEVICETREE_dra7xx-evm = "arch/arm/boot/dts/dra7-evm.dts"
> >+
> >+KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
> >+
> >+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
> >+
> >+DEFAULT_PREFERENCE = "-1"
> >+
> >+S = "${WORKDIR}/git"
> >+
> >+BRANCH = "ti-linux-3.12.y"
> >+
> >+SRCREV = "b36f4be3de1b123d8601de062e7dbfc904f305fb"
> >+PV = "3.10+3.11-rc6"
> >+
> >+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause
> >a rebuild
> >+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> >+
> >+SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-
> >kernel.git;protocol=git;branch=${BRANCH} \
> >+           file://defconfig \
> >+          "
> >--
> >1.8.3.2
> >
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

