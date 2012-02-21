Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B436E013A5
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:30:57 -0800 (PST)
Received: by mail-ww0-f51.google.com with SMTP id dy1so4575059wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:30:57 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.86.198 as permitted sender)
	client-ip=10.180.86.198; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.86.198 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.86.198])
	by 10.180.86.198 with SMTP id r6mr25310871wiz.22.1329820257377
	(num_hops = 1); Tue, 21 Feb 2012 02:30:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.86.198 with SMTP id r6mr21195304wiz.22.1329820257298;
	Tue, 21 Feb 2012 02:30:57 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm53642704wib.4.2012.02.21.02.30.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 02:30:56 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 21 Feb 2012 11:30:19 +0100
Message-Id: <1329820224-28112-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
References: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlvndQOOPzYW3KveAn/HeHVJLkhwnk4mIlvmHixNIGJHj5mIJqAaOuoYKiAA7loIafpDJ8M
Subject: [Beagleboard.org][PATCH v2 05/10] u-boot 2011.09: add patch to support 'cold' AM335x silicon
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
X-List-Received-Date: Tue, 21 Feb 2012 10:30:58 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...ddr_defs-change-DDR-timings-for-15x15-EVM.patch |   30 ++++++++++++++++++++
 recipes-bsp/u-boot/u-boot_2011.10rc.bb             |    3 +-
 2 files changed, 32 insertions(+), 1 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0001-ddr_defs-change-DDR-timings-for-15x15-EVM.patch

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
-- 
1.7.2.5


