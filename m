Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B52F6C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 18:41:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.570.1648233714318492595
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 11:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SL2X+oTX;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22PIfrG7102702;
	Fri, 25 Mar 2022 13:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648233713;
	bh=nx3LeGkcmIXg8+aeabFzcLvsCKVOYTtqoycyDsypKDY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SL2X+oTXqfkY8VmYYmSIGb7Ncnd5ibBPkiF65/PlFO5M4RGe6kYopR+mhlZ4SsnD3
	 wkIa+U3DEV89IrZAC6acpaF3zB+VLYje+mjISyUtbE/YqVnUg6nywsPq19BVpqh4su
	 9nqygeV6cwaxW4Iz0fL4mkeLLOjItH80Zgf8Odhs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22PIfqk6110688
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Mar 2022 13:41:52 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Mar 2022 13:41:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Mar 2022 13:41:52 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22PIfpLu022723;
	Fri, 25 Mar 2022 13:41:52 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Darren Etheridge <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: "Andrew F . Davis" <afd@ti.com>
Subject: [meta-ti][master][PATCH 3/4] ti-img-rogue-umlibs: only the j721e SoC
 is currently supported
Date: Fri, 25 Mar 2022 13:41:50 -0500
Message-ID: <20220325184151.16940-3-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220325184151.16940-1-afd@ti.com>
References: <20220325184151.16940-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Mar 2022 18:41:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14551

There are now three SoCs in the J7 family, but only the j721e variant
is currently supported. Be specific here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../libgles/ti-img-rogue-umlibs_1.13.5776728.bb                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
index f54c3ee9..18b36fbb 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.5776728.bb
@@ -8,7 +8,7 @@ inherit features_check
 REQUIRED_MACHINE_FEATURES = "gpu"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j7"
+COMPATIBLE_MACHINE = "j721e"
 
 PR = "r3"
 
-- 
2.17.1


