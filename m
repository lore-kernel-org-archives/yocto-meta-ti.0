Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796DDC77B73
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 17:23:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.85711.1682443432436174607
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Apr 2023 10:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HpKxmtU8;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33PHNoxX004284;
	Tue, 25 Apr 2023 12:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682443430;
	bh=EEFG2tBPzPqUYgnba3GovRstc0BW6yEUDO9f0pBlBKc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HpKxmtU8MPAJBrRzzMMYmTuzHvZdPiArLusFUXWjG97cQ87G3/ZO+yIaZURLe/ZSj
	 TsNbUWV5gilbZoN3bxa+W3+BBbURxyHcrlE9CcbDGdKA9HvbpMngrZEFaxn7PCwngx
	 drKwPfUgBX2B62iQM8wd5gU938tXauVyek3UyppA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33PHNon5090995
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Apr 2023 12:23:50 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 25
 Apr 2023 12:23:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 25 Apr 2023 12:23:49 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33PHNj0w030178;
	Tue, 25 Apr 2023 12:23:49 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Neha Malcom Francis <n-francis@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][RFC 9/9] conf: machine: Remove all leftover config files
Date: Tue, 25 Apr 2023 12:23:45 -0500
Message-ID: <20230425172345.12293-10-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230425172345.12293-1-afd@ti.com>
References: <20230425172345.12293-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Apr 2023 17:23:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16427

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../conf/machine/am62axx-evm-k3r5-gp.conf     | 19 ----------------
 .../conf/machine/am62axx-evm-k3r5-hs-fs.conf  | 14 ------------
 .../conf/machine/am62axx-evm-k3r5-hs-se.conf  | 22 -------------------
 .../conf/machine/am62xx-evm-k3r5-gp.conf      | 18 ---------------
 .../conf/machine/am62xx-evm-k3r5-hs-fs.conf   | 14 ------------
 .../conf/machine/am62xx-evm-k3r5-hs-se.conf   | 21 ------------------
 .../machine/am62xx-lp-evm-k3r5-hs-fs.conf     | 14 ------------
 .../machine/am62xx-lp-evm-k3r5-hs-se.conf     | 21 ------------------
 .../conf/machine/am64xx-evm-k3r5-gp.conf      | 20 -----------------
 .../machine/am64xx-evm-k3r5-sr2-hs-fs.conf    | 14 ------------
 .../machine/am64xx-evm-k3r5-sr2-hs-se.conf    | 20 -----------------
 .../conf/machine/am65xx-evm-k3r5-sr2.conf     | 11 ----------
 .../conf/machine/am65xx-hs-evm-k3r5-sr2.conf  | 11 ----------
 .../conf/machine/j721s2-evm-k3r5-gp.conf      | 20 -----------------
 .../machine/j721s2-evm-k3r5-sr1-hs-fs.conf    | 15 -------------
 .../conf/machine/j784s4-evm-k3r5-gp.conf      | 20 -----------------
 .../machine/j784s4-evm-k3r5-sr1-hs-fs.conf    | 16 --------------
 meta-ti-bsp/conf/multiconfig/k3r5-gp.conf     |  3 ---
 meta-ti-bsp/conf/multiconfig/k3r5-hs-fs.conf  |  3 ---
 meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf  |  3 ---
 .../conf/multiconfig/k3r5-sr1-hs-fs.conf      |  3 ---
 meta-ti-bsp/conf/multiconfig/k3r5-sr1.conf    |  3 ---
 .../conf/multiconfig/k3r5-sr2-hs-fs.conf      |  3 ---
 .../conf/multiconfig/k3r5-sr2-hs-se.conf      |  3 ---
 meta-ti-bsp/conf/multiconfig/k3r5-sr2.conf    |  3 ---
 25 files changed, 314 deletions(-)
 delete mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5-gp.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-se.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r5-gp.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-se.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am65xx-evm-k3r5-sr2.conf
 delete mode 100644 meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j721s2-evm-k3r5-gp.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j784s4-evm-k3r5-gp.conf
 delete mode 100644 meta-ti-bsp/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-gp.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr1-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr1.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-fs.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-se.conf
 delete mode 100644 meta-ti-bsp/conf/multiconfig/k3r5-sr2.conf

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5-gp.conf b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5-gp.conf
deleted file mode 100644
index 962413c3..00000000
--- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5-gp.conf
+++ /dev/null
@@ -1,19 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM62A GP EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62A GP EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "am62ax"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "gp"
-
-SYSFW_TIBOOT3_SYMLINK = ""
-SYSFW_SYMLINK = ""
-
-UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
-
-SPL_BINARY = ""
-UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-fs.conf b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-fs.conf
deleted file mode 100644
index 256f021a..00000000
--- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-fs.conf
+++ /dev/null
@@ -1,14 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM62A HS-FS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62A HS-FS EVM (R5F core)
-
-# Booting HS-FS requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/include/k3r5.inc
-SOC_FAMILY:append = ":k3r5-hs-fs"
-
-SYSFW_SOC = "am62ax"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs-fs"
-
-UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-se.conf b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-se.conf
deleted file mode 100644
index c7cb0681..00000000
--- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5-hs-se.conf
+++ /dev/null
@@ -1,22 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM62A HS-SE EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62A HS-SE EVM (R5F core)
-
-# Booting HS-SE requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/include/k3r5.inc
-SOC_FAMILY:append = ":k3r5-hs-se"
-
-SYSFW_SOC = "am62ax"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs"
-
-SYSFW_TIBOOT3_SYMLINK = ""
-SYSFW_SYMLINK = ""
-
-UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
-
-SPL_BINARY = ""
-UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "u-boot-r5spl-hs-se.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-gp.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-gp.conf
deleted file mode 100644
index ab18301a..00000000
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-gp.conf
+++ /dev/null
@@ -1,18 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM62XX EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "am62x"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "gp"
-
-SYSFW_TIBOOT3_SYMLINK = ""
-
-UBOOT_MACHINE = "am62x_evm_r5_defconfig"
-
-SPL_BINARY = ""
-UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-fs.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-fs.conf
deleted file mode 100644
index 0dad1104..00000000
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-fs.conf
+++ /dev/null
@@ -1,14 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM62xx HS-FS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62xx HS-FS EVM (R5F core)
-
-# Booting HS-FS requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/include/k3r5.inc
-SOC_FAMILY:append = ":k3r5-hs-fs"
-
-SYSFW_SOC = "am62x"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs-fs"
-
-UBOOT_MACHINE = "am62x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-se.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-se.conf
deleted file mode 100644
index 7bca513a..00000000
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5-hs-se.conf
+++ /dev/null
@@ -1,21 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM62xx HS-SE EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62xx HS-SE EVM (R5F core)
-
-# Booting HS-SE requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/include/k3r5.inc
-SOC_FAMILY:append = ":k3r5-hs-se"
-
-SYSFW_SOC = "am62x"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs"
-
-SYSFW_TIBOOT3_SYMLINK = ""
-
-UBOOT_MACHINE = "am62x_evm_r5_defconfig"
-
-SPL_BINARY = ""
-UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "u-boot-r5spl-hs-se.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf
deleted file mode 100644
index 9026b67c..00000000
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf
+++ /dev/null
@@ -1,14 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM62xx LPSK HS-FS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62xx LP HS-FS EVM (R5F core)
-
-# Booting HS-FS requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/include/k3r5.inc
-SOC_FAMILY:append = ":k3r5-hs-fs"
-
-SYSFW_SOC = "am62x"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs-fs"
-
-UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
deleted file mode 100644
index c126de0f..00000000
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
+++ /dev/null
@@ -1,21 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM62xx LPSK HS-SE EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM62xx LP HS-SE EVM (R5F core)
-
-# Booting HS-SE requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/include/k3r5.inc
-SOC_FAMILY:append = ":k3r5-hs-se"
-
-SYSFW_SOC = "am62x"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs"
-
-SYSFW_TIBOOT3_SYMLINK = ""
-
-UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
-
-SPL_BINARY = ""
-UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "u-boot-r5spl-hs-se.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf
deleted file mode 100644
index 50bf6a07..00000000
--- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-gp.conf
+++ /dev/null
@@ -1,20 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM64xx GP EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM64xx GP EVM (R5F core)
-
-# Booting GP requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/include/k3r5.inc
-SOC_FAMILY:append = ":k3r5-gp"
-
-SYSFW_SOC = "am64x"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "gp"
-SYSFW_TIBOOT3_SYMLINK = ""
-
-UBOOT_MACHINE = "am64x_evm_r5_defconfig"
-
-SPL_BINARY = ""
-UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
deleted file mode 100644
index 42ddbb4c..00000000
--- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-fs.conf
+++ /dev/null
@@ -1,14 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM64xx SR2.0 HS-FS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM64xx SR2.0 HS-FS EVM (R5F core)
-
-# Booting SR2.0 HS-FS requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/include/k3r5.inc
-SOC_FAMILY:append = ":k3r5-sr2-hs-fs"
-
-SYSFW_SOC = "am64x_sr2"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs-fs"
-
-UBOOT_MACHINE = "am64x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
deleted file mode 100644
index a1c2b3e6..00000000
--- a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5-sr2-hs-se.conf
+++ /dev/null
@@ -1,20 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM64xx SR2.0 HS-SE EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM64xx SR2.0 HS-SE EVM (R5F core)
-
-# Booting SR2.0 HS-SE requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/include/k3r5.inc
-SOC_FAMILY:append = ":k3r5-sr2-hs-se"
-
-SYSFW_SOC = "am64x_sr2"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs"
-SYSFW_TIBOOT3_SYMLINK = ""
-
-UBOOT_MACHINE = "am64x_evm_r5_defconfig"
-
-SPL_BINARY = ""
-UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "u-boot-r5spl-sr2-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "u-boot-r5spl-sr2-hs-se.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5-sr2.conf b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5-sr2.conf
deleted file mode 100644
index e74dd3ab..00000000
--- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5-sr2.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM65xx SR2.0 EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM65xx SR2.0 EVM (R5F core)
-
-# Booting SR2 requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/am65xx-evm-k3r5.conf
-SOC_FAMILY:append = ":k3r5-sr2"
-
-SYSFW_SOC = "am65x_sr2"
-SYSFW_SYMLINK = "sysfw.itb"
diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5-sr2.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
deleted file mode 100644
index ff1645e4..00000000
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM65xx SR2.0 HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM65xx SR2.0 HS EVM (R5F core)
-
-# Booting SR2 requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/am65xx-hs-evm-k3r5.conf
-SOC_FAMILY:append = ":k3r5-sr2"
-
-SYSFW_SOC = "am65x_sr2"
-SYSFW_SYMLINK = "sysfw.itb"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5-gp.conf b/meta-ti-bsp/conf/machine/j721s2-evm-k3r5-gp.conf
deleted file mode 100644
index 95771139..00000000
--- a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5-gp.conf
+++ /dev/null
@@ -1,20 +0,0 @@
-#@TYPE: Machine
-#@NAME: J721S2 GP EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J721S2 GP EVM (R5F core)
-
-# Booting GP requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/include/k3r5.inc
-SOC_FAMILY:append = ":k3r5-gp"
-
-SYSFW_SOC = "j721s2"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "gp"
-SYSFW_TIBOOT3_SYMLINK = "tiboot3.bin"
-
-UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
-
-SPL_BINARY = ""
-UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf b/meta-ti-bsp/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
deleted file mode 100644
index 1a77830d..00000000
--- a/meta-ti-bsp/conf/machine/j721s2-evm-k3r5-sr1-hs-fs.conf
+++ /dev/null
@@ -1,15 +0,0 @@
-#@TYPE: Machine
-#@NAME: J721S2 HS-FS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J721S2 HS-FS EVM (R5F core)
-
-# Booting HS-FS requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/include/k3r5.inc
-SOC_FAMILY:append = ":k3r5-sr1-hs-fs"
-
-SYSFW_SOC = "j721s2"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs-fs"
-SYSFW_TIBOOT3_SYMLINK = ""
-
-UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5-gp.conf b/meta-ti-bsp/conf/machine/j784s4-evm-k3r5-gp.conf
deleted file mode 100644
index 6f7ef92e..00000000
--- a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5-gp.conf
+++ /dev/null
@@ -1,20 +0,0 @@
-#@TYPE: Machine
-#@NAME: J784S4 GP EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J784S4 GP EVM (R5F core)
-
-# Booting GP requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/include/k3r5.inc
-SOC_FAMILY:append = ":k3r5-gp"
-
-SYSFW_SOC = "j784s4"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "gp"
-SYSFW_TIBOOT3_SYMLINK = "tiboot3.bin"
-
-UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
-
-SPL_BINARY = ""
-UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf b/meta-ti-bsp/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
deleted file mode 100644
index 18b38305..00000000
--- a/meta-ti-bsp/conf/machine/j784s4-evm-k3r5-sr1-hs-fs.conf
+++ /dev/null
@@ -1,16 +0,0 @@
-#@TYPE: Machine
-#@NAME: J784S4 HS-FS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J784S4 HS-FS EVM (R5F core)
-
-# Booting HS-FS requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/include/k3r5.inc
-SOC_FAMILY:append = ":k3r5-sr1-hs-fs"
-
-SYSFW_SOC = "j784s4"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs-fs"
-SYSFW_TIBOOT3_SYMLINK = ""
-SYSFW_SYMLINK = ""
-
-UBOOT_MACHINE = "j784s4_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-gp.conf b/meta-ti-bsp/conf/multiconfig/k3r5-gp.conf
deleted file mode 100644
index 80491e35..00000000
--- a/meta-ti-bsp/conf/multiconfig/k3r5-gp.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-require k3r5.conf
-
-MACHINE:append = "-gp"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-hs-fs.conf b/meta-ti-bsp/conf/multiconfig/k3r5-hs-fs.conf
deleted file mode 100644
index e22204ee..00000000
--- a/meta-ti-bsp/conf/multiconfig/k3r5-hs-fs.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-require k3r5.conf
-
-MACHINE:append = "-hs-fs"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf b/meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf
deleted file mode 100644
index 7e3d7dae..00000000
--- a/meta-ti-bsp/conf/multiconfig/k3r5-hs-se.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-require k3r5.conf
-
-MACHINE:append = "-hs-se"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-sr1-hs-fs.conf b/meta-ti-bsp/conf/multiconfig/k3r5-sr1-hs-fs.conf
deleted file mode 100644
index 505f08d5..00000000
--- a/meta-ti-bsp/conf/multiconfig/k3r5-sr1-hs-fs.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-require k3r5-sr1.conf
-
-MACHINE:append = "-hs-fs"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-sr1.conf b/meta-ti-bsp/conf/multiconfig/k3r5-sr1.conf
deleted file mode 100644
index 1c8098cd..00000000
--- a/meta-ti-bsp/conf/multiconfig/k3r5-sr1.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-require k3r5.conf
-
-MACHINE:append = "-sr1"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-fs.conf b/meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-fs.conf
deleted file mode 100644
index 98972326..00000000
--- a/meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-fs.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-require k3r5-sr2.conf
-
-MACHINE:append = "-hs-fs"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-se.conf b/meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-se.conf
deleted file mode 100644
index 8b98fc0a..00000000
--- a/meta-ti-bsp/conf/multiconfig/k3r5-sr2-hs-se.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-require k3r5-sr2.conf
-
-MACHINE:append = "-hs-se"
diff --git a/meta-ti-bsp/conf/multiconfig/k3r5-sr2.conf b/meta-ti-bsp/conf/multiconfig/k3r5-sr2.conf
deleted file mode 100644
index e933b9cc..00000000
--- a/meta-ti-bsp/conf/multiconfig/k3r5-sr2.conf
+++ /dev/null
@@ -1,3 +0,0 @@
-require k3r5.conf
-
-MACHINE:append = "-sr2"
-- 
2.39.2


