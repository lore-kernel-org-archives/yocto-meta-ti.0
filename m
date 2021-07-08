Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.7902.1625721154880117175
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Jul 2021 22:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sHlgMYEE;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1685CXUI049129;
	Thu, 8 Jul 2021 00:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625721153;
	bh=JwtUmiiO2zkNN0HAoYTX88x6+AOI4h4l0O3yrXkP0no=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sHlgMYEECKV5cJ7gBhNYFy/8gDN5cg4U16Nkz93ugStymbyjBHECtc92BazK7e/tw
	 GRiw2fcyUCy9DGu/5SbzR1dAx6jTsrkZee+klIh6Mr7sKLdI6cmg2rzvbIcX9CAsUW
	 IIx/4TRw7ucA9hmvBje4mKT0fOD5WiKG4zfNbnsk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1685CXL8073804
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jul 2021 00:12:33 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 8 Jul
 2021 00:12:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 8 Jul 2021 00:12:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1685CWmA121984;
	Thu, 8 Jul 2021 00:12:33 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Yogesh Siraswar <yogeshs@ti.com>
Subject: [meta-ti][dunfell/master][PATCH 3/4] u-boot-ti-staging: Update to 08.00.00.002 release tag
Date: Thu, 8 Jul 2021 05:12:31 +0000
Message-ID: <20210708051232.10077-4-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210708051232.10077-1-yogeshs@ti.com>
References: <20210708051232.10077-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update to 08.00.00.002 release tag

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 7d18d68f..35ec974a 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r8"
+PR = "r9"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "230c4c5938cfaeb58cda0f1aa80cb006af75eca5"
+SRCREV = "20e7036ac9194b4ec8b0161b830d7f4f4d6db95f"
-- 
2.17.1

