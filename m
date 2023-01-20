Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB9FC25B4E
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 14:18:58 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.75075.1674224337836334549
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Jan 2023 06:18:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=awycqF0Q;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: s-adivi@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30KEIsqO129612;
	Fri, 20 Jan 2023 08:18:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674224334;
	bh=0Zz08VXG/il5bi1UmK8gXlyH9lx8snb0Gp/9vESn1N8=;
	h=From:To:CC:Subject:Date;
	b=awycqF0QibmKdBabdDJcpCMBlAGkUU8X/NN0LkkJ5NFqCACuRERw26X3NG9SsLTaj
	 BasACxhZNQVbeNj/5ZcyB/J1UbmfYGhZvJ7LvpXIYXTrZa3wllVrijWWo4SBC8sr6v
	 1vAwWHNzKyXu2c13dSVzIDh0PHWgl3nuPoB0Y/z4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30KEIsBQ023117
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Jan 2023 08:18:54 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 20
 Jan 2023 08:18:54 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 20 Jan 2023 08:18:54 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30KEIrWM029329;
	Fri, 20 Jan 2023 08:18:54 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <khasim@ti.com>, <g-gupta@ti.com>
Subject: [meta-ti][dunfell][PATCH] ti-graphics: enable GPU for am62axx-evm
Date: Fri, 20 Jan 2023 19:48:52 +0530
Message-ID: <20230120141852.21647-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 14:18:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15610

From: Sai Sree Kartheek Adivi <s-adivi@ti.com>

The am62axx device has no hardware accelerated GPU. But enabling "GPU"
to allow applications get access to GPU rendering APIs.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 conf/machine/am62axx-evm.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/machine/am62axx-evm.conf b/conf/machine/am62axx-evm.conf
index e7a59d2e..7fcec3f7 100644
--- a/conf/machine/am62axx-evm.conf
+++ b/conf/machine/am62axx-evm.conf
@@ -4,6 +4,8 @@
 
 require conf/machine/include/am62axx.inc
 
+MACHINE_FEATURES += "gpu"
+
 KERNEL_DEVICETREE = " \
     ti/k3-am62a7-sk.dtb \
     ti/k3-am62a7-fpdlink-ov2312-0-0.dtbo \
-- 
2.17.1


