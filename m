Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAD8CAC5AB
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 22:09:35 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.36485.1758146970139105102
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Sep 2025 15:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=p1HZlfDW;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58HM9Siu1610836;
	Wed, 17 Sep 2025 17:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758146968;
	bh=K4WDBA4MuCEpIIrbnT/jUvB8vpeRbz/gIMHdsTLVSAE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=p1HZlfDWyvPaLD8BzQcz3EbBV8jsGbIYfvdWJYkLfFgmi3ApWHX9IceW/e3fQ2l5+
	 tPEg9WQ1YCcHtDxxB2cMVdaPpqU2l1bXb3BqBCdPbKLNcjAeG7eas6rBbmfsQ2qJE9
	 9ERFCCJoIBANFi3q3voBD+iM8QCTvT/dliq39P9o=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58HM9SHh1076035
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 17 Sep 2025 17:09:28 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 17
 Sep 2025 17:09:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Sep 2025 17:09:28 -0500
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58HM9RZB4056077;
	Wed, 17 Sep 2025 17:09:28 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap][PATCH 3/5] ti-bsp: Use same version for both UM and KM driver
Date: Wed, 17 Sep 2025 17:09:24 -0500
Message-ID: <20250917220926.1116988-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250917220926.1116988-1-afd@ti.com>
References: <20250917220926.1116988-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Sep 2025 22:09:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19029

The DRIVER and matching UMLIBS must always match, no need to define a
version number for both. Keep this simple and remove the extra defines.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-beagle/conf/machine/include/beagle-bsp.inc |  4 ----
 meta-ti-bsp/conf/machine/include/ti-bsp.inc     | 10 ++--------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/conf/machine/include/beagle-bsp.inc
index d180c297..448e2086 100644
--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -18,10 +18,8 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_12 = ""
 
 BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_12 = "ti-sgx-ddk-km"
 BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_12 = "1.17%"
-BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_12 = "1.17%"
 BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_12 = "ti-img-rogue-driver"
 BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_12 = "24%"
-BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_12 = "24%"
 BSP_MESA_PVR_VERSION:bsp-bb_org-6_12 = "24%"
 
 # GC320 support requires out-of-tree drivers not yet available in bb.org 6.12
@@ -41,10 +39,8 @@ KERNEL_DEVICETREE_PREFIX:bsp-bb_org-6_6 = ""
 
 BSP_SGX_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-sgx-ddk-km"
 BSP_SGX_DRIVER_VERSION:bsp-bb_org-6_6 = "1.17%"
-BSP_SGX_UMLIBS_VERSION:bsp-bb_org-6_6 = "1.17%"
 BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-img-rogue-driver"
 BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 = "24%"
-BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_6 = "24%"
 BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 = "24%"
 
 # GC320 support requires out-of-tree drivers not yet available in bb.org 6.6
diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index a5d9a51f..dc0473de 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -44,10 +44,8 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2025.01%"
 
 BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_12 = "ti-sgx-ddk-km"
 BSP_SGX_DRIVER_VERSION:bsp-ti-6_12 = "1.17%"
-BSP_SGX_UMLIBS_VERSION:bsp-ti-6_12 = "1.17%"
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_12 = "ti-img-rogue-driver"
 BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 = "24%"
-BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_12 = "24%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_12 = "24%"
 
 # ==========
@@ -61,10 +59,8 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024.04%"
 
 BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-sgx-ddk-km"
 BSP_SGX_DRIVER_VERSION:bsp-ti-6_6 = "1.17%"
-BSP_SGX_UMLIBS_VERSION:bsp-ti-6_6 = "1.17%"
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
 BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
-BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 = "24%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "24%"
 
 # GC320 support requires out-of-tree drivers not yet available in 6.6
@@ -84,8 +80,6 @@ BSP_SGX_DRIVER_PROVIDER ?= ""
 BSP_SGX_DRIVER_VERSION ?= ""
 BSP_ROGUE_DRIVER_PROVIDER ?= ""
 BSP_ROGUE_DRIVER_VERSION ?= ""
-BSP_SGX_UMLIBS_VERSION ?= ""
-BSP_ROGUE_UMLIBS_VERSION ?= ""
 BSP_MESA_PVR_VERSION ?= ""
 
 # ==========
@@ -101,7 +95,7 @@ PREFERRED_VERSION_${BSP_BOOTLOADER_PROVIDER} ?= "${BSP_BOOTLOADER_VERSION}"
 # GPU provider gets set in machine configs, as some machines are headless
 # Select default preferred versions here
 PREFERRED_VERSION_ti-sgx-ddk-km ?= "${BSP_SGX_DRIVER_VERSION}"
-PREFERRED_VERSION_ti-sgx-ddk-um ?= "${BSP_SGX_UMLIBS_VERSION}"
+PREFERRED_VERSION_ti-sgx-ddk-um ?= "${BSP_SGX_DRIVER_VERSION}"
 PREFERRED_VERSION_ti-img-rogue-driver ?= "${BSP_ROGUE_DRIVER_VERSION}"
-PREFERRED_VERSION_ti-img-rogue-umlibs ?= "${BSP_ROGUE_UMLIBS_VERSION}"
+PREFERRED_VERSION_ti-img-rogue-umlibs ?= "${BSP_ROGUE_DRIVER_VERSION}"
 PREFERRED_VERSION_mesa-pvr ?= "${BSP_MESA_PVR_VERSION}"
-- 
2.39.2


