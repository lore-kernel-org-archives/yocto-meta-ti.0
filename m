Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.134.1590003658267829090
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 May 2020 12:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kLvNRjCH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KJeuIg108638
	for <meta-ti@lists.yoctoproject.org>; Wed, 20 May 2020 14:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1590003656;
	bh=QeSkZiKEuHJwVSY50A7OtlfZZ/mN3LspDMXxyoNTpAo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kLvNRjCHaoMz+S3x4J0CUdDR1QB3mrjPEwrUsqIwj32NFr0szRVAlzYGxutrOXUJz
	 S7CFSFFPSBXN2oT0mL4wKO1GukEAkXta0fl7z5LBTTLhRPXlccjClvmeF4f6N8qpjy
	 UmQ0AJQiwqiBeDfMdpgFL+AxeLHp3aYdXw3+FFKQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04KJeuIS044226
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 20 May 2020 14:40:56 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 14:40:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 14:40:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KJeuY3083947;
	Wed, 20 May 2020 14:40:56 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/2] u-boot-ti-staging: update to 07.00.00.003 tag
Date: Wed, 20 May 2020 14:40:54 -0500
Message-ID: <20200520194054.6748-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520194054.6748-1-dmurphy@ti.com>
References: <20200520194054.6748-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index 6b7e603c..7a5f4bcb 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r9"
+PR = "r10"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "018f7f1c324fbd3f494a4e5e112853eb32b7bcdd"
+SRCREV = "34fcb949aa53c57d13af1be920c15c5a2e68a019"
-- 
2.26.2

