Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.2840.1581379665808026948
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 16:07:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA937E0171F; Mon, 10 Feb 2020 16:07:45 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [64.68.198.64 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BFE8E0171C
	for <meta-ti@yoctoproject.org>; Mon, 10 Feb 2020 16:07:44 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A8DD540C1F;
	Tue, 11 Feb 2020 00:07:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UC6lsAXKjYCZ; Tue, 11 Feb 2020 00:07:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 884B040BFD;
	Tue, 11 Feb 2020 00:07:42 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D51791743F3;
	Mon, 10 Feb 2020 19:07:41 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH] conf/machine: generalize wic usage by moving settings to SOC files
Date: Mon, 10 Feb 2020 19:07:40 -0500
Message-Id: <1581379660-16073-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am335x-evm.conf      |  2 +-
 conf/machine/am437x-evm.conf      |  2 +-
 conf/machine/am57xx-evm.conf      |  2 --
 conf/machine/am65xx-evm.conf      | 10 ----------
 conf/machine/beagle-x15.conf      | 25 -------------------------
 conf/machine/beaglebone.conf      |  6 ------
 conf/machine/dra7xx-evm.conf      |  2 --
 conf/machine/include/k3.inc       | 10 ++++++++++
 conf/machine/include/omap-a15.inc |  4 ++++
 conf/machine/include/ti33x.inc    |  4 ++++
 conf/machine/include/ti43x.inc    |  4 ++++
 conf/machine/j7-evm.conf          | 10 ----------
 12 files changed, 24 insertions(+), 57 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 8bfbee8..469c4d3 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -7,7 +7,7 @@ require conf/machine/include/ti33x.inc
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubifs ubi tar.xz"
+IMAGE_FSTYPES += "ubifs ubi"
 
 # Normally AM335 boards use ttyS0, but ICE uses ttyS3, so try both
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
diff --git a/conf/machine/am437x-evm.conf b/conf/machine/am437x-evm.conf
index e7d3a98..4e3681d 100644
--- a/conf/machine/am437x-evm.conf
+++ b/conf/machine/am437x-evm.conf
@@ -7,7 +7,7 @@ require conf/machine/include/ti43x.inc
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubifs ubi tar.xz"
+IMAGE_FSTYPES += "ubifs ubi"
 
 SERIAL_CONSOLES = "115200;ttyS0"
 
diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 449aad9..3f05035 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -6,8 +6,6 @@ require conf/machine/include/dra7xx.inc
 
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "tar.xz"
-
 SERIAL_CONSOLES = "115200;ttyS2"
 
 KERNEL_DEVICETREE = " \
diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index bc5fdc3..dce6d05 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -6,8 +6,6 @@ require conf/machine/include/am65xx.inc
 
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "tar.xz wic.xz"
-
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
@@ -24,11 +22,3 @@ UBOOT_MACHINE = "am65x_evm_a53_defconfig"
 OPTEEMACHINE = "k3"
 OPTEEFLAVOR = "am65x"
 OPTEEOUTPUTMACHINE = "k3"
-
-# Please note that booting AM65xx platform also requires
-# tiboot3.bin and sysfw.itb, which are provided by meta-arago
-# u-boot-k3-r5 and ti-sci-fw recipes
-IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
-WKS_FILE ?= "sdimage-bootpart.wks"
-
-do_image_wic[depends] += "u-boot:do_deploy"
diff --git a/conf/machine/beagle-x15.conf b/conf/machine/beagle-x15.conf
index d5e05ec..c750326 100644
--- a/conf/machine/beagle-x15.conf
+++ b/conf/machine/beagle-x15.conf
@@ -11,28 +11,3 @@ MACHINE_GUI_CLASS = "bigscreen"
 SERIAL_CONSOLES = "115200;ttyS2"
 
 UBOOT_MACHINE = "am57xx_evm_config"
-
-WKS_FILE ?= "sdimage-bootpart.wks"
-IMAGE_BOOT_FILES = "MLO u-boot.img"
-IMAGE_FSTYPES += "tar.xz wic.xz"
-
-# UBI information.  Note that this is board and kernel specific.  Changes
-# in your kernel port may require changes in these variables.  For more
-# details about this board please see
-# http://processors.wiki.ti.com/index.php/UBIFS_Support
-
-# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
-# From dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: logical eraseblock size:    126976 bytes
-# from ubiattach stdout:
-# UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 8192"
-
-# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
-# from dmesg:
-# UBI: smallest flash I/O unit:    2048
-# UBI: physical eraseblock size:   131072 bytes (128 KiB)
-# UBI: sub-page size:              512
-# UBI: VID header offset:          2048 (aligned 2048)
-UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index d8fd406..896a9d7 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -13,12 +13,6 @@ MACHINE_GUI_CLASS = "bigscreen"
 
 SERIAL_CONSOLES = "115200;ttyS0"
 
-WKS_FILE ?= "sdimage-bootpart.wks"
-
-IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} ${SPL_BINARY}"
-
-IMAGE_FSTYPES += "tar.xz wic.xz"
-
 IMAGE_INSTALL_append = " kernel-devicetree kernel-image-zimage"
 
 # Refine the list of device targets for ti-pdk class recipes
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index b1da844..67ce99c 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -6,8 +6,6 @@ require conf/machine/include/dra7xx.inc
 
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "tar.xz"
-
 SERIAL_CONSOLES = "115200;ttyS0"
 
 KERNEL_DEVICETREE = " \
diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 8b836ea..c9ff553 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -31,3 +31,13 @@ UBI_VOLNAME = "rootfs"
 # List common SoC features, may need to add touchscreen for specific machines
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet pci gpu"
 # Not ready yet - dsp mmip
+
+IMAGE_FSTYPES += "tar.xz wic.xz"
+
+# Please note that booting K3 platform also requires
+# tiboot3.bin and sysfw.itb, which are provided by meta-arago
+# u-boot-k3-r5 and ti-sci-fw recipes
+IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
+WKS_FILE ?= "sdimage-bootpart.wks"
+
+do_image_wic[depends] += "u-boot:do_deploy"
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index cc05536..1b9f653 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -37,3 +37,7 @@ UBI_VOLNAME = "rootfs"
 
 # List common SoC features, may need to add touchscreen for specific machines
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu mmip dsp"
+
+IMAGE_FSTYPES += "tar.xz wic.xz"
+WKS_FILE ?= "sdimage-bootpart.wks"
+IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 6f97361..a744cd6 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -58,3 +58,7 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa etherne
 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS = "am335x"
 TI_PDK_LIMIT_BOARDS = "evmAM335x icev2AM335x iceAMIC110 bbbAM335x skAM335x"
+
+IMAGE_FSTYPES += "tar.xz wic.xz"
+WKS_FILE ?= "sdimage-bootpart.wks"
+IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index a0cc9cc..252053c 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -55,3 +55,7 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa etherne
 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS = "am437x"
 TI_PDK_LIMIT_BOARDS = "evmAM437x idkAM437x skAM437x"
+
+IMAGE_FSTYPES += "tar.xz wic.xz"
+WKS_FILE ?= "sdimage-bootpart.wks"
+IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index e41b152..581fed9 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/k3.inc
 
-IMAGE_FSTYPES += "tar.xz wic.xz"
-
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
@@ -21,14 +19,6 @@ OPTEEMACHINE = "k3"
 OPTEEFLAVOR = "j7"
 OPTEEOUTPUTMACHINE = "k3"
 
-# Please note that booting J7 platform also requires
-# tiboot3.bin and sysfw.itb, which are provided by meta-arago
-# u-boot-k3-r5 and ti-sci-fw recipes
-IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
-WKS_FILE ?= "sdimage-bootpart.wks"
-
-do_image_wic[depends] += "u-boot:do_deploy"
-
 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_SOCS = "j721e j7200"
 TI_PDK_LIMIT_BOARDS = "j721e_evm j7200_evm"
-- 
2.7.4

