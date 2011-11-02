Return-Path: <joelagnel@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 772C8E006B4
	for <meta-ti@yoctoproject.org>; Wed,  2 Nov 2011 13:36:38 -0700 (PDT)
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id pA2Kab4Q001069
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Wed, 2 Nov 2011 15:36:37 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA2KabiD002673
	for <meta-ti@yoctoproject.org>; Wed, 2 Nov 2011 15:36:37 -0500 (CDT)
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA2KabNG022143
	for <meta-ti@yoctoproject.org>; Wed, 2 Nov 2011 15:36:37 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3; Wed, 2 Nov 2011
	15:36:36 -0500
Received: from localhost.localdomain (lta0273324a.am.dhcp.ti.com
	[10.247.20.212])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	pA2KaZIA012351;	Wed, 2 Nov 2011 15:36:36 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 2 Nov 2011 15:36:33 -0500
Message-ID: <1320266193-21790-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: [PATCH] linux-ti335x-psp 3.1: Fix gpio1_6 pinmux
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
X-List-Received-Date: Wed, 02 Nov 2011 20:36:38 -0000
Content-Type: text/plain

This change is required to get GPIO 1_6 working for bone test init purposes
These 2 lines were dropped from the original patch.

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 ...0002-ARM-OMAP2-beaglebone-add-LED-support.patch |   22 ++++++++++++++++---
 recipes-kernel/linux/linux-ti33x-psp_3.1.bb        |    2 +-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/0002-ARM-OMAP2-beaglebone-add-LED-support.patch b/recipes-kernel/linux/linux-ti33x-psp-3.1/0002-ARM-OMAP2-beaglebone-add-LED-support.patch
index c1e7560..68c7f15 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.1/0002-ARM-OMAP2-beaglebone-add-LED-support.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/0002-ARM-OMAP2-beaglebone-add-LED-support.patch
@@ -1,12 +1,13 @@
-From 3672d287f5382b102e02400298a00d6f8052dd9d Mon Sep 17 00:00:00 2001
+From 4df4ee83b31e09942932d67890d36ae116363ac1 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 2 Nov 2011 09:11:59 +0100
-Subject: [PATCH 2/3] ARM: OMAP2+: beaglebone: add LED support
+Subject: [PATCH] ARM: OMAP2+: beaglebone: add LED support
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   66 +++++++++++++++++++++++++++++++++
- 1 files changed, 66 insertions(+), 0 deletions(-)
+ arch/arm/mach-omap2/mux33xx.c         |    2 +-
+ 2 files changed, 67 insertions(+), 1 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index ee936e0..ecf4a76 100644
@@ -113,6 +114,19 @@ index ee936e0..ecf4a76 100644
  	{NULL, 0, 0},
  };
  
+diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
+index 0286c4f..f09e827 100644
+--- a/arch/arm/mach-omap2/mux33xx.c
++++ b/arch/arm/mach-omap2/mux33xx.c
+@@ -49,7 +49,7 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 		NULL, NULL, NULL, NULL),
+ 	_AM33XX_MUXENTRY(GPMC_AD6, 0,
+ 		"gpmc_ad6", "mmc1_dat6", NULL, NULL,
+-		NULL, NULL, NULL, NULL),
++		NULL, NULL, NULL, "gpio1_6"),
+ 	_AM33XX_MUXENTRY(GPMC_AD7, 0,
+ 		"gpmc_ad7", "mmc1_dat7", NULL, NULL,
+ 		NULL, NULL, NULL, NULL),
 -- 
-1.7.2.5
+1.7.4.1
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
index faf7406..953b574 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.1.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.1-staging"
 SRCREV = "1d84d8853fa30cf3db2571a5aec572accca4e29d"
-MACHINE_KERNEL_PR_append = "n+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "o+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-- 
1.7.4.1


