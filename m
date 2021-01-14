Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.5107.1610645440435549997
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Jan 2021 09:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jQIi/uGH;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10EHUdxL057506
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Jan 2021 11:30:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610645439;
	bh=RQcvH3jkUBkEXES6t3jeDhsI9geHAN355ekHdbpgwik=;
	h=From:To:CC:Subject:Date;
	b=jQIi/uGH74c4PBH/KHV1h/qLSx/Xjk0M+v0ZwROAv5xoJAjBzAx1+3GBlNYYH/mN1
	 THHJ2YteB9H/smgE8iX3dkcJ+G14CBKq4vZOC4ashbkXfJmIFyy2fiBgPJ6grhjBDy
	 0kkvL/H8le02lOHreuHma8e0IC151WKz23lsYfD4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10EHUdwx069648
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Jan 2021 11:30:39 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 14
 Jan 2021 11:30:39 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 14 Jan 2021 11:30:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10EHUc7Y112814;
	Thu, 14 Jan 2021 11:30:38 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ti-uboot-staging: Update to the latest commit
Date: Thu, 14 Jan 2021 11:30:38 -0600
Message-ID: <20210114173038.15308-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update SRCREV to latest commit

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index 2fb5ccb2..ffa0a9de 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r27"
+PR = "r28"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "7b6b1a17bfdae5e4f6fd13f208c36814803f3ba7"
+SRCREV = "71ba4a5f933a1f03e8bb72d487a62a877c2135ff"
-- 
2.17.1

