Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF21CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 13:28:53 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.14328.1758202125947941316
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 06:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QWVynGuY;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58IDSiBh495558;
	Thu, 18 Sep 2025 08:28:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758202124;
	bh=BNJZMi9s6GDkXxV5Y9Mhk0qrKiBFr8qSDQ2zZcqKq6M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QWVynGuYbu4OZdTlD3FZQQyv0D3l7kiCdlBR7BUL8NCEccfMEzDScB6atUUnwnE/+
	 qJyb2hf/wkQ3OeHy7C44+kSCCfTofQLGjDNPAF1cb0qOtNxf3SX35ZpeZ3p5wBwzgM
	 cySjjE+98CFa7MA0bCVO9ClQlHDS70QlQ5PFugm0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58IDSiRa1577843
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 08:28:44 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 08:28:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 08:28:44 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58IDShh5651606;
	Thu, 18 Sep 2025 08:28:44 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 2/5] ti-bsp: Do not remove gpu MACHINE_FEATURE conditionally on BSP version
Date: Thu, 18 Sep 2025 08:28:39 -0500
Message-ID: <20250918132842.1183883-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250918132842.1183883-1-afd@ti.com>
References: <20250918132842.1183883-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Sep 2025 13:28:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19031

Setting or removing the gpu MACHINE_FEATURE does not actually change
if the GPU driver is built or not. That is done based on the setting
of the BSP_{SGX,ROGUE}_{DRIVER,UMLIBS}_{PROVIDER,VERSION} vars. These
are default empty for BSP versions without supported GPU drivers, which
will correctly cause a fallback to SW rendering when the GPU driver is
not available.

As the "gpu" MACHINE_FEATURE now has no uses, remove it from all the
machine config include files.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/beagleplay-ti.conf   | 2 +-
 meta-ti-bsp/conf/machine/include/am62pxx.inc  | 2 +-
 meta-ti-bsp/conf/machine/include/am62xx.inc   | 2 +-
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 2 +-
 meta-ti-bsp/conf/machine/include/am68.inc     | 2 +-
 meta-ti-bsp/conf/machine/include/am69.inc     | 2 +-
 meta-ti-bsp/conf/machine/include/j721e.inc    | 2 +-
 meta-ti-bsp/conf/machine/include/j721s2.inc   | 2 +-
 meta-ti-bsp/conf/machine/include/j722s.inc    | 2 +-
 meta-ti-bsp/conf/machine/include/j742s2.inc   | 2 +-
 meta-ti-bsp/conf/machine/include/j784s4.inc   | 2 +-
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 2 +-
 meta-ti-bsp/conf/machine/include/ti-bsp.inc   | 8 --------
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 2 +-
 15 files changed, 14 insertions(+), 22 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti.conf b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
index 792c91b2..ca88fdfb 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-ti.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
@@ -7,7 +7,7 @@ require conf/machine/include/mc_k3r5.inc
 
 SOC_FAMILY:append = ":am62xx"
 
-MACHINE_FEATURES += "screen gpu"
+MACHINE_FEATURES += "screen"
 
 SERIAL_CONSOLES = "115200;ttyS2"
 
diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/conf/machine/include/am62pxx.inc
index d59f607d..560334c1 100644
--- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
@@ -3,7 +3,7 @@ require conf/machine/include/mc_k3r5.inc
 
 SOC_FAMILY:append = ":am62pxx"
 
-MACHINE_FEATURES += "screen gpu"
+MACHINE_FEATURES += "screen"
 
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index 74054a78..9e24898c 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -3,7 +3,7 @@ require conf/machine/include/mc_k3r5.inc
 
 SOC_FAMILY:append = ":am62xx"
 
-MACHINE_FEATURES += "screen gpu"
+MACHINE_FEATURES += "screen"
 
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index d70bb22d..bfaa529b 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -3,7 +3,7 @@ require conf/machine/include/mc_k3r5.inc
 
 SOC_FAMILY:append = ":am65xx"
 
-MACHINE_FEATURES += "screen touchscreen gpu"
+MACHINE_FEATURES += "screen touchscreen"
 
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_SGX_DRIVER_PROVIDER}"
diff --git a/meta-ti-bsp/conf/machine/include/am68.inc b/meta-ti-bsp/conf/machine/include/am68.inc
index b6d18fe0..60ea679a 100644
--- a/meta-ti-bsp/conf/machine/include/am68.inc
+++ b/meta-ti-bsp/conf/machine/include/am68.inc
@@ -3,7 +3,7 @@ require conf/machine/include/mc_k3r5.inc
 
 SOC_FAMILY:append = ":j721s2"
 
-MACHINE_FEATURES += "screen gpu"
+MACHINE_FEATURES += "screen"
 
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/conf/machine/include/am69.inc
index 759984ea..7956e355 100644
--- a/meta-ti-bsp/conf/machine/include/am69.inc
+++ b/meta-ti-bsp/conf/machine/include/am69.inc
@@ -3,7 +3,7 @@ require conf/machine/include/mc_k3r5.inc
 
 SOC_FAMILY:append = ":j784s4"
 
-MACHINE_FEATURES += "screen gpu"
+MACHINE_FEATURES += "screen"
 
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index f9fdac0c..a74fbfee 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -3,7 +3,7 @@ require conf/machine/include/mc_k3r5.inc
 
 SOC_FAMILY:append = ":j721e"
 
-MACHINE_FEATURES += "screen gpu"
+MACHINE_FEATURES += "screen"
 
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
index b6d18fe0..60ea679a 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -3,7 +3,7 @@ require conf/machine/include/mc_k3r5.inc
 
 SOC_FAMILY:append = ":j721s2"
 
-MACHINE_FEATURES += "screen gpu"
+MACHINE_FEATURES += "screen"
 
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/conf/machine/include/j722s.inc
index 8a02441b..c2732b70 100644
--- a/meta-ti-bsp/conf/machine/include/j722s.inc
+++ b/meta-ti-bsp/conf/machine/include/j722s.inc
@@ -3,7 +3,7 @@ require conf/machine/include/mc_k3r5.inc
 
 SOC_FAMILY:append = ":j722s"
 
-MACHINE_FEATURES += "screen gpu"
+MACHINE_FEATURES += "screen"
 
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
diff --git a/meta-ti-bsp/conf/machine/include/j742s2.inc b/meta-ti-bsp/conf/machine/include/j742s2.inc
index d2de1d0d..13037c09 100644
--- a/meta-ti-bsp/conf/machine/include/j742s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j742s2.inc
@@ -3,7 +3,7 @@ require conf/machine/include/mc_k3r5.inc
 
 SOC_FAMILY:append = ":j742s2"
 
-MACHINE_FEATURES += "screen gpu"
+MACHINE_FEATURES += "screen"
 
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
index 759984ea..7956e355 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -3,7 +3,7 @@ require conf/machine/include/mc_k3r5.inc
 
 SOC_FAMILY:append = ":j784s4"
 
-MACHINE_FEATURES += "screen gpu"
+MACHINE_FEATURES += "screen"
 
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index 2179476f..aed2c727 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -42,7 +42,7 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "vpdma-fw goodix-fw"
 UBI_VOLNAME = "rootfs"
 
 # List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa gpu mmip dsp gc320"
+MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa mmip dsp gc320"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index c690cb5a..b4fe0676 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -18,10 +18,6 @@ BSP_KERNEL_VERSION:bsp-mainline = "%"
 BSP_BOOTLOADER_PROVIDER:bsp-mainline = "u-boot-ti-mainline"
 BSP_BOOTLOADER_VERSION:bsp-mainline = "%"
 
-# GPU support requires out-of-tree SGX and Rogue drivers not available
-# in mainline, usually present in TI staging or derivative like BB.org
-MACHINE_FEATURES:remove:bsp-mainline = "gpu"
-
 # GC320 support requires out-of-tree drivers not available in mainline
 MACHINE_FEATURES:remove:bsp-mainline = "gc320"
 
@@ -34,10 +30,6 @@ BSP_KERNEL_VERSION:bsp-next = "%"
 BSP_BOOTLOADER_PROVIDER:bsp-next = "u-boot-ti-next"
 BSP_BOOTLOADER_VERSION:bsp-next = "%"
 
-# GPU support requires out-of-tree SGX and Rogue drivers not available
-# in next, usually present in TI staging or derivative like BB.org
-MACHINE_FEATURES:remove:bsp-next = "gpu"
-
 # GC320 support requires out-of-tree drivers not yet available in next
 MACHINE_FEATURES:remove:bsp-next = "gc320"
 
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index c47165e4..662fbd03 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -88,7 +88,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-zimage"
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "amx3-cm3 prueth-fw pruhsr-fw pruprp-fw"
 
 # List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa gpu"
+MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index a23b6518..6150d106 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -60,7 +60,7 @@ MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "kernel-image-zimage"
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "amx3-cm3 prueth-fw pruhsr-fw pruprp-fw"
 
 # List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa gpu"
+MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
-- 
2.39.2


