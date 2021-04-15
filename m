Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.8037.1618497711824888275
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 07:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Bvx47EY8;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13FEfk6H128810;
	Thu, 15 Apr 2021 09:41:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618497706;
	bh=oeeMRIOZTNOkyd+6cq1PPa9oUNF4jbhDYuDcHFzNvtQ=;
	h=From:To:CC:Subject:Date;
	b=Bvx47EY8OClA0r6iwkltLyPJlmFl/CDclsz+YmOG/V+sTw6t0BCHqWWBeXtyd/nKq
	 30mEjYoXMOaLtEE8WDj6oRzH5jRkwy8x7hTDQ+XlHi3D4QfipUQFIjeqNoK1f/A1Na
	 T9jEqbQCfuBIsTdQGlVTz90TyP5XUVALveYC/1Ds=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13FEfknw090003
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Apr 2021 09:41:46 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 15
 Apr 2021 09:41:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 15 Apr 2021 09:41:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13FEfkEP072543;
	Thu, 15 Apr 2021 09:41:46 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <lokeshvutla@ti.com>,
        Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master PATCH] recipes-bsp: u-boot-ti-mainline: Update to v2021.04 release
Date: Thu, 15 Apr 2021 09:41:43 -0500
Message-ID: <20210415144143.11667-1-nm@ti.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update u-boot recipe to be on the bleeding upstream tag.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index ee0b17640807..ccd2a009ca43 100644
--- a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
 PR = "r0"
 
-PV = "2020.10"
+PV = "2021.04"
 UBOOT_GIT_URI = "git://gitlab.denx.de/u-boot/u-boot.git"
 UBOOT_GIT_PROTOCOL = "http"
-SRCREV = "050acee119b3757fee3bd128f55d720fdd9bb890"
+SRCREV = "b46dd116ce03e235f2a7d4843c6278e1da44b5e1"
-- 
2.31.0

