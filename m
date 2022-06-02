Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5606CCA47C
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 20:24:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.621.1654201493051599293
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Jun 2022 13:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jmKs02J9;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 252KOoIP055684;
	Thu, 2 Jun 2022 15:24:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654201490;
	bh=oEWr5J6rksy4vZu2kJ8U26+u7AGe0mNZc2LoHwvn7HQ=;
	h=From:To:CC:Subject:Date;
	b=jmKs02J9z9m+1lY7VVootov8K/vcqa63SoxlB5wyIjT5RwaerYKWzxjlUW+rQHbqq
	 PR3xaRaYSfx2f5en7nsd66ANsIIZsRgOvNuWW5k5bBHW5v1g+Cn+yEUwdgbs+DzwVj
	 Eg4KzZbrH2WOqfkSkrWl1xaYiUD6jtT8tZp6bqZE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 252KOoGA095049
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jun 2022 15:24:50 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 2
 Jun 2022 15:24:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 2 Jun 2022 15:24:49 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 252KOmHD060754;
	Thu, 2 Jun 2022 15:24:49 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Manorit Chawdhry <m-chawdhry@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 1/2] conf: machine: wic: Fix HS image boot
 partition
Date: Thu, 2 Jun 2022 15:24:47 -0500
Message-ID: <20220602202448.18068-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Jun 2022 20:24:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14779

From: Manorit Chawdhry <m-chawdhry@ti.com>

IMAGE_BOOT_FILES was being overwritten in the HS recipes leading to
incomplete binaries in /boot and the naming of the binaries were not
correct.

Fixes /boot partition for HS devices.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
[afd: Extended fix to all HS platforms]
Signed-off-by: Andrew Davis <afd@ti.com>
---
 conf/machine/am64xx-hs-evm.conf | 4 +---
 conf/machine/am65xx-hs-evm.conf | 4 +---
 conf/machine/include/k3.inc     | 5 +++--
 conf/machine/j7-hs-evm.conf     | 4 +---
 conf/machine/j7200-hs-evm.conf  | 4 +---
 5 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
index 44e81463..c0d904e1 100644
--- a/conf/machine/am64xx-hs-evm.conf
+++ b/conf/machine/am64xx-hs-evm.conf
@@ -15,8 +15,6 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
 UBOOT_DTBO_OFFSET =      "0x00010000"
 
 SPL_BINARY = "tispl.bin_HS"
-SPL_BINARYNAME = "tispl.bin"
-UBOOT_BINARY = "u-boot.img_HS"
-IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
+UBOOT_IMAGE = "u-boot.img_HS"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
index e4eebb6a..a7514663 100644
--- a/conf/machine/am65xx-hs-evm.conf
+++ b/conf/machine/am65xx-hs-evm.conf
@@ -15,8 +15,6 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
 UBOOT_DTBO_OFFSET =      "0x00010000"
 
 SPL_BINARY = "tispl.bin_HS"
-SPL_BINARYNAME = "tispl.bin"
-UBOOT_BINARY = "u-boot.img_HS"
-IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
+UBOOT_IMAGE = "u-boot.img_HS"
 
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
index f2e3ccf5..629a5ccd 100644
--- a/conf/machine/j7-hs-evm.conf
+++ b/conf/machine/j7-hs-evm.conf
@@ -15,9 +15,7 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
 UBOOT_DTBO_OFFSET =      "0x00010000"
 
 SPL_BINARY = "tispl.bin_HS"
-SPL_BINARYNAME = "tispl.bin"
-UBOOT_BINARY = "u-boot.img_HS"
-IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
+UBOOT_IMAGE = "u-boot.img_HS"
 
 BBMULTICONFIG += "k3r5-sr1-1"
 
diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-evm.conf
index a5bd637e..54b7906f 100644
--- a/conf/machine/j7200-hs-evm.conf
+++ b/conf/machine/j7200-hs-evm.conf
@@ -15,8 +15,6 @@ UBOOT_DTBO_LOADADDRESS = "0x83080000"
 UBOOT_DTBO_OFFSET =      "0x00010000"
 
 SPL_BINARY = "tispl.bin_HS"
-SPL_BINARYNAME = "tispl.bin"
-UBOOT_BINARY = "u-boot.img_HS"
-IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
+UBOOT_IMAGE = "u-boot.img_HS"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
-- 
2.36.1


