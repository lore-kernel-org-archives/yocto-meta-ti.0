Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1A99E0156C
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 08:44:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5RFiI0x016914
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 10:44:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5RFiIXu016116
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 10:44:18 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 10:44:18 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5RFiCGZ023148;
	Thu, 27 Jun 2013 10:44:16 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Jun 2013 10:57:31 -0500
Message-ID: <1372348655-5596-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1372348655-5596-1-git-send-email-fcooper@ti.com>
References: <1372348655-5596-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] linux-am335x-psp: Enable USB with DMA by default
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
X-List-Received-Date: Thu, 27 Jun 2013 15:44:19 -0000
Content-Type: text/plain

* Patches have been added to fix some USB with DMA.
* Enable support for this by default by removing the patch that disabled it.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...01-am335x_evm_defconfig-turn-off-MUSB-DMA.patch |   35 --------------------
 recipes-kernel/linux/linux-am335x-psp_3.2.bb       |    3 +-
 2 files changed, 1 insertions(+), 37 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x_evm_defconfig-turn-off-MUSB-DMA.patch

diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x_evm_defconfig-turn-off-MUSB-DMA.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x_evm_defconfig-turn-off-MUSB-DMA.patch
deleted file mode 100644
index 6a32c2c..0000000
--- a/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x_evm_defconfig-turn-off-MUSB-DMA.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 95eca5a896c96d0af7188c97825a3b3ef5313ed3 Mon Sep 17 00:00:00 2001
-From: Chase Maupin <Chase.Maupin@ti.com>
-Date: Thu, 2 Feb 2012 16:38:51 -0600
-Subject: [PATCH] am335x_evm_defconfig: turn off MUSB DMA
-
-* Turn off the MUSB DMA in the am335x_evm_defconfig.  This way
-  we can pull the default defconfig without enabling the
-  faulty USB DMA.
-
-Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
----
- arch/arm/configs/am335x_evm_defconfig |    6 +++---
- 1 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/arch/arm/configs/am335x_evm_defconfig b/arch/arm/configs/am335x_evm_defconfig
-index d105c61..121dc7f 100644
---- a/arch/arm/configs/am335x_evm_defconfig
-+++ b/arch/arm/configs/am335x_evm_defconfig
-@@ -1982,11 +1982,11 @@ CONFIG_USB_MUSB_TI81XX_GLUE=y
- CONFIG_USB_MUSB_TI81XX=y
- # CONFIG_USB_MUSB_BLACKFIN is not set
- # CONFIG_USB_MUSB_UX500 is not set
--CONFIG_USB_TI_CPPI41_DMA_HW=y
--# CONFIG_MUSB_PIO_ONLY is not set
-+# CONFIG_USB_TI_CPPI41_DMA_HW is not set
-+CONFIG_MUSB_PIO_ONLY=y
- # CONFIG_USB_INVENTRA_DMA is not set
- # CONFIG_USB_TI_CPPI_DMA is not set
--CONFIG_USB_TI_CPPI41_DMA=y
-+# CONFIG_USB_TI_CPPI41_DMA is not set
- # CONFIG_USB_TUSB_OMAP_DMA is not set
- # CONFIG_USB_UX500_DMA is not set
- # CONFIG_USB_RENESAS_USBHS is not set
---
-1.7.0.4
diff --git a/recipes-kernel/linux/linux-am335x-psp_3.2.bb b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
index 00c4b10..7fd6935 100644
--- a/recipes-kernel/linux/linux-am335x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
@@ -15,7 +15,7 @@ DEPENDS += "am33x-cm3"
 KERNEL_IMAGETYPE = "uImage"
 
 # The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
-MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "e+gitr${SRCPV}"
 
 BRANCH = "v3.2-staging"
 
@@ -34,7 +34,6 @@ KERNEL_PATCHES = "${PATCHES}"
 # Add a set of patches that enabled features, fixed bugs or disabled buggy features
 # that weren't part of the official PSP release
 PATCHES = "file://0001-musb-update-PIO-mode-help-information-in-Kconfig.patch \
-               file://0001-am335x_evm_defconfig-turn-off-MUSB-DMA.patch \
                file://0001-mach-omap2-pm33xx-Disable-VT-switch.patch"
 
 # Add Cryptography support early driver patches while working to get the driver
-- 
1.7.0.4


