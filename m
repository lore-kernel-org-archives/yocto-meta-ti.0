Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D201DC433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 13:20:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.28484.1652707239244026724
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 May 2022 06:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Qbdy2cNF;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24GDKaQ1065986;
	Mon, 16 May 2022 08:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652707236;
	bh=IwQbBK1TnT8SioW2st7aZiltCd/FVezbwIlixoK7la8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Qbdy2cNF2JCauqd5gFgQGgSpcJrVgM563smIpPIxtoh75miLx2sdodbymhKjm1JN0
	 IsfygRkRY9MyUtgfcsIr0gH1U9nbGHMlBbE8toG/S8tqpuPAzwJ0MySE/dwQEqSXkz
	 vA9y38Djt9vARkCuC432YxyqYBZA3xf99UpHDLzU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24GDKawq014259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 May 2022 08:20:36 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 16
 May 2022 08:20:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 16 May 2022 08:20:36 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24GDKatK099322;
	Mon, 16 May 2022 08:20:36 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nqaeK-0007k8-D7; Mon, 16 May 2022 08:20:36 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/4] linux-ti-staging-rt: Bump to
 08.03.00.004 release
Date: Mon, 16 May 2022 08:20:35 -0500
Message-ID: <20220516132036.29708-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220516132036.29708-1-reatmon@ti.com>
References: <20220516132036.29708-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 May 2022 13:20:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14743

Updated the linux rt version for 08.03.00.004

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 233d5dff..544186f4 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "44a4e68ecf519fd2e35417371fbac546c416d2d9"
+SRCREV = "f57afba2afc20fecd853518af1c24221fa3b5c76"
 PV = "5.10.109+git${SRCPV}"
-- 
2.17.1


