Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F007CC27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 20:16:32 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.83224.1719000990336805629
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Jun 2024 13:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ze5z2clZ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LKGQU2017744;
	Fri, 21 Jun 2024 15:16:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719000986;
	bh=Zj+vhoFdaeDpo5qnGcNkBR4x/6nio/mtztejjDyudHA=;
	h=From:To:CC:Subject:Date;
	b=Ze5z2clZOOaTkNYS1t3w02VRRhQgOOWOEqWElaPX4aLlTGAX2o2cmbAE2uUOCC4/k
	 kboiyKJF1jmXn6ZFkerfBopY+jpyDk9tDkX3pyfiszrx1Pg+dyCLBsPaAqa6azDTEy
	 R9SeXOKEmkax40rimOIjbDMSX4mG6TBRRBpE8dqc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LKGQEf021970
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Jun 2024 15:16:26 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 15:16:25 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 15:16:25 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LKGP3u107654;
	Fri, 21 Jun 2024 15:16:25 -0500
From: <rs@ti.com>
To: <max.oss.09@gmail.com>, <denis@denix.org>, <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] ti-img-rogue-driver_23.3.6512818: gcc 14 compat
Date: Fri, 21 Jun 2024 15:15:34 -0500
Message-ID: <20240621201533.1531567-2-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 21 Jun 2024 20:16:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17797

From: Randolph Sapp <rs@ti.com>

Bump this recipe to add a change to help with GCC 14 compatibility in
the check-cc script used to check compiler flags before use.

Also ports some of the patches that were added to the kirkstone branch
post creation of what was supposed to be a temporary scarthgap branch.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Sorry for the delay. Needed to run some tests since there were some other
patches that had not been ported to the intermediary branch.

 .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
index 34c22cb2..7fbb0524 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
 
 S = "${WORKDIR}/git"
 
-SRCREV = "2f409b4dd2540e896b54bff02219d4fc51129b81"
+SRCREV = "97727f8606ca984527a470252c0bc3ada1bb3f92"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 TARGET_PRODUCT:j721s2 = "j721s2_linux"
-- 
2.45.1


