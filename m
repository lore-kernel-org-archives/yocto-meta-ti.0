Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66346C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 06:40:47 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.46322.1742193641163618696
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 16 Mar 2025 23:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Y7FUh5OM;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: p-bhagat@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52H6eZ9m2712830
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Mar 2025 01:40:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742193635;
	bh=5S/2IK8tzSzu3nz0RyZ6XAlJQNdLMit8BR+BsrDLUWo=;
	h=From:To:CC:Subject:Date;
	b=Y7FUh5OMmfMWUh/mtMJ5HkeoBZ8ac52hBZ6O0k/yQQxtSM+w8nkV8GbYfzKMbY7NE
	 LIPB78YdubrE7qB4eo60dqezrCWA4Ezzi/UgXsf0iC5+hvPUbnJc5SDva/gjjoM2p6
	 6neRyS4LIZu5Ko7YgNHRRwsXuzr+xeD0Xhqh5yTk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52H6eZ41074113;
	Mon, 17 Mar 2025 01:40:35 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 01:40:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 01:40:35 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52H6eYBG058609;
	Mon, 17 Mar 2025 01:40:34 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>,
        <denis@denix.org>
CC: <jweyer@aecontrols.com>, <c-shilwant@ti.com>, <khasim@ti.com>
Subject: [scarthgap][PATCH] recipes-ti: jailhouse: Correct SRCREV for jailhouse
Date: Mon, 17 Mar 2025 12:10:14 +0530
Message-ID: <20250317064014.2591788-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Mar 2025 06:40:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18393

Correct SRCREV for jailhouse which currently points to an unpublished
commit hash.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
index 62a97df6..fd40d74d 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
+++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 COMPATIBLE_MACHINE = "am62xx|am62pxx|am62lxx"
 TARGET_CC_ARCH += "${LDFLAGS}"
 PV = "0.12+git"
-SRCREV = "dc77c05460bc3df8f2ddc9cc3a9990ca31cb9f9d"
+SRCREV = "ef512f9591febed854d8f07ad8c1fa731c2d3c69"
 BRANCH = "master"
 SRC_URI = " \
     git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=https;branch=${BRANCH} \
-- 
2.34.1


