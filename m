Return-Path: <joelagnel@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5041E01277
	for <meta-ti@yoctoproject.org>; Fri, 21 Oct 2011 07:47:12 -0700 (PDT)
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9LElBl9018437
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Fri, 21 Oct 2011 09:47:11 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9LElBO2003692
	for <meta-ti@yoctoproject.org>; Fri, 21 Oct 2011 09:47:11 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9LElB4W008823
	for <meta-ti@yoctoproject.org>; Fri, 21 Oct 2011 09:47:11 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 21 Oct 2011 09:47:11 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p9LElAUA021542;	Fri, 21 Oct 2011 09:47:10 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 21 Oct 2011 09:31:32 -0500
Message-ID: <1319207492-17342-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: [PATCH meta-ti v2] u-boot 2011.10rc: Read EEPROM header correctly for BeagleBone board detection
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
X-List-Received-Date: Fri, 21 Oct 2011 14:47:13 -0000
Content-Type: text/plain

This patch fixes the case where the EEPROM is programmed but we still use the
fall back case to detect the bone board. Now that EEPROMs are programmed, we should
correctly detect the bone board instead of relying on fall back to bone mode.

PR bumped

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
v2: Resolved merge conflict with 54906ebbec3447b47f298c92772fb619c969ec8a

 ...Read-name-field-in-EEPROM-header-for-Beag.patch |   28 ++++++++++++++++++++
 recipes-bsp/u-boot/u-boot_2011.10rc.bb             |    3 +-
 2 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-evm-Read-name-field-in-EEPROM-header-for-Beag.patch

diff --git a/recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-evm-Read-name-field-in-EEPROM-header-for-Beag.patch b/recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-evm-Read-name-field-in-EEPROM-header-for-Beag.patch
new file mode 100644
index 0000000..ef901a9
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot/2011.09git/0005-am335x-evm-Read-name-field-in-EEPROM-header-for-Beag.patch
@@ -0,0 +1,28 @@
+From 186250ee6abca3f080b5321504a1c5881ffbf7c6 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Thu, 20 Oct 2011 19:46:53 -0500
+Subject: [PATCH] am335x-evm: Read name field in EEPROM header for BeagleBoard bone detection
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ board/ti/am335x/evm.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/board/ti/am335x/evm.c b/board/ti/am335x/evm.c
+index 37e348f..b63dcbe 100755
+--- a/board/ti/am335x/evm.c
++++ b/board/ti/am335x/evm.c
+@@ -501,6 +501,10 @@ int board_init(void)
+ 		detect_daughter_board_profile();
+ 	} else if (!strncmp("SKU#03", header.config, 6)) {
+ 		board_id = IPP_BOARD;
++	} else if (!strncmp("A335BONE", header.name, 8)) {
++		board_id = BONE_BOARD;
++		profile = 1;	/* profile 0 is internally considered as 1 */
++		daughter_board_connected = 0;
+ 	} else {
+ 		printf("Did not find a recognized configuration, "
+ 			"assuming BeagleBone\n");
+-- 
+1.7.1
+
diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
index 0bd39d3..ca7b670 100644
--- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
@@ -4,7 +4,7 @@ require u-boot.inc
 COMPATIBLE_MACHINE = "(ti33x)"
 DEFAULT_PREFERENCE_ti33x = "99"
 PV = "2011.09+git"
-PR = "r14"
+PR = "r15"
 
 # SPL build
 UBOOT_BINARY = "u-boot.img"
@@ -18,6 +18,7 @@ SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;br
            file://2011.09git/0001-mach-types-Add-new-beaglebone-machine-type.patch \
            file://2011.09git/0003-am335x_evm-single-byte-address-EEPROM-for-board-iden.patch \
            file://2011.09git/0004-am335x-evm-fall-back-to-bone-if-header.config-is-emp.patch \
+           file://2011.09git/0005-am335x-evm-Read-name-field-in-EEPROM-header-for-Beag.patch \
           "
 
 SRCREV = "9158d7f37d596b867039345cb2e3f8f18f54fe46"
-- 
1.7.0.4


