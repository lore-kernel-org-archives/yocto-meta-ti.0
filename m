Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA74CCA481
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 12:19:31 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.24521.1656591563908929231
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 05:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=zC+DNGoa;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25UCJMeR011231;
	Thu, 30 Jun 2022 07:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656591562;
	bh=9lmG9Dyp/9TUG/a9F7Q1pPhOWRxecHMe4E1/3tACQA0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=zC+DNGoaNDI2yvYQu7dUaChlkznZ5GUzoDy2AN68Ac4xTguleZa6XcbsVT+2gTRFg
	 6n7D1pNItgylnfEzxlXVp89YjJrCe+GS17L2bu2wbwR3EkrtMNUiXtohtsmuB42smb
	 SkkChAgCy2p4PRX7E3VFZi5DdJX8JrbLNQGS0UbQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25UCJMEE002918
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jun 2022 07:19:22 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 30
 Jun 2022 07:19:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 30 Jun 2022 07:19:22 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25UCJMGL021196;
	Thu, 30 Jun 2022 07:19:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o6t8k-0006g1-Bl; Thu, 30 Jun 2022 07:19:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/4] u-boot-ti-staging: Bump to 08.04.00.003
 release
Date: Thu, 30 Jun 2022 07:19:19 -0500
Message-ID: <20220630121922.25624-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220630121922.25624-1-reatmon@ti.com>
References: <20220630121922.25624-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Jun 2022 12:19:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14850

Updated the u-boot version for 08.04.00.003

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 3c41e59e..91ae0319 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r29"
+PR = "r30"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "fb0a0333fbbb73679e719745575df8efd800380b"
+SRCREV = "5de948718fab9c024b56268860a06fab9c7d514c"
-- 
2.17.1


