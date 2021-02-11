Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.5168.1613024515365118405
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Feb 2021 22:21:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CT/+UwLq;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11B6LstQ110394
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Feb 2021 00:21:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613024514;
	bh=yhm39IfTl5jxesUxiwbp3+TVM1DXBAouK4z/2F5NdMc=;
	h=From:To:CC:Subject:Date;
	b=CT/+UwLqGPUc+Ivh1kShCBq0jQhjNZ2lND6yz+tnDY/ETwYoeDnwmHzaP/+JYUIox
	 hoH9xKWXeh9Db4W9xYn50LCYAzYJqFg6STOm+CkuU73eVZAtuuYxyKTOrtZ3Lo0t7l
	 tb4HkvvFzVsYUGHJzmqRkNCPtfS6gShOmvwdsECY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11B6Lsi8005021
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 Feb 2021 00:21:54 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Feb 2021 00:21:53 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Feb 2021 00:21:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11B6Lrvb004182;
	Thu, 11 Feb 2021 00:21:53 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ti-uboot-staging: Update to the latest commit
Date: Thu, 11 Feb 2021 00:21:53 -0600
Message-ID: <20210211062153.19041-1-praneeth@ti.com>
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
index 4cf0b599..c4a3119a 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r31"
+PR = "r32"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "9e7410ef108d77c2801afbe8fb1879c475aed6ff"
+SRCREV = "3352297ed065254b1a615fb16a7e4eefb07f9728"
-- 
2.17.1

