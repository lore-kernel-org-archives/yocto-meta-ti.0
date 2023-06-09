Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325E5C7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 14:29:09 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.14864.1686320945768168533
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 07:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=S3DJkuXC;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: devarsht@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359ET4KN015948;
	Fri, 9 Jun 2023 09:29:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686320944;
	bh=2hp0LZdIhxspnUWlCBe93RUbPEctmqj08VkHZaNqia0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=S3DJkuXCfukzDbFpRKy+rRw31BkW8k4FBBh+dG7kDIMMFB/m6PwMW/wz+XIgLF7u3
	 QPZewA35FHyugtZmYmnofsh36DQ0ZGd7dRp6La62mrssIsG/dRDqJjhZY2jxDdCSyn
	 H2JBS9tmrrfjAtjHKJLO6JBHlwucf5HXF2Q+Qxuo=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359ET4c5010763
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 09:29:04 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 09:29:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 09:29:04 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359ET3Dg077610;
	Fri, 9 Jun 2023 09:29:04 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        <denys@konsulko.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>, <rs@ti.com>,
        <devarsht@ti.com>
Subject: [meta-ti] [kirkstone] [PATCH 1/2] u-boot-ti-staging_2023.04: Copy bitmap file to boot partition for AM62x
Date: Fri, 9 Jun 2023 19:59:00 +0530
Message-ID: <20230609142901.2958733-2-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609142901.2958733-1-devarsht@ti.com>
References: <20230609142901.2958733-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Jun 2023 14:29:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16701

Early splash screen support for AM62x has been enabled in u-boot
and it requires ti.gz bitmap file to be present in boot partition
as per the default environment settings done in u-boot [1].

Copy ti.gz [2] to boot partition to enable out of box early display on
AM62x when it is flashed with the wic image compiled using TI's
bsp.

[1] https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62x/am62x.env?h=09.00.00.001#n34
[2] https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/tools/logos/ti.gz?h=ti-u-boot-2023.04

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb      | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
index 4bbb6433..5067e3c8 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
@@ -8,3 +8,12 @@ BRANCH = "ti-u-boot-2023.04"
 
 SRCREV = "d8e6f9178f6c80abff4ed2e9094001357bda40d4"
 
+do_install:append:am62xx() {
+	install -d ${D}/boot
+	install -m 0644 ${S}/tools/logos/ti.gz ${D}/boot
+}
+
+do_deploy:append:am62xx() {
+	install -d ${DEPLOYDIR}
+	install -m 0644 ${S}/tools/logos/ti.gz ${DEPLOYDIR}
+}
-- 
2.34.1


