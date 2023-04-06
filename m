Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDF9C77B6F
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 19:28:57 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.168214.1680809330756699054
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 12:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sWmd5PpU;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 336JSnL8046061;
	Thu, 6 Apr 2023 14:28:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680809329;
	bh=XsEsdIGMGAAqqA2KoG29B3LFaVEvegTAFE5aXnjNAzE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sWmd5PpUWtoLweY7T394ElvUjJe97rfbiSqQn4WN3EAZHvlALjyq0BVM9s17POCup
	 fSWwLX455YYzpy0le1ou6VcWH9C6wa9ejB30bPMIp5qdanfdUCkx1x4wd8pnwIDJKr
	 3rUw10uYITWLLilrNL+X9LTZIaUv1uTZzcaVT4lQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 336JSnBq003895
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Apr 2023 14:28:49 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 6
 Apr 2023 14:28:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 6 Apr 2023 14:28:49 -0500
Received: from lelv0854.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 336JSm3L012041;
	Thu, 6 Apr 2023 14:28:48 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 3/5] ti-sgx-ddk-km: Be specific on supported K3 machines
Date: Thu, 6 Apr 2023 14:28:45 -0500
Message-ID: <20230406192847.7934-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406192847.7934-1-afd@ti.com>
References: <20230406192847.7934-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Apr 2023 19:28:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16305

Of the K3 family only the AM65x device is currently supported by this
driver. COMPATIBLE_MACHINE should match.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 13b8757c..dcceed69 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -7,7 +7,7 @@ inherit module
 
 PROVIDES = "virtual/gpudriver"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
 
 MACHINE_KERNEL_PR:append = "x"
 PR = "${MACHINE_KERNEL_PR}"
@@ -27,7 +27,7 @@ SRCREV = "eda7780bfd5277e16913c9bc0b0e6892b4e79063"
 TARGET_PRODUCT:omap-a15 = "jacinto6evm"
 TARGET_PRODUCT:ti33x = "ti335x"
 TARGET_PRODUCT:ti43x = "ti437x"
-TARGET_PRODUCT:k3 = "ti654x"
+TARGET_PRODUCT:am65xx = "ti654x"
 
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT} WINDOW_SYSTEM=nulldrmws'
 
-- 
2.39.2


