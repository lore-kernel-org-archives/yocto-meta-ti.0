Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF8ECCA47A
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 12:04:13 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.16934.1655381051484771987
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Jun 2022 05:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xiGWBpqP;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25GC4951107315;
	Thu, 16 Jun 2022 07:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655381049;
	bh=5P5W5PJ70jcwYTAdhO+KpruSQ/mtWbUevpuGdP7Zm9s=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=xiGWBpqPuRDvVSODN+6YTEpcnYW4DnpQE9VQKA3D0wVPgibVl1kXdvhV7ufG4B+I2
	 OXaFKf7HZJ6AlT807UxupepjOwqEq4H/cLa8CZkxyFFsuMrQAg/8qTVoqsc93fMjbv
	 uM7YwpOg9PFOnOgbtGqYUZduDX4Qa9Zyka0bNXTQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25GC49cC028430
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jun 2022 07:04:09 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 16
 Jun 2022 07:04:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 16 Jun 2022 07:04:08 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25GC48sF017293;
	Thu, 16 Jun 2022 07:04:08 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o1oEK-0003kp-Mw; Thu, 16 Jun 2022 07:04:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/4] u-boot-ti-staging: Bump to 08.04.00.001
 release
Date: Thu, 16 Jun 2022 07:04:05 -0500
Message-ID: <20220616120408.14388-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220616120408.14388-1-reatmon@ti.com>
References: <20220616120408.14388-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Jun 2022 12:04:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14830

Updated the u-boot version for 08.04.00.001

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 55ea6b8a..0386bff4 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r27"
+PR = "r28"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "d588b4b55d2240c13c3cce507683853fd6d6ac00"
+SRCREV = "f4d82db64258c50b6e44411ffdf0b87770bc1aff"
-- 
2.17.1


