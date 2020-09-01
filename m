Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.2452.1598984222033767572
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Sep 2020 11:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rwcaGCHU;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 081IH0r0074736
	for <meta-ti@lists.yoctoproject.org>; Tue, 1 Sep 2020 13:17:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1598984220;
	bh=QVCqelpaenI1p9bN3/jFwYY0FProqT68xPjDYby2wKA=;
	h=From:To:CC:Subject:Date;
	b=rwcaGCHUs9raoAnE5npIaMkQmciaE9W+e8A82aOAyInmjcetb14VbF4/AKFOScczf
	 496E/aFLBrQaOw8pHJ9zjIyhAjEZxpjeaoFGoOHMHP73J+CsFp26BWdlU/WmXMObp+
	 Z2fkPjBP9s+sosdPo3Q3nrFQzGhmSA/Udzma+190=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 081IH04R027372
	for <meta-ti@lists.yoctoproject.org>; Tue, 1 Sep 2020 13:17:00 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 1 Sep
 2020 13:17:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 1 Sep 2020 13:17:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 081IH0jj095195;
	Tue, 1 Sep 2020 13:17:00 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 1/3] u-boot-ti-staging: Update to tag 07.01.00.0001
Date: Tue, 1 Sep 2020 13:16:24 -0500
Message-ID: <20200901181626.23308-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index 67d13e4cd4a9..33975aa0f56d 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r15"
+PR = "r16"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "78513625145f2ae2e67309b53472b0c562ad4807"
+SRCREV = "f2cd62a77d9b85005ff5a60e3839992ace0494b8"
-- 
2.28.0

