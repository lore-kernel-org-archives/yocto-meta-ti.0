Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.3111.1637288705976533031
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 18:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=hI46oxtm;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AJ2P5l9035800;
	Thu, 18 Nov 2021 20:25:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637288705;
	bh=3JwKY9ubcBilRVDmOvNAwlIQmn1mayrKgIQJ4B87KsI=;
	h=From:To:Subject:Date;
	b=hI46oxtmIKF8ItfGNFyp9qz3oLXbDstrTMufc070GyKyAS2XQawyJ4FQphsDgKxZI
	 R6ApSp3TesMjTgPnVydLRZmKSN0zbqf/qfbe02zljY3Zoc/NuIHpTDaR0uvgP0s5ym
	 v4rgGjXAEjuXN8n7fEzJxUE0KVu9loKDWAN/1XCM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AJ2P4Va107437
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Nov 2021 20:25:05 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 18
 Nov 2021 20:25:04 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 18 Nov 2021 20:25:04 -0600
Received: from chasm (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AJ2P4ad103927;
	Thu, 18 Nov 2021 20:25:04 -0600
Received: from reatmon by chasm with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1mntaK-0005AC-H7; Thu, 18 Nov 2021 20:25:04 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 1/4] u-boot-ti-staging: Bump u-boot version for 08.01.00.005
Date: Thu, 18 Nov 2021 20:25:04 -0600
Message-ID: <20211119022504.19808-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

u-boot bump for 08.01.00.005 release

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index b5aa3fb7..f65d4fb0 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r14"
+PR = "r15"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "6c804a1af10bda322c86ce1c5dbb29f0fbb56c79"
+SRCREV = "d79399bcd770191618bfeb3840506a286a6498df"
-- 
2.17.1

