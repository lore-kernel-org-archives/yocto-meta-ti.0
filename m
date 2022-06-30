Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B123C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 17:41:12 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.28276.1656610871835857590
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 10:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gOglmAI4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25UHf9LZ127860;
	Thu, 30 Jun 2022 12:41:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656610869;
	bh=sT0CMc2+3xB+MSXBIrqtcinGGt6PgbIsgDkVAZ1iYsw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=gOglmAI4Yz8h+ijA/kZiPHRJ6Dg1idXMp1YA8OOPn4zZbNJBz8cbU+zLZKHSfJdEZ
	 puxG52B8MzEVIFLkfKkPpcVzuk+VZkw/cgbEFSdw272Fitig/+5u6kxPK9+zZm1O0k
	 8/9AMKzriORL95pChVysc3+5IPm33kHRhPPDPIFs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25UHf97q038628
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jun 2022 12:41:09 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 30
 Jun 2022 12:41:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 30 Jun 2022 12:41:08 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25UHf81G108411;
	Thu, 30 Jun 2022 12:41:08 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o6yA8-0002r4-PG; Thu, 30 Jun 2022 12:41:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 1/3] u-boot-ti-staging: Bump to
 08.04.00.003 release
Date: Thu, 30 Jun 2022 12:41:06 -0500
Message-ID: <20220630174108.10935-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220630174108.10935-1-reatmon@ti.com>
References: <20220630174108.10935-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Jun 2022 17:41:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14856

Updated the u-boot version for 08.04.00.003

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Rebased

 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 023af05f..91ae0319 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r29"
+PR = "r30"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "4c186846fa8c8b432dfb8fa19b31b121c0e7c06e"
+SRCREV = "5de948718fab9c024b56268860a06fab9c7d514c"
-- 
2.17.1


