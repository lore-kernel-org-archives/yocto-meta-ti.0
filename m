Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.18368.1603575920472240173
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 24 Oct 2020 14:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LQ/GuYRk;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09OLjJLl097036
	for <meta-ti@lists.yoctoproject.org>; Sat, 24 Oct 2020 16:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603575919;
	bh=dhgZcNob8bmZg61BZej+gophByt8v15yoYL0gXViJ2E=;
	h=From:To:CC:Subject:Date;
	b=LQ/GuYRkqHKeOAQADq/z1Hd0ObPPy2UunldwC2a4aVASEtZZrIfkGbuiV2FkN4Wre
	 Aur/6lE79YjaiYQ65RJSRHBU7buAoVH/EYMZliW4UoEi1JXeSV2MhSSyMnhrR6I2aY
	 xFKCqpTnnU2qu4br+tUOWf+tgcsPQgu2AHgOdhno=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09OLjJYd074226
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sat, 24 Oct 2020 16:45:19 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 24
 Oct 2020 16:45:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 24 Oct 2020 16:45:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09OLjIE0082665;
	Sat, 24 Oct 2020 16:45:18 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 1/2] u-boot-ti-staging: Update to tag 07.01.00.004
Date: Sat, 24 Oct 2020 16:45:11 -0500
Message-ID: <20201024214512.3655-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index 3956a3092679..4a1837e3afd4 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r20"
+PR = "r21"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "31c183d1c46b69a2f1e5dc1cc2173b8ce82a3ed9"
+SRCREV = "7c8ae131b5623ff14c1b1ad6702801e39ef9b722"
-- 
2.28.0.585.ge1cfff676549

