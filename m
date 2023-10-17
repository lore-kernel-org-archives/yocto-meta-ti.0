Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60480CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 00:30:04 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.197102.1697502602630135424
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 17:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rxYl1mhB;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39H0U1vI092331;
	Mon, 16 Oct 2023 19:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697502601;
	bh=+eoOuDtZ5iXSX+IDonYDR8iFYIjUOD2jp441Mvs6ecA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=rxYl1mhBCFeUAeqMP01hDCSpzU3fjOYfooTiP4JPu1XNdMAMF1GtOjR9Iuwx5+9HN
	 cQ3VkNohmiDxdkA9QZXt42yYLCF9wsvzP89pcNIH6X8bcNqnMAkYeYfgRh8CpijVaJ
	 TtBoT7KKB8mWD8vECS92+Js/xTTeZjGz+XypdHTI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39H0U06q029825
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Oct 2023 19:30:01 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Oct 2023 19:30:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Oct 2023 19:30:00 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39H0U0sZ041124;
	Mon, 16 Oct 2023 19:30:00 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <khasim@ti.com>,
        Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCHv2 2/3] mesa-pvr: bump srcrev for sgx support
Date: Mon, 16 Oct 2023 19:29:57 -0500
Message-ID: <20231017002958.1762487-3-rs@ti.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017002958.1762487-1-rs@ti.com>
References: <20231017002958.1762487-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Oct 2023 00:30:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17123

From: Randolph Sapp <rs@ti.com>

Bump the SRCREV to include the required changes to build for SGX now.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
index 281d6a21..857bbdf3 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
@@ -23,7 +23,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "54fd9d7dea098b6f11c2a244b0c6763dc8c5690c"
+SRCREV = "13829fd7ffa8e9e961cc8702869da55d72f99a84"
 
 PACKAGECONFIG:append = " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
-- 
2.42.0


