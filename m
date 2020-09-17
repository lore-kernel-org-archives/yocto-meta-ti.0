Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.1425.1600355877791548337
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Sep 2020 08:17:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aTiSt3WJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08HFHuv8102253
	for <meta-ti@lists.yoctoproject.org>; Thu, 17 Sep 2020 10:17:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1600355876;
	bh=wY7L0kCLQrEgb2oKICMSc9cKaYa03KeKL1U2rAAEdPU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aTiSt3WJla5RXytNu+qymI6LQB3/cuYZQ2HXKFQDWNGmalRbA8dxlJtyft9EuerUS
	 isR+jkMdXfTBG3JPve3iamY9n7t2HWkuar+LAP3tcUj2y0RYSGnFo61x1LSQ3guc4A
	 NLIydeCAg0zLHCveuX5jHqnDG6eNuWExG6wFo4+0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08HFHusb005913
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 17 Sep 2020 10:17:56 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Sep 2020 10:17:56 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Sep 2020 10:17:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08HFHu6E012424;
	Thu, 17 Sep 2020 10:17:56 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/2] u-boot-ti-staging: Update to tag 07.01.00.0002
Date: Thu, 17 Sep 2020 10:17:45 -0500
Message-ID: <20200917151745.7921-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200917151745.7921-1-dmurphy@ti.com>
References: <20200917151745.7921-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index 33975aa0f56d..477d573d4fde 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r16"
+PR = "r17"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "f2cd62a77d9b85005ff5a60e3839992ace0494b8"
+SRCREV = "b9af85263e81f8c2d1441202522842156edaeb96"
-- 
2.28.0

