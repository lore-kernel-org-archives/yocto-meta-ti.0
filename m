Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2930.1626986588584397896
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 13:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Y4b27mvr;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16MKh783114012;
	Thu, 22 Jul 2021 15:43:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626986587;
	bh=8EsPPXKHlo02UAwWlTRs8WcQrZAnkC77KpYLHWtKEtQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Y4b27mvrHOaOu2GJ3EThsvIW6TTVa2ZskmSYxQayCW5J8t7sYzmwVgZE17xPXkWSc
	 DXxfoDyXDFU+z4MxaQ0c8yL9176CuNovQlbnWOoquR5rRCBZWIrnPnChugRyszFv2I
	 BwwZCN5ePlxSqSRmSW1qBgtKXb5GB7i7LtWnhv5k=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16MKh7j2044723
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jul 2021 15:43:07 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 22
 Jul 2021 15:43:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 22 Jul 2021 15:43:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16MKh62L041872;
	Thu, 22 Jul 2021 15:43:06 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell/master][PATCH 1/3] u-boot-ti-staging: Updated the u-boot to 08.00.00.004 release
Date: Thu, 22 Jul 2021 20:43:04 +0000
Message-ID: <20210722204306.37166-2-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210722204306.37166-1-yogeshs@ti.com>
References: <20210722204306.37166-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Changes to pick 08.00.00.004 release tag

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index b1796ace..53a95f20 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r10"
+PR = "r11"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "e335337914f2a47b72f823f0d5e36924c1747ad1"
+SRCREV = "53e79d0e89f975eeb874366dd9a92f68b3a599d1"
-- 
2.17.1

