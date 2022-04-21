Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF619C43219
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 19:59:45 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.804.1650563814815590822
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Apr 2022 10:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ahm8D/yE;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23LHuqr9088421;
	Thu, 21 Apr 2022 12:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650563812;
	bh=blbJf07glzZ87PHZY6tRvrr/pA+c5hGcry1PuilkQw4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ahm8D/yEQ0cgUEv6S+Brr78ScPq3EsgEYtngzljSEOd/ICBHrxLkJ6juGnZfuLzW7
	 AokTvSt3jHxL+WUjYQh0LcQsCfqNsQS9fEMuXiYqhdNlQu7UG1gdvECaerbuAH1dUT
	 ammTja4vTpi88LPmDlwj4xPMdGC0E4R2F0dcoRBc=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23LHuqR5115827
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Apr 2022 12:56:52 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Apr 2022 12:56:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Apr 2022 12:56:52 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23LHuq1s000609;
	Thu, 21 Apr 2022 12:56:52 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nhb2y-0007wY-0i; Thu, 21 Apr 2022 12:56:52 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/3] u-boot-ti-staging: Bump to 08.03.00.001
 release
Date: Thu, 21 Apr 2022 12:56:49 -0500
Message-ID: <20220421175651.30494-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220421175651.30494-1-reatmon@ti.com>
References: <20220421175651.30494-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Apr 2022 19:59:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14611

Updated the u-boot version for 08.03.00.001

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 5b13329f..d7592b27 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r22"
+PR = "r23"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "44a87e3ab85c6d64044f0b5ad677008316baad70"
+SRCREV = "6355ef8b170bfea9390ca17ec11c0c9f3a7872eb"
-- 
2.17.1


