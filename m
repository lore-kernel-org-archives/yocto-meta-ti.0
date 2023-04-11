Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367F7C77B72
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 21:52:54 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.28860.1681249966254089975
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 14:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KmGmN+wo;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BLqjfu119743;
	Tue, 11 Apr 2023 16:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681249965;
	bh=0637v6DooN2IGeXa2RScSyIgtJULHXqWDhxsmmo3IdU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KmGmN+wo2fBxCcfrru0d9VJ2oLRCx91qmkg4nqNFFHph2OY5SQEeBY0vDSM/S9ANR
	 UWeqQpDcHL9pJhJA9en5fV+GDAZ21prGKMvsqa2pcqECn1ye8i/ebvw2bXL83wwigU
	 IIwvw2803cf9+oNi4Ga3/kDxOfNxnq9mRreXqVw0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BLqjIg066113
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 16:52:45 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 16:52:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 16:52:44 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BLqhUg006598;
	Tue, 11 Apr 2023 16:52:44 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v3 3/6] linux-ti-mainline: Update to v6.2 mainline version
Date: Tue, 11 Apr 2023 16:52:40 -0500
Message-ID: <20230411215243.18230-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411215243.18230-1-afd@ti.com>
References: <20230411215243.18230-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 21:52:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16362

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 842864cd..dfa46f48 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -15,9 +15,9 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
 
 S = "${WORKDIR}/git"
 
-# 5.15 Mainline version
-SRCREV = "8bb7eca972ad531c9b149c0a51ab43a417385813"
-PV = "5.15+git${SRCPV}"
+# 6.2 Mainline version
+SRCREV = "c9c3395d5e3dcc6daee66c6908354d47bf98cb0c"
+PV = "6.2+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR:append = "b"
-- 
2.39.2


