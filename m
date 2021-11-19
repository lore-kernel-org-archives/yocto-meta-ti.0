Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.3212.1637288712637986103
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 18:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xbvy1XCb;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AJ2PBHa048016;
	Thu, 18 Nov 2021 20:25:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637288711;
	bh=YHDCRkQoMp4cARxwSKmR3eNeQJMP29sQoU5fd4ZFB8c=;
	h=From:To:Subject:Date;
	b=xbvy1XCb+TL6BNetKbUhjpclBQo6igD42aqUSX/zPCJA8DqneRQKb3Y3NXl3pgqZ1
	 ClqMLUbURuIu6dqHGvlFR/9nv4yV6f6iUERssjXE9TFE25cg2uZOj2MN4+qQuSa0kX
	 oNb3A+q3JRmAnzTpcKG1JuFsfmqRlXuJu4v0ZKMo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AJ2PBkJ031449
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Nov 2021 20:25:11 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 18
 Nov 2021 20:25:10 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 18 Nov 2021 20:25:10 -0600
Received: from chasm (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AJ2PAD5105382;
	Thu, 18 Nov 2021 20:25:10 -0600
Received: from reatmon by chasm with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1mntaQ-0005B5-JC; Thu, 18 Nov 2021 20:25:10 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 2/4] linux-ti-staging: Bump linux version for 08.01.00.005
Date: Thu, 18 Nov 2021 20:25:10 -0600
Message-ID: <20211119022510.19864-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Bump linux for 08.01.00.005 release

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 9fb74af6..545ea569 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "eb55b499b1865222e85acad2c665baadbaea3072"
+SRCREV = "dfe78b39dc37d37666f04c788abcf7d72cca3e91"
 PV = "5.10.65+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

