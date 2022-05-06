Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A62C4332F
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 00:23:52 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.3999.1651796626957400783
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 May 2022 17:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=zVKk26HJ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2460NjGk044063;
	Thu, 5 May 2022 19:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651796625;
	bh=y3E/HJtISiPpUXmcBoM6zcOpyF3gc9VJ9xCJ9jo8Pi0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=zVKk26HJVE9QvAhTxWkM/YbL/yWfydOuonnIVMkaDhMUiGpIYicSzsHCBmKhJFSky
	 JF5fzfm478AwblXoqaARo0GrrLzdNWtGDHd5clPD2VkI2J/v7XrldoqwkGHAQyxz/a
	 tS8Rp/W7v1UFuisMBT4japu/2XTVs5dyOD1yA8PE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2460Nj2C009000
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 May 2022 19:23:45 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 5
 May 2022 19:23:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 5 May 2022 19:23:44 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2460NjuN129416;
	Thu, 5 May 2022 19:23:45 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nmll2-00011z-To; Thu, 05 May 2022 19:23:44 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/3] u-boot-ti-staging: Bump to 08.03.00.003
 release
Date: Thu, 5 May 2022 19:23:42 -0500
Message-ID: <20220506002344.3923-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220506002344.3923-1-reatmon@ti.com>
References: <20220506002344.3923-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 May 2022 00:23:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14713

Updated the u-boot version for 08.03.00.003

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 03c73112..e3214c37 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r24"
+PR = "r25"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "edbebb6447c16241031c21b47d27bd3484f78f42"
+SRCREV = "70c33dd821811a05c595f29ecac5abae23534768"
-- 
2.17.1


