Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17A83E01481
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2013 09:02:57 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3C46852A55; Tue,  2 Jul 2013 16:02:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130702160252.3C46852A55@arago-project.org>
Date: Tue,  2 Jul 2013 16:02:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : linux-am335x-psp: Enable USB with DMA by default
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
X-List-Received-Date: Tue, 02 Jul 2013 16:02:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c6f0b8c57f45913f7a9e461f6b7bff0e9fcf930f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c6f0b8c57f45913f7a9e461f6b7bff0e9fcf930f

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Thu Jun 27 10:57:31 2013 -0500

linux-am335x-psp: Enable USB with DMA by default

* Patches have been added to fix some USB with DMA.
* Enable support for this by default by removing the patch that disabled it.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...01-am335x_evm_defconfig-turn-off-MUSB-DMA.patch |   35 --------------------
 recipes-kernel/linux/linux-am335x-psp_3.2.bb       |    3 +-
 2 files changed, 1 insertions(+), 37 deletions(-)

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


