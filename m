Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.6476.1617308191610806002
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Apr 2021 13:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FHjpG1wS;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 131KGUKA031093
	for <meta-ti@lists.yoctoproject.org>; Thu, 1 Apr 2021 15:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617308190;
	bh=Yd9VAcuYrPOCnj08rP1UAkq+ScOwp1ebcOzGv+scv4M=;
	h=From:To:CC:Subject:Date;
	b=FHjpG1wSli2IZYediZBMYRCLq5istp8bKPgJOObISia5W8yh6msCaMjyG6YWn/WSW
	 DMSH2FWyhbpxXCymOASUNAUYr+uadxhClO4y2JHDYjDWVF+9TyeCdQXXBTJYzMhTPH
	 X9R138RTIZ5qUB7QbDdIOcfyiSzQPQHlJuXJGBGo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 131KGUN1004365
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 1 Apr 2021 15:16:30 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 1 Apr
 2021 15:16:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 1 Apr 2021 15:16:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 131KGTsR034209;
	Thu, 1 Apr 2021 15:16:29 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Shivalingappa Sujith <sujith.s@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ti-rtos: Update metadata and versions for RTOS firmware
Date: Thu, 1 Apr 2021 15:16:29 -0500
Message-ID: <20210401201629.10334-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

updated rtos firmwares
j721e, j7200: 07.03.00.26

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 176d0ad0..84dae9a6 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -20,8 +20,8 @@ include ${DEPLOY_DIR_IMAGE}/${DEFAULT_METADATA_FILE}
 
 # Set some defaults for when metadata.inc is not available
 DEFAULT_RTOS_FAMILY = "jacinto"
-DEFAULT_RTOS_VERSION = "07_03_00_21"
-DEFAULT_RTOS_VERSION_DOT = "07.03.00.21"
+DEFAULT_RTOS_VERSION = "07_03_00_26"
+DEFAULT_RTOS_VERSION_DOT = "07.03.00.26"
 
 DEFAULT_RTOS_VERSION_am64xx = "07_03_00_18"
 DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.00.18"
@@ -48,8 +48,8 @@ DEFAULT_FIRMWARE_URL = "file://empty"
 DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
 
 DEFAULT_FIRMWARE_SHA256SUM = "unknown"
-DEFAULT_FIRMWARE_SHA256SUM_j7 = "fc7805ed3d6c1801efb2b85ac9af99a8657aa3a7a9327bc16a1163d566f11c2c"
-DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "71f282ba6768ad3b603a17d30851cc621986c88311c174960a50196bfc79f85c"
+DEFAULT_FIRMWARE_SHA256SUM_j7 = "d3fc9fbcfaf67ebd5a509e56ef30e9a54242c290baecfda15e7ff92c127738d0"
+DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "674040e161cb4b87845fd527dea166a2dd25d0df9136aa6206d73a9240058c40"
 DEFAULT_FIRMWARE_SHA256SUM_am65xx = "61e0be08bea8ab1055645bd96504a6a29c70318c5b277237dee9981cd94d7f79"
 DEFAULT_FIRMWARE_SHA256SUM_am64xx = "1b44bccd20b767568e996e924a2ef18cabd1c3e16d3412629ff72d83b81b152f"
 
-- 
2.17.1

