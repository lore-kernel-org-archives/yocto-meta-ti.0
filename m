Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45448C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 14:41:49 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.8224.1655995302542859459
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 07:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=V1D1CLZa;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25NEffhb000549;
	Thu, 23 Jun 2022 09:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655995301;
	bh=e4uxsEo83GxJVtpZ8UPWaR48lbbty2wlouh7lO2Qzmw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=V1D1CLZaefDVQujk+ECIsSQKNonT23ofTkENGOaOvES4N0RLUpFF7od033wzNWpab
	 CjeecjOrD675XlJPqdNLTYnEi1b+FDfQ/WgeQYOfv1K5ZSFJwnXwQIICOmTfIVFKrd
	 lMBe0mw4j+2JDxiVXYJ7ghIyEGEhjoyS8F8Z5UiM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25NEffEU061916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jun 2022 09:41:41 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Jun 2022 09:41:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 23 Jun 2022 09:41:39 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25NEfecU058733;
	Thu, 23 Jun 2022 09:41:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o4O1c-0004u7-3Q; Thu, 23 Jun 2022 09:41:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/4] linux-ti-staging-rt: Bump to
 08.04.00.002 release
Date: Thu, 23 Jun 2022 09:41:38 -0500
Message-ID: <20220623144139.18799-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220623144139.18799-1-reatmon@ti.com>
References: <20220623144139.18799-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Jun 2022 14:41:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14840

Updated the linux rt version for 08.04.00.002

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 1f711c36..56888472 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "bd4b7ce35aa987b5b6f80fc2efd2be9a4e707b84"
+SRCREV = "c0344a7bf119b7169765e13bef377735fa39cef9"
 PV = "5.10.120+git${SRCPV}"
-- 
2.17.1


