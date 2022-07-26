Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73254CCA48B
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 12:39:43 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.6062.1658839174902104849
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 05:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PrRWiozL;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QCdWBm096790;
	Tue, 26 Jul 2022 07:39:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658839172;
	bh=uvyoJ2gsuWXPHjHwoWMXkp2d4oANcczI73pgUxzbJDM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=PrRWiozLRYnLfVI8mbdChWi00FxbwnD3HZJZUyu0qEoBrOdahbSRAsupuHc7kJyR0
	 3MIxwq0WuZg8zyZZcEk3cyn9wSq7XEm+4h6zBpI8n6nMwGg8TEkEURwUPgOk4rZB+g
	 tyWD1l0hJJyQnUlLMQpTqhJDGlF4hXbtcukH/laE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QCdWje015173
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Jul 2022 07:39:32 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 07:39:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 07:39:32 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QCdWwQ022813;
	Tue, 26 Jul 2022 07:39:32 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oGJqW-0005Gp-7Z; Tue, 26 Jul 2022 07:39:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/3] u-boot-ti-staging: Bump to 08.04.00.005
 release
Date: Tue, 26 Jul 2022 07:39:30 -0500
Message-ID: <20220726123932.20216-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220726123932.20216-1-reatmon@ti.com>
References: <20220726123932.20216-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 26 Jul 2022 12:39:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14906

Updated the u-boot version for 08.04.00.005

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index a1d2f14c..f90519f9 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r31"
+PR = "r32"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "24bb75ba60e716a606bb90150348bfe3a21a5120"
+SRCREV = "a169f4261024397dd3ddb944decc1601a623df2a"
-- 
2.17.1


