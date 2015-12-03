Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0230E00888; Thu,  3 Dec 2015 07:43:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6DD8BE0088C
	for <meta-ti@yoctoproject.org>; Thu,  3 Dec 2015 07:43:22 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B0EF152A5A; Thu,  3 Dec 2015 15:43:21 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151203154321.B0EF152A5A@arago-project.org>
Date: Thu,  3 Dec 2015 15:43:21 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: remove outdated 3.12 version
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
X-List-Received-Date: Thu, 03 Dec 2015 15:43:23 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 163786e74a8d15f4828be06e5fcf7b0591f7fa32
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=163786e74a8d15f4828be06e5fcf7b0591f7fa32

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Dec  3 10:42:26 2015 -0500

linux-ti-staging: remove outdated 3.12 version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...ge-ARM-config-omap-Disable-SMP-for-AM335x.patch |   45 --------------
 .../linux/linux-ti-staging-3.12/baseport.cfg       |    8 ---
 .../linux/linux-ti-staging-3.12/connectivity.cfg   |   14 -----
 .../linux/linux-ti-staging-3.12/defconfig          |    1 -
 recipes-kernel/linux/linux-ti-staging-3.12/ipc.cfg |   18 ------
 .../linux/linux-ti-staging-3.12/systest.cfg        |   20 ------
 recipes-kernel/linux/linux-ti-staging_3.12.bb      |   62 --------------------
 7 files changed, 0 insertions(+), 168 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-3.12/0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch b/recipes-kernel/linux/linux-ti-staging-3.12/0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
deleted file mode 100644
index a389e5c..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.12/0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From bd9c0b09db8798815cb577f82beebf7e6c03edcd Mon Sep 17 00:00:00 2001
-From: Santosh Shilimkar <santosh.shilimkar@ti.com>
-Date: Thu, 13 Feb 2014 08:52:41 -0500
-Subject: [PATCH] Not-for-merge: ARM: config: omap: Disable SMP for AM335x
- build
-
-SMP and SMP_ON_UP introduces some extra barriers and code many fast paths
-including kernel lock functions.
-
-Performance sensitive usecases like networking gets impacted because of this.
-In typical production kernel which is targeted for single core device
-like AM335x family, you don't want to take this hit.
-
-Ideally one should just create a device specific config feed as done by all
-typical distro's. Other option is to apply this specifically during build
-time using recipe.
-
-Whichever option, one definitely don't want this overhead for performance
-critical usecases.
-
-Disabling SMP in the build introduces one warining in cpuidle44xx.c driver
-and fix is included in the series
-
-Signed-off-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- arch/arm/configs/omap2plus_defconfig | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
-index ff579a7..25217e3 100644
---- a/arch/arm/configs/omap2plus_defconfig
-+++ b/arch/arm/configs/omap2plus_defconfig
-@@ -36,8 +36,6 @@ CONFIG_OMAP4_ERRATA_I688=y
- CONFIG_ARM_THUMBEE=y
- CONFIG_ARM_ERRATA_411920=y
- CONFIG_PCIE_DRA7XX=y
--CONFIG_SMP=y
--CONFIG_NR_CPUS=2
- CONFIG_CMA=y
- CONFIG_PREEMPT_VOLUNTARY=y
- CONFIG_LEDS=y
--- 
-1.8.3.2
-
diff --git a/recipes-kernel/linux/linux-ti-staging-3.12/baseport.cfg b/recipes-kernel/linux/linux-ti-staging-3.12/baseport.cfg
deleted file mode 100644
index 8dc24af..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.12/baseport.cfg
+++ /dev/null
@@ -1,8 +0,0 @@
-##################################################
-# Baseport Config Options
-##################################################
-CONFIG_CRYPTO_HW=y
-CONFIG_CRYPTO_DEV_OMAP_AES=y
-CONFIG_CRYPTO_DEV_OMAP_SHAM=y
-CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=n
diff --git a/recipes-kernel/linux/linux-ti-staging-3.12/connectivity.cfg b/recipes-kernel/linux/linux-ti-staging-3.12/connectivity.cfg
deleted file mode 100644
index bf18dae..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.12/connectivity.cfg
+++ /dev/null
@@ -1,14 +0,0 @@
-##################################################
-# Connectivity Configs
-##################################################
-CONFIG_MTD_NAND_OMAP_BCH=y
-CONFIG_MTD_TESTS=m
-CONFIG_SPI_SPIDEV=y
-CONFIG_USB_TEST=m
-CONFIG_USB_ACM=y
-CONFIG_USB_SERIAL_PL2303=y
-CONFIG_USB_PRINTER=y
-CONFIG_USB_NET_AX8817X=y
-CONFIG_USB_G_MULTI=m
-CONFIG_USB_G_MULTI_RNDIS=y
-CONFIG_USB_G_MULTI_CDC=y
diff --git a/recipes-kernel/linux/linux-ti-staging-3.12/defconfig b/recipes-kernel/linux/linux-ti-staging-3.12/defconfig
deleted file mode 100644
index 926b35a..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.12/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-kernel-config=omap2plus_defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging-3.12/ipc.cfg b/recipes-kernel/linux/linux-ti-staging-3.12/ipc.cfg
deleted file mode 100644
index 645dfdf..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.12/ipc.cfg
+++ /dev/null
@@ -1,18 +0,0 @@
-##################################################
-# IPC config options
-##################################################
-CONFIG_IOMMU_API=y
-CONFIG_IOMMU_SUPPORT=y
-CONFIG_OF_IOMMU=y
-CONFIG_OMAP_IOMMU=y
-CONFIG_OMAP_IOVMM=y
-CONFIG_OMAP_IOMMU_DEBUG=y
-CONFIG_VIRTIO=m
-CONFIG_RPMSG=m
-CONFIG_RPMSG_RPC=m
-CONFIG_REMOTEPROC=m
-CONFIG_OMAP_REMOTEPROC=m
-CONFIG_OMAP_REMOTEPROC_IPU=y
-CONFIG_OMAP_REMOTEPROC_DSP=y
-CONFIG_OMAP_REMOTEPROC_IPU1=y
-CONFIG_OMAP_REMOTEPROC_DSP2=y
diff --git a/recipes-kernel/linux/linux-ti-staging-3.12/systest.cfg b/recipes-kernel/linux/linux-ti-staging-3.12/systest.cfg
deleted file mode 100644
index e21602f..0000000
--- a/recipes-kernel/linux/linux-ti-staging-3.12/systest.cfg
+++ /dev/null
@@ -1,20 +0,0 @@
-##################################################
-# Systest config options
-##################################################
-CONFIG_DEBUG_SPINLOCK=y
-CONFIG_DEBUG_MUTEXES=y
-CONFIG_DEBUG_KMEMLEAK=y
-CONFIG_DEVKMEM=y
-CONFIG_HAVE_DEBUG_KMEMLEAK=y
-CONFIG_DEBUG_KMEMLEAK_EARLY_LOG_SIZE=400
-CONFIG_DEBUG_KMEMLEAK_TEST=n
-CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=n
-CONFIG_DEBUG_LOCK_ALLOC=y
-CONFIG_DEBUG_INFO=y
-CONFIG_DEBUG_FS=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_PM_DEBUG=y
-CONFIG_DEBUG_GPIO=y
-CONFIG_USB_DEBUG=y
-CONFIG_SND_DEBUG=y
-CONFIG_RTC_DEBUG=y
diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
deleted file mode 100644
index dd68b8e..0000000
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ /dev/null
@@ -1,62 +0,0 @@
-SECTION = "kernel"
-DESCRIPTION = "Linux kernel for TI devices"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-inherit kernel
-
-require recipes-kernel/linux/linux-dtb.inc
-require recipes-kernel/linux/setup-defconfig.inc
-
-# Look in the generic major.minor directory for files
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.12:"
-
-# Pull in the devicetree files into the rootfs
-RDEPENDS_kernel-base += "kernel-devicetree"
-
-# Add a run-time dependency for the PM firmware to be installed
-# on the target file system.
-RDEPENDS_kernel-base_append_ti33x = " am33x-cm3"
-RDEPENDS_kernel-base_append_ti43x = " am33x-cm3"
-
-# Add a run-time dependency for the VPE VPDMA firmware to be installed
-# on the target file system.
-RDEPENDS_kernel-base_append_dra7xx = " vpdma-fw"
-
-# Default is to package all dtb files for ti33x devices unless building
-# for the specific beaglebone machine.
-KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
-KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb"
-KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
-KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx = "dra7-evm.dtb"
-
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
-
-S = "${WORKDIR}/git"
-
-BRANCH = "ti-linux-3.12.y"
-
-SRCREV = "68f449afccf6d1fb6b38bddfc3a40d9e97b53bdf"
-PV = "3.12.30+git${SRCPV}"
-
-# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
-PR = "${MACHINE_KERNEL_PR}"
-
-KERNEL_CONFIG_FRAGMENTS = "${WORKDIR}/baseport.cfg ${WORKDIR}/connectivity.cfg \
-                           ${WORKDIR}/ipc.cfg"
-
-SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
-           file://defconfig \
-           file://baseport.cfg \
-           file://connectivity.cfg \
-           file://ipc.cfg \
-           file://systest.cfg \
-          "
-
-# Disable SMP in defconfig on single-core platforms to reduce overhead
-SRC_URI_append_ti33x = "file://0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
-SRC_URI_append_ti43x = "file://0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"


