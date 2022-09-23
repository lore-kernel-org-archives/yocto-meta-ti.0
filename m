Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9075C07E9D
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 21:13:48 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.538.1663967621009092891
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 Sep 2022 14:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ItVttY9l;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28NLDaHa114726;
	Fri, 23 Sep 2022 16:13:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1663967616;
	bh=WZHk5211yMbCSZN7UfWWkpr4flqv7X6YTgy+3PpBpXA=;
	h=From:To:CC:Subject:Date;
	b=ItVttY9llcyEXfj6eYSXg/kvnrAvDBS7/l2Iu/Wv8xD7XA4B0NUr+qq42tph7ryiY
	 5oh+aT8Bz8zAxygNCvNt6bSS5LwOQZUWNVEwL1soHyCs0h+qwyU3sfgYDcsKWQuQzw
	 J6UftXknQkTjZ51XSf5hlkyXVTkAI3mx7yu17qMQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28NLDaSG039729
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Sep 2022 16:13:36 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 23
 Sep 2022 16:13:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 23 Sep 2022 16:13:35 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28NLDZZ1082721;
	Fri, 23 Sep 2022 16:13:35 -0500
From: Praneeth Bajjuri <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Suman Anna <s-anna@ti.com>, Devarsh Thakkar <devarsht@ti.com>
Subject: [kirkstone/master PATCH] ipc: ti-rpmsg-char: Update library to 0.5.1
Date: Fri, 23 Sep 2022 16:13:35 -0500
Message-ID: <20220923211335.13420-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 23 Sep 2022 21:13:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15092

Update the ti-rpmsg-char library to 0.5.1 version that enables the
support for R5F on am62x SoCs.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
index 10349b58..7aadbb6e 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL = "git"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# Initial 0.4.1 release
-SRCREV = "355d2b0bcde5eb5c895a270d1835102d2bc39fbd"
+# Initial 0.5.1 release
+SRCREV = "adb964ee72f99545e2ad55c50cfd14015a7d837e"
 
-PV = "0.4.1+git${SRCPV}"
+PV = "0.5.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


