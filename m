Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E56DC433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 14:06:11 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.29214.1652709966691960851
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 May 2022 07:06:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=U6qd8xaU;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24GE64Z4079798;
	Mon, 16 May 2022 09:06:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652709964;
	bh=iABLMDqwJ7GW/BkZZmYNKPoedESE44e6izgHdbFlvKk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=U6qd8xaU4Htv3/upmJ7PiyIH2LuFH8TJBJYVlzk0td/iButzZ7aIg4hoGyhAv9V+6
	 v/SPdPsBbhqJMN1N856iKUltdkRcfbi24RqcihRLSNhHE64wjUAqC0GFLDVVg6d9g/
	 jh3bzzTritxRSvBKmLXLp0l3wVpDvkftsl6pAetU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24GE636J040154
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 May 2022 09:06:04 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 16
 May 2022 08:20:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 16 May 2022 08:20:36 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24GDKajg099319;
	Mon, 16 May 2022 08:20:36 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nqaeK-0007jw-5N; Mon, 16 May 2022 08:20:36 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/4] u-boot-ti-staging: Bump to 08.03.00.004
 release
Date: Mon, 16 May 2022 08:20:33 -0500
Message-ID: <20220516132036.29708-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220516132036.29708-1-reatmon@ti.com>
References: <20220516132036.29708-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 May 2022 14:06:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14745

Updated the u-boot version for 08.03.00.004

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index e3214c37..b189de8b 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r25"
+PR = "r26"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "70c33dd821811a05c595f29ecac5abae23534768"
+SRCREV = "2de57d278b74747234313b51f8daac9928a5df6c"
-- 
2.17.1


