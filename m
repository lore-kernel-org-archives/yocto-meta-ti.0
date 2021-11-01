Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.148.1635799507252137429
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 13:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JTFCEhLW;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1A1Kj5mB081677;
	Mon, 1 Nov 2021 15:45:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1635799505;
	bh=5RmIkJ2zfS7fV2yaFMtGCNGhW7o2yWHT+G90rJWEc6k=;
	h=From:To:Subject:Date;
	b=JTFCEhLWCd3XgFEhETLsLEtbIheAkfBEM2rMgEm7f9wlw3Nqg8yKGNEzOXBaIaV6L
	 4gY6IxeHx+vvOo1EpS4nWGrjnwgfsaLYgYtyNz9gJVWi64w0CpWH74VgfAa/VYCTOJ
	 GEEBrsP83Wrs3lYhu1MUESDKt1K7U6JAStK+9FhQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1A1Kj5qj088276
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Nov 2021 15:45:05 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 1
 Nov 2021 15:45:05 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 1 Nov 2021 15:45:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1A1Kj5Qs059734;
	Mon, 1 Nov 2021 15:45:05 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 1/4] u-boot-ti-staging: Bump u-boot version for 08.01.00.002
Date: Mon, 1 Nov 2021 20:45:02 +0000
Message-ID: <20211101204505.32309-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Bump u-boot version to 08.01.00.002 release

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index db8dc9d6..6765572a 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r12"
+PR = "r13"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "316948e851b21f1f79e78fdd364a754cf9817038"
+SRCREV = "377e0f7041d1863bf9b3d23e90fb4b0c0a2cd6bf"
-- 
2.17.1

