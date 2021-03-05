Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.5274.1614903485061783427
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Mar 2021 16:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fRou9htd;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1250I4Dm012242
	for <meta-ti@lists.yoctoproject.org>; Thu, 4 Mar 2021 18:18:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614903484;
	bh=ZqJexD/EsqAhXGJS09JkiVDFWDm8008Hqq0oi8p0ZsY=;
	h=From:To:CC:Subject:Date;
	b=fRou9htdl8qfNR6st70G6944Qgf6H/ermpf9Qm3i/NKVc6xFInknitDj+Ql4NNa9T
	 yS1Cdz+MCdKcqmp9tTsPkQmvBmsrCrldBS8+z+Ln9ue5sUeBhjGzNvtAxtLMqz3Sv6
	 sVZcEKGeQth+FxqmEWrBbsso5/n141U5ucVIQsC4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1250I33E048831
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 4 Mar 2021 18:18:04 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 4 Mar
 2021 18:18:03 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 4 Mar 2021 18:18:03 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1250I3Nf065226;
	Thu, 4 Mar 2021 18:18:03 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ti-uboot-staging: Update to the latest commit
Date: Thu, 4 Mar 2021 18:18:02 -0600
Message-ID: <20210305001802.29758-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

ti-uboot-staging: Update to the latest commit

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index 395436f6..0aa6460f 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r33"
+PR = "r34"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "6b5b982e98dde63832b3a68c84f990e63f732584"
+SRCREV = "535b6fafedb605ee0b8fbe05159ce3851fa14bbf"
-- 
2.17.1

