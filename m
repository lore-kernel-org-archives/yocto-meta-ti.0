Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BC5CAC587
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 15:10:41 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.866.1757430631152038888
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Sep 2025 08:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=OX0rQOO3;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589FASUs4051809;
	Tue, 9 Sep 2025 10:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757430628;
	bh=gV18j5HCahh3uQiNiEZFg45eT9+i0I1EjkfjYjyTdDo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OX0rQOO3Mjio9IhiRicfGB/WrQTkbB2cFnBK9lkfh1PCj0a02O5JcxYIXYhu2VE9V
	 0rBr15V3su1Pe5Y3cvnsq8gAGwlIIEHD9RgBTLbZ0RjgUJE0HG9dbGsxYh0msSy03u
	 /QMm7I79dogxlq0cZCoyJZ602Iqb11sD9SbFRguI=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589FASv73864890
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 10:10:28 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 10:10:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 10:10:28 -0500
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [10.247.30.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589FASUl2825029;
	Tue, 9 Sep 2025 10:10:28 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap][RFC 6/6] mesa-pvr: Use mesa-pvr for all TI SoCs
Date: Tue, 9 Sep 2025 10:10:28 -0500
Message-ID: <20250909151028.272925-6-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250909151028.272925-1-afd@ti.com>
References: <20250909151028.272925-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Sep 2025 15:10:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18988

TI SoCs without GPUs can still use mesa-pvr as it will simply fallback to
SW rendering just like the normal mesa package. The benefit is using the
same version across all supported devices is more consistent and only
one version of Mesa is needed for all TI SoCs.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/beagleplay-ti.conf          | 1 -
 meta-ti-bsp/conf/machine/include/am62pxx.inc         | 1 -
 meta-ti-bsp/conf/machine/include/am62xx.inc          | 1 -
 meta-ti-bsp/conf/machine/include/am65xx.inc          | 1 -
 meta-ti-bsp/conf/machine/include/am68.inc            | 1 -
 meta-ti-bsp/conf/machine/include/am69.inc            | 1 -
 meta-ti-bsp/conf/machine/include/j721e.inc           | 1 -
 meta-ti-bsp/conf/machine/include/j721s2.inc          | 1 -
 meta-ti-bsp/conf/machine/include/j722s.inc           | 1 -
 meta-ti-bsp/conf/machine/include/j742s2.inc          | 1 -
 meta-ti-bsp/conf/machine/include/j784s4.inc          | 1 -
 meta-ti-bsp/conf/machine/include/mesa-pvr.inc        | 8 --------
 meta-ti-bsp/conf/machine/include/omap-a15.inc        | 1 -
 meta-ti-bsp/conf/machine/include/ti-bsp.inc          | 8 ++++++++
 meta-ti-bsp/conf/machine/include/ti33x.inc           | 1 -
 meta-ti-bsp/conf/machine/include/ti43x.inc           | 1 -
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb | 1 +
 17 files changed, 9 insertions(+), 22 deletions(-)
 delete mode 100644 meta-ti-bsp/conf/machine/include/mesa-pvr.inc

diff --git a/meta-ti-bsp/conf/machine/beagleplay-ti.conf b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
index 792c91b2..8a11a188 100644
--- a/meta-ti-bsp/conf/machine/beagleplay-ti.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay-ti.conf
@@ -11,7 +11,6 @@ MACHINE_FEATURES += "screen gpu"
 
 SERIAL_CONSOLES = "115200;ttyS2"
 
-require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 TFA_BOARD = "lite"
diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/conf/machine/include/am62pxx.inc
index d59f607d..05fc6433 100644
--- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
@@ -5,7 +5,6 @@ SOC_FAMILY:append = ":am62pxx"
 
 MACHINE_FEATURES += "screen gpu"
 
-require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 TFA_BOARD = "lite"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index 74054a78..16bfa3d3 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -5,7 +5,6 @@ SOC_FAMILY:append = ":am62xx"
 
 MACHINE_FEATURES += "screen gpu"
 
-require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 # Bitmap image tarball for early splashscreen
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index d70bb22d..6b482227 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -5,7 +5,6 @@ SOC_FAMILY:append = ":am65xx"
 
 MACHINE_FEATURES += "screen touchscreen gpu"
 
-require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_SGX_DRIVER_PROVIDER}"
 
 KERNEL_DEVICETREE_PREFIX = "ti/k3-am654"
diff --git a/meta-ti-bsp/conf/machine/include/am68.inc b/meta-ti-bsp/conf/machine/include/am68.inc
index b6d18fe0..a4ac12f3 100644
--- a/meta-ti-bsp/conf/machine/include/am68.inc
+++ b/meta-ti-bsp/conf/machine/include/am68.inc
@@ -5,7 +5,6 @@ SOC_FAMILY:append = ":j721s2"
 
 MACHINE_FEATURES += "screen gpu"
 
-require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 TFA_BOARD = "generic"
diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/conf/machine/include/am69.inc
index 759984ea..c98dad7b 100644
--- a/meta-ti-bsp/conf/machine/include/am69.inc
+++ b/meta-ti-bsp/conf/machine/include/am69.inc
@@ -5,7 +5,6 @@ SOC_FAMILY:append = ":j784s4"
 
 MACHINE_FEATURES += "screen gpu"
 
-require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 TFA_BOARD = "j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index f9fdac0c..a892736a 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -5,7 +5,6 @@ SOC_FAMILY:append = ":j721e"
 
 MACHINE_FEATURES += "screen gpu"
 
-require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 # Deploy SYSFW and any variants
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
index b6d18fe0..a4ac12f3 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -5,7 +5,6 @@ SOC_FAMILY:append = ":j721s2"
 
 MACHINE_FEATURES += "screen gpu"
 
-require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 TFA_BOARD = "generic"
diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/conf/machine/include/j722s.inc
index 8a02441b..fa860f79 100644
--- a/meta-ti-bsp/conf/machine/include/j722s.inc
+++ b/meta-ti-bsp/conf/machine/include/j722s.inc
@@ -5,7 +5,6 @@ SOC_FAMILY:append = ":j722s"
 
 MACHINE_FEATURES += "screen gpu"
 
-require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 TFA_BOARD = "lite"
diff --git a/meta-ti-bsp/conf/machine/include/j742s2.inc b/meta-ti-bsp/conf/machine/include/j742s2.inc
index d2de1d0d..7ede2de5 100644
--- a/meta-ti-bsp/conf/machine/include/j742s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j742s2.inc
@@ -5,7 +5,6 @@ SOC_FAMILY:append = ":j742s2"
 
 MACHINE_FEATURES += "screen gpu"
 
-require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 TFA_BOARD = "j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
index 759984ea..c98dad7b 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -5,7 +5,6 @@ SOC_FAMILY:append = ":j784s4"
 
 MACHINE_FEATURES += "screen gpu"
 
-require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 TFA_BOARD = "j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/mesa-pvr.inc b/meta-ti-bsp/conf/machine/include/mesa-pvr.inc
deleted file mode 100644
index d5581315..00000000
--- a/meta-ti-bsp/conf/machine/include/mesa-pvr.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-PREFERRED_PROVIDER_virtual/mesa ?= "mesa-pvr"
-PREFERRED_PROVIDER_virtual/egl ?= "mesa-pvr"
-PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-pvr"
-PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-pvr"
-PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa-pvr"
-PREFERRED_PROVIDER_virtual/libgbm ?= "mesa-pvr"
-PREFERRED_PROVIDER_virtual/libglx ?= "mesa-pvr"
-PREFERRED_PROVIDER_virtual/libgl ?= "mesa-pvr"
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index 9058b461..c48f89ae 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -7,7 +7,6 @@ require conf/machine/include/arm/armv7a/tune-cortexa15.inc
 require conf/machine/include/ti-bsp.inc
 
 # Graphics providers and variables
-require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_SGX_DRIVER_PROVIDER}"
 
 KERNEL_IMAGETYPE = "zImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index dc0473de..37a59135 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -99,3 +99,11 @@ PREFERRED_VERSION_ti-sgx-ddk-um ?= "${BSP_SGX_DRIVER_VERSION}"
 PREFERRED_VERSION_ti-img-rogue-driver ?= "${BSP_ROGUE_DRIVER_VERSION}"
 PREFERRED_VERSION_ti-img-rogue-umlibs ?= "${BSP_ROGUE_DRIVER_VERSION}"
 PREFERRED_VERSION_mesa-pvr ?= "${BSP_MESA_PVR_VERSION}"
+PREFERRED_PROVIDER_virtual/mesa ?= "mesa-pvr"
+PREFERRED_PROVIDER_virtual/egl ?= "mesa-pvr"
+PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-pvr"
+PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-pvr"
+PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa-pvr"
+PREFERRED_PROVIDER_virtual/libgbm ?= "mesa-pvr"
+PREFERRED_PROVIDER_virtual/libglx ?= "mesa-pvr"
+PREFERRED_PROVIDER_virtual/libgl ?= "mesa-pvr"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index 5d7375e5..1301e2e7 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -7,7 +7,6 @@ require conf/machine/include/arm/armv7a/tune-cortexa8.inc
 require conf/machine/include/ti-bsp.inc
 
 # Graphics providers and variables
-require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_SGX_DRIVER_PROVIDER}"
 
 KERNEL_IMAGETYPE = "zImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index 7dd5b1f2..2b061d53 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -7,7 +7,6 @@ require conf/machine/include/arm/armv7a/tune-cortexa9.inc
 require conf/machine/include/ti-bsp.inc
 
 # Graphics providers and variables
-require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_SGX_DRIVER_PROVIDER}"
 
 KERNEL_IMAGETYPE = "zImage"
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
index 40226f65..a432dcdd 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
@@ -41,4 +41,5 @@ do_install:append () {
 FILES:${PN}-dev += "${datadir}/mesa/wayland-drm.xml"
 FILES:mesa-vulkan-drivers += "${libdir}/libpvr_mesa_wsi.so"
 
+PREFERRED_PROVIDER_virtual/gpudriver ?= ""
 RRECOMMENDS:mesa-megadriver:append:class-target = " ${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
-- 
2.39.2


