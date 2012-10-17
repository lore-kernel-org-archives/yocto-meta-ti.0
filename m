Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD771E01351
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2012 13:14:00 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 4A08252A7E; Wed, 17 Oct 2012 20:14:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121017201400.4A08252A7E@arago-project.org>
Date: Wed, 17 Oct 2012 20:14:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti335x-psp 3.2: mux orientation detect for camera sensor to gpio instead of gpmc
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
X-List-Received-Date: Wed, 17 Oct 2012 20:14:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: 52011ad894b31a2778451e167893ebf0a3ff9a13
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=52011ad894b31a2778451e167893ebf0a3ff9a13

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Aug 16 11:18:35 2012 +0200

linux-ti335x-psp 3.2: mux orientation detect for camera sensor to gpio instead of gpmc

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>

---

 ...e-mux-camera-cape-orientation-pin-to-gpio.patch |   35 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
 2 files changed, 37 insertions(+), 1 deletions(-)

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


