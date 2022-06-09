Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC0CC43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 14:59:13 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.14411.1654786751417707113
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Jun 2022 07:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FE3bDN6C;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 259ExAKl002053;
	Thu, 9 Jun 2022 09:59:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654786750;
	bh=cUBIVioU19JNbNkNspdXgij5/HPquqJUfogGRSCARzc=;
	h=From:To:CC:Subject:Date;
	b=FE3bDN6CyrETLXdYYuo5uxs3YCYiNi91PKzjFuQsZrq11oQf50A9CNhYVS9A72xbd
	 qWY12sfncejS0eabcOARSpx0j4VdoNVHPTjfgY/t7iKXFySpZpXmr27M1mxRrWIcrw
	 GYyfasyve3Geme4h58cdq1VM8mhN/Kn6WkGyHgqY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 259ExA6d054692
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jun 2022 09:59:10 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 9
 Jun 2022 09:59:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 9 Jun 2022 09:59:09 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 259Ex9La020117;
	Thu, 9 Jun 2022 09:59:09 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry <m-chawdhry@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH v3] conf: machine: wic: Fix HS image boot
 partition
Date: Thu, 9 Jun 2022 09:59:09 -0500
Message-ID: <20220609145909.15483-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Jun 2022 14:59:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14811

From: Manorit Chawdhry <m-chawdhry@ti.com>

IMAGE_BOOT_FILES was being overwritten in the HS recipes leading to
incomplete binaries in /boot and the naming of the binaries were not
correct.

Fixes /boot partition for HS devices.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
[afd: Extended fix to all HS platforms]
Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes from v2:
 - Added UBOOT_SYMLINK to fix missing u-boot.img image

 conf/machine/am64xx-hs-evm.conf | 3 +--
 conf/machine/am65xx-hs-evm.conf | 3 +--
 conf/machine/include/k3.inc     | 5 +++--
 conf/machine/j7-hs-evm.conf     | 3 +--
 conf/machine/j7200-hs-evm.conf  | 3 +--
 5 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
index 44e81463..ebbe2e62 100644
--- a/conf/machine/am64xx-hs-evm.conf
+++ b/conf/machine/am64xx-hs-evm.conf
@@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
 UBOOT_DTBO_OFFSET =      "0x00010000"
 
 SPL_BINARY = "tispl.bin_HS"
-SPL_BINARYNAME = "tispl.bin"
 UBOOT_BINARY = "u-boot.img_HS"
-IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
+UBOOT_SYMLINK = "u-boot.img"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
index e4eebb6a..de92cacb 100644
--- a/conf/machine/am65xx-hs-evm.conf
+++ b/conf/machine/am65xx-hs-evm.conf
@@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
 UBOOT_DTBO_OFFSET =      "0x00010000"
 
 SPL_BINARY = "tispl.bin_HS"
-SPL_BINARYNAME = "tispl.bin"
 UBOOT_BINARY = "u-boot.img_HS"
-IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
+UBOOT_SYMLINK = "u-boot.img"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index e0970698..f85e6b98 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -22,6 +22,7 @@ UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
 SPL_BINARY = "tispl.bin"
+SPL_BINARYNAME = "tispl.bin"
 UBOOT_SUFFIX = "img"
 
 EXTRA_IMAGEDEPENDS += "virtual/bootloader"
@@ -40,8 +41,8 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet pci"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 
-IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
-IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
+IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
+IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
 
 IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
 
diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
index f2e3ccf5..ece0d85e 100644
--- a/conf/machine/j7-hs-evm.conf
+++ b/conf/machine/j7-hs-evm.conf
@@ -15,9 +15,8 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
 UBOOT_DTBO_OFFSET =      "0x00010000"
 
 SPL_BINARY = "tispl.bin_HS"
-SPL_BINARYNAME = "tispl.bin"
 UBOOT_BINARY = "u-boot.img_HS"
-IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
+UBOOT_SYMLINK = "u-boot.img"
 
 BBMULTICONFIG += "k3r5-sr1-1"
 
diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-evm.conf
index a5bd637e..8821ffac 100644
--- a/conf/machine/j7200-hs-evm.conf
+++ b/conf/machine/j7200-hs-evm.conf
@@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
 UBOOT_DTBO_OFFSET =      "0x00010000"
 
 SPL_BINARY = "tispl.bin_HS"
-SPL_BINARYNAME = "tispl.bin"
 UBOOT_BINARY = "u-boot.img_HS"
-IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
+UBOOT_SYMLINK = "u-boot.img"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
-- 
2.36.1


