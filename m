Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D65EC4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 22:15:34 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.58831.1671747329755163284
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Dec 2022 14:15:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MucO7nKW;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2BMMFSkB059986;
	Thu, 22 Dec 2022 16:15:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1671747328;
	bh=JR9AX7sN8RZ7WxaVVKCNNxwVQx/1yVrW/bSpXBAY8dw=;
	h=From:To:Subject:Date;
	b=MucO7nKW9VbZnxzSpo958tCbxsVopdRKdcDMicJfxmvGI6A/ylqH+kSOOvgB2bClF
	 P9bnD02PvqjMH5wJR3TwVwZAF9h+sy30YB5SvmTqyqwLADimUdpY5dEGZr4KMpLvWc
	 xrZWIW5/ZlcAlgJQYkUXcnFi7315NlytTZdyq810=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2BMMFSiF042048
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Dec 2022 16:15:28 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 22
 Dec 2022 16:15:28 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 22 Dec 2022 16:15:28 -0600
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2BMMFS1l012150;
	Thu, 22 Dec 2022 16:15:28 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1p8Tqa-0004qc-4c; Thu, 22 Dec 2022 16:15:28 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] k3r5: Use the ?= default assignment to allow for overrides
Date: Thu, 22 Dec 2022 16:15:28 -0600
Message-ID: <20221222221528.18590-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 22 Dec 2022 22:15:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15501

Move to setting the values for PREFERRED_PROVIDER using the
?= default assignment so that we can override the setting if
we would like to.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3r5.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/machine/include/k3r5.inc
index 31646f5a..48202154 100644
--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
+++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
@@ -10,9 +10,9 @@ require conf/machine/include/arm/armv7a/tune-cortexa8.inc
 # R5 runs early bootloader and loads SYSFW
 # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am65x/README
 # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/j721e/README
-PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-dummy"
+PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
 
 SPL_BINARY = ""
 UBOOT_SUFFIX = "bin"
-- 
2.17.1


