Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD42C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 10:53:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.40433.1710759186693728053
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 03:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AXKR6AT6;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42IAr606018108
	for <meta-ti@lists.yoctoproject.org>; Mon, 18 Mar 2024 05:53:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710759186;
	bh=78MRsVvV+r6sM8vPcYUledg+hxJ5aptEVxI5mXOR/yk=;
	h=From:To:CC:Subject:Date;
	b=AXKR6AT6sc/W6SvSrGIM4wf5wSjlAX5VPPoFyNOV8qnqwPjv2oHDl6aGg692lR9It
	 gg/U8PbLjs+absKXqCG8Fa/DXk8Xyz53P7sLQSZ2YX30He80/8VGu5Md9MH/g/yIgb
	 b+wFq7tb13CpyiMKtuXyX8w6wlvhHSyamrIMqxmQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42IAr6Oe015049
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 18 Mar 2024 05:53:06 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 18
 Mar 2024 05:53:05 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 18 Mar 2024 05:53:05 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42IAr4dG130259;
	Mon, 18 Mar 2024 05:53:05 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH] Update SRCREV for jailhouse recipe
Date: Mon, 18 Mar 2024 16:22:53 +0530
Message-ID: <20240318105253.1067209-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 18 Mar 2024 10:53:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17538

Update SRCREV for jailhouse recipe which will add changes for Out of Box
demo and also a new application to test whether the linux inmate cell has
crashed or not.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
index a63891bf..af94a780 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
+++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 COMPATIBLE_MACHINE = "am62xx|am62pxx"
 TARGET_CC_ARCH += "${LDFLAGS}"
 PV = "0.12+git${SRCPV}"
-SRCREV = "0b29ad90f6f54105b98d6bbf35cc47fb244f7799"
+SRCREV = "603819ef9a771a3c253a141220daab8e61751a43"
 BRANCH = "master"
 SRC_URI = " \
     git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=https;branch=${BRANCH} \
-- 
2.34.1


