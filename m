Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D57C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 20:26:38 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.2648.1657225588588334284
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 13:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wOwFXcZV;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 267KQQ5C098887;
	Thu, 7 Jul 2022 15:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657225586;
	bh=s5oaVlAelZHYDZbjQWXhhX7xhDKqjr1WuiHgn3d2/cc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=wOwFXcZVBfP5KqLz2TEWTh5Aqgve78Lgzp1lfEFk1APgEHz4RBHMKcXqG5ILXx/5i
	 AzugU9gIMULKTNYBKdGsF+sWHCkDyIzu7KzNmsJSVCTBabj/Nai0U4qDBS1yc9Sm3f
	 l1P2AYwMRIbZebjultU/GxiuTtOf7R5XEiVv+8Dw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 267KQQM9016998
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Jul 2022 15:26:26 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 7
 Jul 2022 15:26:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 7 Jul 2022 15:26:25 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 267KQPUZ007193;
	Thu, 7 Jul 2022 15:26:25 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o9Y4v-0005a4-Lz; Thu, 07 Jul 2022 15:26:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/3] u-boot-ti-staging: Bump to 08.04.00.004
 release
Date: Thu, 7 Jul 2022 15:26:23 -0500
Message-ID: <20220707202625.21413-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220707202625.21413-1-reatmon@ti.com>
References: <20220707202625.21413-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 07 Jul 2022 20:26:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14876

Updated the u-boot version for 08.04.00.004

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 91ae0319..a1d2f14c 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r30"
+PR = "r31"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "5de948718fab9c024b56268860a06fab9c7d514c"
+SRCREV = "24bb75ba60e716a606bb90150348bfe3a21a5120"
-- 
2.17.1


