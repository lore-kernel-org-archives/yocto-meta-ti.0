Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E33AE01412
	for <meta-ti@yoctoproject.org>; Fri,  4 May 2012 05:08:36 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so2179540wgb.11
	for <meta-ti@yoctoproject.org>; Fri, 04 May 2012 05:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=REP/FLq6CqHBUfo4M7CKXEfIhOey36HHqNPPhr0qS4Y=;
	b=XwmwTb6oznwFac7Pv6mxcu3e/INDRDFzg69Ehgsira6O2hroHD1Iv71oZDO3wjXfKa
	WgO2vnVD2PHMBBKtv6gysBpgxVpO6N/T1v6nH0zljVlzqm83egoateEGocSiacwXIaw8
	J9jtBdZx9LcIIOeeJ5FgUZ2mIbYux2P/8B+V1wcBiWGwQoH1ZeLPeniAPKzWipI+T8bY
	zX19yjj6JxJwSIaal01cigV2VpzBpV9IyxMBAvTHbEz1MM+JLQ5FMK/5h+srpQCwIbis
	euArv6dwkFOg/gRzGOsiLWa7OfmIwuzrbWYqvcWn0LZMYu7ZiqZNdMwVE9tAHRwXSrv2
	D++A==
Received: by 10.216.200.90 with SMTP id y68mr3754403wen.49.1336133314758;
	Fri, 04 May 2012 05:08:34 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id n20sm14409878wiw.5.2012.05.04.05.08.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 05:08:34 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Fri,  4 May 2012 14:08:23 +0200
Message-Id: <1336133305-26216-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmx10TVWh1pp4N+j0qdbekJPR+/zQBbY4GEoaOXAagJF2St+62aTctqH1QwZ6tjaUVz8xF0
Cc: denys@ti.com
Subject: [PATCH 1/3] linux-ti335x-psp 3.2: bump SRCREV to head of v3.2-staging and add 2 irq patches
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
X-List-Received-Date: Fri, 04 May 2012 12:08:37 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...p2-irq-process-all-4-irq-banks-for-am335x.patch |   26 ++++++++++++++++++
 ...omap2-irqs.h-increase-number-or-irq-banks.patch |   28 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    7 +++--
 3 files changed, 59 insertions(+), 2 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-omap2-irq-process-all-4-irq-banks-for-am335x.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-omap2-irqs.h-increase-number-or-irq-banks.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-omap2-irq-process-all-4-irq-banks-for-am335x.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-omap2-irq-process-all-4-irq-banks-for-am335x.patch
new file mode 100644
index 0000000..2007b5b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-omap2-irq-process-all-4-irq-banks-for-am335x.patch
@@ -0,0 +1,26 @@
+From d5f1df216fb51e1edc3e18b6b4c6d382141cf8dd Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 2 May 2012 13:51:57 +0200
+Subject: [PATCH 31/32] omap2+ irq: process all 4 irq banks for am335x
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/irq.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/mach-omap2/irq.c b/arch/arm/mach-omap2/irq.c
+index 1fef061..419b1a1 100644
+--- a/arch/arm/mach-omap2/irq.c
++++ b/arch/arm/mach-omap2/irq.c
+@@ -212,7 +212,7 @@ static inline void omap_intc_handle_irq(void __iomem *base_addr, struct pt_regs
+ 			goto out;
+ 
+ 		irqnr = readl_relaxed(base_addr + 0xd8);
+-#ifdef CONFIG_SOC_OMAPTI816X
++#if defined(CONFIG_SOC_OMAPTI816X) || defined(CONFIG_SOC_OMAPAM33XX)
+ 		if (irqnr)
+ 			goto out;
+ 		irqnr = readl_relaxed(base_addr + 0xf8);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-omap2-irqs.h-increase-number-or-irq-banks.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-omap2-irqs.h-increase-number-or-irq-banks.patch
new file mode 100644
index 0000000..beb63f3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-omap2-irqs.h-increase-number-or-irq-banks.patch
@@ -0,0 +1,28 @@
+From c551ce3e274195934304b16cc109204a987c4295 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 2 May 2012 13:56:12 +0200
+Subject: [PATCH 32/32] omap2+ irqs.h: increase number or irq banks
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/plat-omap/include/plat/irqs.h |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/plat-omap/include/plat/irqs.h b/arch/arm/plat-omap/include/plat/irqs.h
+index ce6a73c..cc15272 100644
+--- a/arch/arm/plat-omap/include/plat/irqs.h
++++ b/arch/arm/plat-omap/include/plat/irqs.h
+@@ -434,8 +434,8 @@
+ 
+ #define OMAP_IRQ_BIT(irq)	(1 << ((irq) % 32))
+ 
+-#define INTCPS_NR_MIR_REGS	3
+-#define INTCPS_NR_IRQS		96
++#define INTCPS_NR_MIR_REGS	4
++#define INTCPS_NR_IRQS		128
+ 
+ #include <mach/hardware.h>
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index f560a1d..35d1b26 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,8 +11,8 @@ S = "${WORKDIR}/git"
 MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
-SRCREV = "e8004dad869568692ca2a45c04e8464ce48cc4d7"
-MACHINE_KERNEL_PR_append = "d+gitr${SRCREV}"
+SRCREV = "0d0567b6c1a61a374120b985559768077c511a6d"
+MACHINE_KERNEL_PR_append = "e+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -826,4 +826,7 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch \
 	file://beaglebone/0029-beaglebone-also-report-cape-revision.patch \
 	file://beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch \
+	file://beaglebone/0031-omap2-irq-process-all-4-irq-banks-for-am335x.patch \
+	file://beaglebone/0032-omap2-irqs.h-increase-number-or-irq-banks.patch \
 "
+
-- 
1.7.10


