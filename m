Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26AE9E01424
	for <meta-ti@yoctoproject.org>; Wed, 30 May 2012 11:15:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 61AE352A6D; Wed, 30 May 2012 18:15:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120530181515.61AE352A6D@arago-project.org>
Date: Wed, 30 May 2012 18:15:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: fix pin free check once and for all
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
X-List-Received-Date: Wed, 30 May 2012 18:15:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: da7c9449fa3272f63e0ba1f8a42fd3aba66e1ceb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=da7c9449fa3272f63e0ba1f8a42fd3aba66e1ceb

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed May 23 18:05:58 2012 +0200

linux-ti33x-psp 3.2: fix pin free check once and for all

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...lebone-always-execute-the-pin-free-checks.patch |   68 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
 2 files changed, 70 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0064-beaglebone-always-execute-the-pin-free-checks.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0064-beaglebone-always-execute-the-pin-free-checks.patch
new file mode 100644
index 0000000..e6f696e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0064-beaglebone-always-execute-the-pin-free-checks.patch
@@ -0,0 +1,68 @@
+From 2b000164f7bd77838ec5c9ad5d392282a4e27b3f Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 23 May 2012 17:39:12 +0200
+Subject: [PATCH 64/64] beaglebone: always execute the pin free checks
+
+This code needs to run when there are no capes and when there are capes present.
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   26 +++++++++++++-------------
+ 1 files changed, 13 insertions(+), 13 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 1f2d1fd..da6020b 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2589,7 +2589,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 	ret = mem_acc->read(mem_acc, (char *)&cape_config, 0, sizeof(cape_config));
+ 	if (ret != sizeof(cape_config)) {
+ 		pr_warning("BeagleBone cape EEPROM: could not read eeprom at address 0x%x\n", capecount + 0x53);
+-		return;
++		goto out2;
+ 	}
+ 
+ 	if (cape_config.header != AM335X_EEPROM_HEADER) {
+@@ -2724,6 +2724,16 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		beaglebone_w1gpio_free = 0;
+ 	}
+ 
++	goto out2;
++out:
++	/*
++	 * If the EEPROM hasn't been programed or an incorrect header
++	 * or board name are read, assume this is an old beaglebone board
++	 * (< Rev A3)
++	 */
++	pr_err("Could not detect BeagleBone cape properly\n");
++	beaglebone_cape_detected = false;
++out2:
+ 	if (capecount > 3) {
+ 		if (beaglebone_tsadcpins_free == 1) {
+ 			pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
+@@ -2741,20 +2751,10 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 			spi_register_board_info(bone_spidev2_info, ARRAY_SIZE(bone_spidev2_info));
+ 		}
+ 		if(beaglebone_w1gpio_free == 1) {
++			pr_info("BeagleBone cape: initializing w1-gpio\n");
+ 			bonew1_gpio_init(0,0);
+ 		}
+-	}	
+-	
+-	return;
+-out:
+-	/*
+-	 * If the EEPROM hasn't been programed or an incorrect header
+-	 * or board name are read, assume this is an old beaglebone board
+-	 * (< Rev A3)
+-	 */
+-	pr_err("Could not detect BeagleBone cape properly\n");
+-	beaglebone_cape_detected = false;
+-
++	}
+ }
+ 
+ static struct at24_platform_data cape_eeprom_info = {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 4c144e5..38202fa 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -1220,4 +1220,5 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0061-beaglebone-make-uart2-pinmux-match-the-uart0-pinmux.patch \
 	file://beaglebone/0062-da8xx-fb-Rounding-FB-size-to-satisfy-SGX-buffer-requ.patch \
 	file://beaglebone/0063-beaglebone-dvi-cape-audio-hacks.patch \
+	file://beaglebone/0064-beaglebone-always-execute-the-pin-free-checks.patch \
 "


