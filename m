Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.2069.1590774308468488171
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 29 May 2020 10:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qYVnP0WB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04THj65S113357
	for <meta-ti@lists.yoctoproject.org>; Fri, 29 May 2020 12:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1590774306;
	bh=mvbCMbR5BtX450LEkPSYxxpSQ2qrmBIzmI2qWZMnwIU=;
	h=From:To:CC:Subject:Date;
	b=qYVnP0WBb1HXOopgeCFekIjwVMa4iydfOApY1lHGqKFsRcaWiqqa0vS37j/P+8IVs
	 HKPfq6csp9+IXwJ4tRv0zNwCMGbzfWdg/rH6dOuv0MTmP+m3/SObwBtENeXP/qFVdI
	 xL5axrmrvjen7+y2sb5CxMOPegs8wACWaPhUcaLE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04THj62N027268
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 29 May 2020 12:45:06 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 29
 May 2020 12:45:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 29 May 2020 12:45:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04THj5a9119603;
	Fri, 29 May 2020 12:45:05 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 1/2] u-boot-ti-staging: update to 07.00.00.004 tag
Date: Fri, 29 May 2020 12:45:04 -0500
Message-ID: <20200529174505.27706-1-dmurphy@ti.com>
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
index 7a5f4bcb..cfa500a8 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r10"
+PR = "r11"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "34fcb949aa53c57d13af1be920c15c5a2e68a019"
+SRCREV = "aa92fa7968d0b3ead6b3513ade990efe12ed5971"
-- 
2.26.2

