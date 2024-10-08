Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5247CF0425
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 20:52:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.6643.1728420741771517362
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 13:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=avZ2b+Kh;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 498KqK77050119;
	Tue, 8 Oct 2024 15:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728420740;
	bh=wBAgnonuYgZDbPKABPnXbTCDZ/8GFKB93ey9IDuWaPs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=avZ2b+KhtG+HTDrwgYxFGUz48/XJwP2iGl1xaM18ZZUKxzwRXur2d30COcxAIbKas
	 NkSomYaoTDO38DyHwcfYY/UT73XzUbZBwyadgkjr66m7RmGwqglSwwP4jOmXu9mwvf
	 bJopARw85t22D9BfuPW0smS8qXFuV6d67PG2/xv8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 498KqKVw100717
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Oct 2024 15:52:20 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Oct 2024 15:52:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Oct 2024 15:52:20 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 498KqKPd068813;
	Tue, 8 Oct 2024 15:52:20 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1syHBs-00013z-2b; Tue, 08 Oct 2024 15:52:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH v2 3/4] ti-bsp: Add ti-6_12
Date: Tue, 8 Oct 2024 15:52:18 -0500
Message-ID: <20241008205219.4037-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241008205219.4037-1-reatmon@ti.com>
References: <20241008205219.4037-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Oct 2024 20:52:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17998

Add new BSP for the 6.12 kernel and u-boot 2024.10 versions.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix copy/paste typo in new ti-6_12 section.

 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 33611689..4cb2aab4 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -35,6 +35,19 @@ BSP_BOOTLOADER_VERSION:bsp-next = "%"
 # in next, usually present in TI staging or derivative like BB.org
 MACHINE_FEATURES:remove:bsp-next = "gpu"
 
+# ==========
+# ti-6_12
+# TI staging kernel 6.12, u-boot 2024.10
+# ==========
+BSP_KERNEL_PROVIDER:bsp-ti-6_12 = "linux-ti-staging"
+BSP_KERNEL_VERSION:bsp-ti-6_12 = "6.12%"
+BSP_BOOTLOADER_PROVIDER:bsp-ti-6_12 = "u-boot-ti-staging"
+BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2024.10%"
+
+# GPU support requires out-of-tree SGX and Rogue drivers not available
+# in 6.12 yet
+MACHINE_FEATURES:remove:bsp-ti-6_12 = "gpu"
+
 # ==========
 # ti-6_6
 # TI staging kernel 6.6, u-boot 2024.04
@@ -42,7 +55,7 @@ MACHINE_FEATURES:remove:bsp-next = "gpu"
 BSP_KERNEL_PROVIDER:bsp-ti-6_6 = "linux-ti-staging"
 BSP_KERNEL_VERSION:bsp-ti-6_6 = "6.6%"
 BSP_BOOTLOADER_PROVIDER:bsp-ti-6_6 = "u-boot-ti-staging"
-BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024%"
+BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024.04%"
 
 # Only Rogue is enabled so far, SGX falls back to SW rendering
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
-- 
2.17.1


