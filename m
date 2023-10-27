Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCAFC25B48
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 22:22:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.28093.1698445334087339846
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 15:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CN1rE3tw;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39RMMCfs043998;
	Fri, 27 Oct 2023 17:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698445332;
	bh=142owBQk7ifc5TqKwRVnNMOKiJpSHDFyKJFHQfAtlaA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CN1rE3twmGIqnAKAnkulO87SturhlVs6WI1+Jq223kVCPbtggz98AFWIK/Y+nZEPa
	 VO73DOEmlonaOilIR98WwUXwyBXcaMB3vgS8i4Zy91NLIQMIdXY1uqU/rPHxRY02/o
	 VHI4b81mOA0iFNxgGz6K6Z91hmI+D8QWdZnL1WM4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39RMMCap113993
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Oct 2023 17:22:12 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 27
 Oct 2023 17:22:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 27 Oct 2023 17:22:12 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39RMMBQO014476;
	Fri, 27 Oct 2023 17:22:11 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        Randolph Sapp
	<rs@ti.com>
Subject: [meta-ti][kirkstone][PATCH 1/4] mesa-pvr: isolate sgx and rogue components
Date: Fri, 27 Oct 2023 17:21:57 -0500
Message-ID: <20231027222200.3659634-2-rs@ti.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231027222200.3659634-1-rs@ti.com>
References: <20231027222200.3659634-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Oct 2023 22:22:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17213

From: Randolph Sapp <rs@ti.com>

Bump SRCREV to include some patches to better isolate SGX and PVR
components.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
index 857bbdf3..98d30c5b 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
@@ -23,7 +23,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "13829fd7ffa8e9e961cc8702869da55d72f99a84"
+SRCREV = "7c9522a4147836064f582278e4f7115735c16868"
 
 PACKAGECONFIG:append = " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
-- 
2.42.0


