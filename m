Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2FB48E0158E
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 08:44:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5RFiQcK016931
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 10:44:26 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5RFiQ4X016207
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 10:44:26 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 10:44:26 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5RFiCGc023148;
	Thu, 27 Jun 2013 10:44:24 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Jun 2013 10:57:34 -0500
Message-ID: <1372348655-5596-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1372348655-5596-1-git-send-email-fcooper@ti.com>
References: <1372348655-5596-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] linux-am335x-psp: Add Beaglebone Black support
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
X-List-Received-Date: Thu, 27 Jun 2013 15:44:27 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...-Add-minimal-support-for-Beaglebone-Black.patch |  110 ++++++++++++++++++++
 recipes-kernel/linux/linux-am335x-psp_3.2.bb       |    5 +-
 2 files changed, 114 insertions(+), 1 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x-Add-minimal-support-for-Beaglebone-Black.patch

diff --git a/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x-Add-minimal-support-for-Beaglebone-Black.patch b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x-Add-minimal-support-for-Beaglebone-Black.patch
new file mode 100644
index 0000000..ec83d19
--- /dev/null
+++ b/recipes-kernel/linux/linux-am335x-psp-3.2/0001-am335x-Add-minimal-support-for-Beaglebone-Black.patch
@@ -0,0 +1,110 @@
+From cda956db2b54400c44cc8eb952276ecb058f57d8 Mon Sep 17 00:00:00 2001
+From: Steve Kipisz <s-kipisz2@ti.com>
+Date: Mon, 3 Jun 2013 04:35:51 -0500
+Subject: [PATCH] am335x:Add minimal support for Beaglebone Black
+
+- Detect Beaglebone Black and do the appropriate pin mux
+- Add pin mux for eMMC
+
+Signed-off-by: Steve Kipisz <s-kipisz2@ti.com>
+---
+ arch/arm/mach-omap2/board-am335xevm.c              |   49 ++++++++++++++++++++
+ arch/arm/mach-omap2/include/mach/board-am335xevm.h |    1 +
+ 2 files changed, 50 insertions(+)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 1523f33..c4a5c05 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1654,6 +1654,21 @@ static void mmc1_wl12xx_init(int evm_id, int profile)
+ 	am335x_mmc[1].ocr_mask = MMC_VDD_32_33 | MMC_VDD_33_34; /* 3V3 */
+ }
+ 
++static void mmc1_emmc_init(int evm_id, int profile)
++{
++	setup_pin_mux(mmc1_common_pin_mux);
++	setup_pin_mux(mmc1_dat4_7_pin_mux);
++
++	am335x_mmc[1].mmc = 2;
++	am335x_mmc[1].caps = MMC_CAP_8_BIT_DATA;
++	am335x_mmc[1].gpio_cd = -EINVAL;
++	am335x_mmc[1].gpio_wp = -EINVAL;
++	am335x_mmc[1].ocr_mask = MMC_VDD_32_33 | MMC_VDD_33_34; /* 3V3 */
++
++	/* mmc will be initialized when mmc0_init is called */
++	return;
++}
++
+ static void mmc2_wl12xx_init(int evm_id, int profile)
+ {
+ 	setup_pin_mux(mmc2_wl12xx_pin_mux);
+@@ -2177,6 +2192,21 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+ 	{NULL, 0, 0},
+ };
+ 
++/* Beaglebone Black */
++static struct evm_dev_cfg beagleboneblack_dev_cfg[] = {
++	{am335x_rtc_init, DEV_ON_BASEBOARD, PROFILE_NONE},
++	{clkout2_enable, DEV_ON_BASEBOARD, PROFILE_NONE},
++	{tps65217_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
++	{mii1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
++	{usb0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
++	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
++	{mmc1_emmc_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
++	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
++	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
++	{sgx_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
++	{NULL, 0, 0},
++};
++
+ /* EVM - Starter Kit */
+ static struct evm_dev_cfg evm_sk_dev_cfg[] = {
+ 	{am335x_rtc_init, DEV_ON_BASEBOARD, PROFILE_ALL},
+@@ -2280,6 +2310,23 @@ static void setup_beaglebone(void)
+ 	am33xx_cpsw_init(AM33XX_CPSW_MODE_MII, NULL, NULL);
+ }
+ 
++/* BeagleBone Black */
++static void setup_beagleboneblack(void)
++{
++	pr_info("The board is a AM335x Beaglebone Black.\n");
++
++	/* Beagle Bone has Micro-SD slot which doesn't have Write Protect pin */
++	am335x_mmc[0].gpio_wp = -EINVAL;
++
++	_configure_device(BEAGLE_BONE_BLACK, beagleboneblack_dev_cfg,
++				PROFILE_NONE);
++
++	/* TPS65217 regulator has full constraints */
++	regulator_has_full_constraints();
++
++	am33xx_cpsw_init(AM33XX_CPSW_MODE_MII, NULL, NULL);
++}
++
+ /* EVM - Starter Kit */
+ static void setup_starterkit(void)
+ {
+@@ -2372,6 +2419,8 @@ static void am335x_evm_setup(struct memory_accessor *mem_acc, void *context)
+ 			setup_beaglebone_old();
+ 		else
+ 			setup_beaglebone();
++	} else if (!strncmp("A335BNLT", config.name, 8)) {
++		setup_beagleboneblack();
+ 	} else if (!strncmp("A335X_SK", config.name, 8)) {
+ 		daughter_brd_detected = false;
+ 		setup_starterkit();
+diff --git a/arch/arm/mach-omap2/include/mach/board-am335xevm.h b/arch/arm/mach-omap2/include/mach/board-am335xevm.h
+index e77d52c..915139a 100644
+--- a/arch/arm/mach-omap2/include/mach/board-am335xevm.h
++++ b/arch/arm/mach-omap2/include/mach/board-am335xevm.h
+@@ -26,6 +26,7 @@
+ #define BEAGLE_BONE_A3		3
+ #define EVM_SK			4
+ #define GEN_PURP_DDR3_EVM	5
++#define BEAGLE_BONE_BLACK	6
+ 
+ /* REVIST : check posibility of PROFILE_(x) syntax usage */
+ #define PROFILE_NONE	-1	/* Few EVM doesn't have profiles */
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-am335x-psp_3.2.bb b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
index 958bba5..257c6de 100644
--- a/recipes-kernel/linux/linux-am335x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
@@ -15,7 +15,7 @@ DEPENDS += "am33x-cm3"
 KERNEL_IMAGETYPE = "uImage"
 
 # The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
-MACHINE_KERNEL_PR_append = "f+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "g+gitr${SRCPV}"
 
 BRANCH = "v3.2-staging"
 
@@ -87,6 +87,9 @@ PATCHES += "file://0001-am335x-enable-pullup-on-the-WLAN-enable-pin-fo.patch"
 # Update SPI flash layout. Increase space allocated for u-boot
 PATCHES += "file://0001-ARM-OMAP2-AM335x-Update-SPI-flash-layout.patch"
 
+# Add support for Beaglebone Black
+PATCHES += "file://0001-am335x-Add-minimal-support-for-Beaglebone-Black.patch"
+
 # Copy the am33x-cm3 firmware if it is available
 do_configure_append() {
     if [ -e "${STAGING_DIR_HOST}/${base_libdir}/firmware/am335x-pm-firmware.bin" ]
-- 
1.7.0.4


