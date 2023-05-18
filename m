Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E008C7EE24
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 06:58:05 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.11341.1684393082332125317
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 May 2023 23:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lWnEREwQ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34I6w1HK039552
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 May 2023 01:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684393081;
	bh=Lu07W/LnsSIJj6AUEeSOTOVSEiKVU2MPGJRsI2wwuzY=;
	h=From:To:CC:Subject:Date;
	b=lWnEREwQAOBdwJFBINh+FUR9tAvV8sfEdVxsfPJXPVteTW+tGV+x8zyDycWfBCOix
	 BsiJRh/QcDhwLJaJbbwBMl9hLg7b9lf/k69eM34kZ2UOAHLvXwiKBJiadOhQrByRQH
	 bG7g/atPpwBUqAoqATATgZ4W1FTMuH6zV7E2I4ig=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34I6w1Fo043729
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 May 2023 01:58:01 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 May 2023 01:58:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 May 2023 01:58:01 -0500
Received: from praneethhome (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34I6w1Tm038867;
	Thu, 18 May 2023 01:58:01 -0500
Received: from praneeth by praneethhome with local (Exim 4.90_1)
	(envelope-from <praneeth@ti.com>)
	id 1pzXaL-0002CV-7W; Thu, 18 May 2023 01:58:01 -0500
From: Praneeth Bajjuri <praneeth@ti.com>
To: <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Hari Nagalla
	<hnagalla@ti.com>, Ryan Eatmon <reatmon@ti.com>
CC: Devarsh Thakkar <devarsht@ti.com>
Subject: [kirkstone/master PATCH] ipc: ti-rpmsg-char: Update library to 0.6.0
Date: Thu, 18 May 2023 01:58:01 -0500
Message-ID: <20230518065801.8421-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 May 2023 06:58:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16556

Update the ti-rpmsg-char library to 0.6.0 version that enables the
support for 6.1 kernel.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
index dff13640..bff55258 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL = "https"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# Initial 0.5.2 release
-SRCREV = "1da3e1bd0412c148ab57690940fea5d129220896"
+# 0.6.0 release
+SRCREV = "600ec4dd56d73cc7ad62082c63244183b34f77a5"
 
-PV = "0.5.2+git${SRCPV}"
+PV = "0.6.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


