Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1523.1637266286063714033
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 12:11:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hihhhvXC;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AIKBO2P074280;
	Thu, 18 Nov 2021 14:11:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637266284;
	bh=0UEf2V9MVCcLWSKWZadLTyzAcFoY6FrcGnZT1+5oNrc=;
	h=From:To:Subject:Date;
	b=hihhhvXCXKrYnLBEXaxyQBpSK9QZQ0I5Cia9VfKxq/8okrje8on9MIVBxefJiyGSq
	 E1nZjtaHPNYSZSuO78IXLMsix5Qv89XiaiP+mQD12i4PegcZQZalHLh4pBsvPgNQVo
	 4iVV8neUh4qJke5g7nXL7Lb7eFE96ORv4M+XiLsk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AIKBO6l032852
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Nov 2021 14:11:24 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 18
 Nov 2021 14:11:23 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 18 Nov 2021 14:11:23 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AIKBN4P093105;
	Thu, 18 Nov 2021 14:11:23 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2] j721e-sr1_1: Add j721e sr1.1 HS support
Date: Thu, 18 Nov 2021 20:11:23 +0000
Message-ID: <20211118201123.4908-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This patch adds support for J721e HS SR1.1
HS SR1.1 requires updated sysfw binary. Both SR1.0 and SR1.1 sysfw
binary will be generated. sysfw.itb will point to SR1.1

This patch requires J7 SR 1.1 support in K3 Image gen.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 Changes from v1:
 1) Fixed the typo 
 
 conf/machine/j7-hs-evm-k3r5-sr1-1.conf | 11 +++++++++++
 conf/machine/j7-hs-evm.conf            |  8 ++++++++
 conf/multiconfig/k3r5-sr1-1.conf       |  3 +++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb |  1 +
 4 files changed, 23 insertions(+)
 create mode 100644 conf/machine/j7-hs-evm-k3r5-sr1-1.conf
 create mode 100644 conf/multiconfig/k3r5-sr1-1.conf

diff --git a/conf/machine/j7-hs-evm-k3r5-sr1-1.conf b/conf/machine/j7-hs-evm-k3r5-sr1-1.conf
new file mode 100644
index 00000000..7d1f4afc
--- /dev/null
+++ b/conf/machine/j7-hs-evm-k3r5-sr1-1.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: J7 SR1.1 HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J7 SR1.1 HS EVM (R5F core)
+
+# Booting SR1.1 requires different SYSFW, the rest is handled at runtime
+
+require conf/machine/j7-hs-evm-k3r5.conf
+SOC_FAMILY_append = ":k3r5-sr1-1"
+
+SYSFW_SOC = "j721e_sr1_1"
+SYSFW_SYMLINK = "sysfw.itb"
diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j7-hs-evm.conf
index 70e14754..ab0fa474 100644
--- a/conf/machine/j7-hs-evm.conf
+++ b/conf/machine/j7-hs-evm.conf
@@ -19,4 +19,12 @@ SPL_BINARYNAME = "tispl.bin"
 UBOOT_BINARY = "u-boot.img_HS"
 IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
 
+BBMULTICONFIG += "k3r5-sr1-1"
+
+# Use default IMAGE_BOOT_FILES_LEGACY files
+# Since default sysfw.itb on J7 is for SR1.1, add a version for SR1.0
+IMAGE_BOOT_FILES += "sysfw-j7-hs-evm.itb"
+do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
+
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/multiconfig/k3r5-sr1-1.conf b/conf/multiconfig/k3r5-sr1-1.conf
new file mode 100644
index 00000000..2dc93b2f
--- /dev/null
+++ b/conf/multiconfig/k3r5-sr1-1.conf
@@ -0,0 +1,3 @@
+require k3r5.conf
+
+MACHINE_append = "-sr1-1"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 4f1dd145..6d48bf23 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -25,6 +25,7 @@ SYSFW_PREFIX = "ti-sci-firmware"
 SYSFW_PREFIX_j7-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX_j7-hs-evm-k3r5 = "ti-fs-firmware"
+SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "ti-fs-firmware"
 SYSFW_PREFIX_j7200-hs-evm-k3r5 = "ti-fs-firmware"
 
 SYSFW_SUFFIX ?= "unknown"
-- 
2.17.1

