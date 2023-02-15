Return-Path: <vaishnav.a@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978BBC636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 12:19:57 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.13556.1676463591941627408
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Feb 2023 04:19:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hcNbJ0HG;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: vaishnav.a@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31FCJodN123719
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 06:19:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676463591;
	bh=zxQCOJmwy6Ljnqpw7wgno5TCq5c79dHuBa9rOkDBbDQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hcNbJ0HGtARUy+askbU3VaR684WxEdPN5NIotxrYKod15myKVCoL27CX1KUryYpMJ
	 KD+Go57jUUYhpxDJbwe68BQZVmGLZCC6YDtmdtZE3pWSQ7autCzr9zjiudjUqd1XGy
	 hY+0NC5dKLBWk+qVzyvpD3HKgOuxXTnZ4MqTGeng=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31FCJocl012460
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 06:19:50 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 15
 Feb 2023 06:19:50 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 15 Feb 2023 06:19:50 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31FCJnRE013956;
	Wed, 15 Feb 2023 06:19:50 -0600
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@ti.com>,
        <detheridge@ti.com>
CC: <m-chawdhry@ti.com>, <j-choudhary@ti.com>, <vaishnav.a@ti.com>
Subject: [meta-ti][dunfell][PATCH 3/4] conf: machine: j721s2-evm: Add camera overlays for J721S2 EVM
Date: Wed, 15 Feb 2023 17:49:44 +0530
Message-ID: <20230215121945.3631-3-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230215121945.3631-1-vaishnav.a@ti.com>
References: <20230215121945.3631-1-vaishnav.a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Feb 2023 12:19:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15853

Add the following overlay files on J721S2 EVM:

1. Fusion board (For FPDLink-III cameras)
2. OV5640 camera module

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---
 conf/machine/j721s2-evm.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index f1127ed5..10ed51cf 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -36,6 +36,8 @@ KERNEL_DEVICETREE = " \
     ti/k3-j721e-fpdlink-imx390-rcm-1-2.dtbo \
     ti/k3-j721e-fpdlink-imx390-rcm-1-3.dtbo \
     ti/k3-j721s2-common-proc-board.dtb \
+    ti/k3-j721s2-cpb-csi2-ov5640.dtbo \
+    ti/k3-j721s2-fpdlink-cpb-fusion.dtbo \
     ti/k3-j721s2-gesi-exp-board.dtbo \
 "
 
-- 
2.17.1


