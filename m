Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.6605.1644290557604351606
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Feb 2022 19:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=floO7h0u;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2183Mabk031935;
	Mon, 7 Feb 2022 21:22:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644290556;
	bh=RfkbURjSwLu6PUBrXg6z8FmHHVrLEOD1ihL6hMkq5k4=;
	h=From:To:Subject:Date;
	b=floO7h0uZLK+Rg1JnwzYoTHIY0bXivVdpEHg3UqBgQjfdDLimdEKefRip/lrtsDpP
	 L6D9lC63zPfdNrGRmuCBhvUzrJtmBawb8jMi34qlfIPcPHS4mizL6Y9ByakXOiwaFr
	 Qch/eo5jw1ErfVl+jkvH9xrTSpX2kDCp/sWMRsXM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2183MaLb067940
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Feb 2022 21:22:36 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 7
 Feb 2022 21:22:35 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 7 Feb 2022 21:22:35 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2183MZWS121039;
	Mon, 7 Feb 2022 21:22:35 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nHH5P-0000Vg-KZ; Mon, 07 Feb 2022 21:22:35 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v3] ti-linux-fw: Bump to 08.02.00.001 release
Date: Mon, 7 Feb 2022 21:22:35 -0600
Message-ID: <20220208032235.1915-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the ti-linux-fw version for 08.02.00.001
  - Changed CORESDK_RTOS_VERSION version to 08.02.00.04

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Added CORESDK_RTOS_VERSION change.
v3: Add INC_PR change and changed TI_LINUX_FW_SRCREV to pick up a
missing merge on that repository for this release.

 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 014e89c8..5954cbd8 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -4,10 +4,10 @@ LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
 PV = "2022.01"
-INC_PR = "r2"
+INC_PR = "r3"
 
 # Firmware versions
-CORESDK_RTOS_VERSION = "08.01.00.02"
+CORESDK_RTOS_VERSION = "08.02.00.04"
 SERDES_FW_VERSION = "3.3.0.2c"
 NETCP_SA_FW_VERSION = "1.0.0"
 NETCP_PA_FW_VERSION = "3.0.2.3"
@@ -19,7 +19,7 @@ CADENCE_MHDP_FW_VERSION = "1.2.17"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.00"
 
-TI_LINUX_FW_SRCREV ?= "6070de0ae4095d291e1f7679d1fe6e07253a2fc3"
+TI_LINUX_FW_SRCREV ?= "8810faf0c51a80554150e185122e43bee1553c37"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
-- 
2.17.1

