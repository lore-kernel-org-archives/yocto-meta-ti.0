Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82BBBC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 11:24:53 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.8233.1699356285525098126
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 03:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=W64p2MSX;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A7BOiFp129151
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Nov 2023 05:24:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699356284;
	bh=jO5An+uW1vcKtSkQlUp/X55xxXD6B2n1n6+zvk7Cmb8=;
	h=From:To:CC:Subject:Date;
	b=W64p2MSXqNfUDD1yfEdW8jPa7VJNYG2vPjmKinDI02oIZ2uPMinsScAiCaJLIDqCp
	 BFmNnq4ZgRsovqgTwdSXF7t0tw72ATMDyD7F+CqbKqIeQk+k9WxzL5Gq4l6e98CfSc
	 IIVb3BlO4FuDQ6/MXua9rm2QcISF/XM2FPU+McNk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A7BOiUs084529
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Nov 2023 05:24:44 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 05:24:44 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Nov 2023 05:24:44 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A7BOh9Z019303;
	Tue, 7 Nov 2023 05:24:43 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH] Update SRCREV for u-boot and linux extras
Date: Tue, 7 Nov 2023 16:53:33 +0530
Message-ID: <20231107112333.2295921-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Nov 2023 11:24:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17252

Update the SRCREV to latest commit for both u-boot and linux
extras. Also update SRCREV for jailhouse branch for both psdk
linux and u-boot.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc   | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
index 3a016c6c..e0a94ea6 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "am62xx"
 BRANCH = "ti-u-boot-2023.04"
 BRANCH:tie-jailhouse = "ti-u-boot-2023.04-jailhouse"
 
-SRCREV = "010afc1fe7a1412f92363c8af69c848d76a53e42"
-SRCREV:tie-jailhouse = "79615e1c99b9aa73948f811f5f866cff2e34dc37"
+SRCREV = "b0d868ee086eb5c96a3d32f72a7cb9670abf5b90"
+SRCREV:tie-jailhouse = "765cab112d16fcf68a3266738073663dae67a55d"
 
 UBOOT_GIT_URI = "git://git.ti.com/git/processor-sdk/u-boot.git"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
index 2bb88b13..076a67db 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
@@ -7,8 +7,8 @@ COMPATIBLE_MACHINE = "am62xx"
 BRANCH = "ti-linux-6.1.y"
 BRANCH:tie-jailhouse = "ti-linux-6.1.y-jailhouse"
 
-SRCREV = "30bcc25e7cb1b25667db88d61828728f0f0b5f4b"
-SRCREV:tie-jailhouse = "0ed0dec2462b805b0188fe080895adc437871549"
+SRCREV = "ec058c3ddc5377c629e988a95ef84826b14a3307"
+SRCREV:tie-jailhouse = "d035e0cc72399f1c087a63c4210d29e79a7a66e4"
 
 KERNEL_GIT_URI = "git://git.ti.com/git/processor-sdk/linux.git"
 
-- 
2.34.1


