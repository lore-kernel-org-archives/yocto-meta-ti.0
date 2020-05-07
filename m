Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2249.1588813679607738137
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 May 2020 18:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 023F840BDF;
	Thu,  7 May 2020 01:07:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MBHn2yy6q_Ih; Thu,  7 May 2020 01:07:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D9A3140A93;
	Thu,  7 May 2020 01:07:57 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 386E016EC83;
	Wed,  6 May 2020 21:07:57 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] conf/wic: switch back to 2-partition SD images, reserve extra space in boot
Date: Wed,  6 May 2020 21:07:57 -0400
Message-Id: <1588813677-430-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/k3.inc                  |  2 +-
 conf/machine/include/omap-a15.inc            |  2 +-
 conf/machine/include/ti33x.inc               |  2 +-
 conf/machine/include/ti43x.inc               |  2 +-
 wic/{sdimage-3part.wks => sdimage-2part.wks} | 12 +++++-------
 5 files changed, 9 insertions(+), 11 deletions(-)
 rename wic/{sdimage-3part.wks => sdimage-2part.wks} (22%)

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 765e0ee..54b1789 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -39,7 +39,7 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa etherne
 IMAGE_FSTYPES += "tar.xz wic.xz"
 
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
-WKS_FILE ?= "sdimage-3part.wks"
+WKS_FILE ?= "sdimage-2part.wks"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index c22e6dd..e491d2b 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -39,6 +39,6 @@ UBI_VOLNAME = "rootfs"
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu mmip dsp gc320"
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
-WKS_FILE ?= "sdimage-3part.wks"
+WKS_FILE ?= "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
 do_image_wic[depends] += "u-boot:do_deploy"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index bf9b557..abfd7ec 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -61,6 +61,6 @@ TI_PDK_LIMIT_SOCS = "am335x"
 TI_PDK_LIMIT_BOARDS = "evmAM335x icev2AM335x iceAMIC110 bbbAM335x skAM335x"
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
-WKS_FILE ?= "sdimage-3part.wks"
+WKS_FILE ?= "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
 do_image_wic[depends] += "u-boot:do_deploy"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 5d6ea41..524b0b2 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -57,6 +57,6 @@ TI_PDK_LIMIT_SOCS = "am437x"
 TI_PDK_LIMIT_BOARDS = "evmAM437x idkAM437x skAM437x"
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
-WKS_FILE ?= "sdimage-3part.wks"
+WKS_FILE ?= "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
 do_image_wic[depends] += "u-boot:do_deploy"
diff --git a/wic/sdimage-3part.wks b/wic/sdimage-2part.wks
similarity index 22%
rename from wic/sdimage-3part.wks
rename to wic/sdimage-2part.wks
index 86aeb1c..77d6f7b 100644
--- a/wic/sdimage-3part.wks
+++ b/wic/sdimage-2part.wks
@@ -1,8 +1,6 @@
-# short-description: Create SD card image with 3 partitions
-# long-description: Creates a partitioned SD card image for testing TI platforms.
-# Boot files are located in the first vfat partition.
-# Second ext4 partition is empty and is used for testing.
+# short-description: Create SD card image with 2 partitions
+# long-description: Creates a partitioned SD card image for TI platforms.
+# Boot files are located in the first vfat partition with extra reserved space.
 
-part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 1024 --size 100M --use-uuid
-part test --ondisk mmcblk0 --fstype=ext4 --label test --align 1024 --size 1G --use-uuid
-part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --label root --align 1024 --extra-space 500M --use-uuid
+part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 1024 --extra-space 100M --use-uuid
+part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --label root --align 1024 --use-uuid
-- 
2.7.4

