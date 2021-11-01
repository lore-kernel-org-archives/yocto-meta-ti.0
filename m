Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1248.1635795194257658824
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 12:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2122340C16
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1LiAG18e3iM for <meta-ti@lists.yoctoproject.org>;
	Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1378840C6C
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id CA2711746B2
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 15:33:12 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 02/22] conf: Add extlinux.conf support on some 32bit platforms
Date: Mon,  1 Nov 2021 15:32:52 -0400
Message-Id: <1635795192-43144-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635795192-43144-1-git-send-email-denis@denix.org>
References: <1635795192-43144-1-git-send-email-denis@denix.org>

From: Tom Rini <tom.rini@gmail.com>

To make use of the "generic distro boot" support in U-Boot, an
extlinux.conf file needs to be generated and reside in the extlinux
directory.  The extlinux.conf file will be parsed by U-Boot and the
"append" line will be evaluated and expanded and used entirely as the
bootargs passed to the kernel.  Our generated extlinux.conf states
that the kernel image and device trees live one level up (so the root
directory) from it, so populate that location with our kernel and device
trees.

Signed-off-by: Tom Rini <trini@konsulko.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/include/omap-a15.inc | 11 ++++++++++-
 conf/machine/include/ti33x.inc    | 11 ++++++++++-
 conf/machine/include/ti43x.inc    | 11 ++++++++++-
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 57295a8..ed202f5 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -19,6 +19,15 @@ UBOOT_ARCH = "arm"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
+# Generate an extlinux.conf file
+UBOOT_EXTLINUX = "1"
+UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
+UBOOT_EXTLINUX_BOOT_FILES = " \
+    extlinux.conf;extlinux/extlinux.conf \
+    ${KERNEL_IMAGETYPE} \
+    ${KERNEL_DEVICETREE} \
+"
+
 SPL_BINARY = "MLO"
 UBOOT_SUFFIX = "img"
 
@@ -40,5 +49,5 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa etherne
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
 WKS_FILE ?= "sdimage-2part.wks"
-IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
+IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
 do_image_wic[depends] += "u-boot:do_deploy"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 896328d..197cac1 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -43,6 +43,15 @@ UBOOT_MACHINE = "am335x_evm_config"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
+# Generate an extlinux.conf file
+UBOOT_EXTLINUX = "1"
+UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
+UBOOT_EXTLINUX_BOOT_FILES = " \
+    extlinux.conf;extlinux/extlinux.conf \
+    ${KERNEL_IMAGETYPE} \
+    ${KERNEL_DEVICETREE} \
+"
+
 SPL_BINARY = "MLO"
 UBOOT_SUFFIX = "img"
 
@@ -61,5 +70,5 @@ TI_PDK_LIMIT_BOARDS = "evmAM335x icev2AM335x iceAMIC110 bbbAM335x skAM335x"
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
 WKS_FILE ?= "sdimage-2part.wks"
-IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
+IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 0f28cc9..95b61cb 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -40,6 +40,15 @@ UBOOT_MACHINE = "am43xx_evm_config"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
+# Generate an extlinux.conf file
+UBOOT_EXTLINUX = "1"
+UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
+UBOOT_EXTLINUX_BOOT_FILES = " \
+    extlinux.conf;extlinux/extlinux.conf \
+    ${KERNEL_IMAGETYPE} \
+    ${KERNEL_DEVICETREE} \
+"
+
 SPL_BINARY = "MLO"
 UBOOT_SUFFIX = "img"
 
@@ -58,5 +67,5 @@ TI_PDK_LIMIT_BOARDS = "evmAM437x idkAM437x skAM437x"
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
 WKS_FILE ?= "sdimage-2part.wks"
-IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
+IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
 do_image_wic[depends] += "u-boot:do_deploy"
-- 
2.7.4

