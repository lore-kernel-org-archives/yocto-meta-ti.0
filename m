Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2FCB9E002FB
	for <meta-ti@yoctoproject.org>; Tue, 27 Aug 2013 18:28:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id F3CF052A24; Wed, 28 Aug 2013 01:28:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130828012812.F3CF052A24@arago-project.org>
Date: Wed, 28 Aug 2013 01:28:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging/linux-ti-glsdk: adjust DTB handling to new syntax
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
X-List-Received-Date: Wed, 28 Aug 2013 01:28:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 5a5d98c1ad6a456370d205b65c8dc65a64e23916
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5a5d98c1ad6a456370d205b65c8dc65a64e23916

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Aug 26 12:25:26 2013 -0400

linux-ti-staging/linux-ti-glsdk: adjust DTB handling to new syntax

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-glsdk_3.8.bb   |    6 +++---
 recipes-kernel/linux/linux-ti-staging_3.8.bb |   12 ++++++------
 recipes-kernel/linux/linux-ti-staging_git.bb |   14 +++++++-------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
index 9e3e499..5fd17f8 100644
--- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
@@ -9,8 +9,8 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
-KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-sevm.dts arch/arm/boot/dts/omap5-uevm.dts"
-KERNEL_DEVICETREE_dra7xx-evm = "arch/arm/boot/dts/dra7-evm.dts"
+KERNEL_DEVICETREE_omap5-evm = "omap5-sevm.dtb omap5-uevm.dtb"
+KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
 
 COMPATIBLE_MACHINE = "omap-a15"
 
@@ -24,7 +24,7 @@ SRCREV = "6076e6882d1d6a64b104e42e56a3eada36605cb3"
 PV = "3.8.13"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-3-8-y-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index 29ffebc..fd7b671 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -13,12 +13,12 @@ require recipes-kernel/linux/setup-defconfig.inc
 # on the target file system.
 RDEPENDS_kernel-base_ti33x += "am33x-cm3 am33x-cm3-initscript"
 
-# Default is to package all dts files for ti33x devices unless building
+# Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
-KERNEL_DEVICETREE_ti33x = "arch/arm/boot/dts/am335x-evm.dts arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-bone.dts"
-KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-bone.dts"
-KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-sevm.dts arch/arm/boot/dts/omap5-uevm.dts"
-KERNEL_DEVICETREE_dra7xx-evm = "arch/arm/boot/dts/dra7-evm.dts"
+KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb"
+KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb"
+KERNEL_DEVICETREE_omap5-evm = "omap5-sevm.dtb omap5-uevm.dtb"
+KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
 
 COMPATIBLE_MACHINE = "ti33x|omap-a15"
 
@@ -31,7 +31,7 @@ SRCREV = "f3cb62a800ae37f17a3382b10d155ee02dbc83fc"
 PV = "3.8.13"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "f+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "g+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index cb59dbb..7d84cc4 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -13,13 +13,13 @@ require recipes-kernel/linux/setup-defconfig.inc
 # on the target file system.
 RDEPENDS_kernel-base_ti33x += "am33x-cm3 am33x-cm3-initscript"
 
-# Default is to package all dts files for ti33x devices unless building
+# Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
-KERNEL_DEVICETREE_ti33x = "arch/arm/boot/dts/am335x-evm.dts arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-bone.dts"
-KERNEL_DEVICETREE_am437x-evm = "arch/arm/boot/dts/am43x-epos-evm.dts"
-KERNEL_DEVICETREE_beaglebone = "arch/arm/boot/dts/am335x-bone.dts"
-KERNEL_DEVICETREE_omap5-evm = "arch/arm/boot/dts/omap5-sevm.dts arch/arm/boot/dts/omap5-uevm.dts"
-KERNEL_DEVICETREE_dra7xx-evm = "arch/arm/boot/dts/dra7-evm.dts"
+KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb"
+KERNEL_DEVICETREE_am437x-evm = "am43x-epos-evm.dtb"
+KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb"
+KERNEL_DEVICETREE_omap5-evm = "omap5-sevm.dtb omap5-uevm.dtb"
+KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
@@ -35,7 +35,7 @@ SRCREV = "b36f4be3de1b123d8601de062e7dbfc904f305fb"
 PV = "3.10+3.11-rc6"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \


