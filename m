Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21A9C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 16:55:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.87.1652460911529928378
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 May 2022 09:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lu4dN51c;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24DGtA2r123486;
	Fri, 13 May 2022 11:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652460910;
	bh=RAUikOmOJMehBhn7L4gpzPB4oXajABKoF9QoBHW9YSo=;
	h=From:To:Subject:Date;
	b=lu4dN51crIgaEKDl19IpAHYxO7gP9r+6e2BRX9BYrJWHjwzkva9+byGCEgo8m5Jzk
	 Okoej+7nWhvU8P3CaICiWi7N1GRzX0TDGlLLbwezqhzGe0jwlq46HpqOmv9iYtuDte
	 bNWHZhYfXSzRVNJ2Ax2f4BfEv2osvRyoBJgOcNvk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24DGtALQ073917
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 May 2022 11:55:10 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 13
 May 2022 11:55:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 13 May 2022 11:55:09 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24DGt9o8096898;
	Fri, 13 May 2022 11:55:09 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1npYZJ-0003j2-3r; Fri, 13 May 2022 11:55:09 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] conf: machine: am62xx Fix overlay extension
Date: Fri, 13 May 2022 11:55:09 -0500
Message-ID: <20220513165509.14281-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 May 2022 16:55:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14738

The file extension for the overlay needs to be .dtbo.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 conf/machine/am62xx-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
index 44f46d78..195cb90c 100644
--- a/conf/machine/am62xx-evm.conf
+++ b/conf/machine/am62xx-evm.conf
@@ -8,7 +8,7 @@ MACHINE_FEATURES += "gpu"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
-    ti/k3-am625-sk-csi2-ov5640.dtb \
+    ti/k3-am625-sk-csi2-ov5640.dtbo \
 "
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
-- 
2.17.1


