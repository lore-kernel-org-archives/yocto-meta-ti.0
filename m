Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4714.1618289149001887650
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Apr 2021 21:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=a1BJ+Hnq;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13D4jluw126307;
	Mon, 12 Apr 2021 23:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618289147;
	bh=Pqkj/r7gkVOgXN4o0Es2XKiF2xLEhoMXvx6QGxgpS6Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=a1BJ+Hnq+lOENMPqzW0oEWS1FoQWxkrL15auIs5tYBHdTZZDAr2lMSiZ+tB76+Qa2
	 tMdznToW+FziTb4g8xSFyZSaJoihJcsg1t6v2lgqc5lK8kpyo+MRt1yKa2BFnu61yR
	 GRT2zPz61EMFScQVipscIbL5cMK0oxi4kb4BEctQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13D4jlbS107921
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Apr 2021 23:45:47 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 12
 Apr 2021 23:45:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 12 Apr 2021 23:45:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13D4jlmR072887;
	Mon, 12 Apr 2021 23:45:47 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 2/4] ti-uboot-staging: Update to the latest ti-u-boot-2021.01
Date: Mon, 12 Apr 2021 23:45:44 -0500
Message-ID: <20210413044546.12409-3-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210413044546.12409-1-praneeth@ti.com>
References: <20210413044546.12409-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update to the latest commit of ti-u-boot-2021.01

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 299a6cd8..d4717ca3 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -1,10 +1,9 @@
 require u-boot-ti.inc
 
-#Temporarily add this as the checksum has changed in 2021
-LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=5066762ff788245317d5de2d3a67f6ea"
 
-PR = "r1"
+PR = "r2"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "c4fddedc48f336eabc4ce3f74940e6aa372de18c"
+SRCREV = "0758eb25a0f2f0784b9ee62f2900557323c3babc"
-- 
2.17.1

