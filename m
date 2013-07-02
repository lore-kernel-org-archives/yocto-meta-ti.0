Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44F72E0140D
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2013 09:02:54 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0566F52A53; Tue,  2 Jul 2013 16:02:51 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130702160252.0566F52A53@arago-project.org>
Date: Tue,  2 Jul 2013 16:02:51 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : linux-am335x-psp: Add Beaglebone Black support
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
X-List-Received-Date: Tue, 02 Jul 2013 16:02:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: f815f3aa4c104b6f25e29358241aa20682f3ddf6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f815f3aa4c104b6f25e29358241aa20682f3ddf6

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Thu Jun 27 10:57:34 2013 -0500

linux-am335x-psp: Add Beaglebone Black support

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...-Add-minimal-support-for-Beaglebone-Black.patch |  110 ++++++++++++++++++++
 recipes-kernel/linux/linux-am335x-psp_3.2.bb       |    5 +-
 2 files changed, 114 insertions(+), 1 deletions(-)

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


