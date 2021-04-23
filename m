Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.21.1619197624647706198
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 Apr 2021 10:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JG9qT+u/;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13NH722w064386;
	Fri, 23 Apr 2021 12:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619197622;
	bh=qXV3eBOEROAdaRSgwOSEbbbzEdG25JfHD8ryGPxhuT4=;
	h=From:To:CC:Subject:Date;
	b=JG9qT+u/zeclRa/+H+737Xpx1zBZmztTZYZw0dXUU5pQA+gP1GIZI0KcspdU12Mf0
	 lDXEKRp3+RI1SwEJWMp+RvXPGmI9D0PGDLgyUUvinkd+r873iy21fa2SRga3H9dekd
	 NlnFtZR9oM8K3gigQVE01BljXfX1IEipUsEL44Kc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13NH71aS109715
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Apr 2021 12:07:02 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 23
 Apr 2021 12:07:01 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 23 Apr 2021 12:07:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13NH70Js077890;
	Fri, 23 Apr 2021 12:07:01 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Yogesh Siraswar <yogeshs@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 1/2] ti-uboot-staging: Update to the latest ti-u-boot-2021.01
Date: Fri, 23 Apr 2021 12:06:59 -0500
Message-ID: <20210423170700.4220-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update to the latest commit of ti-u-boot-2021.01

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 41960461..c851e34b 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r2"
+PR = "r3"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "ae3a9e682e51cfa153cd12bf9b42563c74e6a542"
+SRCREV = "1e70024c7e0f95f57fc1f4f20564baef1c049fb0"
-- 
2.17.1

