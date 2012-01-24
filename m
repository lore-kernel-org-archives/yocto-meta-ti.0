Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 55BEDE00592
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 24 Jan 2012 07:05:39 -0800 (PST)
Received: by wgbdy1 with SMTP id dy1so3700720wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 24 Jan 2012 07:05:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.95.131 with SMTP id dk3mr4258589wib.6.1327417538145;
	Tue, 24 Jan 2012 07:05:38 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id bu13sm53263174wib.6.2012.01.24.07.05.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 07:05:37 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 24 Jan 2012 16:05:33 +0100
Message-Id: <1327417533-9021-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQm1Uq0FrSDIymbZOFg4Dj0qr0dA6VRymgwi2RqI0fAyW5gjwVGBFw8fF9WLSKUnBvHwtTHm
Subject: [PATCH] linux-ti33x-psp 3.1: re-enable MUSB DMA for beaglebone
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jan 2012 15:05:39 -0000

The production tester breaks with DMA disabled, so enable it again. Any breakage due to this should get reported to TI PSP so they can fix it.

This effectively reverts aa209df889e2fce6f231e10552b5e7de4605889a

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../linux/linux-ti33x-psp-3.1/beaglebone/defconfig |    7 +++++--
 recipes-kernel/linux/linux-ti33x-psp_3.1.bb        |    2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
index 628f149..4e8644c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
@@ -2507,10 +2507,13 @@ CONFIG_USB_MUSB_TI81XX_GLUE=y
 CONFIG_USB_MUSB_TI81XX=y
 # CONFIG_USB_MUSB_BLACKFIN is not set
 # CONFIG_USB_MUSB_UX500 is not set
-CONFIG_MUSB_PIO_ONLY=y
+# CONFIG_MUSB_PIO_ONLY is not set
+# CONFIG_USB_INVENTRA_DMA_HW is not set
+# CONFIG_USB_TI_CPPI_DMA_HW is not set
+CONFIG_USB_TI_CPPI41_DMA_HW=y
 # CONFIG_USB_INVENTRA_DMA is not set
 # CONFIG_USB_TI_CPPI_DMA is not set
-# CONFIG_USB_TI_CPPI41_DMA is not set
+CONFIG_USB_TI_CPPI41_DMA=y
 # CONFIG_USB_TUSB_OMAP_DMA is not set
 # CONFIG_USB_UX500_DMA is not set
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
index c48435b..ef706cb 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.1-meta-ti-r1r+gitr1d84d8853fa30cf3db2571a5aec572accca4e29d"
 SRCREV = "1d84d8853fa30cf3db2571a5aec572accca4e29d"
-MACHINE_KERNEL_PR_append = "h+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "i+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-- 
1.7.2.5


