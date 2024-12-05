Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C84E7716D
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 00:25:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.30282.1733358310251610614
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 16:25:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pfto1PZn;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: jm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B50P9Ei053208;
	Wed, 4 Dec 2024 18:25:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733358309;
	bh=Mml0R8WJMQepf+yTOj0WUstj/SZhjs/m7n8qBxPkvvY=;
	h=From:To:CC:Subject:Date;
	b=pfto1PZnNZHxzejdnXOUb4v275wZgdXoyrns/hEGHommXIBmqrJXVKdBfOAObpHjZ
	 Tu0y2Fx7l1r/zTcT2VPQCiLOgCloUqjFcNZQW82A2bc2LxYR7370s3UxOCDTKAzPGE
	 D1Og2TByMLMl9FQRmUwTaPdRKs/FcXJ8eZO2Y4oM=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B50P9hR082773
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Dec 2024 18:25:09 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Dec 2024 18:25:09 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Dec 2024 18:25:08 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B50P8La057000;
	Wed, 4 Dec 2024 18:25:08 -0600
From: Judith Mendez <jm@ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>,
        Randolph Sapp <rs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Judith Mendez
	<jm@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2] conf: machine: am62xx-lp-evm: Add PWM overlays
Date: Wed, 4 Dec 2024 18:25:08 -0600
Message-ID: <20241205002508.893914-1-jm@ti.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Dec 2024 00:25:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18080

Add the PWM overlays: k3-am62x-sk-dmtimer-pwm and k3-am62x-sk-pwm
for AM62 LP SK.

Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v1:
- add k3-am62x-sk-dmtimer-pwm overlay
---
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index 51e99728..3eeffcbf 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -8,9 +8,11 @@ require conf/machine/include/ti-extras.inc
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62-lp \
     ti/k3-am625-sk \
+    ti/k3-am62x-sk-dmtimer-pwm \
     ti/k3-am62x-sk-hdmi \
     ti/k3-am62x-sk-lpm \
     ti/k3-am62x-sk-mcan \
+    ti/k3-am62x-sk-pwm \
 "
 
 KERNEL_DEVICETREE = " \
-- 
2.47.1


