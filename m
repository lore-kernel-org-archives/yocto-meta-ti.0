Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102A7CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 04:39:09 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.938.1760589540610513358
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 21:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jRbqhnIB;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: p-bhagat@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59G4cxIW1927227
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 23:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760589539;
	bh=Btyp7nOXJVFquECA/ioZgq6eIVANIC9DKZOtqfCDECo=;
	h=From:To:CC:Subject:Date;
	b=jRbqhnIBNyAYpjE0NAbzDnnBQLbtJu0mPoyxCQM6tgiRTeBI20Ywg6NC10xVupVzU
	 HjCRHbMVWYHYmF7Cpi5LuLvh1U3WdZlutUy3anGYfKTroU61iLnJpGPgLe6hwHq+lG
	 oPU6ux8T+qhEF0MVoJWnzF5NWMaEMDirHq7q0oys=
Received: from DLEE206.ent.ti.com (dlee206.ent.ti.com [157.170.170.90])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59G4cxtj1343412
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 23:38:59 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 23:38:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 23:38:59 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59G4cwRi3150183;
	Wed, 15 Oct 2025 23:38:58 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <v-singh1@ti.com>, <j-sahu@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>,
        <jm@ti.com>
Subject: [master/scarthgap][PATCH v2] conf: machine: am62dxx-evm: Package overlays
Date: Thu, 16 Oct 2025 10:08:36 +0530
Message-ID: <20251016043836.1679278-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Oct 2025 04:39:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19137

Package overlays which are common for AM62 family of devices for
am62dxx-evm by adding prefix string in KERNEL_DEVICETREE_PREFIX.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
Boot logs
https://gist.github.com/paresh-bhagat12/f8513c05abeb0585abcc30cfefd6a40a

Change log
v1->v2-Package common overlays, following am62a approach.

v1-https://lists.yoctoproject.org/g/meta-ti/topic/master_scarthgap_patch/115766465

 meta-ti-bsp/conf/machine/am62dxx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
index 1e41c53c..9008a6dd 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -7,6 +7,7 @@ require conf/machine/include/am62dxx.inc
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62d2 \
     ti/k3-am62a7-sk-edgeai \
+    ti/k3-am62x-sk \
 "
 
 KERNEL_DEVICETREE = ""
-- 
2.34.1


