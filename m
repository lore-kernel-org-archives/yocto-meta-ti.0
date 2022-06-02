Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D00CCA47B
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 17:22:28 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.347.1654190544513721349
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Jun 2022 10:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AUYquoTY;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-choudhary@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 252HMNRF070632
	for <meta-ti@lists.yoctoproject.org>; Thu, 2 Jun 2022 12:22:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654190543;
	bh=8A84hzr+be1xCk1gGRSV/jh/4X1twD0qW5Ek1jG/2YY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AUYquoTYNCJsXiBgwRC0C/GEOCmqVQNNn3pmkNIrY+7/A1MrUVPTTuw+RT/9UGfK7
	 VDuxSLmx+5eU65zg5EJeF2BjLeLFJ3nKkq1EvavN1DtqbwMkyhO1SuDeBt3WUd+yBg
	 wIBwzDXr/eZD5JhxCTvw8SFrgJp+ebPS1V1FtxD0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 252HMNMn063632
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 2 Jun 2022 12:22:23 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 2
 Jun 2022 12:22:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 2 Jun 2022 12:22:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 252HMMnu032280;
	Thu, 2 Jun 2022 12:22:23 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <praneeth@ti.com>
Subject: [meta-ti] [dunfell PATCH 1/3] conf: machine: Add j721s2 hs platform
Date: Thu, 2 Jun 2022 22:52:18 +0530
Message-ID: <20220602172220.24096-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220602172220.24096-1-j-choudhary@ti.com>
References: <20220602172220.24096-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Jun 2022 17:22:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14774

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


