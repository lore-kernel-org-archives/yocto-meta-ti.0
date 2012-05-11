Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD7F7E01412
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 18:55:00 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 17A7252AA3; Fri, 11 May 2012 01:55:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120511015500.17A7252AA3@arago-project.org>
Date: Fri, 11 May 2012 01:55:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti335x-psp 3.2: bump SRCREV to head of v3. 2-staging and add 2 irq patches
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
X-List-Received-Date: Fri, 11 May 2012 01:55:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 649c697bf885f0abc4c7fcc16a05a556e0a02f29
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=649c697bf885f0abc4c7fcc16a05a556e0a02f29

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri May  4 11:02:11 2012 +0200

linux-ti335x-psp 3.2: bump SRCREV to head of v3.2-staging and add 2 irq patches

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...p2-irq-process-all-4-irq-banks-for-am335x.patch |   26 ++++++++++++++++++
 ...omap2-irqs.h-increase-number-or-irq-banks.patch |   28 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    7 +++-
 3 files changed, 59 insertions(+), 2 deletions(-)

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


