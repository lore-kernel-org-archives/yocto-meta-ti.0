Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A278CDB482
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 01:38:25 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.55311.1697247498634104391
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 18:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VvycdZYD;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39E1cGaj072064;
	Fri, 13 Oct 2023 20:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697247496;
	bh=+eoOuDtZ5iXSX+IDonYDR8iFYIjUOD2jp441Mvs6ecA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VvycdZYDwu1Vr8Zl4a+ddfBfj9qOBIF7UKR5Q2VizbP7XiHkRM2HjO2R3t7gGDS1z
	 5gF4zuBoGXeCu7rxG6DpmnVnbEXazbFvz31b/fGgyg5MDvOTTHOr4HXK1NGTekhvAx
	 10mvGJ4NUVRgUduytBj3PiHcJHCM9QTEdxyOVM+0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39E1cGKH100759
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Oct 2023 20:38:16 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Oct 2023 20:38:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Oct 2023 20:38:15 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39E1cFIr019500;
	Fri, 13 Oct 2023 20:38:15 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <khasim@ti.com>,
        Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCH 2/3] mesa-pvr: bump srcrev for sgx support
Date: Fri, 13 Oct 2023 20:37:56 -0500
Message-ID: <20231014013757.1398842-3-rs@ti.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231014013757.1398842-1-rs@ti.com>
References: <20231014013757.1398842-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 14 Oct 2023 01:38:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17112

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


