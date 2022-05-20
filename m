Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3876FC433FE
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 18:28:19 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.981.1653071293699902025
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 May 2022 11:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CcZU61nX;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24KISC28035709;
	Fri, 20 May 2022 13:28:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1653071292;
	bh=nODNxEVInOgSKVvYo2Uxofjf6ERwHnV7vdUJOohKeDM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=CcZU61nXEZccUttfn4hWs/BuQO12kPDH/39S0Qjl9tmgQSupwjd6KvpYFZOQcw6gy
	 rn31mAlYnMbIBW641kimNoa0l4XoTubvFGa7S83PmyO7rmKABjnY8fg0C2dzVuTyx6
	 Lx1ya2Rige39njjso1KeOnST5IbwFvdY2pr2E32E=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24KISCPa014398
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 May 2022 13:28:12 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 20
 May 2022 13:28:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 20 May 2022 13:28:11 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24KISBuZ115962;
	Fri, 20 May 2022 13:28:11 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ns7MB-0006Li-L8; Fri, 20 May 2022 13:28:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/4] linux-ti-staging: Bump to 08.03.00.005
 release
Date: Fri, 20 May 2022 13:28:09 -0500
Message-ID: <20220520182811.24357-3-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14749

Updated the linux version for 08.03.00.005

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 2746d451..ef0b77d5 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -25,7 +25,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "478daea6c94e2c885fa2cf049bc11fb285c5323b"
+SRCREV = "9e58028f945f077b3e0d7423c6af8938ec46a80a"
 PV = "5.10.109+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1


