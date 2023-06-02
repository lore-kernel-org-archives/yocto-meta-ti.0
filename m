Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14BCC7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 10:45:07 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.9546.1685702706154537560
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Jun 2023 03:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=t/5/saTp;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 352Aj5uW095805
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Jun 2023 05:45:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685702705;
	bh=OSNDLwO0EMk9DR+qzxgdAlwmpRFBxh9hl7jAGLpxmEs=;
	h=From:To:CC:Subject:Date;
	b=t/5/saTpwBGCWtZH7cEVKWqwqWcvqIDl30t48L9DUmzANtxPGJVovxk98LlwCu3Lu
	 NKuTJ1aHsWh32R0uNTrQSWaExK5+i656bv43LLlA9MH9WFjYziV5nvZcGkj5w7BG/t
	 SK7tH4ORu/S8XTZfTFye2R8O4Y8MQ08FPOVGr74o=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 352Aj50Z031581
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Jun 2023 05:45:05 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Jun 2023 05:45:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 Jun 2023 05:45:04 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 352Aj4oB119184;
	Fri, 2 Jun 2023 05:45:04 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH] meta-ti-extras: recipes-ti: Update jailhouse SRC_URI to point to ti-jailhouse repo.
Date: Fri, 2 Jun 2023 16:14:49 +0530
Message-ID: <20230602104449.2580110-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Jun 2023 10:45:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16655

The ti-jailhouse repo is synced with the Siemens/jailhouse
at https://github.com/siemens/jailhouse. Use this for development
and build for TI devices.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
index 05cc21b3..0b8b7802 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
@@ -17,7 +17,7 @@ SRCREV = "e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560"
 BRANCH = "master"
 
 SRC_URI = " \
-    git://github.com/siemens/jailhouse.git;protocol=https;branch=${BRANCH} \
+    git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=https;branch=${BRANCH} \
     file://0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch \
     file://0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch \
     file://0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch \
-- 
2.34.1


