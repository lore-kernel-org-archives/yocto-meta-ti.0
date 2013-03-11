Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3C3EE0072E
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 13:17:32 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2BKHU1u032064
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 15:17:31 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BKHUG6018358
	for <meta-ti@yoctoproject.org>; Tue, 12 Mar 2013 01:47:30 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 12 Mar 2013 01:47:30 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2BKHPcg013064;
	Tue, 12 Mar 2013 01:47:29 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 11 Mar 2013 15:17:23 -0500
Message-ID: <1363033043-21593-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363033043-21593-1-git-send-email-Chase.Maupin@ti.com>
References: <1363033043-21593-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] omap5-evm: Add OMAP5 EVM configuration
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
X-List-Received-Date: Mon, 11 Mar 2013 20:17:33 -0000
Content-Type: text/plain

* Add the machine configuration for the OMAP5 EVM device.
* Create the omap-a15.inc file to be shared with all Cortex-A15
  derivative devices.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../machine/include/{keystone.inc => omap-a15.inc} |   14 +++++++-------
 conf/machine/{am335x-evm.conf => omap5-evm.conf}   |   17 +++++++----------
 2 files changed, 14 insertions(+), 17 deletions(-)
 copy conf/machine/include/{keystone.inc => omap-a15.inc} (52%)
 copy conf/machine/{am335x-evm.conf => omap5-evm.conf} (78%)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/omap-a15.inc
similarity index 52%
copy from conf/machine/include/keystone.inc
copy to conf/machine/include/omap-a15.inc
index bd447d4..3ea1a05 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -1,18 +1,18 @@
-SOC_FAMILY = "keystone"
+SOC_FAMILY = "omap-a15"
 require conf/machine/include/soc-family.inc
 
 require conf/machine/include/tune-cortexa15.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
-
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r5"
+MACHINE_KERNEL_PR = "r0"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 
 KERNEL_IMAGETYPE = "uImage"
 
+UBOOT_ARCH = "arm"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
-EXTRA_IMAGEDEPENDS += "u-boot"
-EXTRA_IMAGEDEPENDS += "boot-monitor"
+EXTRA_IMAGEDEPENDS += "virtual/bootloader"
diff --git a/conf/machine/am335x-evm.conf b/conf/machine/omap5-evm.conf
similarity index 78%
copy from conf/machine/am335x-evm.conf
copy to conf/machine/omap5-evm.conf
index 2889358..daa5f58 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/omap5-evm.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: AM335x EVM
-#@DESCRIPTION: Machine configuration for the TI AM335x EVM
+#@NAME: OMAP5 EVM
+#@DESCRIPTION: Machine configuration for the TI OMAP5 uEVM
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
 XSERVER = "xserver-xorg \
@@ -9,14 +9,12 @@ XSERVER = "xserver-xorg \
 
 GUI_MACHINE_CLASS = "smallscreen"
 
-require conf/machine/include/ti33x.inc
+require conf/machine/include/omap-a15.inc
 
 IMAGE_FSTYPES += "ubi tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
-
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
@@ -38,9 +36,8 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
 # UBI: VID header offset:          2048 (aligned 2048)
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
 
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
-
-UBOOT_ARCH = "arm"
-UBOOT_MACHINE = "am335x_evm_config"
+UBOOT_MACHINE = "omap5_evm_config"
 
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen sgx"
+# Currently removing the sgx machine feature because there is no SGX package
+# available for omap5
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
-- 
1.7.0.4


