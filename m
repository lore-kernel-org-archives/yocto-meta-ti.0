Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3510.1635197502770710081
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Oct 2021 14:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=C+T7N1Zj;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19PLVfM3060832;
	Mon, 25 Oct 2021 16:31:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1635197501;
	bh=kIjYALnbnRSxgsccPj/VA3ZiOm8r3D4/fEV54Ox1hh8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=C+T7N1ZjdN6vYULJpy+g74Jb5JMVHXvdJMB20JsaSGGu4RDkOdtSWE1K4MZdtrfTx
	 VaYrAvmFiHITrODcD6CnbPPtTnsrj/2526IKwQR1VbqpATnorB1gpIvEli+n+CZsVI
	 nF9HUP+oXIwKMisDws0/dVua8DyJpEItS1hnYVuY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19PLVf3c067683
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Oct 2021 16:31:41 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 25
 Oct 2021 16:31:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 25 Oct 2021 16:31:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19PLVeAO025143;
	Mon, 25 Oct 2021 16:31:40 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/4] u-boot-ti-staging: Bump to 08.01.00.001 release
Date: Mon, 25 Oct 2021 21:31:38 +0000
Message-ID: <20211025213140.17826-3-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211025213140.17826-1-yogeshs@ti.com>
References: <20211025213140.17826-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the u-boot version for 08.01.00.001

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 53a95f20..db8dc9d6 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r11"
+PR = "r12"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "53e79d0e89f975eeb874366dd9a92f68b3a599d1"
+SRCREV = "316948e851b21f1f79e78fdd364a754cf9817038"
-- 
2.17.1

