Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.6559.1644583410877121129
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 04:43:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uhu3wzle;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21BChTId060536;
	Fri, 11 Feb 2022 06:43:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644583409;
	bh=nOnPlRk5fAoVhzL8kv9QcXW7E8IswWDSxe0Gnelmj1Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=uhu3wzleB7WyFaH5JajNY+wOeWUvenQv9k2CYd2543iLOA/N+Bq+X5NlZVrTULHWP
	 hING+R1bGqhCm09TMcRelBwHZQJwkG0DEI4iedTZcKBcd5M2FMl0D1tlX8Z1J8hcmX
	 vzIiZoQ+suQ/SC6ToN1uxpXFF5R+Y7cN+SW0NN94=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21BChTJH109419
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Feb 2022 06:43:29 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 11
 Feb 2022 06:43:29 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 11 Feb 2022 06:43:29 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21BChTIK108062;
	Fri, 11 Feb 2022 06:43:29 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nIVGr-0003Jm-Al; Fri, 11 Feb 2022 06:43:29 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/4] u-boot-ti-staging: Bump to 08.02.00.002 release
Date: Fri, 11 Feb 2022 06:43:27 -0600
Message-ID: <20220211124328.12693-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220211124328.12693-1-reatmon@ti.com>
References: <20220211124328.12693-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the u-boot version for 08.02.00.002

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index a7e21b7c..16bb1521 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r17"
+PR = "r18"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "eadf5af36c6e0097a162f81308b64cc0b796b6b5"
+SRCREV = "ebc8dca63dd961aaf5f5f626a19c6f6bfd7428f0"
-- 
2.17.1

