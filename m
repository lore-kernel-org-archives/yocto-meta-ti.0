Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB9EC46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 23:45:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.41321.1673480718892506637
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Jan 2023 15:45:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=flfTpydI;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30BNjIYW049998
	for <meta-ti@lists.yoctoproject.org>; Wed, 11 Jan 2023 17:45:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673480718;
	bh=R7oKG/A11+7iBwp/oh56TxndpHOFgwRDKMMgzAOAfBA=;
	h=From:To:CC:Subject:Date;
	b=flfTpydIm/v5VV6la6Io9BzRB3S+3mSgS6s5ex7QONHj0mq7LQbKc/+VJoG58/clf
	 HvQPzVHMVDpcmkTbDUDcAeVRdA/3xWEXu+b2BsvABxw5ZRrQ0djVT0IL2+me9j6a4O
	 6e3ZLGv79surSXN4FcCZVj/mPUO9MGwPXl9j7CQ4=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30BNjIiT007169
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 11 Jan 2023 17:45:18 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 11
 Jan 2023 17:45:17 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 11 Jan 2023 17:45:17 -0600
Received: from res.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30BNjHia039921;
	Wed, 11 Jan 2023 17:45:17 -0600
From: Randolph Sapp <rs@ti.com>
To: <reatmon@ti.com>, <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [dunfell][PATCH v3] ti-img-rogue-driver: AM62 Active power management
Date: Wed, 11 Jan 2023 17:45:12 -0600
Message-ID: <20230111234512.2404483-1-rs@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Jan 2023 23:45:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15554

Bump source revision. Changelog from source:
  - Cleanup the device initialization routine for all platforms
  - Add a power safeguard for multicore initialization
  - Enable active power management for AM62 devices

Signed-off-by: Randolph Sapp <rs@ti.com>
---

v2: This revision actually uses the correct commit hash. Not sure where
I got the old one from.

v3: Move the revision notes to the proper section.

 recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
index 94a7f220..9a5bc479 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
@@ -26,7 +26,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "c901804e8221d477983a6f7224a9cdc6e832f050"
+SRCREV = "1dd6291a5cad4f2b909fc2a14bd717a3bc5f0bb2"
 
 TARGET_PRODUCT_j7-evm = "j721e_linux"
 TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
-- 
2.34.1


