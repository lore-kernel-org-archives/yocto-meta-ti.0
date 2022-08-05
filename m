Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663E2C19F2D
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 02:49:46 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.2830.1659667779967214024
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 19:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GWtaQY8e;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2752nbSS035246;
	Thu, 4 Aug 2022 21:49:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659667777;
	bh=8mpOFecEvi0hJmmHbE+OLrF4wwkCbFvYzxlDaecSja4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GWtaQY8egqdAHaakNp0SFoAHv3A2tM3oXvp75aPGOKGWCp03ickpR8eJ+TXg8kY8C
	 ydggl4hKsKQq07MNjswiN0nMWAbhgxVBE88ckcN/63A3tfFX/gaJ77nA6q3az3MZJA
	 QBvQnZwJ4/DSf5c9msfXEHq9M1we9Bm8MTHXd/Wc=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2752nbM9041021
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Aug 2022 21:49:37 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 4
 Aug 2022 21:49:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 4 Aug 2022 21:49:37 -0500
Received: from ula0226330.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2752nYEU111537;
	Thu, 4 Aug 2022 21:49:37 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 8/8] conf: machine: Move K3
 TI_SECURE_DEV_PKG definition to common include
Date: Thu, 4 Aug 2022 21:49:34 -0500
Message-ID: <20220805024934.23349-8-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805024934.23349-1-afd@ti.com>
References: <20220805024934.23349-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Aug 2022 02:49:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14934

The K3 TI_SECURE_DEV_PKG is the same for all devices, move this out
of each machine file and into the common K3 includes. This doesn't
have any effect on the GP machines as they make no use of it.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 conf/machine/am64xx-hs-evm-k3r5.conf | 2 --
 conf/machine/am64xx-hs-evm.conf      | 2 --
 conf/machine/am65xx-hs-evm-k3r5.conf | 2 --
 conf/machine/am65xx-hs-evm.conf      | 2 --
 conf/machine/include/k3.inc          | 2 ++
 conf/machine/include/k3r5.inc        | 2 ++
 conf/machine/j7-hs-evm-k3r5.conf     | 2 --
 conf/machine/j7-hs-evm.conf          | 2 --
 conf/machine/j7200-hs-evm-k3r5.conf  | 2 --
 conf/machine/j7200-hs-evm.conf       | 2 --
 conf/machine/j721s2-hs-evm-k3r5.conf | 2 --
 conf/machine/j721s2-hs-evm.conf      | 2 --
 12 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/conf/machine/am64xx-hs-evm-k3r5.conf b/conf/machine/am64xx-hs-evm-k3r5.conf
index d12c030f..647c8beb 100644
--- a/conf/machine/am64xx-hs-evm-k3r5.conf
+++ b/conf/machine/am64xx-hs-evm-k3r5.conf
@@ -10,5 +10,3 @@ SYSFW_SUFFIX = "hs"
 SYSFW_SYMLINK = ""
 
 UBOOT_MACHINE = "am64x_hs_evm_r5_defconfig"
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/am64xx-hs-evm.conf b/conf/machine/am64xx-hs-evm.conf
index ebbe2e62..3ab9a49e 100644
--- a/conf/machine/am64xx-hs-evm.conf
+++ b/conf/machine/am64xx-hs-evm.conf
@@ -17,5 +17,3 @@ UBOOT_DTBO_OFFSET =      "0x00010000"
 SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
 UBOOT_SYMLINK = "u-boot.img"
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/am65xx-hs-evm-k3r5.conf b/conf/machine/am65xx-hs-evm-k3r5.conf
index 81b8c75f..d9041c9d 100644
--- a/conf/machine/am65xx-hs-evm-k3r5.conf
+++ b/conf/machine/am65xx-hs-evm-k3r5.conf
@@ -16,5 +16,3 @@ UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
 
 UBOOT_MACHINE = "am65x_hs_evm_r5_defconfig"
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
index de92cacb..ea1f8ff1 100644
--- a/conf/machine/am65xx-hs-evm.conf
+++ b/conf/machine/am65xx-hs-evm.conf
@@ -17,5 +17,3 @@ UBOOT_DTBO_OFFSET =      "0x00010000"
 SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
 UBOOT_SYMLINK = "u-boot.img"
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 24741dee..a5f96087 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -47,3 +47,5 @@ WKS_FILE ?= "sdimage-2part.wks"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/include/k3r5.inc b/conf/machine/include/k3r5.inc
index 035ad812..c29d6c95 100644
--- a/conf/machine/include/k3r5.inc
+++ b/conf/machine/include/k3r5.inc
@@ -22,3 +22,5 @@ UBOOT_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
 
 PACKAGECONFIG_pn-u-boot-ti-staging = ""
 PACKAGECONFIG_pn-u-boot-ti-mainline = ""
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/j7-hs-evm-k3r5.conf b/conf/machine/j7-hs-evm-k3r5.conf
index c0ddfcec..e4b233db 100644
--- a/conf/machine/j7-hs-evm-k3r5.conf
+++ b/conf/machine/j7-hs-evm-k3r5.conf
@@ -16,5 +16,3 @@ UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
 
 UBOOT_MACHINE = "j721e_hs_evm_r5_defconfig"
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
index ff998dc7..bbfe6fcb 100644
--- a/conf/machine/j7-hs-evm.conf
+++ b/conf/machine/j7-hs-evm.conf
@@ -25,5 +25,3 @@ BBMULTICONFIG += "k3r5-sr1-1"
 IMAGE_BOOT_FILES += "sysfw-j721e-evm.itb"
 do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/j7200-hs-evm-k3r5.conf b/conf/machine/j7200-hs-evm-k3r5.conf
index 3f134877..3fe06e74 100644
--- a/conf/machine/j7200-hs-evm-k3r5.conf
+++ b/conf/machine/j7200-hs-evm-k3r5.conf
@@ -9,5 +9,3 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
 
 UBOOT_MACHINE = "j7200_hs_evm_r5_defconfig"
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/j7200-hs-evm.conf b/conf/machine/j7200-hs-evm.conf
index 8821ffac..ef7268b1 100644
--- a/conf/machine/j7200-hs-evm.conf
+++ b/conf/machine/j7200-hs-evm.conf
@@ -17,5 +17,3 @@ UBOOT_DTBO_OFFSET =      "0x00010000"
 SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
 UBOOT_SYMLINK = "u-boot.img"
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/j721s2-hs-evm-k3r5.conf b/conf/machine/j721s2-hs-evm-k3r5.conf
index ac4df86e..a4d51904 100644
--- a/conf/machine/j721s2-hs-evm-k3r5.conf
+++ b/conf/machine/j721s2-hs-evm-k3r5.conf
@@ -9,5 +9,3 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
 
 UBOOT_MACHINE = "j721s2_hs_evm_r5_defconfig"
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/j721s2-hs-evm.conf b/conf/machine/j721s2-hs-evm.conf
index 7ffad45a..84db90bb 100644
--- a/conf/machine/j721s2-hs-evm.conf
+++ b/conf/machine/j721s2-hs-evm.conf
@@ -17,5 +17,3 @@ UBOOT_DTBO_OFFSET =      "0x00010000"
 SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
 UBOOT_SYMLINK = "u-boot.img"
-
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
-- 
2.36.1


