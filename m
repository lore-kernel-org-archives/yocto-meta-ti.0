Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D158E005B4
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 25 Jan 2012 09:27:25 -0800 (PST)
Received: by wgbdy1 with SMTP id dy1so4998436wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Wed, 25 Jan 2012 09:27:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.19.130 with SMTP id f2mr12681707wie.12.1327512444511;
	Wed, 25 Jan 2012 09:27:24 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id l12sm1798906wiw.0.2012.01.25.09.27.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 09:27:23 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Wed, 25 Jan 2012 18:27:18 +0100
Message-Id: <1327512438-16041-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1327512438-16041-1-git-send-email-koen@dominion.thruhere.net>
References: <1327512438-16041-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkviWibFwaQoyFv+zC3xH2ySNpAdOyuvc5xJEfuMPezsTR3ZnrNUH+5pu48Hh1updHiebit
Subject: [PATCH 2/2] linux-3.0: fix beagleboard DSI PLL regression
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
X-List-Received-Date: Wed, 25 Jan 2012 17:27:25 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...d-reinstate-usage-of-hi-speed-PLL-divider.patch |   29 ++++++++++++++++++++
 recipes-kernel/linux/linux_3.0.bb                  |    3 +-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-3.0/beagle/0011-beagleboard-reinstate-usage-of-hi-speed-PLL-divider.patch

diff --git a/recipes-kernel/linux/linux-3.0/beagle/0011-beagleboard-reinstate-usage-of-hi-speed-PLL-divider.patch b/recipes-kernel/linux/linux-3.0/beagle/0011-beagleboard-reinstate-usage-of-hi-speed-PLL-divider.patch
new file mode 100644
index 0000000..4d2a978
--- /dev/null
+++ b/recipes-kernel/linux/linux-3.0/beagle/0011-beagleboard-reinstate-usage-of-hi-speed-PLL-divider.patch
@@ -0,0 +1,29 @@
+From a2139a0efb9472a649465a1080799c73470fd201 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 25 Jan 2012 15:48:36 +0100
+Subject: [PATCH] beagleboard: reinstate usage of hi-speed PLL divider
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-omap3beagle.c |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-omap3beagle.c b/arch/arm/mach-omap2/board-omap3beagle.c
+index 016d0985..c4c7a99 100644
+--- a/arch/arm/mach-omap2/board-omap3beagle.c
++++ b/arch/arm/mach-omap2/board-omap3beagle.c
+@@ -467,6 +467,11 @@ static struct omap_dss_device beagle_dvi_device = {
+ 	.driver_name = "generic_dpi_panel",
+ 	.data = &dvi_panel,
+ 	.phy.dpi.data_lines = 24,
++	.clocks = {
++		.dispc = {
++			.dispc_fclk_src = OMAP_DSS_CLK_SRC_DSI_PLL_HSDIV_DISPC,
++		},
++	},
+ 	.reset_gpio = -EINVAL,
+ };
+ 
+-- 
+1.7.7.5
+
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index 70ca7cc..d62c1ea 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -10,7 +10,7 @@ PV = "3.0.17"
 SRCREV_pn-${PN} = "e9d23be2708477feeaec78e707c80441520c1ef6"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
 
@@ -194,6 +194,7 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.gi
             file://beagle/0008-OMAP2-add-cpu-id-register-to-MAC-address-helper.patch \
             file://beagle/0009-HACK-OMAP2-BeagleBoard-Fix-up-random-or-missing-MAC-.patch \
             file://beagle/0010-ARM-OMAP2-beagleboard-fix-mmc-write-protect-pin-when.patch \
+            file://beagle/0011-beagleboard-reinstate-usage-of-hi-speed-PLL-divider.patch \
             file://madc/0001-Enabling-Hwmon-driver-for-twl4030-madc.patch \
             file://madc/0002-mfd-twl-core-enable-madc-clock.patch \
             \
-- 
1.7.2.5


