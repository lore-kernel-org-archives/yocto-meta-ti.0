Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C048AE0156C
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 08:44:30 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5RFiTv6001095
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 10:44:29 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5RFiTxk016238
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 10:44:29 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 10:44:29 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5RFiCGd023148;
	Thu, 27 Jun 2013 10:44:27 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Jun 2013 10:57:35 -0500
Message-ID: <1372348655-5596-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1372348655-5596-1-git-send-email-fcooper@ti.com>
References: <1372348655-5596-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] linux-am335x-psp: Add 1 GHZ Support for BBB
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
X-List-Received-Date: Thu, 27 Jun 2013 15:44:32 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...nable-Turbo-and-Nitro-modes-for-Beaglebon.patch |   41 ++++++++++++++++++++
 recipes-kernel/linux/linux-am335x-psp_3.2.bb       |    6 ++-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x-Re-enable-Turbo-and-Nitro-modes-for-Beaglebon.patch

diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x-Re-enable-Turbo-and-Nitro-modes-for-Beaglebon.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x-Re-enable-Turbo-and-Nitro-modes-for-Beaglebon.patch
new file mode 100644
index 0000000..17a87af
--- /dev/null
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x-Re-enable-Turbo-and-Nitro-modes-for-Beaglebon.patch
@@ -0,0 +1,41 @@
+From ec0ec41418ec1193e4352f1983ab29173f10f855 Mon Sep 17 00:00:00 2001
+From: Steve Kipisz <s-kipisz2@ti.com>
+Date: Wed, 5 Jun 2013 10:10:44 -0500
+Subject: [PATCH] am335x:Re-enable Turbo and Nitro modes for Beaglebone Black
+ The Beaglebone Black boards use a speed binned PG2.0 AM335x
+ that operate up to 1GHz so re-enable those modes for
+ Beaglebone Black.
+
+Signed-off-by: Steve Kipisz <s-kipisz2@ti.com>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index bac415c..47e5a9d 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2529,6 +2529,20 @@ static void am335x_evm_setup(struct memory_accessor *mem_acc, void *context)
+ 
+ 	am335x_opp_update();
+ 
++	/*
++	 * For now, Beaglebone Black uses PG 2.0 that are speed binned and operate
++	 * up to 1GHz. So re-enable Turbo and Nitro modes,
++	 */
++	if (!strncmp("A335BNLT", config.name, 8)) {
++		struct device *mpu_dev;
++
++		mpu_dev = omap_device_get_by_hwmod_name("mpu");
++		opp_enable(mpu_dev,
++			    AM33XX_ES2_0_OPPTURBO_FREQ);
++		opp_enable(mpu_dev,
++			    AM33XX_ES2_0_OPPNITRO_FREQ);
++	}
++
+ 	/* SmartReflex also requires board information. */
+ 	am33xx_sr_init();
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-am335x-psp_3.2.bb b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
index 257c6de..eaf788f 100644
--- a/recipes-kernel/linux/linux-am335x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
@@ -15,7 +15,7 @@ DEPENDS += "am33x-cm3"
 KERNEL_IMAGETYPE = "uImage"
 
 # The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
-MACHINE_KERNEL_PR_append = "g+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "h+gitr${SRCPV}"
 
 BRANCH = "v3.2-staging"
 
@@ -88,7 +88,9 @@ PATCHES += "file://0001-am335x-enable-pullup-on-the-WLAN-enable-pin-fo.patch"
 PATCHES += "file://0001-ARM-OMAP2-AM335x-Update-SPI-flash-layout.patch"
 
 # Add support for Beaglebone Black
-PATCHES += "file://0001-am335x-Add-minimal-support-for-Beaglebone-Black.patch"
+PATCHES += "file://0001-am335x-Add-minimal-support-for-Beaglebone-Black.patch \
+            file://0001-am335x-Re-enable-Turbo-and-Nitro-modes-for-Beaglebon.patch \
+"
 
 # Copy the am33x-cm3 firmware if it is available
 do_configure_append() {
-- 
1.7.0.4


