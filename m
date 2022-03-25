Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1830C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 18:41:55 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.555.1648233714226676610
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 11:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=q76X9wAa;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22PIfr90102707;
	Fri, 25 Mar 2022 13:41:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648233713;
	bh=VJzno/gTHepdaZ8NlXsVhApm18QCiXsOK+34ejZemA8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=q76X9wAaHOyateDzs5/IxGiFPSHbkRZ7nEREO+Gi5NHAv86374tUV01kKsJ9QyQkw
	 FlCvFd28jVnCQut4f6MC62oaw9DhJiesoQc4HUKHxi0CAax9h00rGkdlqmmrGuPecA
	 Ev4pmQX7aZGuCjxLvccU2LCr197F2Y5ifAB0wDis=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22PIfrru016743
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Mar 2022 13:41:53 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Mar 2022 13:41:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Mar 2022 13:41:52 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22PIfpLv022723;
	Fri, 25 Mar 2022 13:41:52 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Darren Etheridge <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: "Andrew F . Davis" <afd@ti.com>
Subject: [meta-ti][master][PATCH 4/4] ti-sgx-ddk-um: only the am65xx member of
 the k3 family is supported
Date: Fri, 25 Mar 2022 13:41:51 -0500
Message-ID: <20220325184151.16940-4-afd@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14550

The AM65xx is the only member of the K3 family with an SGX GPU.
Be specific here to avoid confusion.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index d4b7a1a6..f4c71d25 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -8,7 +8,7 @@ inherit features_check
 REQUIRED_MACHINE_FEATURES = "gpu"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
 
 PR = "r37"
 
@@ -20,7 +20,7 @@ SRCREV = "742cf38aba13e1ba1a910cf1f036a1a212c263b6"
 TARGET_PRODUCT:omap-a15 = "jacinto6evm"
 TARGET_PRODUCT:ti33x = "ti335x"
 TARGET_PRODUCT:ti43x = "ti437x"
-TARGET_PRODUCT:k3 = "ti654x"
+TARGET_PRODUCT:am65xx = "ti654x"
 
 INITSCRIPT_NAME = "rc.pvr"
 INITSCRIPT_PARAMS = "defaults 8"
-- 
2.17.1


