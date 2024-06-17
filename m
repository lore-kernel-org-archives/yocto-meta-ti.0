Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5910C27C77
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 08:34:13 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.51505.1718613244597188267
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 01:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bEZxEiVG;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45H8Y3QP028448;
	Mon, 17 Jun 2024 03:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718613243;
	bh=VxgRKu80ni4R29kE7GFWMKtKlYw8fb04YGWljVHI9MU=;
	h=From:To:CC:Subject:Date;
	b=bEZxEiVGY7LojRVLX7IiXKksCyn9mRXVWWu46Z7dDqkB8jnw1wp7IFksvfkJ/4bPb
	 Vr7LT55dpaa2NfB6MgQy6Mb1d50vGHPbRmn2ze91qFt7+ijCnVTerPE7NKVTPiXnsp
	 gf2HvA1XvoBW+yByYnrtBJ7tYGkbIVnwxZ43D29o=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45H8Y3R3009103
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Jun 2024 03:34:03 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Jun 2024 03:34:03 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Jun 2024 03:34:03 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45H8Y22Z033827;
	Mon, 17 Jun 2024 03:34:02 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Gyan Gupta <g-gupta@ti.com>,
        Denys
	<denys@konsulko.com>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: Update am62xxsip-evm for multi-BSP support
Date: Mon, 17 Jun 2024 14:03:51 +0530
Message-ID: <20240617083351.4120728-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Jun 2024 08:34:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17750

Update am62xxsip-evm machine configuration to support
TI kernel 6.1 & ti-u-boot-2024.04

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
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


