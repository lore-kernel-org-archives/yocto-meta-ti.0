Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.30514.1613967581418845324
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 21 Feb 2021 20:19:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QbyPDiMQ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11M4JeKO006207
	for <meta-ti@lists.yoctoproject.org>; Sun, 21 Feb 2021 22:19:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613967580;
	bh=+GDdfmxGFw3bdUVtFcp5vAB6j4lhmS4KTnmhn/xb1qo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QbyPDiMQd1z+ucPiLGmTNjL6qR+xn/r7uD4tCtOvUH0b1KTzExsCB0NWRKvWQlqhk
	 Hk07NyDRSRG3Z1D08u1+1ei0igCWy75rupP40ZSdqc1UUiklUtyqc0CQB2sa5SStnh
	 HnKjBXuEN+gVnL2gInH6H9DNA+FK/4GpB1crvqHc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11M4JejG007466
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sun, 21 Feb 2021 22:19:40 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 21
 Feb 2021 22:19:40 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 21 Feb 2021 22:19:40 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11M4Jek6088593;
	Sun, 21 Feb 2021 22:19:40 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 2/3] ti-uboot-staging: Update to the latest commit
Date: Sun, 21 Feb 2021 22:19:38 -0600
Message-ID: <20210222041939.14903-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210222041939.14903-1-praneeth@ti.com>
References: <20210222041939.14903-1-praneeth@ti.com>
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
index c4a3119a..395436f6 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r32"
+PR = "r33"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "3352297ed065254b1a615fb16a7e4eefb07f9728"
+SRCREV = "6b5b982e98dde63832b3a68c84f990e63f732584"
-- 
2.17.1

