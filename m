Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.7035.1636125622609189938
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Nov 2021 08:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xjvOzGsE;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1A5FKLJ3122686;
	Fri, 5 Nov 2021 10:20:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1636125621;
	bh=nlo4t3k+NK/pafBnTqUVizQDCkjQTLsHojEOHaKfrbQ=;
	h=From:To:Subject:Date;
	b=xjvOzGsEygZmxsIX0E33nBJonmMXWs1ICQ+fn9IHICcYnK165I5b5d7zKpCM2t3Tf
	 XAiqdWiHdbZzTg51CTrqA4bx67BN8cMumiIa1YH4Tsjl1dFAfXFhgEGGvatzy/GWbb
	 WWuHEYSBXocKUe69wbTcT49I3cp0V8/ztRsh2DjM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1A5FKKvf123070
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Nov 2021 10:20:21 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 5
 Nov 2021 10:20:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 5 Nov 2021 10:20:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1A5FKK5m079816;
	Fri, 5 Nov 2021 10:20:20 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] ti-linux-fw: Bump k3 image gen to latest
Date: Fri, 5 Nov 2021 15:20:20 +0000
Message-ID: <20211105152020.48277-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Update k3 image gen to latest.
Bump linux firmware to v2021.09a

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 47197212..97e51962 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -3,7 +3,7 @@ SUMMARY = "TI SCI firmware (SYSFW)"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "2021.09"
+PV = "2021.09a"
 INC_PR = "r1"
 
 # Firmware versions
@@ -17,11 +17,11 @@ PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.06"
 GOODIX_FW_VERSION = "1.0.0.0"
 CADENCE_MHDP_FW_VERSION = "1.2.17"
 
-TI_LINUX_FW_SRCREV ?= "0e93d4df760e5f0948b07c09b68f0b1ecd150d40"
+TI_LINUX_FW_SRCREV ?= "95232a584175a8ac872adf477b2dbb9ca68ba063"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "e182c3114f11eea3ec7ebb88cb1ef563a78d4eda"
+SRCREV_imggen = "6baabef219aea0f667423f2cab2bc2d63a349488"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1

