Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5CEE2E0139E
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 27 Feb 2012 05:41:17 -0800 (PST)
Received: by mail-we0-f181.google.com with SMTP id m13so468501wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 27 Feb 2012 05:41:17 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.103.97 as permitted sender)
	client-ip=10.180.103.97; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.103.97 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.103.97])
	by 10.180.103.97 with SMTP id fv1mr28137431wib.17.1330350077119
	(num_hops = 1); Mon, 27 Feb 2012 05:41:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.103.97 with SMTP id fv1mr22339067wib.17.1330350045603;
	Mon, 27 Feb 2012 05:40:45 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id m16sm55244985wie.9.2012.02.27.05.40.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 05:40:44 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 27 Feb 2012 14:40:23 +0100
Message-Id: <1330350029-29100-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330350029-29100-1-git-send-email-koen@dominion.thruhere.net>
References: <1330350029-29100-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnZkIHR7PoZXyP57ihX7rcv+y5CeIm1xDkNbSB67kt0gW/cth73TVzrReDhcmnw+DQ2KTxr
Subject: [BeagleBone][PATCH v3 05/11] u-boot 2011.09: add patch to support 'cold' AM335x silicon
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
X-List-Received-Date: Mon, 27 Feb 2012 13:41:17 -0000

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


