Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.3061.1637783333812736707
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Nov 2021 11:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NKBYCZQ0;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nsaulnier@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AOJmqH2074193
	for <meta-ti@lists.yoctoproject.org>; Wed, 24 Nov 2021 13:48:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637783332;
	bh=HEX23N1GnfMCG8ojYlsOu2el5qIk83j+2nXe0fgIryo=;
	h=From:To:CC:Subject:Date;
	b=NKBYCZQ0RUgHWSLuYRbmIqS44ruH4OJjc0wypXa+NuTc8QlDQ49+CZOMZZftyBCYW
	 pWiDSQZpE45fPJK1x/TYf7s4W0d4XM0gJl0+YqGVTRwJ0F7LCwyRVIgxb4LaqlmE/H
	 8DYcr9EQS6nK74QrARIAgrVNLevy6IvSt1hNhyUU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AOJmqOg074029
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 24 Nov 2021 13:48:52 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 24
 Nov 2021 13:48:52 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 24 Nov 2021 13:48:52 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AOJmqfc100782;
	Wed, 24 Nov 2021 13:48:52 -0600
From: "Nick Saulnier" <nsaulnier@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <nsaulnier@ti.com>, <yogeshs@ti.com>, <kishon@ti.com>, <s-anna@ti.com>
Subject: [meta-ti][master/dunfell PATCH v1] pru-icss_git.bb: update to PSSP v6.0.1
Date: Wed, 24 Nov 2021 13:48:40 -0600
Message-ID: <20211124194840.20512-1-nsaulnier@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Found a bug in the PRU_ICSSG examples in PSSP v6.0.0, fixed in v6.0.1.

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 3acafa3b9af8..bc085c24b5fb 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,9 +8,9 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "acd8479d7f3bdbb4536ceca3cd6803662babaa5a"
+SRCREV = "8eee431384b6a1a9c96ae91a8e99485176b4d2b3"
 
-PV = "6.0.0"
+PV = "6.0.1"
 PR = "r0"
 
 require recipes-ti/includes/ti-paths.inc
-- 
2.17.1

