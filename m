Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B43E2E0030C
	for <meta-ti@lists.yoctoproject.org>;
	Wed,  7 Dec 2011 05:27:55 -0800 (PST)
Received: by eekb57 with SMTP id b57so560330eek.26
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 07 Dec 2011 05:27:54 -0800 (PST)
Received: by 10.14.3.206 with SMTP id 54mr3561578eeh.214.1323264474454;
	Wed, 07 Dec 2011 05:27:54 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id d6sm5630560eec.10.2011.12.07.05.27.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 05:27:53 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Wed,  7 Dec 2011 14:27:50 +0100
Message-Id: <1323264470-29505-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] linux-ti33x-psp 3.1: disable MUSB DMA for beaglebone
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
X-List-Received-Date: Wed, 07 Dec 2011 13:27:57 -0000

This trades "not working" for "slightly less performance" for a lot of use cases

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../linux/linux-ti33x-psp-3.1/beaglebone/defconfig |    7 ++-----
 recipes-kernel/linux/linux-ti33x-psp_3.1.bb        |    2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
index fcff591..a762e6f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
@@ -2507,13 +2507,10 @@ CONFIG_USB_MUSB_TI81XX_GLUE=y
 CONFIG_USB_MUSB_TI81XX=y
 # CONFIG_USB_MUSB_BLACKFIN is not set
 # CONFIG_USB_MUSB_UX500 is not set
-# CONFIG_MUSB_PIO_ONLY is not set
-# CONFIG_USB_INVENTRA_DMA_HW is not set
-# CONFIG_USB_TI_CPPI_DMA_HW is not set
-CONFIG_USB_TI_CPPI41_DMA_HW=y
+CONFIG_MUSB_PIO_ONLY=y
 # CONFIG_USB_INVENTRA_DMA is not set
 # CONFIG_USB_TI_CPPI_DMA is not set
-CONFIG_USB_TI_CPPI41_DMA=y
+# CONFIG_USB_TI_CPPI41_DMA is not set
 # CONFIG_USB_TUSB_OMAP_DMA is not set
 # CONFIG_USB_UX500_DMA is not set
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
index 4668749..029b5c3 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.1-meta-ti-r1r+gitr1d84d8853fa30cf3db2571a5aec572accca4e29d"
 SRCREV = "1d84d8853fa30cf3db2571a5aec572accca4e29d"
-MACHINE_KERNEL_PR_append = "e+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "f+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-- 
1.7.2.5


