Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6007.1620363711867330671
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 May 2021 22:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VyqXf1pt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14751oQM037652;
	Fri, 7 May 2021 00:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620363710;
	bh=lDQ1VuXgPeVjab9h3XFWzgasZVhhF3MTY8qOviUXc78=;
	h=From:To:CC:Subject:Date;
	b=VyqXf1pt3I7XiuPhV1OiPv7feEL01F9JaGMurugK7xv25hUAIpm2AYgPNyknpJJdU
	 rdvfT3riBngnvLSmg9OEniNHEqDtCF1EknPT05ath5r74SVW7IMqnEyBEOTuW9iq0e
	 IaP2x6AIOgdcvyB8edkQ9WwoOBNusDmZTyFhb9uY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14751ovu084717
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 May 2021 00:01:50 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 7 May
 2021 00:01:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 7 May 2021 00:01:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14751npZ085715;
	Fri, 7 May 2021 00:01:49 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Suman Anna <s-anna@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ti-uboot-staging: Update to the latest ti-u-boot-2021.01
Date: Fri, 7 May 2021 00:01:49 -0500
Message-ID: <20210507050149.8672-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update to the latest commit of ti-u-boot-2021.01

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 015cd028..b911042c 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r4"
+PR = "r5"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "51a19c4274ca897cec279d1b2d883957ab4705c5"
+SRCREV = "fbbc964a3514d99430f66600603b7ae348b64cd4"
-- 
2.17.1

