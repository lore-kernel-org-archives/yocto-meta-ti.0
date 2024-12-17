Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA90CE7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 20:59:50 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.91572.1734469188852469035
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 12:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=no69esn6;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BHKxla3057922
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 17 Dec 2024 14:59:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734469187;
	bh=xUHakbf7iBkyzM701AeaFONDW3h7mcGPZfj8+QEGz10=;
	h=From:To:CC:Subject:Date;
	b=no69esn6FKbfIXdRSR8Xjvp9Q87BDQoZvs98Vt14I79VZ7HRfudUOyQIry9kukBK7
	 cOxj4SSSLclacJh9u64AYxPnD5DPyctpNfEmQ4OXKlqAdjrzBn5OnjX+CUiYjoetf0
	 n2MkOOrDZ2W0jlQjd2r0wjtWa5YcOMcHmdX6jFZ4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKxl5j018038;
	Tue, 17 Dec 2024 14:59:47 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 17
 Dec 2024 14:59:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 17 Dec 2024 14:59:46 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BHKxkaR037110;
	Tue, 17 Dec 2024 14:59:46 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH] ti-bsp: Disable GC320 support conditionally on BSP version
Date: Tue, 17 Dec 2024 14:59:45 -0600
Message-ID: <20241217205945.46805-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Dec 2024 20:59:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18126

Like we do with GPU support, GC320 support is conditional on the
kernel we are building and so should be disabled here for kernels
on which it is not functional yet.

We can then remove these disabling lines as the driver is updated
for each supported kernel, instead of blanket disabling in the
distro layer as done currently.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 814c6ca8..bdc8bef7 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -22,6 +22,9 @@ BSP_BOOTLOADER_VERSION:bsp-mainline = "%"
 # in mainline, usually present in TI staging or derivative like BB.org
 MACHINE_FEATURES:remove:bsp-mainline = "gpu"
 
+# GC320 support requires out-of-tree drivers not available in mainline
+MACHINE_FEATURES:remove:bsp-mainline = "gc320"
+
 # ==========
 # next
 # upcoming upstream/mainline kernel, u-boot
@@ -35,6 +38,9 @@ BSP_BOOTLOADER_VERSION:bsp-next = "%"
 # in next, usually present in TI staging or derivative like BB.org
 MACHINE_FEATURES:remove:bsp-next = "gpu"
 
+# GC320 support requires out-of-tree drivers not available in next
+MACHINE_FEATURES:remove:bsp-next = "gc320"
+
 # ==========
 # ti-6_12
 # TI staging kernel 6.12, u-boot 2024.10
@@ -48,6 +54,9 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2024.10%"
 # in 6.12 yet
 MACHINE_FEATURES:remove:bsp-ti-6_12 = "gpu"
 
+# GC320 support requires out-of-tree drivers not yet available in 6.12
+MACHINE_FEATURES:remove:bsp-ti-6_12 = "gc320"
+
 # ==========
 # ti-6_6
 # TI staging kernel 6.6, u-boot 2024.04
@@ -65,6 +74,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 = "24%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "23%"
 
+# GC320 support requires out-of-tree drivers not yet available in 6.6
+MACHINE_FEATURES:remove:bsp-ti-6_6 = "gc320"
+
 # ==========
 # ti-6_1
 # TI staging kernel 6.1, u-boot 2023.04
@@ -82,6 +94,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_1 = "23%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_1 = "23%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_1 = "22%"
 
+# GC320 support requires out-of-tree drivers not yet available in 6.1
+MACHINE_FEATURES:remove:bsp-ti-6_1 = "gc320"
+
 # ==========
 # bb_org
 # BeagleBoard.org kernel 6.1, u-boot 2023.04
@@ -101,6 +116,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-bb_org = "23%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org = "23%"
 BSP_MESA_PVR_VERSION:bsp-bb_org = "22%"
 
+# GC320 support requires out-of-tree drivers not yet available in bb.org
+MACHINE_FEATURES:remove:bsp-bb_org = "gc320"
+
 # ==========
 # sane fallback defaults
 # if specific values are not defined or bsp is set incorrectly
-- 
2.39.2


