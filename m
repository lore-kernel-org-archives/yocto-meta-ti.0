Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54316CCA47C
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 14:41:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.8349.1655995301996648362
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 07:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sk2eaWAg;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25NEfe8X017089;
	Thu, 23 Jun 2022 09:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655995300;
	bh=DFBpVAeTxPyuPcp+ZeAKZg/5WaSxQljtTHz700Lx8CY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=sk2eaWAgYWh1+IL3sObVT+2FOnqMrOJyFsB2v5f3MfUyJ+CmP8TA0YtpmRicBF+Zk
	 LWcBrDcWvaKWXnOChBMO/jT4CO8ZfuYkXD9lrorsTZegfD7/j+llemKVLSjcu4MkFQ
	 Ar23dun1OJUzeZ27zMWuM+8Hp2xf2P4Bcm7+upw0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25NEfen0018039
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jun 2022 09:41:40 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Jun 2022 09:41:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 23 Jun 2022 09:41:40 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25NEfeQI101269;
	Thu, 23 Jun 2022 09:41:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o4O1c-0004uD-7N; Thu, 23 Jun 2022 09:41:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 4/4] ti-linux-fw: Bump to 08.04.00.002
 release
Date: Thu, 23 Jun 2022 09:41:39 -0500
Message-ID: <20220623144139.18799-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220623144139.18799-1-reatmon@ti.com>
References: <20220623144139.18799-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Jun 2022 14:41:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14839

Updated the ti-linux-fw version for 08.04.00.002

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index ffbb1bba..d1a1f3a5 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -20,12 +20,12 @@ IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.00"
 TIFS_LPM_STUB_FW_VERSION = "08.03.02"
 
-TI_LINUX_FW_SRCREV ?= "224f82474e4029dd2e550600ba7e59f687ff7131"
+TI_LINUX_FW_SRCREV ?= "2d9a1002663a20673d942826c558ba4b472ffe9a"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "c43068a114a86daad9241724ef8e3afda45be9be"
+K3_IMAGE_GEN_SRCREV ?= "f67a3696bb8d9efd052f40b6c67b742d63f6545c"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
-- 
2.17.1


