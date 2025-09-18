Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF25CAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 13:28:53 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.14119.1758202126325837891
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 06:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DJGZEW56;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58IDSjUI019227;
	Thu, 18 Sep 2025 08:28:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758202125;
	bh=v0gfZ+LJDZ9La3TkO1CmH0XJAJAMzv9B+2DaubzPvuY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DJGZEW56r9T9tlrYB4A8BTAAPT6mfqq1PZbSVjrl7ix3MpjYAzrYjnOfxV4hobO/5
	 gwKZ+l5hhtQ6eYyl7jGNt3Y1A2FykiliQugYqjO0dLeGcyku/R0R01RJKWL9UFuinO
	 or817Kqt7U5U8Ru8lFQQj5CyYMJO4FZtB7axikjM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58IDSjra3179698
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 08:28:45 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 08:28:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 08:28:44 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58IDShh7651606;
	Thu, 18 Sep 2025 08:28:44 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 4/5] mesa-pvr: Remove need for PVR/SGX display aliases
Date: Thu, 18 Sep 2025 08:28:41 -0500
Message-ID: <20250918132842.1183883-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250918132842.1183883-1-afd@ti.com>
References: <20250918132842.1183883-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Sep 2025 13:28:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19034

Update mesa-pvr which includes a default set of display controller
aliases for the supported display controllers. This means we do not
have to manually set the alias for each device here in the integration
layer. Remove that here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/omap-a15.inc        | 1 -
 meta-ti-bsp/conf/machine/include/ti33x.inc           | 1 -
 meta-ti-bsp/conf/machine/include/ti43x.inc           | 1 -
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb | 7 +------
 4 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index aed2c727..8e029431 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -9,7 +9,6 @@ require conf/machine/include/ti-bsp.inc
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_SGX_DRIVER_PROVIDER}"
-PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
 
 KERNEL_IMAGETYPE = "zImage"
 KERNEL_IMAGETYPES = "zImage uImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index 662fbd03..252b6e5a 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -9,7 +9,6 @@ require conf/machine/include/ti-bsp.inc
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_SGX_DRIVER_PROVIDER}"
-PVR_DISPLAY_CONTROLLER_ALIAS ?= "tilcdc"
 
 KERNEL_IMAGETYPE = "zImage"
 
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index 6150d106..5c09e2f5 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -9,7 +9,6 @@ require conf/machine/include/ti-bsp.inc
 # Graphics providers and variables
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_SGX_DRIVER_PROVIDER}"
-PVR_DISPLAY_CONTROLLER_ALIAS ?= "omapdrm"
 
 KERNEL_IMAGETYPE = "zImage"
 
diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
index e4f99d36..01426680 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
@@ -26,14 +26,9 @@ PACKAGECONFIG:append = " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
 "
 
-SRCREV = "82e6a9293c476267417c5b6b906b01fb73a34e38"
+SRCREV = "68af6a102c2298569e77d1aa8bccc1ff61438b3e"
 PV = "24.0.1"
 
-PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
-PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
-PACKAGECONFIG[sgx] = "-Dgallium-sgx-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
-
-
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
-- 
2.39.2


