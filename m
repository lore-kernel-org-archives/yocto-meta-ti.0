Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E343E014E2
	for <meta-ti@yoctoproject.org>; Tue,  4 Jun 2013 20:17:08 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MNW0093CH4320Y1@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 04 Jun 2013 22:17:07 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D2841200E2; Tue,
	04 Jun 2013 23:16:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 04 Jun 2013 23:16:47 -0400
Message-id: <1370402207-23681-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH] u-boot-dra7xx: add latest u-boot from the integration branch
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
X-List-Received-Date: Wed, 05 Jun 2013 03:17:08 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/dra7xx-evm.conf                |  7 +++++--
 recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb | 16 ++++++++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index d968d3b..5897a5f 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -8,6 +8,11 @@ IMAGE_FSTYPES += "ubi tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-dra7xx"
+PREFERRED_PROVIDER_u-boot = "u-boot-dra7xx"
+
+UBOOT_MACHINE = "dra7xx_evm_config"
+
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
@@ -29,8 +34,6 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
 # UBI: VID header offset:          2048 (aligned 2048)
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
 
-UBOOT_MACHINE = "dra7xx_evm_config"
-
 # Currently removing the sgx machine feature because there is no SGX package
 # available for omap5
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
diff --git a/recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb b/recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb
new file mode 100644
index 0000000..eb3fc05
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-dra7xx_2013.04.bb
@@ -0,0 +1,16 @@
+require u-boot-ti.inc
+
+DESCRIPTION = "u-boot bootloader for TI devices"
+
+COMPATIBLE_MACHINE = "dra7xx-evm"
+
+PR = "r0+gitr${SRCPV}"
+
+SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
+
+BRANCH ?= "ti-u-boot-2013.04+"
+
+# This commit corresponds to ti2013.04.02 release tag
+SRCREV = "e2315adf674b60132f0c5c8fe6eac5d109b81688"
+
+SPL_BINARY = "MLO"
-- 
1.8.2.1


