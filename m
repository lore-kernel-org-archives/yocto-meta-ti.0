Return-Path: <joelagnel@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 58AD6E00301
	for <meta-ti@yoctoproject.org>; Thu,  3 Nov 2011 20:54:11 -0700 (PDT)
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id pA43sA1w017682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Thu, 3 Nov 2011 22:54:10 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA43sACQ015864
	for <meta-ti@yoctoproject.org>; Thu, 3 Nov 2011 22:54:10 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA43s9AF026986
	for <meta-ti@yoctoproject.org>; Thu, 3 Nov 2011 22:54:09 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3; Thu, 3 Nov 2011
	22:54:09 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	pA43s8rG011681;	Thu, 3 Nov 2011 22:54:09 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 3 Nov 2011 22:37:48 -0500
Message-ID: <1320377869-29758-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: [PATCH] u-boot 2011.10rc: Fix pmic shut down over USB power
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
X-List-Received-Date: Fri, 04 Nov 2011 03:54:11 -0000
Content-Type: text/plain

These are some fixes suggested by Jason Kridner to fix the PMIC
instabilities we've been seeing over USB power.

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
Cc: Jason Kridner <jdk@ti.com>
---
 ...vm-Fix-bone-pmic-shut-down-over-USB-power.patch |   67 ++++++++++++++++++++
 recipes-bsp/u-boot/u-boot_2011.10rc.bb             |    3 +-
 2 files changed, 69 insertions(+), 1 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0006-am335x-evm-Fix-bone-pmic-shut-down-over-USB-power.patch

diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0006-am335x-evm-Fix-bone-pmic-shut-down-over-USB-power.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0006-am335x-evm-Fix-bone-pmic-shut-down-over-USB-power.patch
new file mode 100644
index 0000000..2b8caa3
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0006-am335x-evm-Fix-bone-pmic-shut-down-over-USB-power.patch
@@ -0,0 +1,67 @@
+From 801316091ac7e14cc8fa9b0bd2cdce76bea06991 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Thu, 3 Nov 2011 22:19:19 -0500
+Subject: [PATCH] am335x-evm: Fix bone pmic shut down over USB power
+Cc: trini@ti.com
+
+* Set DCDC2 to 1.2v for all boards irrespective of board version, or power source.
+* Set USB current trip point to 1300mA for all boards and power sources.
+* Only Skip setting of MPU frequency to 720MHz for A1 and USB-powered boards.
+
+Credits to Jason for noticing this. Tested with 20 reboots over USB.
+
+Signed-off-by: Jason Kridner <jdk@ti.com>
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ board/ti/am335x/evm.c |   27 ++++++++++++++-------------
+ 1 files changed, 14 insertions(+), 13 deletions(-)
+
+diff --git a/board/ti/am335x/evm.c b/board/ti/am335x/evm.c
+index e95a088..bd3c09a 100644
+--- a/board/ti/am335x/evm.c
++++ b/board/ti/am335x/evm.c
+@@ -483,12 +483,10 @@ void spl_board_init(void)
+ 		if (tps65217_reg_read(STATUS, &pmic_status_reg))
+ 			return;
+ 
+-		/* Only perform PMIC configurations if board rev > A1 */
+-		if (!strncmp(header.version, "00A1", 4))
+-			return;
+-
+-		if (!(pmic_status_reg & PWR_SRC_AC_BITMASK)) {
+-			printf("No AC power, disabling frequency switch\n");
++		/* Set DCDC2 (MPU) voltage to 1.275V */
++		if (tps65217_voltage_update(DEFDCDC2,
++					     DCDC_VOLT_SEL_1275MV)) {
++			printf("tps65217_voltage_update failure\n");
+ 			return;
+ 		}
+ 
+@@ -507,14 +505,17 @@ void spl_board_init(void)
+ 				       USB_INPUT_CUR_LIMIT_MASK))
+ 			printf("tps65217_reg_write failure\n");
+ 
+-		/* Set DCDC2 (MPU) voltage to 1.275V */
+-		if (!tps65217_voltage_update(DEFDCDC2,
+-					     DCDC_VOLT_SEL_1275MV)) {
+-			/* Set MPU Frequency to 720MHz */
+-			mpu_pll_config(MPUPLL_M_720);
+-		} else {
+-			printf("tps65217_voltage_update failure\n");
++		/* Only perform PMIC configurations if board rev > A1 */
++		if (!strncmp(header.version, "00A1", 4))
++			return;
++
++		if (!(pmic_status_reg & PWR_SRC_AC_BITMASK)) {
++			printf("No AC power, disabling frequency switch\n");
++			return;
+ 		}
++
++		/* Set MPU Frequency to 720MHz */
++		mpu_pll_config(MPUPLL_M_720);
+ 	} else {
+ 		/* 
+ 		 * EVM PMIC code.  PMIC voltage is configuring for frequency
+-- 
+1.7.4.1
+
diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
index eda4a62..cf1979d 100644
--- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
@@ -4,7 +4,7 @@ require u-boot.inc
 COMPATIBLE_MACHINE = "(ti33x)"
 DEFAULT_PREFERENCE_ti33x = "99"
 PV = "2011.09+git"
-PR = "r17"
+PR = "r18"
 
 # SPL build
 UBOOT_BINARY = "u-boot.img"
@@ -17,6 +17,7 @@ SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;br
            file://2011.09git/0003-am335x_evm-set-bootdelay-to-1.patch \
            file://2011.09git/0004-am335x-evm-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch \
            file://2011.09git/0005-am335x-Change-mmc_load_uimage-to-load-at-a-fixed-add.patch \
+           file://2011.09git/0006-am335x-evm-Fix-bone-pmic-shut-down-over-USB-power.patch \
           "
 
 SRCREV = "f63b270e47f62f4d1a05b2001357e215966c6f5a"
-- 
1.7.0.4


