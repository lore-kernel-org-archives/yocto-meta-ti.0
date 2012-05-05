Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50CD9E00596
	for <meta-ti@yoctoproject.org>; Sat,  5 May 2012 01:49:51 -0700 (PDT)
Received: by wibhm17 with SMTP id hm17so1772733wib.11
	for <meta-ti@yoctoproject.org>; Sat, 05 May 2012 01:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=gEbTokVxsGPa+2RVc9EqDpo3xvkz9e7GHJwOLzYgUqw=;
	b=IwL9YJyADpE6F0HdnzoHDyXUotyCyOi3JE/sFulLCf0WkDniUA1bYUO5kUmL+P38hW
	uZPP4rOWJGGyBYoxxwHyWzyss622eyRWZFlyM/rH7gd0P6D2Up2DXeDP1Qlz4mdbpox/
	a+WP89ja+eTOxyeJs6vFNUf63u9S9W5fb/9CmUtt36HYECKd3wi2zrO6SOqHf0uFMjCW
	YmpSopU6AcbIuTJaTN1Jq/Ddvrb6ddqCfpvL2yZL3ijlz2bEZcLiThfQuZ9kiiDlp46U
	8fOiqHLzQpez7/vzRs22UaMy28l/o6nlPOlQVxLeG+Zao3wN9o7p+y8FKYqXuLfNA8TO
	R/Sw==
Received: by 10.180.83.72 with SMTP id o8mr19875863wiy.5.1336207790111;
	Sat, 05 May 2012 01:49:50 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fm1sm3419052wib.10.2012.05.05.01.49.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 05 May 2012 01:49:49 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Sat,  5 May 2012 10:49:41 +0200
Message-Id: <1336207781-27975-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnRcERngRdzDsTGZ1bGnEa/4gJmAnleKWhQv5IHm0xiOKTYF2bztTxYzihJp+dz2p5UDFIP
Cc: denys@ti.com
Subject: [PATCH] linux-ti335x-psp 3.2: use proper irq fix from Vaibhav
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
X-List-Received-Date: Sat, 05 May 2012 08:49:51 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...p2-irq-process-all-4-irq-banks-for-am335x.patch |   26 ------------------
 ...omap2-irqs.h-increase-number-or-irq-banks.patch |   28 --------------------
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    6 ++---
 3 files changed, 2 insertions(+), 58 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-omap2-irq-process-all-4-irq-banks-for-am335x.patch
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-omap2-irqs.h-increase-number-or-irq-banks.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-omap2-irq-process-all-4-irq-banks-for-am335x.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-omap2-irq-process-all-4-irq-banks-for-am335x.patch
deleted file mode 100644
index 2007b5b..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-omap2-irq-process-all-4-irq-banks-for-am335x.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d5f1df216fb51e1edc3e18b6b4c6d382141cf8dd Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 2 May 2012 13:51:57 +0200
-Subject: [PATCH 31/32] omap2+ irq: process all 4 irq banks for am335x
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- arch/arm/mach-omap2/irq.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arm/mach-omap2/irq.c b/arch/arm/mach-omap2/irq.c
-index 1fef061..419b1a1 100644
---- a/arch/arm/mach-omap2/irq.c
-+++ b/arch/arm/mach-omap2/irq.c
-@@ -212,7 +212,7 @@ static inline void omap_intc_handle_irq(void __iomem *base_addr, struct pt_regs
- 			goto out;
- 
- 		irqnr = readl_relaxed(base_addr + 0xd8);
--#ifdef CONFIG_SOC_OMAPTI816X
-+#if defined(CONFIG_SOC_OMAPTI816X) || defined(CONFIG_SOC_OMAPAM33XX)
- 		if (irqnr)
- 			goto out;
- 		irqnr = readl_relaxed(base_addr + 0xf8);
--- 
-1.7.9.5
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-omap2-irqs.h-increase-number-or-irq-banks.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-omap2-irqs.h-increase-number-or-irq-banks.patch
deleted file mode 100644
index beb63f3..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-omap2-irqs.h-increase-number-or-irq-banks.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c551ce3e274195934304b16cc109204a987c4295 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 2 May 2012 13:56:12 +0200
-Subject: [PATCH 32/32] omap2+ irqs.h: increase number or irq banks
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- arch/arm/plat-omap/include/plat/irqs.h |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/arch/arm/plat-omap/include/plat/irqs.h b/arch/arm/plat-omap/include/plat/irqs.h
-index ce6a73c..cc15272 100644
---- a/arch/arm/plat-omap/include/plat/irqs.h
-+++ b/arch/arm/plat-omap/include/plat/irqs.h
-@@ -434,8 +434,8 @@
- 
- #define OMAP_IRQ_BIT(irq)	(1 << ((irq) % 32))
- 
--#define INTCPS_NR_MIR_REGS	3
--#define INTCPS_NR_IRQS		96
-+#define INTCPS_NR_MIR_REGS	4
-+#define INTCPS_NR_IRQS		128
- 
- #include <mach/hardware.h>
- 
--- 
-1.7.9.5
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 954e5ca..2e75cc2 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,8 +11,8 @@ S = "${WORKDIR}/git"
 MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
-SRCREV = "0d0567b6c1a61a374120b985559768077c511a6d"
-MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
+SRCREV = "31944a82681a0e7ab6cc3e069c30eddc5042e3e8"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -954,8 +954,6 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch \
 	file://beaglebone/0029-beaglebone-also-report-cape-revision.patch \
 	file://beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch \
-	file://beaglebone/0031-omap2-irq-process-all-4-irq-banks-for-am335x.patch \
-	file://beaglebone/0032-omap2-irqs.h-increase-number-or-irq-banks.patch \
 	file://beaglebone/0033-beaglebone-fix-3.5-cape-support.patch \
 	file://beaglebone/0034-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch \
 	file://beaglebone/0035-beaglebone-add-support-for-CAN-and-RS232-cape.patch \
-- 
1.7.10


