Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.14074.1597394625189966556
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Aug 2020 01:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AHuexeHF;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nikhil.nd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07E8hi9S112650
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Aug 2020 03:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597394624;
	bh=43t1nWfT0/OaLaPjbFZAv/nwA44gZbCIQt2vCPeygKg=;
	h=From:To:CC:Subject:Date;
	b=AHuexeHFOFk9osbuvmNp+vHJYuFBI/huvgDWkUTeBTacE+XemxozVXbT6RD9vMix3
	 lXo3xJmnVq+nzElYHtK6ObFkGjZ3D+e4eu3EGBkjQV9UmMvKlMOqTGpPSMlAvx+UGQ
	 I3VT/Gvrh1xtA0XvyzApDikCcpRYbJgyc1tAYzPg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07E8hiWR035868
	for <meta-ti@lists.yoctoproject.org>; Fri, 14 Aug 2020 03:43:44 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 14
 Aug 2020 03:43:44 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 14 Aug 2020 03:43:44 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07E8hg3s071876;
	Fri, 14 Aug 2020 03:43:42 -0500
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][dunfell PATCH] recipes-kernel: jailhouse: Update SRCREV to latest
Date: Fri, 14 Aug 2020 14:13:29 +0530
Message-ID: <20200814084329.27065-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 recipes-kernel/jailhouse/jailhouse_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index 46447af6..8f5e50b6 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 PV = "0.12+git${SRCPV}"
-SRCREV = "8fd88c37ae1a4f7130ef40899c0eadd737c64832"
+SRCREV = "0d059b6f2c3efeaa2466517300540498b34b7655"
 BRANCH = "ti-jailhouse-0.12"
 
 SRC_URI = " \
-- 
2.17.1

