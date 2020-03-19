Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.367.1584648569722650294
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2020 13:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 045C240BF3;
	Thu, 19 Mar 2020 20:09:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JDo2udvMizfl; Thu, 19 Mar 2020 20:09:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 287EC40A28;
	Thu, 19 Mar 2020 20:09:26 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9A05A17136C;
	Thu, 19 Mar 2020 16:09:25 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH] wic: create SD card with 3 partitions for testing
Date: Thu, 19 Mar 2020 16:09:25 -0400
Message-Id: <1584648565-11646-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/k3.inc       | 2 +-
 conf/machine/include/omap-a15.inc | 2 +-
 conf/machine/include/ti33x.inc    | 2 +-
 conf/machine/include/ti43x.inc    | 2 +-
 wic/sdimage-3part.wks             | 8 ++++++++
 5 files changed, 12 insertions(+), 4 deletions(-)
 create mode 100644 wic/sdimage-3part.wks

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 3416be9..5e67f5f 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -38,5 +38,5 @@ IMAGE_FSTYPES += "tar.xz wic.xz"
 # tiboot3.bin and sysfw.itb, which are provided by meta-arago
 # u-boot-k3-r5 and ti-sci-fw recipes
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
-WKS_FILE ?= "sdimage-bootpart.wks"
+WKS_FILE ?= "sdimage-3part.wks"
 do_image_wic[depends] += "u-boot:do_deploy"
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 6255191..7600126 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -39,6 +39,6 @@ UBI_VOLNAME = "rootfs"
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet gpu mmip dsp gc320"
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
-WKS_FILE ?= "sdimage-bootpart.wks"
+WKS_FILE ?= "sdimage-3part.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
 do_image_wic[depends] += "u-boot:do_deploy"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 3c752d5..db1df04 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -61,6 +61,6 @@ TI_PDK_LIMIT_SOCS = "am335x"
 TI_PDK_LIMIT_BOARDS = "evmAM335x icev2AM335x iceAMIC110 bbbAM335x skAM335x"
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
-WKS_FILE ?= "sdimage-bootpart.wks"
+WKS_FILE ?= "sdimage-3part.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
 do_image_wic[depends] += "u-boot:do_deploy"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index d1fc0b5..e2aaf38 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -57,6 +57,6 @@ TI_PDK_LIMIT_SOCS = "am437x"
 TI_PDK_LIMIT_BOARDS = "evmAM437x idkAM437x skAM437x"
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
-WKS_FILE ?= "sdimage-bootpart.wks"
+WKS_FILE ?= "sdimage-3part.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
 do_image_wic[depends] += "u-boot:do_deploy"
diff --git a/wic/sdimage-3part.wks b/wic/sdimage-3part.wks
new file mode 100644
index 0000000..86aeb1c
--- /dev/null
+++ b/wic/sdimage-3part.wks
@@ -0,0 +1,8 @@
+# short-description: Create SD card image with 3 partitions
+# long-description: Creates a partitioned SD card image for testing TI platforms.
+# Boot files are located in the first vfat partition.
+# Second ext4 partition is empty and is used for testing.
+
+part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 1024 --size 100M --use-uuid
+part test --ondisk mmcblk0 --fstype=ext4 --label test --align 1024 --size 1G --use-uuid
+part / --source rootfs --ondisk mmcblk0 --fstype=ext4 --label root --align 1024 --extra-space 500M --use-uuid
-- 
2.7.4

