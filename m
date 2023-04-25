Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BB8C77B78
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 17:23:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.85709.1682443431964399253
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Apr 2023 10:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lJI5dzPy;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33PHNpHi052997;
	Tue, 25 Apr 2023 12:23:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682443431;
	bh=L408On+uBZQZYQxPsZQAE1Eh3ePXJajyc0dyAkbwCmE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lJI5dzPyqw1o+To9k38yUpp241+Bu5sjPx8l2hSdvsgcfi1bNoWHwilxAWGKZYRln
	 VLkd3RU6GGRe/x93xlhO7Kl3estaz45GkDzFv6u0R/a8My9WEct0taSIvuOaFxQ6RL
	 dXRbQG2EmY/52EVNJ/RZHGvcjpxIALXu0rsYe9KY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33PHNojM123189
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Apr 2023 12:23:51 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 25
 Apr 2023 12:23:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 25 Apr 2023 12:23:49 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33PHNj0v030178;
	Tue, 25 Apr 2023 12:23:49 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Neha Malcom Francis <n-francis@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][RFC 8/9] conf: machine: Switch all the machines over to U-Boot binman
Date: Tue, 25 Apr 2023 12:23:44 -0500
Message-ID: <20230425172345.12293-9-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16426

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf   | 12 ++++++++++++
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf    | 11 +++++++++++
 meta-ti-bsp/conf/machine/am62xx-evm.conf         |  4 ++--
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf |  7 -------
 meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf    | 12 ++++++++++++
 meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf    |  7 -------
 meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf |  7 -------
 meta-ti-bsp/conf/machine/include/am62axx.inc     |  6 ------
 meta-ti-bsp/conf/machine/include/am62xx-lp.inc   |  4 ----
 meta-ti-bsp/conf/machine/include/am62xx.inc      |  6 ------
 meta-ti-bsp/conf/machine/include/am64xx.inc      |  6 ------
 meta-ti-bsp/conf/machine/include/am65xx.inc      |  5 -----
 meta-ti-bsp/conf/machine/include/j721e.inc       |  3 ---
 meta-ti-bsp/conf/machine/include/k3.inc          |  2 +-
 meta-ti-bsp/conf/machine/include/k3r5.inc        |  5 ++++-
 meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf     |  6 ------
 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf  |  6 ------
 meta-ti-bsp/conf/machine/j721s2-evm.conf         |  4 ----
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf      |  2 --
 meta-ti-bsp/conf/machine/j784s4-evm.conf         |  4 ----
 meta-ti-bsp/conf/machine/j784s4-hs-evm.conf      |  2 --
 21 files changed, 42 insertions(+), 79 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
new file mode 100644
index 00000000..80b6497f
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
@@ -0,0 +1,12 @@
+#@TYPE: Machine
+#@NAME: AM62A HS-FS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62A EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY:append = ":k3r5-hs-fs"
+
+SYSFW_SOC = "am62ax"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
new file mode 100644
index 00000000..724a8d4a
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: AM62XX EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "am62x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+
+UBOOT_MACHINE = "am62x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index d54213d4..5b86a1f5 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -12,6 +12,6 @@ KERNEL_DEVICETREE = " \
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
 
-SPL_BINARY = "tispl.bin_HS"
-UBOOT_BINARY = "u-boot.img_HS"
+SPL_BINARY = "tispl.bin"
+UBOOT_BINARY = "u-boot.img"
 UBOOT_SYMLINK = "u-boot.img"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
index 15ecc677..54059dd7 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -9,11 +9,4 @@ SYSFW_SOC = "am62x"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
-SYSFW_TIBOOT3_SYMLINK = ""
-
 UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
-
-SPL_BINARY = ""
-UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "u-boot-r5spl-gp-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "u-boot-r5spl-gp.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
new file mode 100644
index 00000000..4369becc
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am64xx-evm-k3r5.conf
@@ -0,0 +1,12 @@
+#@TYPE: Machine
+#@NAME: AM64xx EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM64xx EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+SOC_FAMILY:append = ":am64xx"
+
+SYSFW_SOC = "am64x_sr2"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE = "am64x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
index a484e444..b1b2490e 100644
--- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
@@ -7,12 +7,5 @@ require conf/machine/include/k3r5.inc
 SYSFW_SOC = "am65x"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
-SYSFW_SYMLINK = ""
-
-SPL_BINARY = "spl/u-boot-spl.${UBOOT_SUFFIX}"
-SPL_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
-UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
 
 UBOOT_MACHINE = "am65x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
index d9041c9d..836460e9 100644
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
@@ -7,12 +7,5 @@ require conf/machine/include/k3r5.inc
 SYSFW_SOC = "am65x"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
-SYSFW_SYMLINK = ""
-
-SPL_BINARY = "spl/u-boot-spl.${UBOOT_SUFFIX}"
-SPL_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
-UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
 
 UBOOT_MACHINE = "am65x_hs_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
index eacfa584..5cc95585 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -6,18 +6,12 @@ MACHINE_FEATURES += "screen touchscreen"
 TFA_K3_SYSTEM_SUSPEND = "1"
 
 # Default tiboot3.bin on AM62A is for HS-FS
-BBMULTICONFIG = "k3r5-hs-fs"
-do_image_complete[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on AM62A is for HS-FS, add a version for GP
-BBMULTICONFIG += "k3r5-gp"
 IMAGE_BOOT_FILES += "tiboot3-am62ax-gp-evm.bin"
-do_image_complete[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on AM62A is for HS-FS, add a version for HS-SE
-BBMULTICONFIG += "k3r5-hs-se"
 IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-evm.bin"
-do_image_complete[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
 
 TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am62x"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
index bcc6f493..3c0249eb 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
@@ -6,13 +6,9 @@ MACHINE_FEATURES += "screen touchscreen"
 TFA_K3_SYSTEM_SUSPEND = "1"
 
 # Default tiboot3.bin on AM62x LP is for HS-FS
-BBMULTICONFIG = "k3r5-hs-fs"
-do_image_complete[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on AM62x LP is for HS-FS, add a version for HS-SE
-BBMULTICONFIG += "k3r5-hs-se"
 IMAGE_BOOT_FILES += "tiboot3-am62x-hs-evm.bin"
-do_image_complete[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
 
 TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am62x"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index 623d90eb..cb8db03f 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -6,18 +6,12 @@ MACHINE_FEATURES += "screen gpu"
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 
 # Default tiboot3.bin on AM62x is for HS-FS
-BBMULTICONFIG = "k3r5-hs-fs"
-do_image_complete[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on AM62x is for HS-FS, add a version for GP
-BBMULTICONFIG += "k3r5-gp"
 IMAGE_BOOT_FILES += "tiboot3-am62x-gp-evm.bin"
-do_image_complete[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on AM62x is for HS-FS, add a version for HS-SE
-BBMULTICONFIG += "k3r5-hs-se"
 IMAGE_BOOT_FILES += "tiboot3-am62x-hs-evm.bin"
-do_image_complete[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
 
 TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index f5f4ffe7..9112b78b 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -9,18 +9,12 @@ KERNEL_DEVICETREE = " \
 "
 
 # Default tiboot3.bin on AM64x is for SR2.0 HS-FS
-BBMULTICONFIG = "k3r5-sr2-hs-fs"
-do_image_complete[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
 IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-fs-evm.bin"
 
 # Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
-BBMULTICONFIG += "k3r5-gp"
-do_image_complete[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
 IMAGE_BOOT_FILES += "tiboot3-am64x-gp-evm.bin"
 
 # Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for SR2.0 HS-SE
-BBMULTICONFIG += "k3r5-sr2-hs-se"
-do_image_complete[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
 IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-evm.bin"
 
 TFA_BOARD = "lite"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 9fe851f4..0ddb088e 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -11,12 +11,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am654-base-board.dtb \
 "
 
-# On AM65x the file tiboot3.bin comes from the bootloader not ti-sci-fw
-do_image_complete[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
-
 # Default sysfw.itb on AM65x is for SR2.0
-BBMULTICONFIG += "k3r5-sr2"
-do_image_complete[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 IMAGE_BOOT_FILES += "sysfw.itb"
 
 # Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index 5e325ffe..e33918aa 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -5,9 +5,6 @@ MACHINE_FEATURES += "screen gpu"
 
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 
-# On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
-do_image_complete[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
-
 IMAGE_BOOT_FILES += "sysfw.itb"
 
 TFA_BOARD = "generic"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 31da2ca9..6ca9f17a 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -52,7 +52,7 @@ MACHINE_FEATURES += "efi"
 
 WKS_FILE ?= "sdimage-2part-efi.wks"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
-do_image_complete[mcdepends] += "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
 
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/machine/include/k3r5.inc
index 377a2b2f..8b8cedbe 100644
--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
+++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
@@ -15,7 +15,10 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
-SPL_BINARY = ""
+SPL_SUFFIX = "bin"
+#SPL_BINARY = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.${SPL_SUFFIX}"
+SPL_BINARY = "tiboot3.${SPL_SUFFIX}"
+SPL_SYMLINK = "tiboot3.${SPL_SUFFIX}"
 UBOOT_SUFFIX = "bin"
 UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
 UBOOT_IMAGE = "u-boot-r5spl-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
diff --git a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
index 9544cdb6..070bf7aa 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
@@ -8,10 +8,4 @@ SYSFW_SOC = "j721e"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
-SPL_BINARY = "spl/u-boot-spl.${UBOOT_SUFFIX}"
-SPL_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
-UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
-
 UBOOT_MACHINE = "j721e_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
index 56312c0c..74abbbfd 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
@@ -8,10 +8,4 @@ SYSFW_SOC = "j721e_sr1_1"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
 
-SPL_BINARY = "spl/u-boot-spl.${UBOOT_SUFFIX}"
-SPL_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
-UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
-
 UBOOT_MACHINE = "j721e_hs_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index 2a128411..e396bfad 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -19,10 +19,6 @@ KERNEL_DEVICETREE = " \
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
 
 # Default tiboot3.bin on J721S2 is for GP
-BBMULTICONFIG = "k3r5-gp"
-do_image_complete[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-FS
-BBMULTICONFIG += "k3r5-sr1-hs-fs"
 IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-fs-evm.bin"
-do_image_complete[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
index 337818a4..59f3cfbc 100644
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
@@ -14,8 +14,6 @@ KERNEL_DEVICETREE = " \
 
 UBOOT_MACHINE = "j721s2_hs_evm_a72_defconfig"
 
-do_image_complete[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-
 SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
 UBOOT_SYMLINK = "u-boot.img"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 7971ad73..8045dd75 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -17,10 +17,6 @@ KERNEL_DEVICETREE = ""
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
 
 # Default tiboot3.bin on J784S4 is for GP
-BBMULTICONFIG = "k3r5-gp"
-do_image_complete[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0 HS-FS
-BBMULTICONFIG += "k3r5-sr1-hs-fs"
 IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
-do_image_complete[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
index 123de8c1..12163dd8 100644
--- a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
@@ -14,8 +14,6 @@ KERNEL_DEVICETREE = " \
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
 
-do_image_complete[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-
 TFA_BOARD = "j784s4"
 
 SPL_BINARY = "tispl.bin_HS"
-- 
2.39.2


