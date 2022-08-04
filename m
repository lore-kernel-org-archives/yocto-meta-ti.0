Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E137C25B07
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:30:05 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.406.1659652202348006722
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 15:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=wyf/t7hc;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 274MU0Ec091680;
	Thu, 4 Aug 2022 17:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659652200;
	bh=LTM/Qz7ksvMetHxOWwggtCZ8Utq3mbG+HGDcG913VJA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=wyf/t7hc8kMtDHbS/O4+s2gjJTSx9Ld3BRb5NjpgWbdwp5NkYsEmeeCcwDEOYxKaK
	 oD/6z2svOpZZOFr4swua2fLKYn9DEiGaDpNkPJ7+OlDowkxx9jSvqVsE4snAOXNL8S
	 3N9BuQ96pSrV6FWOmMnWLvQQVIkm3T9AEIEASjgc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 274MU0t9013536
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Aug 2022 17:30:00 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 4
 Aug 2022 17:29:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 4 Aug 2022 17:29:59 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 274MTx8j004786;
	Thu, 4 Aug 2022 17:29:59 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oJjLr-0004UG-OQ; Thu, 04 Aug 2022 17:29:59 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/3] linux-ti-staging-rt: Bump to
 08.04.01.001 release
Date: Thu, 4 Aug 2022 17:29:58 -0500
Message-ID: <20220804222959.17202-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220804222959.17202-1-reatmon@ti.com>
References: <20220804222959.17202-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 Aug 2022 22:30:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14922

Updated the linux rt version for 08.04.01.001

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 239c9f5a..e27dbcf4 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "adb96c641cb03198db729962eb348ca1a16978e2"
+SRCREV = "614438c4da01dd40a99d7c4165f3c86f82f000a3"
 PV = "5.10.120+git${SRCPV}"
-- 
2.17.1


