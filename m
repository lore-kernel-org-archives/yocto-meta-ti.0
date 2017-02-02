Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 602E0E009D4; Thu,  2 Feb 2017 15:35:33 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D79E5E009C2
	for <meta-ti@yoctoproject.org>; Thu,  2 Feb 2017 15:35:29 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id D1C3652B46; Thu,  2 Feb 2017 23:35:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170202233528.D1C3652B46@arago-project.org>
Date: Thu,  2 Feb 2017 23:35:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: remove old 4.1 version
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
X-List-Received-Date: Thu, 02 Feb 2017 23:35:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: fb42bf85af5569786034fbfa839d6391e0f571d6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fb42bf85af5569786034fbfa839d6391e0f571d6

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb  2 04:36:52 2017 +0000

linux-ti-staging: remove old 4.1 version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti-staging-4.1/defconfig           |    1 -
 .../linux/linux-ti-staging-4.1/keystone/defconfig  |    1 -
 .../linux/linux-ti-staging-rt-4.1/defconfig        |    1 -
 .../linux-ti-staging-rt-4.1/keystone/defconfig     |    1 -
 recipes-kernel/linux/linux-ti-staging-rt_4.1.bb    |    9 --
 .../linux/linux-ti-staging-systest-4.1/defconfig   |    1 -
 .../keystone/defconfig                             |    1 -
 .../linux/linux-ti-staging-systest_4.1.bb          |    5 -
 recipes-kernel/linux/linux-ti-staging_4.1.bb       |   92 --------------------
 9 files changed, 0 insertions(+), 112 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/defconfig b/recipes-kernel/linux/linux-ti-staging-4.1/defconfig
deleted file mode 100644
index 990e7f7..0000000
--- a/recipes-kernel/linux/linux-ti-staging-4.1/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-combined-config=ti_config_fragments/defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-4.1/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-4.1/keystone/defconfig
deleted file mode 100644
index 470cf11..0000000
--- a/recipes-kernel/linux/linux-ti-staging-4.1/keystone/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-combined-config=ti_config_fragments/multi_core_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.1/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.1/defconfig
deleted file mode 100644
index 2091fca..0000000
--- a/recipes-kernel/linux/linux-ti-staging-rt-4.1/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-combined-config=ti_config_fragments/rt_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig
deleted file mode 100644
index 6d28753..0000000
--- a/recipes-kernel/linux/linux-ti-staging-rt-4.1/keystone/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-combined-config=ti_config_fragments/rt_multi_core_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
deleted file mode 100644
index 5671d45..0000000
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require linux-ti-staging_4.1.bb
-
-# Look in the generic major.minor directory for files
-# This will have priority over generic non-rt path
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"
-
-BRANCH = "ti-rt-linux-4.1.y"
-
-SRCREV = "3bef1493dbbc61880f09cfda285cd0032a501d41"
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.1/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.1/defconfig
deleted file mode 100644
index cfe4f99..0000000
--- a/recipes-kernel/linux/linux-ti-staging-systest-4.1/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-combined-config=ti_config_fragments/system_test_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.1/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.1/keystone/defconfig
deleted file mode 100644
index 68cfc25..0000000
--- a/recipes-kernel/linux/linux-ti-staging-systest-4.1/keystone/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-combined-config=ti_config_fragments/multi_core_system_test_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging-systest_4.1.bb b/recipes-kernel/linux/linux-ti-staging-systest_4.1.bb
deleted file mode 100644
index 30962e6..0000000
--- a/recipes-kernel/linux/linux-ti-staging-systest_4.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require linux-ti-staging_4.1.bb
-
-# Look in the generic major.minor directory for files
-# This will have priority over generic non-rt path
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
deleted file mode 100644
index ea1ed62..0000000
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ /dev/null
@@ -1,92 +0,0 @@
-SECTION = "kernel"
-DESCRIPTION = "Linux kernel for TI devices"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
-
-inherit kernel
-
-require recipes-kernel/linux/linux-dtb.inc
-require recipes-kernel/linux/setup-defconfig.inc
-require recipes-kernel/linux/cmem.inc
-require recipes-kernel/linux/ti-uio.inc
-
-# Look in the generic major.minor directory for files
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"
-
-# Pull in the devicetree files into the rootfs
-RDEPENDS_kernel-base += "kernel-devicetree"
-
-# Add a run-time dependency for the PM firmware to be installed
-# on the target file system.
-RDEPENDS_kernel-base_append_ti33x = " amx3-cm3"
-RDEPENDS_kernel-base_append_ti43x = " amx3-cm3"
-
-# Add a run-time dependency for the VPE VPDMA firmware to be installed
-# on the target file system.
-RDEPENDS_kernel-base_append_dra7xx = " vpdma-fw"
-
-# Install boot-monitor skern file into /boot dir of rootfs
-RDEPENDS_kernel-base_append_keystone = " boot-monitor"
-
-# Install ti-sci-fw into /boot dir of rootfs
-RDEPENDS_kernel-base_append_k2g-evm = " ti-sci-fw"
-
-# Add run-time dependency for SerDes firmware to the rootfs
-RDEPENDS_kernel-base_append_keystone = " serdes-fw"
-
-# Add run-time dependency for NETCP PA firmware to the rootfs
-RDEPENDS_kernel-base_append_k2hk-evm = " netcp-pa-fw"
-RDEPENDS_kernel-base_append_k2e-evm = " netcp-pa-fw"
-RDEPENDS_kernel-base_append_k2l-evm = " netcp-pa-fw"
-
-# Add run-time dependency for PRU Ethernet firmware to the rootfs
-RDEPENDS_kernel-base_append_am57xx-evm = " prueth-fw"
-RDEPENDS_kernel-base_append_am437x-evm = " prueth-fw"
-
-# Default is to package all dtb files for ti33x devices unless building
-# for the specific beaglebone machine.
-KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
-KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb"
-KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb"
-KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd.dtb dra72-evm.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd.dtb"
-KERNEL_DEVICETREE_dra7xx-hs-evm = "${KERNEL_DEVICETREE_dra7xx-evm}"
-KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-beagle-x15-es2plus.dtb am57xx-evm.dtb am57xx-evm-es2plus.dtb am572x-idk.dtb am571x-idk.dtb am572x-idk-lcd-osd.dtb am571x-idk-lcd-osd.dtb"
-KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
-KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
-KERNEL_DEVICETREE_am37x-evm = "omap3-evm-37xx.dtb"
-KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb"
-KERNEL_DEVICETREE_pandaboard = "omap4-panda.dtb omap4-panda-es.dtb"
-KERNEL_DEVICETREE_k2hk-evm = "k2hk-evm.dtb"
-KERNEL_DEVICETREE_k2e-evm = "k2e-evm.dtb"
-KERNEL_DEVICETREE_k2g-evm = "k2g-evm.dtb"
-KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
-
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap3|omap4|keystone"
-
-S = "${WORKDIR}/git"
-
-BRANCH = "ti-lsk-linux-4.1.y"
-
-SRCREV = "6b41ca0b945d73ac8c8318083f79411639836643"
-PV = "4.1.18+git${SRCPV}"
-
-# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "l"
-PR = "${MACHINE_KERNEL_PR}"
-
-KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-
-# SoC specific config fragments are not enabled yet
-KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${KERNEL_CONFIG_DIR}/am33xx_only.cfg"
-KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${KERNEL_CONFIG_DIR}/am43xx_only.cfg"
-KERNEL_CONFIG_FRAGMENTS_append_dra7xx = " ${KERNEL_CONFIG_DIR}/dra7_only.cfg"
-
-MULTI_CONFIG_BASE_SUFFIX = ""
-
-KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-KERNEL_GIT_PROTOCOL = "git"
-SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
-            file://defconfig"


