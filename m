Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D512C433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 18:28:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.982.1653071293771498407
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 May 2022 11:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FupPGVI9;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24KISCcQ080798;
	Fri, 20 May 2022 13:28:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1653071292;
	bh=sxc9I7vKitS8keUyPswAsL7HGvMTcXPOD35rHC5O5zM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FupPGVI9XGz1g0sRq9UJTXX4TLW/lSHhRXIhDPf0reUhFMUIE68SUsXqptjY0ToaR
	 sk/x7impNpXiJKArF52w09lgVlzJPtwzVpu2rdI0LK7SKLoc2Ct2E4yyk+1asKUhvO
	 01Mgfr+IVniKUv3C/Kmy7aEoupKVubztrTuC/osU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24KISBt3014394
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 May 2022 13:28:11 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 20
 May 2022 13:28:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 20 May 2022 13:28:11 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24KISBPR016076;
	Fri, 20 May 2022 13:28:11 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ns7MB-0006Lc-IC; Fri, 20 May 2022 13:28:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/4] u-boot-ti-staging: Bump to 08.03.00.005
 release
Date: Fri, 20 May 2022 13:28:08 -0500
Message-ID: <20220520182811.24357-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220520182811.24357-1-reatmon@ti.com>
References: <20220520182811.24357-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 May 2022 18:28:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14747

Updated the u-boot version for 08.03.00.005

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index b189de8b..b2982b04 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r26"
+PR = "r27"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "2de57d278b74747234313b51f8daac9928a5df6c"
+SRCREV = "74fc69c8897f67628ee9517744c720a3dc201f53"
-- 
2.17.1


