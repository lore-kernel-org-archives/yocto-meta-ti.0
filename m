Return-Path: <vaishnav.a@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83878C30653
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 08:34:51 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3410.1719477287194348804
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Jun 2024 01:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ESXXBv7O;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: vaishnav.a@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45R8YjVT083368;
	Thu, 27 Jun 2024 03:34:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719477285;
	bh=QToTAZbRLJ38vU0sFZRyVZFL9TNtA9XMRqDkQsR7oLk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ESXXBv7OhU7BIiuxhInAssBeutMr4pmfF40Tx8bMXo7OaU6PDP1dGiLSVIBKAQ3OV
	 6Qbhm7WQA7so9R3uuSjdynn1wW0G5f5QEAFHwTmSWDoNwW3/iMeD3yQsbg9gX+SU2l
	 BWzMLhQzzKSbhYbftrqklKgU7m366uc0xy+XfGao=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45R8YjH2090248
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 03:34:45 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 03:34:45 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 03:34:45 -0500
Received: from uda0490681.. ([10.24.69.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45R8YWsh034736;
	Thu, 27 Jun 2024 03:34:42 -0500
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <reatmon@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <a-limaye@ti.com>, <m-chawdhry@ti.com>,
        <j-luthra@ti.com>, <r-ravikumar@ti.com>, <vaishnav.a@ti.com>
Subject: [meta-ti][scarthgap][PATCH 3/3] conf: machine: am69-sk: Pick overlays for IMX219 and FPD-Link
Date: Thu, 27 Jun 2024 14:04:31 +0530
Message-ID: <20240627083431.1096889-4-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627083431.1096889-1-vaishnav.a@ti.com>
References: <20240627083431.1096889-1-vaishnav.a@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Jun 2024 08:34:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17812

J721E SK, AM68 SK and AM69 SK have similar connectivity
for CSI2 RPi connector and the same overlays can be reused,
thus pick the J721E SK CSI2 IMX219, fusion overlay and
AM68 SK V3Link fusion overlay for AM69 SK also.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---
 meta-ti-bsp/conf/machine/am69-sk.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf b/meta-ti-bsp/conf/machine/am69-sk.conf
index 6341a6fa..aff06a02 100644
--- a/meta-ti-bsp/conf/machine/am69-sk.conf
+++ b/meta-ti-bsp/conf/machine/am69-sk.conf
@@ -11,6 +11,9 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am69-sk \
     ti/k3-fpdlink \
     ti/k3-v3link \
+    ti/k3-am68-sk-v3link-fusion \
+    ti/k3-j721e-sk-csi2-dual-imx219 \
+    ti/k3-j721e-sk-fpdlink-fusion \
 "
 
 KERNEL_DEVICETREE = " \
-- 
2.34.1


