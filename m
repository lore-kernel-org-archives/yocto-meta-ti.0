Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.267.1626467514122463540
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Jul 2021 13:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lqpZdxrJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16GKVq9C044751;
	Fri, 16 Jul 2021 15:31:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626467512;
	bh=NrtZ24p8BIY2/MaPbKZUwz2wb3CJ1u6tFVyhwx83cWw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=lqpZdxrJK6czmTbE7qcscAM12Vr0RUV8JWMxcQHKuSbXQOjjs5gMgomvwP1bpGSEw
	 StgprFxPw6G1cwzYH2p36lUmb4h+sc50fEVO6n4l5Ro72M6ECZPnkPEQ5w3BR3TX70
	 ZpS7b+ZOI/zLQ/JKokZ5FKif6POB8VxuwvWMyg5U=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16GKVqja020461
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Jul 2021 15:31:52 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Jul 2021 15:31:51 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Jul 2021 15:31:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16GKVpZ7026533;
	Fri, 16 Jul 2021 15:31:51 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][PATCH 1/4] u-boot-ti-staging: Update the u-boot srcrev to 08.00.00.003
Date: Fri, 16 Jul 2021 20:31:48 +0000
Message-ID: <20210716203151.3989-2-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716203151.3989-1-yogeshs@ti.com>
References: <20210716203151.3989-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update the u-boot to pick tag 08.00.00.003

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 35ec974a..b1796ace 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r9"
+PR = "r10"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "20e7036ac9194b4ec8b0161b830d7f4f4d6db95f"
+SRCREV = "e335337914f2a47b72f823f0d5e36924c1747ad1"
-- 
2.17.1

