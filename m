Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4065.1645139631804962784
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 15:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GWxd+fcC;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21HNDnDD076480;
	Thu, 17 Feb 2022 17:13:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645139629;
	bh=Vlr64jL9vmRr3+quKLK8KGGPzm227MVynLayt9MEsXA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=GWxd+fcCAl0AaIWKjZcmUnlWqu0jclvAZ1XGVjfrkgYI5+nT2Q7p7Pfqm3jvrnsQz
	 xCoEyGvtye+GpH2oT64+/mmLDDr+fVaAblTEmVL6ga3Y605qJXtG1UKGgwLxOs1KGt
	 SNq6y5c1fceGCWB8kjz4PRJ9yCI7mRuVcU/nbowQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21HNDnpa085514
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Feb 2022 17:13:49 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 17
 Feb 2022 17:13:49 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 17 Feb 2022 17:13:49 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21HNDnAF052498;
	Thu, 17 Feb 2022 17:13:49 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nKpy8-0006o6-UQ; Thu, 17 Feb 2022 17:13:48 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 4/4] u-boot-ti-staging: Bump to 08.02.00.003 release
Date: Thu, 17 Feb 2022 17:13:48 -0600
Message-ID: <20220217231348.26098-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220217231348.26098-1-reatmon@ti.com>
References: <20220217231348.26098-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the u-boot version for 08.02.00.003

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 16bb1521..701b802a 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r18"
+PR = "r19"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "ebc8dca63dd961aaf5f5f626a19c6f6bfd7428f0"
+SRCREV = "bd58b61277a189ee49e0d6e9fd03d52996685d98"
-- 
2.17.1

