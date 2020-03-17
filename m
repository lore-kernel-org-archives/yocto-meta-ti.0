Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.10127.1584461636359405180
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2020 09:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OGIgSHvw;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02HGDtvG071407
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2020 11:13:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1584461635;
	bh=nFz6BV9u3r20x5zPD3t2SM9mg/8YJJXa26Mkdm3X+zM=;
	h=From:To:CC:Subject:Date;
	b=OGIgSHvwne60eGebNDy9cxvQmCC7KiZmyP4aOLpkcHlXfOMvp9XVWmrmQg6FIhFzP
	 hgBsZWu84woRPAiymTQwtVlVeuxyYv4zdN/uTkUCuDw3JDVwe8HygDi1/5Z+xWd0GV
	 Fg4InU65HwQT/5RJoFh20cAcDbp5HytxaKF89gAc=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02HGDtAU016624
	for <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2020 11:13:55 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Mar 2020 11:13:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Mar 2020 11:13:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02HGDt6K080772;
	Tue, 17 Mar 2020 11:13:55 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <denys@ti.com>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 1/2] uboot-ti-staging: update to ti2020.00-rc4 tag
Date: Tue, 17 Mar 2020 11:08:06 -0500
Message-ID: <20200317160807.12873-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index 283d8dc0..6828df8d 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r5"
+PR = "r6"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "d68bb53189f4ad87f872bf53b3de9c047bd741b0"
+SRCREV = "9addfeb8bf8de5c60c9b33a6f77a72639878cd26"
-- 
2.25.1

