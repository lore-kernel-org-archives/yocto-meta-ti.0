Return-Path: <vaishnav.a@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9A9C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:12:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.85549.1677485555851078265
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Feb 2023 00:12:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mPZcHsSi;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: vaishnav.a@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31R8CZ0L094475
	for <meta-ti@lists.yoctoproject.org>; Mon, 27 Feb 2023 02:12:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677485555;
	bh=NGNxRxc8rNzHS/7WZ3BFJTOYMuD+5YVRsmyGa3YN2M8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mPZcHsSi9KFXpjJLsVvNUiqDkMcnVck6syuMNo/gcDqnaZwD7Y5f+Hz3EJ5vWK9Gm
	 qoDQv8rSb0gjHuEea86BvUKkNa283KCpqo/ILUjVyv4lYmqGAx2tQwcZUbb1Vrm6ej
	 PccasXC7xeEmnEu7wIYm72Q+Sox7YFHJDGswz//E=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31R8CZM3129566
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 27 Feb 2023 02:12:35 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 27
 Feb 2023 02:12:34 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 27 Feb 2023 02:12:35 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31R8CX8x024978;
	Mon, 27 Feb 2023 02:12:34 -0600
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <denys@ti.com>, <u-kumar1@ti.com>, <vaishnav.a@ti.com>
Subject: [meta-ti][dunfell][PATCH 3/3] conf: machine: j784s4-evm: Add MCSPI loopback overlay for J784S4
Date: Mon, 27 Feb 2023 13:42:28 +0530
Message-ID: <20230227081228.10841-3-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230227081228.10841-1-vaishnav.a@ti.com>
References: <20230227081228.10841-1-vaishnav.a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Feb 2023 08:12:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15957

Add the MCSPI loopback overlay file for J784S4 EVM which helps
users to enable MCU-MAIN MCSPI loopback applications, even though
the overlay is named j7200-mcspi-loopback.dtbo, same can be used
for testing on other J7 platforms as well.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---
 conf/machine/j784s4-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j784s4-evm.conf b/conf/machine/j784s4-evm.conf
index 77805d49..11930b75 100644
--- a/conf/machine/j784s4-evm.conf
+++ b/conf/machine/j784s4-evm.conf
@@ -38,6 +38,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-j784s4-evm.dtb \
     ti/k3-j784s4-evm-csi2-ov5640.dtbo \
     ti/k3-j784s4-fpdlink-fusion.dtbo \
+    ti/k3-j7200-mcspi-loopback.dtbo \
 "
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
-- 
2.17.1


