Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8FC7E006D9
	for <meta-ti@yoctoproject.org>; Tue, 29 May 2012 13:51:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0456352A69; Tue, 29 May 2012 20:51:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120529205125.0456352A69@arago-project.org>
Date: Tue, 29 May 2012 20:51:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: silence useless omap4 hwmod warning
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
X-List-Received-Date: Tue, 29 May 2012 20:51:26 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1078965795412744e1fc39ff8e0876665a79afed
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1078965795412744e1fc39ff8e0876665a79afed

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue May 22 08:06:24 2012 +0200

linux-ti33x-psp 3.2: silence useless omap4 hwmod warning

This fixes the last remaining debug print shown when booting with 'quiet'

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../0044-omap-hwmod-silence-st_shift-error.patch   |   33 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    1 +
 2 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-omap-hwmod-silence-st_shift-error.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-omap-hwmod-silence-st_shift-error.patch
new file mode 100644
index 0000000..7991f0a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-omap-hwmod-silence-st_shift-error.patch
@@ -0,0 +1,33 @@
+From 4119ec2ea20b7ae4095049e9f192c751559fbb87 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 16 May 2012 17:57:31 +0200
+Subject: [PATCH] omap hwmod: silence st_shift error
+
+During boot the following error is shown:
+
+	[    0.545227] omap_hwmod: wkup_m3: wkup_m3: hwmod data error: OMAP4 does not support st_shift
+
+Since this PSP tree will never run on omap4 remove the print so people will stop getting scared by it.
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/omap_hwmod.c |    3 ---
+ 1 files changed, 0 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
+index bc14f9f..a050699 100644
+--- a/arch/arm/mach-omap2/omap_hwmod.c
++++ b/arch/arm/mach-omap2/omap_hwmod.c
+@@ -1343,9 +1343,6 @@ static int _deassert_hardreset(struct omap_hwmod *oh, const char *name)
+ 	 * Note: cpu_is_omap34xx is true for am33xx device as well.
+ 	 */
+ 	if (cpu_is_omap44xx() || cpu_is_am33xx()) {
+-		if (ohri.st_shift)
+-			pr_err("omap_hwmod: %s: %s: hwmod data error: OMAP4 does not support st_shift\n",
+-			       oh->name, name);
+ 		ret = omap4_prminst_deassert_hardreset(ohri.rst_shift,
+ 				  oh->clkdm->pwrdm.ptr->prcm_partition,
+ 				  oh->clkdm->pwrdm.ptr->prcm_offs,
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 97c1cd0..0fe3d4f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -968,6 +968,7 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch \
 	file://beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch \
     file://beaglebone/0043-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch \
+	file://beaglebone/0044-omap-hwmod-silence-st_shift-error.patch \
 	file://beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch \
 	file://beaglebone/0045-cpws-phy_device-demote-PHY-message-to-INFO.patch \
 "


