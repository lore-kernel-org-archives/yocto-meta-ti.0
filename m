Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.799.1614986727609789269
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 15:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OafNG/vN;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 125NPQOY086733
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Mar 2021 17:25:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614986726;
	bh=miD6cVH1aAmV5gQce15LJVG9aLrzJYGkF3iGkaZgb80=;
	h=From:To:CC:Subject:Date;
	b=OafNG/vNMPVX3o4B2k8CEtCd5iPalVthCfq5F8caMeXFIwPOr+BRHb9UmKa/J0RZj
	 b7OyIBXeJ4zjYSHvztuSVCzcuwdIbjEWRe12zm6OeOxhWyWgpXU1cHC5jqzPfnyaMF
	 RuAj/41DltC+xhkNnC2xSqby0yo451zAyCxooDA4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 125NPQ76094284
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Mar 2021 17:25:26 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Mar
 2021 17:25:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Mar 2021 17:25:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 125NPPuN017931;
	Fri, 5 Mar 2021 17:25:25 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 1/2] ti-uboot-staging: Update to the latest commit
Date: Fri, 5 Mar 2021 17:25:24 -0600
Message-ID: <20210305232525.5790-1-praneeth@ti.com>
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
index 395436f6..688eb131 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r33"
+PR = "r34"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "6b5b982e98dde63832b3a68c84f990e63f732584"
+SRCREV = "8c49d316a4283299c9b2d193aac38a25ba8f8709"
-- 
2.17.1

