Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.2539.1614138034440705935
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Feb 2021 19:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=POgssPq6;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11O3eXhm005985
	for <meta-ti@lists.yoctoproject.org>; Tue, 23 Feb 2021 21:40:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614138033;
	bh=Zt/2XNS+fdeNsPLK40afv7fctI5f+xKT/o7KaOgJPMM=;
	h=From:To:CC:Subject:Date;
	b=POgssPq6xnQMxT4g7Q6Kd6WMJ7OxcSXsTIP7cIFq7sywf8KHJF1RAIDKbb3DsTY0z
	 tB228ZkNdl++4buXS6aqdNeik/ZXRxyhbajMyBsPXev9RxNAPUhDEGR+PuJtJpG1qk
	 S+nVP2vPEwz3Y3nAlZeWB8WqZ8IFyoh6zWJfrrr8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11O3eXW7029897
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 23 Feb 2021 21:40:33 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 23
 Feb 2021 21:40:32 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 23 Feb 2021 21:40:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11O3eWL6032957;
	Tue, 23 Feb 2021 21:40:32 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ti-sci-fw: Update image gen and sysfw to v2021.01
Date: Tue, 23 Feb 2021 21:40:32 -0600
Message-ID: <20210224034032.31199-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update the image gen and linux-firmware commit SHAs so that
am65x, j7200 and j721e also picks v2021.01 sysfw and the applicable
DM update with following version
* 07.03.00.12 for J721E
* 07.03.00.10 for J7200

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index cfe0fe66..108f7133 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -3,11 +3,11 @@ SUMMARY = "TI SCI firmware (SYSFW)"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "2020.12a"
+PV = "2021.01"
 
-SRCREV = "b66ee9ae020c31d7138f0af38518823bb4f5791e"
+SRCREV = "b7e5d159fd4a5b03a02c8f4b8eb32bad2addf4f5"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "d882ca2bfcef8a9f07eefe0edc231711f0df036f"
+SRCREV_imggen = "3cd998ff043adf70a50f63115ca1888c62802511"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1

