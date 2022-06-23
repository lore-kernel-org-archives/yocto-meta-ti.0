Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54520CCA482
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 14:41:49 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.8250.1655995302027101499
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jun 2022 07:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Jk+BeY4M;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25NEfe3h013345;
	Thu, 23 Jun 2022 09:41:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655995300;
	bh=jKhhKzijrW2DFPmls934EuwyJ4OpKRxIcfrVKjVoyV8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Jk+BeY4MwpIgG9gmKhZ/x7tgL21EMl858nGjZ8UtyMSHGdsnalkhbbizdWgo6TwRl
	 2hpSVUX4CKOrZmXx49F0NJFsO3DUbUzLIotKS0n1eiDyRlyJ1zx3cgbPJ3+fCOl1/I
	 A4MZQYMNho6GdvLIhlR2KPW7E6sOkKP0vdbxJB5c=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25NEfeVb027884
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jun 2022 09:41:40 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Jun 2022 09:41:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 23 Jun 2022 09:41:40 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25NEfeU7101264;
	Thu, 23 Jun 2022 09:41:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o4O1b-0004u1-VZ; Thu, 23 Jun 2022 09:41:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/4] linux-ti-staging: Bump to 08.04.00.002
 release
Date: Thu, 23 Jun 2022 09:41:37 -0500
Message-ID: <20220623144139.18799-3-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14838

Updated the linux version for 08.04.00.002

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index c440835d..b2513a27 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -25,7 +25,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "d5f4ca50bbb42d7872dfa7286c7a0f9f5699e94b"
+SRCREV = "ab2d96e4f21159a7df2e87a6fb2a29bd9535506b"
 PV = "5.10.120+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1


