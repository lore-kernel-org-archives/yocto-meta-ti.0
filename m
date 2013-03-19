Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2997E006D6
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 08:10:51 -0700 (PDT)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2JFAo0j009486
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 10:10:50 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFAnCW005337
	for <meta-ti@yoctoproject.org>; Tue, 19 Mar 2013 20:40:49 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 19 Mar 2013 20:40:49 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2JFAhYK023846;
	Tue, 19 Mar 2013 20:40:48 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 19 Mar 2013 10:10:41 -0500
Message-ID: <1363705841-9610-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363705841-9610-1-git-send-email-Chase.Maupin@ti.com>
References: <1363705841-9610-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] omap5-evm: Add OMAP5 EVM configuration
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
X-List-Received-Date: Tue, 19 Mar 2013 15:10:52 -0000
Content-Type: text/plain

* Add the machine configuration for the OMAP5 EVM device.
* Create the omap-a15.inc file to be shared with all Cortex-A15
  derivative devices.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 conf/machine/include/omap-a15.inc                |   18 ++++++++++++++++++
 conf/machine/{am335x-evm.conf => omap5-evm.conf} |   20 ++++++++++++++------
 2 files changed, 32 insertions(+), 6 deletions(-)
 create mode 100644 conf/machine/include/omap-a15.inc
 copy conf/machine/{am335x-evm.conf => omap5-evm.conf} (65%)

diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
new file mode 100644
index 0000000..3ea1a05
--- /dev/null
+++ b/conf/machine/include/omap-a15.inc
@@ -0,0 +1,18 @@
+SOC_FAMILY = "omap-a15"
+require conf/machine/include/soc-family.inc
+
+require conf/machine/include/tune-cortexa15.inc
+
+# Increase this everytime you change something in the kernel
+MACHINE_KERNEL_PR = "r0"
+
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
+
+KERNEL_IMAGETYPE = "uImage"
+
+UBOOT_ARCH = "arm"
+UBOOT_ENTRYPOINT = "0x80008000"
+UBOOT_LOADADDRESS = "0x80008000"
+
+EXTRA_IMAGEDEPENDS += "virtual/bootloader"
diff --git a/conf/machine/am335x-evm.conf b/conf/machine/omap5-evm.conf
similarity index 65%
copy from conf/machine/am335x-evm.conf
copy to conf/machine/omap5-evm.conf
index 21e79a2..daa5f58 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/omap5-evm.conf
@@ -1,13 +1,15 @@
 #@TYPE: Machine
-#@NAME: AM335x EVM
-#@DESCRIPTION: Machine configuration for the TI AM335x EVM
+#@NAME: OMAP5 EVM
+#@DESCRIPTION: Machine configuration for the TI OMAP5 uEVM
 
-require conf/machine/include/ti33x.inc
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+XSERVER = "xserver-xorg \
+           xf86-input-evdev \
+           xf86-video-fbdev"
 
-# Use built-in LCD by default
-XSERVER += "xf86-input-tslib"
 GUI_MACHINE_CLASS = "smallscreen"
-MACHINE_FEATURES += "touchscreen"
+
+require conf/machine/include/omap-a15.inc
 
 IMAGE_FSTYPES += "ubi tar.gz"
 
@@ -33,3 +35,9 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
 # UBI: sub-page size:              512
 # UBI: VID header offset:          2048 (aligned 2048)
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
+
+UBOOT_MACHINE = "omap5_evm_config"
+
+# Currently removing the sgx machine feature because there is no SGX package
+# available for omap5
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen touchscreen"
-- 
1.7.0.4


