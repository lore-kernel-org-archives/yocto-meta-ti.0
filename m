Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.16446.1591198061287578087
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Jun 2020 08:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HM4xVXkB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 053FRdZR025421
	for <meta-ti@lists.yoctoproject.org>; Wed, 3 Jun 2020 10:27:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1591198059;
	bh=/EAZzQrkZf+2ofZaoSmovNlbUShCYGBnohiy73yzQwQ=;
	h=From:To:CC:Subject:Date;
	b=HM4xVXkBHmJln8b2zAe6yr4Xlnnva5ei9o4xJ1DL9Eiy7bPUrfTxPMbirEoDyaWsf
	 4Yt9WrcOiPsZh8+HDyFd/V4bhFDdHsfVZ5t0fXkGIqKZZnCrAX6UlPXt1ykftpBJfm
	 5XnERNWB4EXVFRgfGdkuxby+S1JRUJVxUgtE/2Pc=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 053FRdft052832
	for <meta-ti@lists.yoctoproject.org>; Wed, 3 Jun 2020 10:27:39 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 3 Jun
 2020 10:27:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 3 Jun 2020 10:27:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 053FRdZF010038;
	Wed, 3 Jun 2020 10:27:39 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 1/2] u-boot-ti-staging: update to 07.00.00.005 tag
Date: Wed, 3 Jun 2020 10:27:37 -0500
Message-ID: <20200603152738.5647-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index cfa500a8..6ea97ac9 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r11"
+PR = "r12"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "aa92fa7968d0b3ead6b3513ade990efe12ed5971"
+SRCREV = "f9b0d030d31ab79577f1dd1e48814a8f3119c481"
-- 
2.26.2

