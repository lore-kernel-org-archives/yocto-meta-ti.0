Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7982CC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 18:16:01 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.13728.1647972960636452545
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 11:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=szXEDR+Q;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MIFx1D129541;
	Tue, 22 Mar 2022 13:15:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647972959;
	bh=cgl3QpvlAD9d3oQaAi4q2pnf46+TvE4yEp7sTdoM470=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=szXEDR+Qa+LFAdPOggQyJ2FT16GsKywGGQwjZDOARGeovqaI5hxNlC0EyEBZGwpsg
	 koUJXsThzMW+6qan2liovi2MeQUcBLhMGEVeowa4KS2lvr+NtFMfW6pIFcGBh+akKk
	 fYvSxwZmsYcf1OoZMZMEgn+B27o3d6ShMgBb+e5A=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MIFx77102844
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 13:15:59 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 13:15:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 13:15:58 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MIFwX1030844;
	Tue, 22 Mar 2022 13:15:58 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nWj30-0005Op-QS; Tue, 22 Mar 2022 13:15:58 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 4/7] HACK: recipes-ti: ti-rtos-metadata:
 Make am62x point to am64x
Date: Tue, 22 Mar 2022 13:15:55 -0500
Message-ID: <20220322181558.20684-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322181558.20684-1-reatmon@ti.com>
References: <20220322181558.20684-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 18:16:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14534

From: Nishanth Menon <nm@ti.com>

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index e435676f..4f320e4c 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -14,6 +14,7 @@ PLAT_SFX_j7 = "/j721e"
 PLAT_SFX_j7200-evm = "/j7200"
 PLAT_SFX_am65xx = "/am65xx"
 PLAT_SFX_am64xx = "/am64x"
+PLAT_SFX_am62xx = "/am64x"
 
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
-- 
2.17.1


