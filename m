Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.1372.1624926380904525808
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 28 Jun 2021 17:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GLPU8fZQ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15T0QJrJ027994;
	Mon, 28 Jun 2021 19:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624926379;
	bh=NXBIrauTuBR/qP3lB+2SgSxJQ5TGf0SA3mRLSnMKoFQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GLPU8fZQPgL19Df286P6VB58nQBXXakN34U8WilxyYRjtAKcexVAbrMB9qev/+68C
	 iMN/f8+q+zo/W9ENMrxopgtPIJIUDOuIs9fUq7DANTdpIN7yPYvFQJdNUPHt4pBbgu
	 2pc3Qrx8oyZO6B6XtyLhzs/60KHP6I/qIxZG0O+k=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15T0QJr2120904
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Jun 2021 19:26:19 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 28
 Jun 2021 19:26:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 28 Jun 2021 19:26:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15T0QIgH047725;
	Mon, 28 Jun 2021 19:26:19 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Praneeth Bajjuri <praneeth@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][PATCH 2/4] u-boot-ti-staging: Update to 08.00.00.001 release tag
Date: Tue, 29 Jun 2021 00:26:16 +0000
Message-ID: <20210629002618.29822-3-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210629002618.29822-1-yogeshs@ti.com>
References: <20210629002618.29822-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 4c3f0a47..7d18d68f 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r7"
+PR = "r8"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "c66dd9b8467472278803c2426098a2828c93ebcc"
+SRCREV = "230c4c5938cfaeb58cda0f1aa80cb006af75eca5"
-- 
2.17.1

