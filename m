Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1247.1635795194186521218
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 12:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 19B6740AC9
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6l0D_HZ7vmq for <meta-ti@lists.yoctoproject.org>;
	Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0917F40C16
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id BF0721746B0
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 15:33:12 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 01/22] conf/machine: k3: Enable grub-efi by default in wic images
Date: Mon,  1 Nov 2021 15:32:51 -0400
Message-Id: <1635795192-43144-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635795192-43144-1-git-send-email-denis@denix.org>
References: <1635795192-43144-1-git-send-email-denis@denix.org>

From: Tom Rini <tom.rini@gmail.com>

All of our platforms here support running EFI binaries.  We can have wic
generate a simple grub.cfg file for us that will find the root partition
via PARTUUID and utilize the device tree that is already discoverable
via the EFI configuration tables.  Assuming the EFI loader is U-Boot,
this device tree can be replaced at run-time by the normal mechanism of
loading in to memory and passing that address as an argument to bootefi.

Signed-off-by: Tom Rini <trini@konsulko.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/include/k3.inc | 6 +++++-
 wic/sdimage-2part-efi.wks   | 7 +++++++
 2 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 wic/sdimage-2part-efi.wks

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 20ab7a9..a39ddd2 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -44,8 +44,12 @@ IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysf
 IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
 
 IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
+IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
 
-WKS_FILE ?= "sdimage-2part.wks"
+EFI_PROVIDER ?= "grub-efi"
+MACHINE_FEATURES += "efi"
+
+WKS_FILE ?= "sdimage-2part-efi.wks"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/wic/sdimage-2part-efi.wks b/wic/sdimage-2part-efi.wks
new file mode 100644
index 0000000..ffb8d24
--- /dev/null
+++ b/wic/sdimage-2part-efi.wks
@@ -0,0 +1,7 @@
+# short-description: Create SD card image with 2 partitions and EFI support
+# long-description: Creates a partitioned SD card image for TI platforms that
+# supports EFI.  Boot files are located in the first vfat partition with extra
+# reserved space.  We cannot use a GPT here.
+bootloader --append="rootfstype=ext4 ro"
+part /boot --source bootimg-efi --sourceparams="loader=grub-efi" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
+part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
-- 
2.7.4

