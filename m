Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64E6C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 19:24:50 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.3800.1699385080530740452
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 11:24:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sKWvV7ds;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A7JOdlF075413;
	Tue, 7 Nov 2023 13:24:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699385079;
	bh=BT2QYgyZAQeIU8InZ4j5GPGO+HhsMl1rJ1kLCGgBeZE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=sKWvV7dsCn+LIbn57nUcWtUHqlRLPJqNE8YhJ5U19mY5TrLGu330k+E7oNTvczBfa
	 q7nH60o24Kt4jujnowWo4VtA3cw0bgk027ybSIQ2NWfKWi8H4BE0Wb36xFIuBwlJGO
	 jEaWt6ZgGOS43ydNqtyYxRiFqDWsZ1yULI0Em4iQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A7JOdH9036526
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Nov 2023 13:24:39 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 13:24:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Nov 2023 13:24:39 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A7JOdrq027562;
	Tue, 7 Nov 2023 13:24:39 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1r0Rgk-0004yH-VJ; Tue, 07 Nov 2023 13:24:38 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 2/2] u-boot-ti-mainline: Update to v2023.10 mainline version
Date: Tue, 7 Nov 2023 13:24:38 -0600
Message-ID: <20231107192438.19067-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231107192438.19067-1-reatmon@ti.com>
References: <20231107192438.19067-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Nov 2023 19:24:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17258

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index e98d584a..692cf84a 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -2,7 +2,7 @@ require u-boot-ti.inc
 
 PR = "r0"
 
-PV = "2023.07"
+PV = "2023.10"
 
 # For the un-initiated:
 # The actual URL you'd use with a git clone for example would be:
@@ -13,4 +13,4 @@ PV = "2023.07"
 # b) and we want git fetcher to use https protocol, hence GIT_PROTOCOL as https
 UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
 UBOOT_GIT_PROTOCOL = "https"
-SRCREV = "83cdab8b2c6ea0fc0860f8444d083353b47f1d5c"
+SRCREV = "4459ed60cb1e0562bc5b40405e2b4b9bbf766d57"
-- 
2.17.1


