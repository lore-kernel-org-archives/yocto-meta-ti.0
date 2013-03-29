Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6457E01485
	for <meta-ti@yoctoproject.org>; Fri, 29 Mar 2013 06:59:09 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2TDx7Xj018717
	for <meta-ti@yoctoproject.org>; Fri, 29 Mar 2013 08:59:08 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TDx6Fs025557
	for <meta-ti@yoctoproject.org>; Fri, 29 Mar 2013 19:29:07 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 29 Mar 2013 19:29:06 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TDx3LP006805;
	Fri, 29 Mar 2013 19:29:05 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 29 Mar 2013 08:59:00 -0500
Message-ID: <1364565540-30417-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] dra7xx-evm: Add DRA7xx machine type
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
X-List-Received-Date: Fri, 29 Mar 2013 13:59:09 -0000
Content-Type: text/plain

* Add the dra7xx-evm machine type which is part of the omap-a15
  SOC_FAMILY

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 conf/machine/dra7xx-evm.conf |   36 ++++++++++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 conf/machine/dra7xx-evm.conf

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
new file mode 100644
index 0000000..5543891
--- /dev/null
+++ b/conf/machine/dra7xx-evm.conf
@@ -0,0 +1,36 @@
+#@TYPE: Machine
+#@NAME: DRA7xx EVM
+#@DESCRIPTION: Machine configuration for the TI DRA7xx EVM
+
+require conf/machine/include/omap-a15.inc
+
+IMAGE_FSTYPES += "ubi tar.gz"
+
+SERIAL_CONSOLE = "115200 ttyO2"
+
+# UBI information.  Note that this is board and kernel specific.  Changes
+# in your kernel port may require changes in these variables.  For more
+# details about this board please see
+# http://processors.wiki.ti.com/index.php/UBIFS_Support
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# From dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: logical eraseblock size:    126976 bytes
+# from ubiattach stdout:
+# UBI device number 0, total 1988 LEBs
+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
+
+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
+# from dmesg:
+# UBI: smallest flash I/O unit:    2048
+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
+# UBI: sub-page size:              512
+# UBI: VID header offset:          2048 (aligned 2048)
+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
+
+UBOOT_MACHINE = "dra7xx_evm_config"
+
+# Currently removing the sgx machine feature because there is no SGX package
+# available for omap5
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
-- 
1.7.0.4


