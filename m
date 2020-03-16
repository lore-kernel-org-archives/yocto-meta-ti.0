Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.77323.1584386551920197162
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Mar 2020 12:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vnlMyU0r;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: angelabaker@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02GJMVtw060832
	for <meta-ti@lists.yoctoproject.org>; Mon, 16 Mar 2020 14:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1584386551;
	bh=4upIv6FR/qYmoD26+d7yJVAmASOkcc2w+8jS7pbKnmU=;
	h=From:To:CC:Subject:Date;
	b=vnlMyU0rQ8sZSZU5q4pWTkwpHBcpo3GRWyT7I7tSerNDeh3HFzGBOvMybjbJBT82x
	 DWehpc74Yrzf1Y5PaUBv2DjEHFXY3SePsUi9Zi6oXM2EEUiVCINJupp5XsFJKLVffN
	 9RCcfwuTtT2CfwQte8nTmtIsuC0i6jLFohhqb1Go=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02GJMVBc054421
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 16 Mar 2020 14:22:31 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Mar 2020 14:22:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Mar 2020 14:22:30 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02GJMUTw118705;
	Mon, 16 Mar 2020 14:22:30 -0500
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.75.89])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 02GJMU1r095698;
	Mon, 16 Mar 2020 14:22:30 -0500
From: "Angela Stegmaier" <angelabaker@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <s-anna@ti.com>, Angela Stegmaier <angelabaker@ti.com>
Subject: [meta-ti][zeus/master][PATCH] ti-ipc: Update to new version 3.51.00.00A
Date: Mon, 16 Mar 2020 14:21:38 -0500
Message-ID: <1584386498-27055-1-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 recipes-ti/ipc/ti-ipc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 1206e33..3b0115e 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -8,8 +8,8 @@ TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
 TI_IPC_GIT_BRANCH = "master"
 
-#Corresponds to 3.51.00.00
-TI_IPC_SRCREV = "36b2fe589de8d2d79db7c076c2ca3b0a7488fc15"
+#Corresponds to 3.51.00.00A
+TI_IPC_SRCREV = "7a6e343a208d2849139b7272a67abc01db806e00"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
-- 
1.9.1

