Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC1DECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:29:40 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.2360.1666902572912980658
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 13:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DeUBiGaW;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29RKTPkO022667;
	Thu, 27 Oct 2022 15:29:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1666902565;
	bh=59FvbxYNb0sWKw7QHSXLoYYeqJgWg+U7vI9UKohx5XY=;
	h=From:To:CC:Subject:Date;
	b=DeUBiGaWbtnDHEZKUXPcZHh0oLx6a+G8V6dPzA+YlSsm0l9qpW+1BKivOEM05gJKe
	 nXgErXdVJi532w/Qd6ZS1/kupTRR7//5/Yo/fmPce+WnbiWw+nQ+oZP11yBC3Iq5Pd
	 yPCcEl2FJMKFCtEA3yba7vxLw2aJQZVs7N7QjP2s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29RKTPfR123535
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Oct 2022 15:29:25 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 27
 Oct 2022 15:29:25 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 27 Oct 2022 15:29:25 -0500
Received: from res.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29RKTP7L096858;
	Thu, 27 Oct 2022 15:29:25 -0500
From: Randolph Sapp <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [dunfell][PATCH] ti-img-rogue-driver: Bump the source revision
Date: Thu, 27 Oct 2022 15:29:13 -0500
Message-ID: <20221027202913.1153690-1-rs@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Oct 2022 20:29:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15208

Bump the source revision for the rogue pvr kernel module.

Source changelog:
  - A hack was added to increase stability on J7 platforms while we are
    looking into a proper fix for cache coherency issues in this module

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
index 4f6dc4d4..c8a118cd 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
@@ -26,7 +26,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "a353b9524399d927af8e824f92902065947b2fbe"
+SRCREV = "c901804e8221d477983a6f7224a9cdc6e832f050"
 
 TARGET_PRODUCT_j7-evm = "j721e_linux"
 TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
-- 
2.34.1


