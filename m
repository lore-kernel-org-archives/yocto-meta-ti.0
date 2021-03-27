Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.659.1616804217928064309
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 17:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IsHwA84M;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12R0Guji024807
	for <meta-ti@lists.yoctoproject.org>; Fri, 26 Mar 2021 19:16:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616804216;
	bh=2lxo9+albbb4pjfR38OgKZfFAiNcyxGE1PuFyIjOT6g=;
	h=From:To:CC:Subject:Date;
	b=IsHwA84MvmRCVoYF3Rw9/qkjYb4PhWLANT4XLKX/SbfM5XEL5JDW+MpMZiy/sSU8P
	 g2nhWjz9bMHlkU0alTJt9QZ5MWexpLtJBEsb0YU1Kxu9nnWScG92DI175uFeKUo1vO
	 ixTVFqv1PvL87ahzvo1NQFxGk8rELxif+P2HoQ0Y=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12R0Gu2a061580
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 26 Mar 2021 19:16:56 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 26
 Mar 2021 19:16:56 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 26 Mar 2021 19:16:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12R0GuL3046824;
	Fri, 26 Mar 2021 19:16:56 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ti-uboot-staging: Update to the latest commit
Date: Fri, 26 Mar 2021 19:16:56 -0500
Message-ID: <20210327001656.8576-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

ti-uboot-staging: Update to the latest commit

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index c066eb8f..e1bdae46 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r35"
+PR = "r36"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "654d73f8725db340ccb470d5d130df3fcf7ce482"
+SRCREV = "2781231a33c3d779e32445f4fe55164c45d6d7c1"
-- 
2.17.1

