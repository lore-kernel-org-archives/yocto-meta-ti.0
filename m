Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46C20E013A3
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 06:12:30 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9855652A8F; Mon, 27 Feb 2012 14:12:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120227141229.9855652A8F@arago-project.org>
Date: Mon, 27 Feb 2012 14:12:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : u-boot 2011.09: add patch to support 'cold' AM335x silicon
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
X-List-Received-Date: Mon, 27 Feb 2012 14:12:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c5f5ead49160ebf82546ea913035ec6d8fc96654
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c5f5ead49160ebf82546ea913035ec6d8fc96654

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon Feb 13 14:46:34 2012 +0100

u-boot 2011.09: add patch to support 'cold' AM335x silicon

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...ddr_defs-change-DDR-timings-for-15x15-EVM.patch |   30 ++++++++++++++++++++
 recipes-bsp/u-boot/u-boot_2011.10rc.bb             |    3 +-
 2 files changed, 32 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0001-ddr_defs-change-DDR-timings-for-15x15-EVM.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0001-ddr_defs-change-DDR-timings-for-15x15-EVM.patch
new file mode 100644
index 0000000..4563a2c
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0001-ddr_defs-change-DDR-timings-for-15x15-EVM.patch
@@ -0,0 +1,30 @@
+From 7a3b3b04b1aed6a649d99396f914ec042968f924 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Thu, 9 Feb 2012 13:09:27 -0600
+Subject: [PATCH] ddr_defs: change DDR timings for 15x15 EVM
+
+* For cold silicon the DDR timings need to be relaxed in order for
+  the device to boot with DDR at 266MHz
+* Fix proposed by James Doublesin
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ arch/arm/include/asm/arch-ti81xx/ddr_defs.h |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/include/asm/arch-ti81xx/ddr_defs.h b/arch/arm/include/asm/arch-ti81xx/ddr_defs.h
+index 6c4b422..0b7ffe7 100644
+--- a/arch/arm/include/asm/arch-ti81xx/ddr_defs.h
++++ b/arch/arm/include/asm/arch-ti81xx/ddr_defs.h
+@@ -338,7 +338,7 @@
+ #define DDR2_RD_DQS		0x40
+ #define DDR2_PHY_FIFO_WE	0x56
+ #else
+-#define EMIF_READ_LATENCY	0x04
++#define EMIF_READ_LATENCY	0x05
+ #define EMIF_TIM1		0x0666B3D6
+ #define EMIF_TIM2		0x143731DA
+ #define	EMIF_TIM3		0x00000347
+-- 
+1.7.0.4
+
diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
index 74597f6..0102d15 100644
--- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "(ti33x)"
 DEFAULT_PREFERENCE_ti33x = "99"
 
 PV = "2011.09+git"
-PR = "r25"
+PR = "r26"
 
 # SPL build
 UBOOT_BINARY = "u-boot.img"
@@ -23,6 +23,7 @@ SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;br
            file://2011.09git/0007-am335x_evm-switch-to-ext4.patch \
            file://2011.09git/0008-HACK-am335x-evm-turn-d-cache-on-globally-turn-it-off.patch \
            file://2011.09git/0009-am335x-evm-enable-i2c2-pinmux-for-beaglebone.patch \
+           file://2011.09git/0001-ddr_defs-change-DDR-timings-for-15x15-EVM.patch \
           "
 
 SRCREV = "f63b270e47f62f4d1a05b2001357e215966c6f5a"


