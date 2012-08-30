Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46335E01443
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 01:55:17 -0700 (PDT)
Received: by eabd1 with SMTP id d1so500603eab.35
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 01:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=caz5Gjiit7qKk61TZCdknwP3rTecpg8fNQW4vNhaK/U=;
	b=PcTGuwTFIiT89Ig4PW3nRXVlT/NkTmj3uFmNJAVg7ueS+TYe3WJG9Z4Wxy2mE7d1Mu
	d9gme45UqTEmZd/Bnn1u4in4G9Zpj9IYlrRqc/oDd7xmY6z1POWudrYYkc1sGLeJcxdp
	Z82KMFU9tlim0AfCf+lU6INOp5MuwNY43GDxqwbSebV12RcAv2vkRc09LdIxoIO6+cPN
	btR6TApSLhXV/dV/qJJ/e0Y3Dp3VzxaP7J9NP26VL+oyR/rPbxJxFMzVLL/Tb3BuBdFo
	6hhxiWBawEC/Te7xhHUoUryNmdkr7GL7dX7qGfH5JNjpH+QAPjqGyjaBzjzIfrEj2AcJ
	a6Ng==
Received: by 10.14.179.136 with SMTP id h8mr5527110eem.6.1346316914137;
	Thu, 30 Aug 2012 01:55:14 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id l42sm3028646eep.1.2012.08.30.01.55.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 01:55:13 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 30 Aug 2012 10:54:56 +0200
Message-Id: <1346316899-11441-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346316899-11441-1-git-send-email-koen@dominion.thruhere.net>
References: <1346316899-11441-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlD9wQOjD0AIKEaF0TwZ6aaUsOcF3BPEvt28cmegkgWK7TxK0c6DvEz5GaxL5AypKiAWmNQ
Subject: [PATCH 3/6] linux-ti335x-psp 3.2: mux orientation detect for camera sensor to gpio instead of gpmc
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
X-List-Received-Date: Thu, 30 Aug 2012 08:55:17 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...e-mux-camera-cape-orientation-pin-to-gpio.patch |   35 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0085-beaglebone-mux-camera-cape-orientation-pin-to-gpio.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0085-beaglebone-mux-camera-cape-orientation-pin-to-gpio.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0085-beaglebone-mux-camera-cape-orientation-pin-to-gpio.patch
new file mode 100644
index 0000000..396b2d1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0085-beaglebone-mux-camera-cape-orientation-pin-to-gpio.patch
@@ -0,0 +1,35 @@
+From cfef44a953b640d592133ed553c1c4ba72953837 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 15 Aug 2012 14:33:37 +0200
+Subject: [PATCH] beaglebone: mux camera cape orientation pin to gpio
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index d30c5a2..78c4bf9 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -846,6 +846,7 @@ static struct pinmux_config gpmc_pin_mux[] = {
+ static struct pinmux_config camera_cape_pin_mux[] = {
+ 	{"spi0_d1.gpio0_4",    OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT },		// QL CSSP and Camera Sensor Reset
+ 	{"spi0_cs0.gpio0_5",   OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT_PULLUP },	// 1V8 and 2V8 Power Enable
++	{"gpmc_csn1.gpio0_30",   OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},		// Sensor orientation detect: low -> frontfacing, high -> backfacing
+ 	{NULL, 0},
+ };
+ 
+@@ -2065,8 +2066,8 @@ static void cssp_gpmc_init(void)
+ 			{ NULL, GPMC_DEVICE_NOR },
+ 		};
+ 
+-	setup_pin_mux(camera_cape_pin_mux);
+ 	setup_pin_mux(gpmc_pin_mux);
++	setup_pin_mux(camera_cape_pin_mux);
+ 
+ 	omap_init_gpmc(gpmc_device, sizeof(gpmc_device));
+ 	gpmc_cssp_init();
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 77b1680..5cbf46b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -15,7 +15,7 @@ PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.25", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -1826,4 +1826,5 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0082-beaglebone-add-rudimentary-support-for-eMMC-cape.patch \
 	file://beaglebone/0083-beaglebone-add-extra-partnumber-for-camera-cape.patch \
 	file://beaglebone/0084-beaglebone-cssp_camera-driver-cleanup.patch \
+	file://beaglebone/0085-beaglebone-mux-camera-cape-orientation-pin-to-gpio.patch \
 "
-- 
1.7.10


