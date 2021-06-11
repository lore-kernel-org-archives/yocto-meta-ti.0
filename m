Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2290.1623372555494860298
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 17:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZDQAnVvX;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15B0nEqL034263;
	Thu, 10 Jun 2021 19:49:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623372554;
	bh=I5JEsvaqqYQXSJRSyI06bZbG21V+ilAxxcrIvFL2INc=;
	h=From:To:CC:Subject:Date;
	b=ZDQAnVvXrNKFD11pwzmXOE/4Hp9Bjg8ZWxOsYTDeuqVx8jTUDcjfBL7Wx5Hj8yOkJ
	 gY6f17JRxNy2ECjJ0o2IcyOeOFHRukGdP4ylpGrZbPeUB6NxXElGsGXhwJjTyGuauz
	 7drgr+2Cg/98ZALvna6J5m3LC8ETMdPN0KdgrkZk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15B0nE0c077896
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Jun 2021 19:49:14 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 10
 Jun 2021 19:49:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 10 Jun 2021 19:49:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15B0nEek129033;
	Thu, 10 Jun 2021 19:49:14 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <lukas@wunner.de>
Subject: [dunfell/master PATCH v2] ti-sci-fw: Update image gen to latest
Date: Thu, 10 Jun 2021 19:49:14 -0500
Message-ID: <20210611004914.18391-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

update image gen to latest.
This commit also picks AM64x boot critical fix.
commit e411dc16862b ("soc: am64x: Makefile: Move the SPL Load address to 0x70000000")

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index 72430ab6..dbf63ef5 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -7,7 +7,7 @@ PV = "2021.01a"
 
 SRCREV = "34062b5670aac524ce3074b184ef2ef62daafca0"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "7b6f3832af6d334d335309d66d206ab829765c0e"
+SRCREV_imggen = "e411dc16862b5bb2d8befb12496b03d7b01c87b2"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1

