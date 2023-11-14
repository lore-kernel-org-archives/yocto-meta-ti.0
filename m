Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1D3C4167D
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 23:52:05 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1275.1700005918234885789
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Nov 2023 15:51:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eBs+usxI;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AENpvnu063194
	for <meta-ti@lists.yoctoproject.org>; Tue, 14 Nov 2023 17:51:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700005917;
	bh=Bas83Q4NsFjv4kD0wMjwPNqr9SoJArACSq9KvmZtPKs=;
	h=From:To:CC:Subject:Date;
	b=eBs+usxIMh6dswNJ7vFoG0NTwfCd7bDiUhVzdKi/VanfvkcQhj9gkC4secXBAunOu
	 2SbphRYE5kl6tgMbi9ztO2x7oiQwCYXX+wfJoMQEMqP9QnniF3m8ZCsUS/KC0xGguB
	 XVmqm0sypBKqVhc27atSN0MnZvYw7jDfzgDMoW6c=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AENpvbQ077998
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 14 Nov 2023 17:51:57 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 14
 Nov 2023 17:51:56 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 14 Nov 2023 17:51:56 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AENpu9Y027282;
	Tue, 14 Nov 2023 17:51:56 -0600
From: Praneeth Bajjuri <praneeth@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Judith Mendez <jm@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Vishal Mahaveer
	<vishalm@ti.com>
Subject: [kirkstone PATCH] conf: machine: am62xx-lp-evm.conf: Pick MCU GPIO wakeup overlay
Date: Tue, 14 Nov 2023 17:51:56 -0600
Message-ID: <20231114235156.6608-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Nov 2023 23:52:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17298

commit [1] renamed the MCU GPIO wakeup overlay as k3-am62x-sk-mcu-gpio-wakeup.dtbo
k3-am62x-sk prefix picks this overlay for am62xx, am62axx and am62xxsip already.

This patch picks the necessary overlay for am62xx-lp-evm since it doesnt use
the same prefix as other am62 platforms.

[1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=24bd6ce832cd

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index afa5e061..dfb9cbfa 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -9,6 +9,7 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am625-sk \
     ti/k3-am62x-sk-hdmi \
     ti/k3-am62x-sk-mcan \
+    ti/k3-am62x-sk-mcu \
 "
 
 KERNEL_DEVICETREE = " \
-- 
2.17.1


