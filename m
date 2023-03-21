Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF96C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 11:08:16 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.10281.1679396886755012879
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 04:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=h0TutgJp;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32LB7u72026165;
	Tue, 21 Mar 2023 06:07:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679396876;
	bh=CvuWsHiUu/+1/vVRUAZKr1GXEZ/qoj7YRVUB4huNTW8=;
	h=From:To:CC:Subject:Date;
	b=h0TutgJp/TJS+1zmIwC/CZ06oZ4Ov6kmSBN0Ks8y5bLTMYv+r9ETT8cjsGGvOMi8D
	 mB7p8Ze7WjdBAAN0yuPFeATj2/++20OhT9KnAWWCzqqJ/Wpp/QrNkY51qFImFrtXRW
	 Sjr7kVV62i6QYuhs8SpUxCoSPZWLyUEXZQgU8iDc=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32LB7u3o001952
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Mar 2023 06:07:56 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 21
 Mar 2023 06:07:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 21 Mar 2023 06:07:55 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32LB7tsW018697;
	Tue, 21 Mar 2023 06:07:55 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <g-gupta@ti.com>, <s-adivi@ti.com>
Subject: [meta-ti][dunfell/kirkstone][PATCH] Support building for AM65x SR2.0 & SR1.0 HS & GP with am65xx-evm machine
Date: Tue, 21 Mar 2023 16:37:42 +0530
Message-ID: <20230321110742.26379-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Mar 2023 11:08:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16217

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

- multiconfig, conf:
    - Add new multiconfig file to build for K3R5F SR2 GP devices
    - Update the am65xx-evm conf files to build both HS and GP for
      AM65x SR2.0. SR1.0 and keep SR2.0 HS sysfw.itb as default.
    - Remove am65xx-hs-evm conf files since am65xx-evm will build both
      GP and HS.
- optee: Sign optee for am65xx-evm to support HS builds
- ATF: Sign ATF for am65xx-evm to support HS builds
- ti-sci-fw: Add SYSFW_SUFFIX to SYSFW_BINARY name to differentiate
  between GP and HS binaries.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 conf/machine/am65xx-evm-k3r5-gp.conf          | 13 +++++++
 conf/machine/am65xx-evm-k3r5-hs-se.conf       | 13 +++++++
 ...-k3r5.conf => am65xx-evm-k3r5-sr2-gp.conf} |  4 +--
 ...r2.conf => am65xx-evm-k3r5-sr2-hs-se.conf} |  4 ++-
 conf/machine/am65xx-hs-evm-k3r5-sr2.conf      | 11 ------
 conf/machine/am65xx-hs-evm-k3r5.conf          | 18 ----------
 conf/machine/am65xx-hs-evm.conf               | 11 ------
 conf/machine/include/am65xx.inc               | 30 +++++++++++-----
 conf/multiconfig/k3r5-sr2-gp.conf             |  3 ++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        | 34 +++++++++----------
 .../trusted-firmware-a_%.bbappend             |  2 +-
 recipes-security/optee/optee-os_%.bbappend    |  2 +-
 12 files changed, 74 insertions(+), 71 deletions(-)
 create mode 100644 conf/machine/am65xx-evm-k3r5-gp.conf
 create mode 100644 conf/machine/am65xx-evm-k3r5-hs-se.conf
 rename conf/machine/{am65xx-evm-k3r5.conf => am65xx-evm-k3r5-sr2-gp.conf} (87%)
 rename conf/machine/{am65xx-evm-k3r5-sr2.conf => am65xx-evm-k3r5-sr2-hs-se.conf} (80%)
 delete mode 100644 conf/machine/am65xx-hs-evm-k3r5-sr2.conf
 delete mode 100644 conf/machine/am65xx-hs-evm-k3r5.conf
 delete mode 100644 conf/machine/am65xx-hs-evm.conf
 create mode 100644 conf/multiconfig/k3r5-sr2-gp.conf

diff --git a/conf/machine/am65xx-evm-k3r5-gp.conf b/conf/machine/am65xx-evm-k3r5-gp.conf
new file mode 100644
index 00000000..c67699ac
--- /dev/null
+++ b/conf/machine/am65xx-evm-k3r5-gp.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: AM65xx SR1.0 EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM65xx SR1.0 EVM (R5F core)
+
+# Booting SR1 requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/am65xx-evm-k3r5-sr2-gp.conf
+SOC_FAMILY_append = ":k3r5"
+
+SYSFW_SUFFIX = "gp"
+SYSFW_SOC = "am65x"
+SYSFW_SYMLINK = ""
+
diff --git a/conf/machine/am65xx-evm-k3r5-hs-se.conf b/conf/machine/am65xx-evm-k3r5-hs-se.conf
new file mode 100644
index 00000000..6060de85
--- /dev/null
+++ b/conf/machine/am65xx-evm-k3r5-hs-se.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: AM65xx SR1.0 EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM65xx SR1.0 EVM (R5F core)
+
+# Booting SR1 requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/am65xx-evm-k3r5-sr2-gp.conf
+SOC_FAMILY_append = ":k3r5"
+
+SYSFW_SUFFIX = "hs"
+SYSFW_SOC = "am65x"
+SYSFW_SYMLINK = ""
+
diff --git a/conf/machine/am65xx-evm-k3r5.conf b/conf/machine/am65xx-evm-k3r5-sr2-gp.conf
similarity index 87%
rename from conf/machine/am65xx-evm-k3r5.conf
rename to conf/machine/am65xx-evm-k3r5-sr2-gp.conf
index a484e444..31ca807a 100644
--- a/conf/machine/am65xx-evm-k3r5.conf
+++ b/conf/machine/am65xx-evm-k3r5-sr2-gp.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/include/k3r5.inc
 
-SYSFW_SOC = "am65x"
+SYSFW_SOC = "am65x_sr2"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 SYSFW_SYMLINK = ""
@@ -15,4 +15,4 @@ UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
 UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
 
-UBOOT_MACHINE = "am65x_evm_r5_defconfig"
+UBOOT_MACHINE = "am65x_hs_evm_r5_defconfig"
diff --git a/conf/machine/am65xx-evm-k3r5-sr2.conf b/conf/machine/am65xx-evm-k3r5-sr2-hs-se.conf
similarity index 80%
rename from conf/machine/am65xx-evm-k3r5-sr2.conf
rename to conf/machine/am65xx-evm-k3r5-sr2-hs-se.conf
index c0b3cd51..cf127029 100644
--- a/conf/machine/am65xx-evm-k3r5-sr2.conf
+++ b/conf/machine/am65xx-evm-k3r5-sr2-hs-se.conf
@@ -4,8 +4,10 @@
 
 # Booting SR2 requires different SYSFW, the rest is handled at runtime
 
-require conf/machine/am65xx-evm-k3r5.conf
+require conf/machine/am65xx-evm-k3r5-sr2-gp.conf
 SOC_FAMILY_append = ":k3r5-sr2"
 
+SYSFW_SUFFIX = "hs"
 SYSFW_SOC = "am65x_sr2"
 SYSFW_SYMLINK = "sysfw.itb"
+
diff --git a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf b/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
deleted file mode 100644
index ef1b6fbe..00000000
--- a/conf/machine/am65xx-hs-evm-k3r5-sr2.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM65xx SR2.0 HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM65xx SR2.0 HS EVM (R5F core)
-
-# Booting SR2 requires different SYSFW, the rest is handled at runtime
-
-require conf/machine/am65xx-hs-evm-k3r5.conf
-SOC_FAMILY_append = ":k3r5-sr2"
-
-SYSFW_SOC = "am65x_sr2"
-SYSFW_SYMLINK = "sysfw.itb"
diff --git a/conf/machine/am65xx-hs-evm-k3r5.conf b/conf/machine/am65xx-hs-evm-k3r5.conf
deleted file mode 100644
index d9041c9d..00000000
--- a/conf/machine/am65xx-hs-evm-k3r5.conf
+++ /dev/null
@@ -1,18 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM65xx HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM (R5F core)
-
-require conf/machine/include/k3r5.inc
-
-SYSFW_SOC = "am65x"
-SYSFW_CONFIG = "evm"
-SYSFW_SUFFIX = "hs"
-SYSFW_SYMLINK = ""
-
-SPL_BINARY = "spl/u-boot-spl.${UBOOT_SUFFIX}"
-SPL_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
-UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
-
-UBOOT_MACHINE = "am65x_hs_evm_r5_defconfig"
diff --git a/conf/machine/am65xx-hs-evm.conf b/conf/machine/am65xx-hs-evm.conf
deleted file mode 100644
index 2c1256d0..00000000
--- a/conf/machine/am65xx-hs-evm.conf
+++ /dev/null
@@ -1,11 +0,0 @@
-#@TYPE: Machine
-#@NAME: AM65xx HS EVM
-#@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM
-
-require conf/machine/include/am65xx.inc
-
-UBOOT_MACHINE = "am65x_hs_evm_a53_defconfig"
-
-SPL_BINARY = "tispl.bin_HS"
-UBOOT_BINARY = "u-boot.img_HS"
-UBOOT_SYMLINK = "u-boot.img"
diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
index b70d212f..958cbc8a 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -20,16 +20,28 @@ KERNEL_DEVICETREE = " \
     ti/k3-am654-evm-ov5640.dtbo \
 "
 
-BBMULTICONFIG += "k3r5-sr2"
-
-# Since J721e does not support multi-cert tiboot3.bin add standalone sysfw.itb
+BBMULTICONFIG = "k3r5-sr2-hs-se"
 IMAGE_BOOT_FILES += "sysfw.itb"
-
-# Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0
-IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
-
-do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
+do_image_wic[mcdepends] = "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
+
+BBMULTICONFIG += "k3r5-hs-se"
+IMAGE_BOOT_FILES += "sysfw-am65x-hs-evm.itb"
+do_image_wic[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
+
+BBMULTICONFIG += "k3r5-gp"
+IMAGE_BOOT_FILES += "sysfw-am65x-gp-evm.itb"
+do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
+
+
+BBMULTICONFIG += "k3r5-sr2-gp"
+IMAGE_BOOT_FILES += "sysfw-am65x_sr2-gp-evm.itb"
+do_image_wic[mcdepends] += "mc::k3r5-sr2-gp:u-boot-ti-staging:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-sr2-gp:u-boot-ti-staging:do_deploy"
+do_image_wic[mcdepends] += "mc::k3r5-sr2-gp:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-sr2-gp:ti-sci-fw:do_deploy"
 
 OPTEEMACHINE = "k3-am65x"
 OPTEEOUTPUTMACHINE = "k3"
diff --git a/conf/multiconfig/k3r5-sr2-gp.conf b/conf/multiconfig/k3r5-sr2-gp.conf
new file mode 100644
index 00000000..fae89bd3
--- /dev/null
+++ b/conf/multiconfig/k3r5-sr2-gp.conf
@@ -0,0 +1,3 @@
+require k3r5-sr2.conf
+
+MACHINE_append = "-gp"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 80c0b890..6503e964 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -2,10 +2,10 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 require recipes-ti/includes/ti-paths.inc
 
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native virtual/bootloader"
-DEPENDS_remove_am65xx-evm-k3r5 = " virtual/bootloader"
-DEPENDS_remove_am65xx-evm-k3r5-sr2 = " virtual/bootloader"
-DEPENDS_remove_am65xx-hs-evm-k3r5 = " virtual/bootloader"
-DEPENDS_remove_am65xx-hs-evm-k3r5-sr2 = " virtual/bootloader"
+DEPENDS_remove_am65xx-evm-k3r5-sr2-gp = " virtual/bootloader"
+DEPENDS_remove_am65xx-evm-k3r5-sr2-hs-se = " virtual/bootloader"
+DEPENDS_remove_am65xx-evm-k3r5-gp = " virtual/bootloader"
+DEPENDS_remove_am65xx-evm-k3r5-hs-se = " virtual/bootloader"
 DEPENDS_remove_j7-evm-k3r5 = " virtual/bootloader"
 DEPENDS_remove_j7-hs-evm-k3r5 = " virtual/bootloader"
 DEPENDS_remove_j7-hs-evm-k3r5-sr1-1 = " virtual/bootloader"
@@ -54,23 +54,23 @@ SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
 SYSFW_TIBOOT3 = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.bin"
 SYSFW_TIBOOT3_SYMLINK ?= "tiboot3.bin"
 
-SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
 SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
 SYSFW_IMAGE = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
 SYSFW_SYMLINK ?= "sysfw.itb"
 
-SYSFW_VBINARY_am65xx-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY_am65xx-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY_am65xx-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY_am65xx-hs-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY_am65xx-evm-k3r5-sr2-gp = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY_am65xx-evm-k3r5-sr2-hs-se = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY_am65xx-evm-k3r5-gp = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY_am65xx-evm-k3r5-hs-se = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
 SYSFW_VBINARY_j7-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
 SYSFW_VBINARY_j7-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
 SYSFW_VBINARY_j7-hs-evm-k3r5-sr1-1 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
 
-SYSFW_IMAGE_am65xx-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE_am65xx-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE_am65xx-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE_am65xx-hs-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE_am65xx-evm-k3r5-sr2-gp = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE_am65xx-evm-k3r5-sr2-hs-se = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE_am65xx-evm-k3r5-gp = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE_am65xx-evm-k3r5-hs-se = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
 SYSFW_IMAGE_j7-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
 SYSFW_IMAGE_j7-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
 SYSFW_IMAGE_j7-hs-evm-k3r5-sr1-1 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
@@ -87,10 +87,10 @@ EXTRA_OEMAKE = "\
     CONFIG=${SYSFW_CONFIG} SYSFW_DIR="${S}/ti-sysfw" \
     SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin" \
 "
-EXTRA_OEMAKE_remove_am65xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_remove_am65xx-evm-k3r5-sr2 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_remove_am65xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_remove_am65xx-hs-evm-k3r5-sr2 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_remove_am65xx-evm-k3r5-sr2-gp = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_remove_am65xx-evm-k3r5-sr2-hs-se = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_remove_am65xx-evm-k3r5-gp = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_remove_am65xx-evm-k3r5-hs-se = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_remove_j7-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_remove_j7-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_remove_j7-hs-evm-k3r5-sr1-1 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 70406724..38c7022f 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -23,7 +23,7 @@ tfa_sign_k3hs() {
 	)
 }
 
-do_compile_append_am65xx-hs-evm() {
+do_compile_append_am65xx-evm() {
 	tfa_sign_k3hs
 }
 
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index ddfc76f1..807f1c0f 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -64,7 +64,7 @@ do_compile_append_dra7xx() {
     optee_sign_legacyhs
 }
 
-do_compile_append_am65xx-hs-evm() {
+do_compile_append_am65xx-evm() {
     optee_sign_k3hs
 }
 
-- 
2.17.1


