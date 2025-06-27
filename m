Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48171C83026
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 19:24:59 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.1515.1751052297985976959
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jun 2025 12:24:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XoR1B9TV;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RJOuWY2827463;
	Fri, 27 Jun 2025 14:24:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751052296;
	bh=4XDBA2D2rroPXj58w++iYT6m2b8tamMmTSXvi00769I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XoR1B9TV8m3rToXVui07zBQM+UTDqiNIK0BnYWEuNnq/wAldPBytxXSmdfmFKzPWo
	 TVctFGyIWKU9jV8zyXJjG93exKDXb+0WXK6MeAHWZ8EzE3GOMkiwSKejvkSrw8ePWd
	 GHheGUEmfxMOsXi8vcR1zVoPJmM3qOG0JGptWz8M=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RJOusb731249
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 14:24:56 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 14:24:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 14:24:55 -0500
Received: from lelvem-mr05.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RJOt1b3323523;
	Fri, 27 Jun 2025 14:24:55 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 3/3] meta-beagle: beagle-bsp.inc: Fix versions in comments
Date: Fri, 27 Jun 2025 14:24:54 -0500
Message-ID: <20250627192454.575458-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250627192454.575458-1-afd@ti.com>
References: <20250627192454.575458-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jun 2025 19:24:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18707

Minor comment changes, fix versions listed for some items.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-beagle/conf/machine/include/beagle-bsp.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/conf/machine/include/beagle-bsp.inc
index f8b94487..3f9828f3 100644
--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -4,12 +4,12 @@
 # Default is bb_org-6_12, but can override with any of the existing options
 TI_PREFERRED_BSP ?= "bb_org-6_12"
 
-# ==========
+# ===========
 # bb_org-6_12
-# BeagleBoard.org kernel 6.12, Upstream u-boot 2025.04
+# BeagleBoard.org kernel 6.12, u-boot 2025.04
 # based on TI staging trees with extra Beagle-specific features
 # but may not be up-to-date with TI version
-# ==========
+# ===========
 BSP_KERNEL_PROVIDER:bsp-bb_org-6_12 = "linux-bb.org"
 BSP_KERNEL_VERSION:bsp-bb_org-6_12 = "6.12.%"
 BSP_BOOTLOADER_PROVIDER:bsp-bb_org-6_12 = "u-boot-bb.org"
@@ -23,12 +23,12 @@ BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 = "24%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_12 = "24%"
 BSP_MESA_PVR_VERSION:bsp-bb_org-6_12 = "24%"
 
-# GC320 support requires out-of-tree drivers not yet available in bb.org 6.6
+# GC320 support requires out-of-tree drivers not yet available in bb.org 6.12
 MACHINE_FEATURES:remove:bsp-bb_org-6_12 = "gc320"
 
 # ==========
 # bb_org-6_6
-# BeagleBoard.org kernel 6.6, Upstream u-boot 2024.07
+# BeagleBoard.org kernel 6.6, u-boot 2024.10
 # based on TI staging trees with extra Beagle-specific features
 # but may not be up-to-date with TI version
 # ==========
-- 
2.39.2


