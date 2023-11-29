Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECED0C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 21:41:07 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.51605.1701294061132205038
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Nov 2023 13:41:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FXMN6SG2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3ATLf0Ac122178
	for <meta-ti@lists.yoctoproject.org>; Wed, 29 Nov 2023 15:41:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701294060;
	bh=TQETUGWGYEbViUJ2Wh/vyPtqFgpMMjAj4s3+6sxj4yc=;
	h=From:To:CC:Subject:Date;
	b=FXMN6SG2f4Zdab3OdLYkoPMvCypq4lHJ2tU0ovIWzPiDRAwUM48CS545iXgchil6P
	 qplXIuXtjhF9T3QEhYzxnF7gM/CzmK8xUWAjkvzhpWwav9CcnprYcnSWolpsTSvJdN
	 3UusCwMgId5xsRiSW2J84sLy43yjcYEfpHWVk+1k=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3ATLf0Dk114044
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 29 Nov 2023 15:41:00 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 29
 Nov 2023 15:40:59 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 29 Nov 2023 15:41:00 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3ATLex03108213;
	Wed, 29 Nov 2023 15:41:00 -0600
From: Praneeth Bajjuri <praneeth@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Judith Mendez <jm@ti.com>,
        Vibhore Vardhan
	<vibhore@ti.com>
Subject: [kirkstone PATCH] conf: machine: am62xx-lp-evm.conf: Pick LPM wkup sources overlay
Date: Wed, 29 Nov 2023 15:40:59 -0600
Message-ID: <20231129214059.11612-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Nov 2023 21:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17338

commit [1] created a common LPM wkup sources overlay and removes
k3-am62x-sk-mcu-gpio-wakeup.dtso for am62 device family.
k3-am62x-sk prefix picks this overlay for am62xx, am62axx and am62xxsip already.

This patch picks the necessary overlay for am62xx-lp-evm since it doesnt use
the same prefix as other am62 platforms.

[1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=4ba1886b886d

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index dfb9cbfa..229b74bc 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -8,8 +8,8 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62-lp \
     ti/k3-am625-sk \
     ti/k3-am62x-sk-hdmi \
+    ti/k3-am62x-sk-lpm \
     ti/k3-am62x-sk-mcan \
-    ti/k3-am62x-sk-mcu \
 "
 
 KERNEL_DEVICETREE = " \
-- 
2.17.1


