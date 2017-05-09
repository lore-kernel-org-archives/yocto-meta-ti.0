Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CC2FAE00B23; Tue,  9 May 2017 11:16:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 726EBE00ACD
	for <meta-ti@yoctoproject.org>; Tue,  9 May 2017 11:16:35 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BF55620B85;
	Tue,  9 May 2017 18:06:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id HeG6KlVPMe4U; Tue,  9 May 2017 18:06:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7D5C9200BB;
	Tue,  9 May 2017 18:06:49 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D35C11624AC;
	Tue,  9 May 2017 14:06:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue,  9 May 2017 14:06:46 -0400
Message-Id: <1494353208-50981-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH 1/3] linux-ti-staging: remove version 4.4
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
X-List-Received-Date: Tue, 09 May 2017 18:16:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../linux/linux-ti-staging-4.4/defconfig           |  1 -
 .../linux/linux-ti-staging-4.4/dra7xx/defconfig    |  1 -
 .../linux/linux-ti-staging-4.4/k2g/defconfig       |  1 -
 .../linux/linux-ti-staging-4.4/keystone/defconfig  |  1 -
 .../linux/linux-ti-staging-4.4/ti33x/defconfig     |  1 -
 .../linux/linux-ti-staging-4.4/ti43x/defconfig     |  1 -
 .../linux/linux-ti-staging-rt-4.4/defconfig        |  1 -
 .../linux/linux-ti-staging-rt-4.4/dra7xx/defconfig |  1 -
 .../linux/linux-ti-staging-rt-4.4/k2g/defconfig    |  1 -
 .../linux-ti-staging-rt-4.4/keystone/defconfig     |  1 -
 .../linux/linux-ti-staging-rt-4.4/ti33x/defconfig  |  1 -
 .../linux/linux-ti-staging-rt-4.4/ti43x/defconfig  |  1 -
 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb    |  9 ---
 .../linux/linux-ti-staging-systest-4.4/defconfig   |  1 -
 .../linux-ti-staging-systest-4.4/dra7xx/defconfig  |  1 -
 .../linux-ti-staging-systest-4.4/k2g/defconfig     |  1 -
 .../keystone/defconfig                             |  1 -
 .../linux-ti-staging-systest-4.4/ti33x/defconfig   |  1 -
 .../linux-ti-staging-systest-4.4/ti43x/defconfig   |  1 -
 .../linux/linux-ti-staging-systest_4.4.bb          |  5 --
 recipes-kernel/linux/linux-ti-staging_4.4.bb       | 94 ----------------------
 21 files changed, 126 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-4.4/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-4.4/dra7xx/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-4.4/k2g/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-4.4/keystone/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-4.4/ti33x/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-4.4/ti43x/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.4/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.4/dra7xx/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.4/k2g/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.4/keystone/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.4/ti33x/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.4/ti43x/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-systest-4.4/dra7xx/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-systest-4.4/ti33x/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-systest-4.4/ti43x/defconfig
 delete mode 100644 recipes-kernel/linux/linux-ti-staging-systest_4.4.bb
 delete mode 100644 recipes-kernel/linux/linux-ti-staging_4.4.bb

diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/defconfig b/recipes-kernel/linux/linux-ti-staging-4.4/defconfig
deleted file mode 100644
index d083d18..0000000
--- a/recipes-kernel/linux/linux-ti-staging-4.4/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_omap2_release
diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-4.4/dra7xx/defconfig
deleted file mode 100644
index dcb53ba..0000000
--- a/recipes-kernel/linux/linux-ti-staging-4.4/dra7xx/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_dra7x_release
diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/k2g/defconfig b/recipes-kernel/linux/linux-ti-staging-4.4/k2g/defconfig
deleted file mode 100644
index 316b04b..0000000
--- a/recipes-kernel/linux/linux-ti-staging-4.4/k2g/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_k2g_release
diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-4.4/keystone/defconfig
deleted file mode 100644
index 5a40b93..0000000
--- a/recipes-kernel/linux/linux-ti-staging-4.4/keystone/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_keystone_release
diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-4.4/ti33x/defconfig
deleted file mode 100644
index 88f80fa..0000000
--- a/recipes-kernel/linux/linux-ti-staging-4.4/ti33x/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_am3x_release
diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-4.4/ti43x/defconfig
deleted file mode 100644
index 4b9daaf..0000000
--- a/recipes-kernel/linux/linux-ti-staging-4.4/ti43x/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_am4x_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.4/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.4/defconfig
deleted file mode 100644
index f0b8bab..0000000
--- a/recipes-kernel/linux/linux-ti-staging-rt-4.4/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_omap2_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.4/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.4/dra7xx/defconfig
deleted file mode 100644
index 47e3d04..0000000
--- a/recipes-kernel/linux/linux-ti-staging-rt-4.4/dra7xx/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_dra7x_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.4/k2g/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.4/k2g/defconfig
deleted file mode 100644
index a9c24f2..0000000
--- a/recipes-kernel/linux/linux-ti-staging-rt-4.4/k2g/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_k2g_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.4/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.4/keystone/defconfig
deleted file mode 100644
index fc68085..0000000
--- a/recipes-kernel/linux/linux-ti-staging-rt-4.4/keystone/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_keystone_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.4/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.4/ti33x/defconfig
deleted file mode 100644
index 0a4fbac..0000000
--- a/recipes-kernel/linux/linux-ti-staging-rt-4.4/ti33x/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_am3x_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.4/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.4/ti43x/defconfig
deleted file mode 100644
index 99594c8..0000000
--- a/recipes-kernel/linux/linux-ti-staging-rt-4.4/ti43x/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_am4x_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
deleted file mode 100644
index ce97991..0000000
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require linux-ti-staging_4.4.bb
-
-# Look in the generic major.minor directory for files
-# This will have priority over generic non-rt path
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
-
-BRANCH = "ti-rt-linux-4.4.y"
-
-SRCREV = "00eb0a0737110139728384e2be21656f9669f8a8"
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig
deleted file mode 100644
index 5d051bd..0000000
--- a/recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_omap2_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/dra7xx/defconfig
deleted file mode 100644
index 2b3635c..0000000
--- a/recipes-kernel/linux/linux-ti-staging-systest-4.4/dra7xx/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_dra7x_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g/defconfig
deleted file mode 100644
index abfb330..0000000
--- a/recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_k2g_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig
deleted file mode 100644
index e95bcf9..0000000
--- a/recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_keystone_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti33x/defconfig
deleted file mode 100644
index 9ab6733..0000000
--- a/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti33x/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_am3x_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti43x/defconfig
deleted file mode 100644
index 825c31c..0000000
--- a/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti43x/defconfig
+++ /dev/null
@@ -1 +0,0 @@
-use-tisdk-config=ti_sdk_am4x_debug
diff --git a/recipes-kernel/linux/linux-ti-staging-systest_4.4.bb b/recipes-kernel/linux/linux-ti-staging-systest_4.4.bb
deleted file mode 100644
index d8e9779..0000000
--- a/recipes-kernel/linux/linux-ti-staging-systest_4.4.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require linux-ti-staging_4.4.bb
-
-# Look in the generic major.minor directory for files
-# This will have priority over generic non-rt path
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
deleted file mode 100644
index d553b13..0000000
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ /dev/null
@@ -1,94 +0,0 @@
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
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
-
-# Pull in the devicetree files into the rootfs
-RDEPENDS_kernel-base += "kernel-devicetree"
-
-# Add run-time dependency for PM firmware to the rootfs
-RDEPENDS_kernel-base_append_ti33x = " amx3-cm3"
-RDEPENDS_kernel-base_append_ti43x = " amx3-cm3"
-
-# Add run-time dependency for VPE VPDMA firmware to the rootfs
-RDEPENDS_kernel-base_append_dra7xx = " vpdma-fw"
-
-# Add run-time dependency for Goodix firmware to the rootfs
-RDEPENDS_kernel-base_append_dra7xx = " goodix-fw"
-
-# Install boot-monitor skern file into /boot dir of rootfs
-RDEPENDS_kernel-base_append_keystone = " boot-monitor"
-
-# Install ti-sci-fw into /boot dir of rootfs
-RDEPENDS_kernel-base_append_k2g = " ti-sci-fw"
-
-# Add run-time dependency for SerDes firmware to the rootfs
-RDEPENDS_kernel-base_append_keystone = " serdes-fw"
-
-# Add run-time dependency for QMSS PDSP firmware to the rootfs
-RDEPENDS_kernel-base_append_keystone = " qmss-pdsp-fw"
-
-# Add run-time dependency for NETCP PA firmware to the rootfs
-RDEPENDS_kernel-base_append_k2hk = " netcp-pa-fw"
-RDEPENDS_kernel-base_append_k2e = " netcp-pa-fw"
-RDEPENDS_kernel-base_append_k2l-evm = " netcp-pa-fw"
-
-# Add run-time dependency for PRU Ethernet firmware to the rootfs
-RDEPENDS_kernel-base_append_am57xx-evm = " prueth-fw"
-RDEPENDS_kernel-base_append_am437x-evm = " prueth-fw"
-RDEPENDS_kernel-base_append_am335x-evm = " prueth-fw"
-RDEPENDS_kernel-base_append_k2g = " prueth-fw"
-
-# Default is to package all dtb files for ti33x devices unless building
-# for the specific beaglebone machine.
-KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb am335x-icev2.dtb"
-KERNEL_DEVICETREE_ti43x = "am43x-epos-evm.dtb am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb am437x-sk-evm.dtb am437x-idk-evm.dtb"
-KERNEL_DEVICETREE_beaglebone = "am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
-KERNEL_DEVICETREE_omap5-evm = "omap5-uevm.dtb"
-KERNEL_DEVICETREE_dra7xx-evm = "dra7-evm.dtb dra7-evm-lcd-lg.dtb dra7-evm-lcd-osd.dtb dra7-evm-lcd-osd101t2587.dtb \
-                                dra72-evm.dtb dra72-evm-lcd-lg.dtb dra72-evm-lcd-osd.dtb dra72-evm-lcd-osd101t2587.dtb \
-                                dra72-evm-revc.dtb dra72-evm-revc-lcd-osd101t2045.dtb dra72-evm-revc-lcd-osd101t2587.dtb \
-                                dra71-evm.dtb dra71-evm-lcd-auo-g101evn01.0.dtb"
-KERNEL_DEVICETREE_dra7xx-hs-evm = "${KERNEL_DEVICETREE_dra7xx-evm}"
-KERNEL_DEVICETREE_am57xx-evm = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb \
-                                am57xx-evm.dtb am57xx-evm-reva3.dtb \
-                                am571x-idk.dtb am571x-idk-lcd-osd.dtb am571x-idk-lcd-osd101t2587.dtb \
-                                am572x-idk.dtb am572x-idk-lcd-osd.dtb am572x-idk-lcd-osd101t2587.dtb"
-KERNEL_DEVICETREE_am57xx-hs-evm = "${KERNEL_DEVICETREE_am57xx-evm}"
-KERNEL_DEVICETREE_omap3 = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-xm-ab.dtb omap3-evm.dtb omap3-evm-37xx.dtb am3517-evm.dtb"
-KERNEL_DEVICETREE_am3517-evm = "am3517-evm.dtb"
-KERNEL_DEVICETREE_am37x-evm = "omap3-evm-37xx.dtb"
-KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beagle-xm-ab.dtb"
-KERNEL_DEVICETREE_pandaboard = "omap4-panda.dtb omap4-panda-a4.dtb omap4-panda-es.dtb"
-KERNEL_DEVICETREE_k2hk = "keystone-k2hk-evm.dtb"
-KERNEL_DEVICETREE_k2e = "keystone-k2e-evm.dtb"
-KERNEL_DEVICETREE_k2g = "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb keystone-k2g-ice.dtb"
-KERNEL_DEVICETREE_k2l-evm = "keystone-k2l-evm.dtb"
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap3|omap4|keystone"
-
-S = "${WORKDIR}/git"
-
-BRANCH = "ti-lsk-linux-4.4.y"
-
-SRCREV = "ecd4eada6ffe24c7edde11a66e406ac96ab557f5"
-PV = "4.4.54+git${SRCPV}"
-
-# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
-PR = "${MACHINE_KERNEL_PR}"
-
-KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-KERNEL_GIT_PROTOCOL = "git"
-SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
-            file://defconfig"
-- 
2.7.4


