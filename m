Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D298CC30653
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 18:17:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.148740.1719253049353310829
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Jun 2024 11:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wgs67WXW;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45OIHNK3130639;
	Mon, 24 Jun 2024 13:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719253044;
	bh=CCvUiOKYFtcPgy9dcZ+sMEkPhejmTQkzI8rAvVGEX8o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wgs67WXWvnslxs9+Yw0cstqyf68tLbBrCMxV4kwg/TJeu3DSMwJdLorNPge1OupaD
	 dlkk+t2eMPDHipEt20q423xHdLXEf/D6gSeFgZkefSc8ZbE4l2nr131wUi5etYjSdh
	 y6EKV7eUcrJeddNtPZnt2LKL7Bzqzus5hAZgKz08=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45OIHNlD024710
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Jun 2024 13:17:23 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 24
 Jun 2024 13:17:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 24 Jun 2024 13:17:23 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45OIHLrH025548;
	Mon, 24 Jun 2024 13:17:23 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <max.oss.09@gmail.com>, <meta-ti@lists.yoctoproject.org>,
        <detheridge@ti.com>
Subject: [meta-ti][master/scarthgap][PATCHv2 2/2] ti-img-rogue-driver_24.1: gcc 14 compat
Date: Mon, 24 Jun 2024 13:17:14 -0500
Message-ID: <20240624181714.1293865-3-rs@ti.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240624181714.1293865-1-rs@ti.com>
References: <20240624181714.1293865-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 24 Jun 2024 18:17:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17803

From: Randolph Sapp <rs@ti.com>

Bump this recipe to add a change to help with GCC 14 compatibility in
the check-cc script used to check compiler flags before use.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
index 6f374f69..fc303c4f 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "e2dfdfee991dadc18175f27fe9e8676e910a2f8d"
+SRCREV = "81e189096ef2f2479ccfb50d8b2fb24097188de3"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
-- 
2.45.1


