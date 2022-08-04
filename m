Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360FDC25B06
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:30:05 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.407.1659652204622206749
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 15:30:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lgyLoKf/;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 274MU2CG109496;
	Thu, 4 Aug 2022 17:30:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659652202;
	bh=d9005NHmBOSN6TSYWvJ+xksQPuvR7niPQD4d8dH0gck=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=lgyLoKf/imUOTGiLJz5DncqdDt3QEfON0e3dHvUOyiaW3/VUjfQiisfJUKtC5v+P4
	 3O9BrN5MNzL2gPsN4KAyzCmLnh1swe+s6qCdtlbFofLq5TwBi/d9NCa5kj/8cwSlRd
	 ncJK5jCZ6VEgz+GTdmJSwQVJZd5vITYbT/5c8xDI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 274MU2eu013698
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Aug 2022 17:30:02 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 4
 Aug 2022 17:29:59 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 4 Aug 2022 17:29:59 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 274MTxTN030038;
	Thu, 4 Aug 2022 17:29:59 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oJjLr-0004UA-KK; Thu, 04 Aug 2022 17:29:59 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/3] linux-ti-staging: Bump to 08.04.01.001
 release
Date: Thu, 4 Aug 2022 17:29:57 -0500
Message-ID: <20220804222959.17202-2-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14924

Updated the linux version for 08.04.01.001

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 605c778d..5bee8918 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -25,7 +25,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "95b90aa828165df6c45d6bb0e1cce905e83a66a7"
+SRCREV = "553874e9bc2cd24265c7b56692e1eb29d5f46b17"
 PV = "5.10.120+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1


