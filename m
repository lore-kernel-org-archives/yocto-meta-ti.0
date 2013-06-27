Return-Path: <heroor@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB86BE005B3
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 06:49:08 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5RDn7IU002863
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 08:49:07 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5RDn7DC024273
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 08:49:07 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 08:49:07 -0500
Received: from ti.com (a0875592-linux.apr.dhcp.ti.com [172.24.145.76])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5RDn5O5022385;
	Thu, 27 Jun 2013 08:49:06 -0500
Date: Thu, 27 Jun 2013 19:19:05 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130627134905.GA6760@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] recipes-kernel: Add GLSDK specific kernel tree for omap-a15
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
X-List-Received-Date: Thu, 27 Jun 2013 13:49:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Machine compatible with only omap-a15 devices.
* The TI Staging tree will not be used to maintain K3.8. Instead,
  this new tree is set up as a production tree. Pending features
  for 3.8 will be implemented on this tree.
  - Backported features from linux mainline
  - Backported bug-fixes from linux mainline and linux-stable.
  - Features implemented by the GLSDK team which maybe product
    specific.
  This is the tree on which GLSDK kernel releases will be made.
* This recipe is based off the Core SDK 2013.04.02 released kernel
  recipe - recipes-kernel/linux/linux-ti-staging_3.8.bb

v2:
    Regenerate the patch using --find-copies-harder -M

Signed-off-by: Siddharth Heroor <heroor@ti.com>
cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 .../{linux-ti-staging => linux-ti-glsdk}/defconfig |    0
 ...nux-ti-staging_3.8.bb => linux-ti-glsdk_3.8.bb} |   16 ++++------------
 2 files changed, 4 insertions(+), 12 deletions(-)
 copy recipes-kernel/linux/{linux-ti-staging => linux-ti-glsdk}/defconfig (100%)
 copy recipes-kernel/linux/{linux-ti-staging_3.8.bb => linux-ti-glsdk_3.8.bb} (51%)

diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig b/recipes-kernel/linux/linux-ti-glsdk/defconfig
similarity index 100%
copy from recipes-kernel/linux/linux-ti-staging/defconfig
copy to recipes-kernel/linux/linux-ti-glsdk/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
similarity index 51%
copy from recipes-kernel/linux/linux-ti-staging_3.8.bb
copy to recipes-kernel/linux/linux-ti-glsdk_3.8.bb
index 29ffebc..8d66f84 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
@@ -1,5 +1,5 @@
 SECTION = "kernel"
-DESCRIPTION = "Linux kernel for TI devices"
+DESCRIPTION = "Linux kernel for TI devices supported by the GLSDK product"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 KERNEL_IMAGETYPE = "uImage"
@@ -9,22 +9,14 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
-# Add a run-time dependency for the PM firmware to be installed
-# on the target file system.
-RDEPENDS_kernel-base_ti33x += "am33x-cm3 am33x-cm3-initscript"
-
-# Default is to package all dts files for ti33x devices unless building
-# for the specific beaglebone machine.
-KERNEL_DEVICETREE_ti33x = "arch/arm/boot/dts/am335x-evm.dts arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-bone.dts"
-KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-bone.dts"
 KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-sevm.dts arch/arm/boot/dts/omap5-uevm.dts"
 KERNEL_DEVICETREE_dra7xx-evm = "arch/arm/boot/dts/dra7-evm.dts"
 
-COMPATIBLE_MACHINE = "ti33x|omap-a15"
+COMPATIBLE_MACHINE = "omap-a15"
 
 S = "${WORKDIR}/git"
 
-BRANCH = "ti-linux-3.8.y"
+BRANCH = "master"
 
 # This commit corresponds to ti2013.04.02 release tag
 SRCREV = "f3cb62a800ae37f17a3382b10d155ee02dbc83fc"
@@ -33,6 +25,6 @@ PV = "3.8.13"
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "f+gitr${SRCPV}"
 
-SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-3-8-y-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
           "
-- 
1.7.0.4


