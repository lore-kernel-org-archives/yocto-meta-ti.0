Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B82CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 15:10:31 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.863.1757430629565224001
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Sep 2025 08:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qXawGAci;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 589FASOL4129451;
	Tue, 9 Sep 2025 10:10:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757430628;
	bh=icgNgNaNePv/Ri1rVeyR7zsErQSCKPJ5NfoPybCaPuk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qXawGAci9LZesncXQnY3YlzQxlNI7dMDptTSXclIVArucM7GWH1BKSLpauMVzttYs
	 eFwJY61Xfh3Rk2KiMGmmZiZvDzQOZlOXKY0TO6aHPalB0bhuS1RwckA+IA91ZBaIQK
	 yJnk42OlKSNbpZLDQmwjppibzOqv+r7OzYF95VeM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 589FASqd3237204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 9 Sep 2025 10:10:28 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 9
 Sep 2025 10:10:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 9 Sep 2025 10:10:28 -0500
Received: from ula0226330.dhcp.ti.com (ula0226330.dhcp.ti.com [10.247.30.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 589FASUh2825029;
	Tue, 9 Sep 2025 10:10:28 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap][RFC 2/6] ti-bsp: Do not remove gpu MACHINE_FEATURE conditionally on BSP version
Date: Tue, 9 Sep 2025 10:10:24 -0500
Message-ID: <20250909151028.272925-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250909151028.272925-1-afd@ti.com>
References: <20250909151028.272925-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Sep 2025 15:10:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18983

Setting or removing the gpu MACHINE_FEATURE does not actually change
if the GPU driver is built or not. That is done based on the setting
of the BSP_{SGX,ROGUE}_{DRIVER,UMLIBS}_{PROVIDER,VERSION} vars. These
are default empty for BSP versions without supported GPU drivers, which
will correctly cause a fallback to SW rendering when the GPU driver is
not available.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 262aa884..a5d9a51f 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -18,10 +18,6 @@ BSP_KERNEL_VERSION:bsp-mainline = "%"
 BSP_BOOTLOADER_PROVIDER:bsp-mainline = "u-boot-ti-mainline"
 BSP_BOOTLOADER_VERSION:bsp-mainline = "%"
 
-# GPU support requires out-of-tree SGX and Rogue drivers not available
-# in mainline, usually present in TI staging or derivative like BB.org
-MACHINE_FEATURES:remove:bsp-mainline = "gpu"
-
 # GC320 support requires out-of-tree drivers not available in mainline
 MACHINE_FEATURES:remove:bsp-mainline = "gc320"
 
@@ -34,10 +30,6 @@ BSP_KERNEL_VERSION:bsp-next = "%"
 BSP_BOOTLOADER_PROVIDER:bsp-next = "u-boot-ti-next"
 BSP_BOOTLOADER_VERSION:bsp-next = "%"
 
-# GPU support requires out-of-tree SGX and Rogue drivers not available
-# in next, usually present in TI staging or derivative like BB.org
-MACHINE_FEATURES:remove:bsp-next = "gpu"
-
 # GC320 support requires out-of-tree drivers not available in next
 MACHINE_FEATURES:remove:bsp-next = "gc320"
 
-- 
2.39.2


