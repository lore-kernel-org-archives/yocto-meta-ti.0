Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BDEC2BA15
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 15:47:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.60451.1718639276263761658
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 08:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=X5zoORvX;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45HFlt1h039318
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Jun 2024 10:47:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718639275;
	bh=bQzi+kq5o8NKHiqdJ7sCvtjiUne3uJ0ojEsqvF5U7wA=;
	h=From:To:CC:Subject:Date;
	b=X5zoORvX6xlScn+x/f1mruk+ZpmqWFZqcxzl2fT7RbLVDdF7Gb0FPjGD0Kz9j6lrk
	 YKBNClQXmoAMyXNBNfM1PpYJAfIsak0RDdwi/tE7R/JrT+I4mpTn76RHH4gcLpBHzv
	 OTf+8dGg5BBHf6ewahhd1B4LIGuGPmFgM/XXCT8k=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45HFltZb031750
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 17 Jun 2024 10:47:55 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Jun 2024 10:47:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Jun 2024 10:47:55 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45HFlsmK062441;
	Mon, 17 Jun 2024 10:47:55 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v3] conf: machine: Update am62xxsip-evm for multi-BSP support
Date: Mon, 17 Jun 2024 21:17:37 +0530
Message-ID: <20240617154737.255281-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Jun 2024 15:47:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17757

Update am62xxsip-evm machine configuration to support
TI kernel 6.1 & ti-u-boot-2023.04

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
v3: Remove accidentaly pushed ti-dm & ti-u-boot changes for am62pxx
v2: In commit message, s/ti-u-boot-2024.04/ti-u-boot-2023.04

 meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 4 ++++
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf      | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
index c35edc6e..55bc530b 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
@@ -9,3 +9,7 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62xsip_evm_r5_defconfig"
+
+UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_r5_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS:bsp-ti-6_1 = "am62xsip_sk_r5.config"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index 38fe04c9..8104329e 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -14,3 +14,5 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "am62xsip_evm_a53_defconfig"
+
+UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_a53_defconfig"
-- 
2.34.1


