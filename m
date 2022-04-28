Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82EBCC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 00:24:21 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.4206.1651105458806089814
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 Apr 2022 17:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=h19Z8XSC;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23S0OHju086590;
	Wed, 27 Apr 2022 19:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651105457;
	bh=2VxfPYpp6ulur4Rta3oE1ArwwOaikDTV10hW767RVvI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=h19Z8XSCdINm+yN6EL2LsX2k7NFu+BNx9YTaH3N+toCWARonbvwL0HSbGgtVL88qL
	 9awjphQ0E/xHyddssk6Ty9Qypsgj1sKA4mCqqjkMmGidlKxgw9L5Io1hvwYWC4DwKV
	 jMyKqodsUaxXjRtxA/oZ3rG20JnyMXKzPQq15Gqg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23S0OH9X013980
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Apr 2022 19:24:17 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Apr 2022 19:24:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Apr 2022 19:24:17 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23S0OHt0127816;
	Wed, 27 Apr 2022 19:24:17 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1njrxA-0007sB-Tx; Wed, 27 Apr 2022 19:24:16 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/4] u-boot-ti-staging: Bump to 08.03.00.002
 release
Date: Wed, 27 Apr 2022 19:24:13 -0500
Message-ID: <20220428002416.30029-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220428002416.30029-1-reatmon@ti.com>
References: <20220428002416.30029-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 Apr 2022 00:24:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14622

Updated the u-boot version for 08.03.00.002

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index d7592b27..03c73112 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r23"
+PR = "r24"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "6355ef8b170bfea9390ca17ec11c0c9f3a7872eb"
+SRCREV = "edbebb6447c16241031c21b47d27bd3484f78f42"
-- 
2.17.1


