Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.1799.1623199856878284035
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 17:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qwC530BJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1590otNq004610;
	Tue, 8 Jun 2021 19:50:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623199855;
	bh=NrvdsfRRUUex2L99jrHbayd7wNtF4vxpLe5FaWxUdkQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qwC530BJpdnLaPhe86wmHdwLcPBPZbcR7XYVOFP3VPetHaSJ+Bs9CyNf87XIqJK5q
	 Akicv9usSpIv2CvpCBux4h0HUshhgrko+SX5+MHp53ShUZPREL1+rQBXfYFkpNRPK5
	 i1a/pS08WSVCWwRfj3i5lqUaO1EANTmg0s6pqtqk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1590otCO098168
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Jun 2021 19:50:55 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 8 Jun
 2021 19:50:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 8 Jun 2021 19:50:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1590otSO047286;
	Tue, 8 Jun 2021 19:50:55 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <lukas@wunner.de>
Subject: [dunfell/master PATCHv2 1/5] ti-uboot-staging: Update to the latest ti-u-boot-2021.01
Date: Tue, 8 Jun 2021 19:50:51 -0500
Message-ID: <20210609005055.7975-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609005055.7975-1-praneeth@ti.com>
References: <20210609005055.7975-1-praneeth@ti.com>
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
index 437f6eba..4c3f0a47 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
-PR = "r6"
+PR = "r7"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "a6e78929575b6969c15ced9685441fc430ee9510"
+SRCREV = "c66dd9b8467472278803c2426098a2828c93ebcc"
-- 
2.17.1

