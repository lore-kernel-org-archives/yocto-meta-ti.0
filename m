Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD701CA0EF7
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 10:24:02 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.10515.1755599041813754217
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Aug 2025 03:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VmjzG54S;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: b-padhi@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57JAO1WN3380448;
	Tue, 19 Aug 2025 05:24:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755599041;
	bh=HKrLaspsxgX6GeANz7NgXPE5E+tUlrQ8WjLHVPDey8g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VmjzG54S36SMsyUW8EmlQTpaa8uIbnDsRmifPRmXhvTVxoSyQ8j8dW4j+zRKDHyUl
	 ++mWp2A/pwvKYURjHTVsV/hr2AB95zP1mE9Q6aLhsEU9hKnfJb09l6G64f1iMg4uxs
	 BKZj+ZEHtNvi+gZTmmhpN2xSVSIdNNMiHpVDeBew=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57JAO11Q975344
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 05:24:01 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 05:24:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 05:24:00 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57JANpHL2850983;
	Tue, 19 Aug 2025 05:23:58 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH v3 3/3] ti-ipc.inc: Bump SRCREV to latest for ipcdev project
Date: Tue, 19 Aug 2025 15:53:50 +0530
Message-ID: <20250819102350.2915102-4-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819102350.2915102-1-b-padhi@ti.com>
References: <20250819102350.2915102-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Aug 2025 10:24:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18939

The latest tag in ipcdev project is 3.52.00.01. Update SRCREV to the
latest tag.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
index c6dfc517..8a8bd1de 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc
@@ -9,8 +9,8 @@ TI_IPC_GIT_URI = "git://git.ti.com/git/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "https"
 TI_IPC_GIT_BRANCH = "master"
 
-#Corresponds to 3.51.00.00A
-TI_IPC_SRCREV = "7a6e343a208d2849139b7272a67abc01db806e00"
+#Corresponds to 3.52.00.01
+TI_IPC_SRCREV = "7f76e5cc15c634b70efee18d1aa0474d603224a6"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
-- 
2.34.1


