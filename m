Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.32379.1611167920283915245
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Jan 2021 10:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Pj7IBUxo;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10KIcdXk004032
	for <meta-ti@lists.yoctoproject.org>; Wed, 20 Jan 2021 12:38:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1611167919;
	bh=kM4kV7lcG/nLZb4LLQPrsSsoCe3KYmExDHjOdCBPu/c=;
	h=From:To:CC:Subject:Date;
	b=Pj7IBUxoEkQ1goJDmDPDqFGV0XfasmHEFEtBR0qK/RK5fxosxbByvY5O8QibxU/lg
	 6hY0EE3SnvGTGQICjJiI5Hmrj7UgUcxxEr01bE9ezRzHN7wONKxee1TYkL5mPr/kIT
	 vyDsYeB09rc5EeKkgVDQ5sIA5LSZEBDDpA9SZdKY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10KIcdQB021194
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 20 Jan 2021 12:38:39 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 Jan 2021 12:38:38 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 Jan 2021 12:38:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10KIcc13079941;
	Wed, 20 Jan 2021 12:38:38 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ti-uboot-staging: Update to the latest commit
Date: Wed, 20 Jan 2021 12:38:38 -0600
Message-ID: <20210120183838.21093-1-praneeth@ti.com>
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
index 6fd1dec6..7f5dc432 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r29"
+PR = "r30"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "df5e46d817182dcbd52212a7ff3c31eb20398dbe"
+SRCREV = "84b608fd3489c8dd93d8eb20e7f005d967b88402"
-- 
2.17.1

