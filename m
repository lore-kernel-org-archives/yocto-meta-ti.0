Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BFDFE0149D
	for <meta-ti@yoctoproject.org>; Wed,  5 Jun 2013 07:31:50 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MNX001SJCBVY3T0@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 05 Jun 2013 09:31:23 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 88C6D20210; Wed,
	05 Jun 2013 10:31:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 05 Jun 2013 10:31:02 -0400
Message-id: <1370442662-9540-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCHv2] u-boot-dra7xx: add latest u-boot from the integration branch
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
X-List-Received-Date: Wed, 05 Jun 2013 14:31:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

While the code is being pulled from ti-u-boot integration tree, J6/DRA7xx bring up
is being done from a separate branch that does not include all the commits made
for am335x. Hence, until those branches are merged with the mainline and unified
in a single recipe, a separate recipe just for DRA7xx makes more sense. This
recipe should eventually go away and unified under u-boot-ti-staging one.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - add detailed explanation for the new recipe

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


