Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.824.1582669099383048487
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 14:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=C67VTR5m;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01PMIIJm051128
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Feb 2020 16:18:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582669098;
	bh=9HIOEG9Llz0GJQWJ9QAtOlrCEK5mmzVspUw3t5oCnQs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=C67VTR5mWxYpeEfB+8d3TNGRUTRYU8yDuqluws2WVkUQYHB/bzUH8mekOobQNVWOg
	 k6uq90wBRiRyvSLjMxglhesxd48VdeO05T5sFQMvu+4ET73fAFbjzl3iZIajZGA3q+
	 6sCEiIR6/n1maYGDwNwsIbFH+rgRbn2PGf4BrKF8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01PMIIPM023568
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 25 Feb 2020 16:18:18 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 25
 Feb 2020 16:18:18 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 25 Feb 2020 16:18:18 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01PMIITN096531;
	Tue, 25 Feb 2020 16:18:18 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <denys@ti.com>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/2] uboot-ti-staging: update to ti2020.00-rc2 tag
Date: Tue, 25 Feb 2020 16:13:05 -0600
Message-ID: <20200225221305.12228-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225221305.12228-1-dmurphy@ti.com>
References: <20200225221305.12228-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index d6e3112d..165eab09 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r3"
+PR = "r4"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "3df84cad33723d60f8de6b50da7bd58731acc705"
+SRCREV = "8af035c84927408986658d3b480d56fb8c351ba1"
-- 
2.25.0

