Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F47EC77B7D
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 23:53:05 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.7673.1684453975051959124
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 May 2023 16:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=byBmem3z;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34INqokm021156;
	Thu, 18 May 2023 18:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684453970;
	bh=l+uins2G3Ij3SRhvpUrZ4nU+cTYpctGbtMi558guBoo=;
	h=From:To:CC:Subject:Date;
	b=byBmem3zB17XtETb2cpsAvRsOJpDlWOFixnBGrFOBicGlb1MGJGzgSG6qHpUxUgTv
	 jgUxsEl0C4r5ye5VDtIgxVCRmuur2QbR/POY/I1ZNXfMTLYV5VAsqDu+VhKUkjERcx
	 I4inVEy+Kamdnic2IBo2T5eta/0LstmNk0rkIRto=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34INqoso029936
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 May 2023 18:52:50 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 May 2023 18:52:50 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 May 2023 18:52:50 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34INqotV014720;
	Thu, 18 May 2023 18:52:50 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Randolph Sapp
	<rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] meta-ti-bsp: ti-img-rogue-driver: cleanup apm and add hack
Date: Thu, 18 May 2023 18:52:40 -0500
Message-ID: <20230518235240.841756-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 May 2023 23:53:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16570

From: Randolph Sapp <rs@ti.com>

Cleanup the J* APM patch a little. Apparently I could have stood to read
the docs a little more. Found some better runtime pm functions and also
discovered something new about the power island definition.

Notes from upstream:
	- Add the CCB coherency HACK from DDK 1.15 to improve stability
	  on J* devices
	- Fix power island support on J* devices
	- Use better APM calls so user modification to power domains
	  don't cause the device to enter a bad state

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
index daee230b..76e3d801 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.1.6404501.bb
@@ -22,7 +22,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "84e164c11ee8c734c58594eca5e74b86a6e6c612"
+SRCREV = "93c66ec66136654849809132b86d3b880ee96ed6"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
-- 
2.40.1


