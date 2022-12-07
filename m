Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A51C6370A
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 21:43:24 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.29584.1670449397161349553
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 13:43:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SIvqtzmS;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B7LhFvf020996;
	Wed, 7 Dec 2022 15:43:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670449395;
	bh=SNJklb831dYxEMftvLGmug+02mLm1M1zNyJY7hr390A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SIvqtzmSQ0KkpoNZzf/lHNPNAJjDheeBGy2F0/QRT12I6Es5GZKmJP/1KieEfMoCf
	 tahFbxly0M63WSEsvy6ltr59P90X40qFRBOOWG7/F2yG0Fwkr6Qyzw124lx2Uvkz3/
	 0AwywPTsIK4d0Y49r7z0BHWFEH6+vV8EvNwKgwEI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B7LhFED077686
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Dec 2022 15:43:15 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 7
 Dec 2022 15:43:14 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 7 Dec 2022 15:43:14 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B7LhCOa007888;
	Wed, 7 Dec 2022 15:43:14 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 7/7] conf: machine: Rework do_image_wic dependencies
Date: Wed, 7 Dec 2022 15:43:12 -0600
Message-ID: <20221207214312.21735-7-afd@ti.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207214312.21735-1-afd@ti.com>
References: <20221207214312.21735-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Dec 2022 21:43:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15428

The WIC image for K3 depends on the TI-SCI firmware, on AM65x and J721e
also the bootloader. Make this clear by only depending on firmware in
the base k3.inc file, then adding the bootloader dependency in AM65x and
J721e specific includes.

Remove unneeded overrides from the evm level files.

Remove do_image_tar dependencies as the tar files do not include
the bootloader nor TI-SCI firmware, only the boot partition of
the WIC file needs these.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62xx.inc   |  3 ---
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  8 +++-----
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 10 +++++-----
 meta-ti-bsp/conf/machine/include/j721e.inc    | 11 +++++++++++
 meta-ti-bsp/conf/machine/include/k3.inc       |  3 +--
 meta-ti-bsp/conf/machine/include/omap-a15.inc |  2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    |  2 +-
 meta-ti-bsp/conf/machine/j7200-evm.conf       |  3 ---
 meta-ti-bsp/conf/machine/j721e-evm.conf       |  3 ---
 meta-ti-bsp/conf/machine/j721e-hs-evm.conf    |  7 -------
 meta-ti-bsp/conf/machine/j721s2-evm.conf      |  3 ---
 meta-ti-bsp/conf/machine/j784s4-evm.conf      |  3 ---
 12 files changed, 22 insertions(+), 36 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index 9d8bc87c..411e5265 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -12,9 +12,6 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 
-do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-
 TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
 
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index f1a91991..0fd15b90 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -17,19 +17,17 @@ KERNEL_DEVICETREE = " \
 # Default tiboot3.bin on AM64x is for SR2.0 HS-FS
 BBMULTICONFIG = "k3r5-sr2-hs-fs"
 do_image_wic[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
+IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-fs-evm.bin"
 
 # Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
 BBMULTICONFIG += "k3r5-gp"
-IMAGE_BOOT_FILES += "tiboot3-am64x-gp-evm.bin"
 do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
+IMAGE_BOOT_FILES += "tiboot3-am64x-gp-evm.bin"
 
 # Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for SR2.0 HS-SE
 BBMULTICONFIG += "k3r5-sr2-hs-se"
-IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-evm.bin"
 do_image_wic[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
+IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-evm.bin"
 
 TFA_BOARD = "lite"
 
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 88259717..424864d3 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -26,17 +26,17 @@ KERNEL_DEVICETREE = " \
     ti/k3-am654-evm-ov5640.dtbo \
 "
 
-BBMULTICONFIG += "k3r5-sr2"
+# On AM65x the file tiboot3.bin comes from the bootloader not ti-sci-fw
+do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
 
-# Since J721e does not support multi-cert tiboot3.bin add standalone sysfw.itb
+# Default sysfw.itb on AM65x is for SR2.0
+BBMULTICONFIG += "k3r5-sr2"
+do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 IMAGE_BOOT_FILES += "sysfw.itb"
 
 # Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0
 IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
 
-do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
-
 TFA_BOARD = "generic"
 
 OPTEEMACHINE = "k3-am65x"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index 12ee0c90..6322fe46 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -9,6 +9,17 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 
+# On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
+do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
+
+# Default sysfw.itb on J721e is for SR1.1
+BBMULTICONFIG += "k3r5-sr1-1"
+do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
+IMAGE_BOOT_FILES += "sysfw.itb"
+
+# Since default sysfw.itb on J721e is for SR1.1, add a version for SR1.0
+IMAGE_BOOT_FILES += "sysfw-j721e-evm.itb"
+
 TFA_BOARD = "generic"
 
 OPTEEMACHINE = "k3-j721e"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index bd71becf..a34b67ff 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -47,7 +47,6 @@ MACHINE_FEATURES += "efi"
 
 WKS_FILE ?= "sdimage-2part-efi.wks"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
-do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
+do_image_wic[mcdepends] += "mc::k3r5:ti-sci-fw:do_deploy"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index f548f3fd..0843fb28 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -50,4 +50,4 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa etherne
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
-do_image_wic[depends] += "u-boot:do_deploy"
+do_image_wic[depends] += "virtual/bootloader:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index 5509a54d..74a964db 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -59,4 +59,4 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa etherne
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
-do_image_wic[depends] += "u-boot:do_deploy"
+do_image_wic[depends] += "virtual/bootloader:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/machine/j7200-evm.conf
index 303ec182..33c39a52 100644
--- a/meta-ti-bsp/conf/machine/j7200-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
@@ -12,6 +12,3 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "j7200_evm_a72_config"
-
-do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
index d28d16d1..fe28e6f5 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -7,9 +7,6 @@ require conf/machine/include/j721e.inc
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
-# Since J721e does not support multi-cert tiboot3.bin add standalone sysfw.itb
-IMAGE_BOOT_FILES += "sysfw.itb"
-
 KERNEL_DEVICETREE = " \
     ti/k3-j721e-common-proc-board.dtb \
     ti/k3-j721e-common-proc-board-infotainment.dtbo \
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
index 9ef7b86a..acd5ca18 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
@@ -18,10 +18,3 @@ SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
 UBOOT_SYMLINK = "u-boot.img"
 SYSFW_SYMLINK = ""
-
-BBMULTICONFIG += "k3r5-sr1-1"
-
-# Since default sysfw.itb on J721e is for SR1.1, add a version for SR1.0
-IMAGE_BOOT_FILES += "sysfw-j721e-evm.itb"
-do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index 46d5dbf6..3576414d 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -15,6 +15,3 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
-
-do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index f8be7d18..73f3eb8c 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -14,6 +14,3 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
-
-do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-- 
2.38.1


