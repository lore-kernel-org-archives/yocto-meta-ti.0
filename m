Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CBFBC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 17:41:12 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.28207.1656610870655619492
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 10:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tYuN9UI6;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25UHf9Jb089120;
	Thu, 30 Jun 2022 12:41:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656610869;
	bh=11Gl7DRN0A8bvrT943zMccKeNz5MAju9yS13h4DCMpM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tYuN9UI6z6jYBHkvL+BNrvmipiiVMSog80UHtAa6iXpzDLLiGTjYOs4MpBqyhy77k
	 a/2lN7HU79v/bYMj+mWVSS5ZNnH9KgHyFTxwSzOV3/aJByMRDvbTCriCcdYJ9TDBpc
	 DdUk0tomtSkXCAj0HdFrSC7lEQ+KD3cQVuJZtlco=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25UHf9HB052968
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jun 2022 12:41:09 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 30
 Jun 2022 12:41:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 30 Jun 2022 12:41:08 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25UHf8nT021649;
	Thu, 30 Jun 2022 12:41:09 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o6yA8-0002rA-SI; Thu, 30 Jun 2022 12:41:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 2/3] linux-ti-staging: Bump to
 08.04.00.003 release
Date: Thu, 30 Jun 2022 12:41:07 -0500
Message-ID: <20220630174108.10935-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220630174108.10935-1-reatmon@ti.com>
References: <20220630174108.10935-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Jun 2022 17:41:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14854

Updated the linux version for 08.04.00.003

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Rebased

 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 75ffa904..4c5c2902 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -25,7 +25,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "016e97907aa4a3194540d461baf33c2d7439db75"
+SRCREV = "a293790a7822997b0ff63bdd95f580ac6e2d85e2"
 PV = "5.10.120+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1


