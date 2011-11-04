Return-Path: <joelagnel@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97615E00307
	for <meta-ti@yoctoproject.org>; Fri,  4 Nov 2011 12:42:27 -0700 (PDT)
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id pA4JgQbT018060
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Fri, 4 Nov 2011 14:42:26 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id pA4JgQR5020167
	for <meta-ti@yoctoproject.org>; Fri, 4 Nov 2011 14:42:26 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA4JgQiq003899
	for <meta-ti@yoctoproject.org>; Fri, 4 Nov 2011 14:42:26 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 4 Nov 2011 14:42:26 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	pA4JgPQj010405;	Fri, 4 Nov 2011 14:42:26 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 4 Nov 2011 14:26:03 -0500
Message-ID: <1320434764-17119-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: [PATCH] U-boot 2011.10rc: Refresh PMIC patch with Rev A1 fixes
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
X-List-Received-Date: Fri, 04 Nov 2011 19:42:27 -0000
Content-Type: text/plain

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 ...vm-Fix-bone-pmic-shut-down-over-USB-power.patch |   51 +++++++++++++-------
 recipes-bsp/u-boot/u-boot_2011.10rc.bb             |    2 +-
 2 files changed, 34 insertions(+), 19 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0006-am335x-evm-Fix-bone-pmic-shut-down-over-USB-power.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0006-am335x-evm-Fix-bone-pmic-shut-down-over-USB-power.patch
index 2b8caa3..158483b 100644
--- a/recipes-bsp/u-boot/u-boot/2011.09git/0006-am335x-evm-Fix-bone-pmic-shut-down-over-USB-power.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0006-am335x-evm-Fix-bone-pmic-shut-down-over-USB-power.patch
@@ -1,33 +1,46 @@
 From 801316091ac7e14cc8fa9b0bd2cdce76bea06991 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Thu, 3 Nov 2011 22:19:19 -0500
-Subject: [PATCH] am335x-evm: Fix bone pmic shut down over USB power
-Cc: trini@ti.com
+Subject: [PATCH v2] am335x-evm: Fix bone pmic shut down over USB power
+Cc: trini@ti.com,
+    chase.maupin@ti.com
 
-* Set DCDC2 to 1.2v for all boards irrespective of board version, or power source.
+* Set DCDC2 to 1.2v for all power sources and board revs except for A1
 * Set USB current trip point to 1300mA for all boards and power sources.
 * Only Skip setting of MPU frequency to 720MHz for A1 and USB-powered boards.
 
-Credits to Jason for noticing this. Tested with 20 reboots over USB.
+Credits to Jason for noticing this. Tested with several reboots over USB on a Rev A2/3.
+
+v2 changes:
+Take care of not upping DCDC2 and LDO voltages for A1.
+For A1- only operation done is to set the USB current limit.
 
 Signed-off-by: Jason Kridner <jdk@ti.com>
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
- board/ti/am335x/evm.c |   27 ++++++++++++++-------------
- 1 files changed, 14 insertions(+), 13 deletions(-)
+Chase has volunteered to test this out on his A1.
+
+ board/ti/am335x/evm.c |   31 ++++++++++++++++---------------
+ 1 files changed, 16 insertions(+), 15 deletions(-)
 
 diff --git a/board/ti/am335x/evm.c b/board/ti/am335x/evm.c
-index e95a088..bd3c09a 100644
+index e95a088..bc1119e 100644
 --- a/board/ti/am335x/evm.c
 +++ b/board/ti/am335x/evm.c
-@@ -483,12 +483,10 @@ void spl_board_init(void)
+@@ -483,12 +483,20 @@ void spl_board_init(void)
  		if (tps65217_reg_read(STATUS, &pmic_status_reg))
  			return;
  
--		/* Only perform PMIC configurations if board rev > A1 */
--		if (!strncmp(header.version, "00A1", 4))
--			return;
--
++		/* Increase USB current limit to 1300mA */
++		if (tps65217_reg_write(PROT_LEVEL_NONE, POWER_PATH,
++				       USB_INPUT_CUR_LIMIT_1300MA,
++				       USB_INPUT_CUR_LIMIT_MASK))
++			printf("tps65217_reg_write failure\n");
++
+ 		/* Only perform PMIC configurations if board rev > A1 */
+ 		if (!strncmp(header.version, "00A1", 4))
+ 			return;
+ 
 -		if (!(pmic_status_reg & PWR_SRC_AC_BITMASK)) {
 -			printf("No AC power, disabling frequency switch\n");
 +		/* Set DCDC2 (MPU) voltage to 1.275V */
@@ -37,10 +50,16 @@ index e95a088..bd3c09a 100644
  			return;
  		}
  
-@@ -507,14 +505,17 @@ void spl_board_init(void)
- 				       USB_INPUT_CUR_LIMIT_MASK))
+@@ -501,20 +509,13 @@ void spl_board_init(void)
+ 				       LDO_VOLTAGE_OUT_3_3, LDO_MASK))
  			printf("tps65217_reg_write failure\n");
  
+-		/* Increase USB current limit to 1300mA */
+-		if (tps65217_reg_write(PROT_LEVEL_NONE, POWER_PATH,
+-				       USB_INPUT_CUR_LIMIT_1300MA,
+-				       USB_INPUT_CUR_LIMIT_MASK))
+-			printf("tps65217_reg_write failure\n");
+-
 -		/* Set DCDC2 (MPU) voltage to 1.275V */
 -		if (!tps65217_voltage_update(DEFDCDC2,
 -					     DCDC_VOLT_SEL_1275MV)) {
@@ -48,10 +67,6 @@ index e95a088..bd3c09a 100644
 -			mpu_pll_config(MPUPLL_M_720);
 -		} else {
 -			printf("tps65217_voltage_update failure\n");
-+		/* Only perform PMIC configurations if board rev > A1 */
-+		if (!strncmp(header.version, "00A1", 4))
-+			return;
-+
 +		if (!(pmic_status_reg & PWR_SRC_AC_BITMASK)) {
 +			printf("No AC power, disabling frequency switch\n");
 +			return;
diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
index cf1979d..39d88b6 100644
--- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
@@ -4,7 +4,7 @@ require u-boot.inc
 COMPATIBLE_MACHINE = "(ti33x)"
 DEFAULT_PREFERENCE_ti33x = "99"
 PV = "2011.09+git"
-PR = "r18"
+PR = "r19"
 
 # SPL build
 UBOOT_BINARY = "u-boot.img"
-- 
1.7.0.4


