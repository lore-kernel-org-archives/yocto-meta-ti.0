Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06ECEC433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 14:43:27 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.5653.1655304205502903381
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Jun 2022 07:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=o+lSec8A;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25FEhMG6122847;
	Wed, 15 Jun 2022 09:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655304202;
	bh=NGYmvHJaQydQ/oEofRckU+K8pbeWQa4GDakwphpV6vE=;
	h=From:To:Subject:Date;
	b=o+lSec8AE6cfs2FSRO6nI27Uyxl5Ea1ZZWsf/Sz/ETKzOy9cl4KjDaHF7MpKUsTbm
	 1bIOIPkO+OHwiDAuwhmJ4cYmC74fFhnohhU0U8D/Z6T/xoNWVvs6zbCH1yifgPV2Ve
	 je/iz9oZha3yH8LmnfjPynRPJaKTig8yck7KVfsQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25FEhMxh065526
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Jun 2022 09:43:22 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 15
 Jun 2022 09:43:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 15 Jun 2022 09:43:22 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25FEhMjP026134;
	Wed, 15 Jun 2022 09:43:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o1UEs-0000WO-1D; Wed, 15 Jun 2022 09:43:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell][PATCH] u-boot: Bump to verison that
 supports j721s2-hs-evm
Date: Wed, 15 Jun 2022 09:43:21 -0500
Message-ID: <20220615144321.1961-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Jun 2022 14:43:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14819

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index b2982b04..55ea6b8a 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -6,4 +6,4 @@ PR = "r27"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "74fc69c8897f67628ee9517744c720a3dc201f53"
+SRCREV = "d588b4b55d2240c13c3cce507683853fd6d6ac00"
-- 
2.17.1


