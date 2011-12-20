Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CE97E00305
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 20 Dec 2011 08:24:08 -0800 (PST)
Received: by werm12 with SMTP id m12so2664511wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 20 Dec 2011 08:24:07 -0800 (PST)
Received: by 10.216.139.71 with SMTP id b49mr6989095wej.47.1324398247722;
	Tue, 20 Dec 2011 08:24:07 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id z5sm5822763wix.5.2011.12.20.08.24.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 08:24:07 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 20 Dec 2011 17:24:02 +0100
Message-Id: <1324398242-32416-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] linux-ti81xx-psp 2.6.37: update to match latest *SDK
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
X-List-Received-Date: Tue, 20 Dec 2011 16:24:09 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/ti814x.inc                    |    2 +-
 ...d-code-for-disabling-the-least-significan.patch |   45 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti81xx-psp_2.6.37.bb    |    9 ++--
 3 files changed, 50 insertions(+), 6 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti81xx-psp-2.6.37/0001-ti814x-added-code-for-disabling-the-least-significan.patch

diff --git a/conf/machine/include/ti814x.inc b/conf/machine/include/ti814x.inc
index 4f1c1de..23b6a1d 100644
--- a/conf/machine/include/ti814x.inc
+++ b/conf/machine/include/ti814x.inc
@@ -6,7 +6,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti81xx-psp"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r1"
+MACHINE_KERNEL_PR = "r2"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-ti81xx-psp-2.6.37/0001-ti814x-added-code-for-disabling-the-least-significan.patch b/recipes-kernel/linux/linux-ti81xx-psp-2.6.37/0001-ti814x-added-code-for-disabling-the-least-significan.patch
new file mode 100644
index 0000000..c1f368d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti81xx-psp-2.6.37/0001-ti814x-added-code-for-disabling-the-least-significan.patch
@@ -0,0 +1,45 @@
+From 1d43359e415cada4607d0d21b7de07c740616386 Mon Sep 17 00:00:00 2001
+From: Amarinder Bindra <a-bindra@ti.com>
+Date: Wed, 7 Dec 2011 20:54:56 +0530
+Subject: [PATCH] ti814x: added code for disabling the least significant bit of TI814x_HDMI_MUX_ADDR before vps init
+
+
+Signed-off-by: Amarinder Bindra <a-bindra@ti.com>
+---
+ drivers/video/ti81xx/vpss/core.c |   13 ++++++++++++-
+ 1 files changed, 12 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/video/ti81xx/vpss/core.c b/drivers/video/ti81xx/vpss/core.c
+index eb9c074..80008b9 100644
+--- a/drivers/video/ti81xx/vpss/core.c
++++ b/drivers/video/ti81xx/vpss/core.c
+@@ -41,7 +41,7 @@
+ 
+ #define VPS_DRIVER_NAME  "vpss"
+ 
+-
++#define TI814x_HDMI_MUX_ADDR (0x481C52C8)
+ 
+ #ifdef DEBUG
+ unsigned int vpss_debug;
+@@ -148,6 +148,17 @@ static int __init vps_init(void)
+ {
+ 	VPSSDBG("core init\n");
+ 
++        /* This mux is for configuring the pixel clock to Venc through HDMI or PLL*/
++        u32 reg_value;
++        u32 reg_base;
++
++        reg_base = (u32)ioremap(TI814x_HDMI_MUX_ADDR, 0x10);
++        reg_value = __raw_readl(reg_base);
++        reg_value &= 0xFFFFFFFE;
++
++        __raw_writel(reg_value, reg_base);
++        iounmap((u32 *)TI814x_HDMI_MUX_ADDR);
++
+ 	if (platform_driver_probe(&vps_driver, vps_probe)) {
+ 		VPSSERR("failed to register ti81xx-vpss driver\n");
+ 		return -ENODEV;
+-- 
+1.7.1
+
diff --git a/recipes-kernel/linux/linux-ti81xx-psp_2.6.37.bb b/recipes-kernel/linux/linux-ti81xx-psp_2.6.37.bb
index bae58b9..e5a3836 100644
--- a/recipes-kernel/linux/linux-ti81xx-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-ti81xx-psp_2.6.37.bb
@@ -6,15 +6,14 @@ KERNEL_IMAGETYPE = "uImage"
 COMPATIBLE_MACHINE = "am387x-evm|am389x-evm|c6a814x-evm|c6a816x-evm|dm814x-evm"
 
 # This is on the ti81xx-master branch
-SRCREV = "a02ce6137c1647009a17ecac35d846fe9479dded"
-
-# requires .28 hdvpss: d686b2da5d2e7337c9759f910c3a665c27b0ec31
+SRCREV = "745a06cb913ad7a9ab44855aa36d8c012cd5793b"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "d+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
 
 SRC_URI += "git://arago-project.org/git/projects/linux-omap3.git;protocol=git;branch=ti81xx-master \
-           file://defconfig"
+            file://0001-ti814x-added-code-for-disabling-the-least-significan.patch \
+            file://defconfig"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.2.5


