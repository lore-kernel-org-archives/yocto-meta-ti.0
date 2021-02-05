Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.247.1612548871430498859
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Feb 2021 10:14:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EqvcIveJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: lokeshvutla@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 115IET37064030
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Feb 2021 12:14:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1612548869;
	bh=AWW1UeL3U8FEHXcpGcL4yLbj+Pt5B4RerzMYoOcLDWU=;
	h=From:To:CC:Subject:Date;
	b=EqvcIveJsvupFuekVMnBqjfidgCrw+3VmLZRE/fbUh+vd226auTSblGkaCMLpqUCO
	 er8d/rqtSrt81+vMPBiUpF4m3wzMLaj5D1kRbo2uYCBoHXdYIQ0/C8JQLDCBUbcxEB
	 IukvF0JNJfRybb/3qOe/gxMwZyY4LZUhdUsE8No4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 115IETuY074099
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Feb 2021 12:14:29 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Feb
 2021 12:14:29 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Feb 2021 12:14:29 -0600
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 115IERVp083725;
	Fri, 5 Feb 2021 12:14:28 -0600
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>,
        Dan
 Murphy <dmurphy@ti.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH dunfell/master] ti-uboot-staging: Update to the latest commit
Date: Fri, 5 Feb 2021 23:44:26 +0530
Message-ID: <20210205181426.15839-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update SRCREV to latest commit that includes AM64xx SK platform

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index 7f5dc432..4cf0b599 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r30"
+PR = "r31"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "84b608fd3489c8dd93d8eb20e7f005d967b88402"
+SRCREV = "9e7410ef108d77c2801afbe8fb1879c475aed6ff"
-- 
2.30.0

