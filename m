Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.142.1590003657253035099
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 May 2020 12:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rB2uRQLl;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KJeulW087976
	for <meta-ti@lists.yoctoproject.org>; Wed, 20 May 2020 14:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1590003656;
	bh=7K4vP10Ua1Z/+Eg1KiG/odBcAa0VvznG35CishFMAg0=;
	h=From:To:CC:Subject:Date;
	b=rB2uRQLlpGNnx7QsiBXpBDh0IYtc+OYk0gGKbt3lUyfLvU847f19IrXe/56sWpXzF
	 RDO0nYMs/vpUj5AuC+ABWBrsZlgi6fsPtt3Tz0jC+Of5uwcVr7EhwgpRVkeaYkM5+j
	 UWj6NGVRuh95weX66v/Vefi+qXB9FmAiWWdC3m7Q=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04KJeuC1074920
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 20 May 2020 14:40:56 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 14:40:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 14:40:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KJet3V089734;
	Wed, 20 May 2020 14:40:55 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@ti.com>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 1/2] linux-ti-staging: update to 5.4.40 and 07.00.00.003 tag
Date: Wed, 20 May 2020 14:40:53 -0500
Message-ID: <20200520194054.6748-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
index 6b06bd87..7a2492a9 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "0b80a9e05fcfe5b40af3002e8464aede98fe2571"
-PV = "5.4.39+git${SRCPV}"
+SRCREV = "83062031887b4a57d8e7761d56b6a08b931c8ad4"
+PV = "5.4.40+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 9c61a0a9..27495512 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -61,8 +61,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "5b74b058323bfccbbf95d09cf2e41d1bec5c68fd"
-PV = "5.4.39+git${SRCPV}"
+SRCREV = "7f8dc0f36a11569b8e901d8a466b5fcb4f7f01b8"
+PV = "5.4.40+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.26.2

