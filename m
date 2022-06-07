Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C5BCCA483
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 10:35:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.10849.1654598133717853517
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 03:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=A+VIfLF/;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-choudhary@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 257AZWhq014865
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jun 2022 05:35:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654598132;
	bh=8A84hzr+be1xCk1gGRSV/jh/4X1twD0qW5Ek1jG/2YY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=A+VIfLF/8m12FYSGv54ebmdBdQWEZpHt7+JvEuBIuOGLd9IAzkQdtm9v0fspBAGeR
	 bMZYjNmplsJ6lKlxuY0h+F42INXzHz7Gohp9eTocM2IIq6E1Mr5NzwDwAtASKZk/p4
	 4b6xQkgjcoMrEAUQx7tz5jsxeADqQ63I+DrHaAhU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 257AZWXg015426
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jun 2022 05:35:32 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 7
 Jun 2022 05:35:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 7 Jun 2022 05:35:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 257AZVSJ033816;
	Tue, 7 Jun 2022 05:35:31 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>, <j-choudhary@ti.com>
Subject: [meta-ti] [dunfell PATCH v2 1/5] conf: machine: Add j721s2 hs
 platform
Date: Tue, 7 Jun 2022 16:05:25 +0530
Message-ID: <20220607103529.13068-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220607103529.13068-1-j-choudhary@ti.com>
References: <20220607103529.13068-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Jun 2022 10:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14787

Machine conf for J721S2 HS platform.
Used j7200 hs as reference.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 conf/machine/j721s2-hs-evm-k3r5.conf | 13 +++++++++++++
 conf/machine/j721s2-hs-evm.conf      | 22 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 conf/machine/j721s2-hs-evm-k3r5.conf
 create mode 100644 conf/machine/j721s2-hs-evm.conf

diff --git a/conf/machine/j721s2-hs-evm-k3r5.conf b/conf/machine/j721s2-hs-evm-k3r5.conf
new file mode 100644
index 00000000..ac4df86e
--- /dev/null
+++ b/conf/machine/j721s2-hs-evm-k3r5.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: J721S2 HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "j721s2"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs"
+
+UBOOT_MACHINE = "j721s2_hs_evm_r5_defconfig"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/j721s2-hs-evm.conf b/conf/machine/j721s2-hs-evm.conf
new file mode 100644
index 00000000..43fb2ebc
--- /dev/null
+++ b/conf/machine/j721s2-hs-evm.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@NAME: J721S2 HS EVM
+#@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM
+
+require conf/machine/j721s2-evm.conf
+
+UBOOT_MACHINE = "j721s2_hs_evm_a72_defconfig"
+
+UBOOT_ENTRYPOINT =       "0x80080000"
+UBOOT_LOADADDRESS =      "0x80080000"
+UBOOT_RD_LOADADDRESS =   "0x84000000"
+UBOOT_RD_ENTRYPOINT =    "0x84000000"
+UBOOT_DTB_LOADADDRESS =  "0x83000000"
+UBOOT_DTBO_LOADADDRESS = "0x83080000"
+UBOOT_DTBO_OFFSET =      "0x00010000"
+
+SPL_BINARY = "tispl.bin_HS"
+SPL_BINARYNAME = "tispl.bin"
+UBOOT_BINARY = "u-boot.img_HS"
+IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
-- 
2.17.1


