Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5608.1617634341373228072
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Apr 2021 07:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mpkL8Oc0;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 135EqK3K089573
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Apr 2021 09:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617634340;
	bh=aeUdiFJQ6nOJUUk2yhos3WrTYbr7DafWHbBFBotr4+c=;
	h=From:To:CC:Subject:Date;
	b=mpkL8Oc0bv5pm672V9B4kWiFAals3GVn0XpIxSmxkZDxm9vQVY10P+z2jSHj0orK4
	 UqAtb7Y6SaH16l+e78m0BbgJapS+RmIbxAusbaASejPzGM7/Gdylv2yom1usqaHIEh
	 vTk4NQ0/MwqPFHIxFVT91b8DIpq+B14cuOQeztMA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 135EqKOW086419
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Apr 2021 09:52:20 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 5 Apr
 2021 09:52:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 5 Apr 2021 09:52:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 135EqJPp119517;
	Mon, 5 Apr 2021 09:52:19 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Shivalingappa Sujith <sujith.s@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] ti-rtos: Update metadata and versions for RTOS firmware
Date: Mon, 5 Apr 2021 09:52:19 -0500
Message-ID: <20210405145219.17503-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

updated rtos firmwares
j721e, j7200: 07.03.00.29

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 8 ++++----
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index e095b7f5..e5a4c43b 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -20,8 +20,8 @@ include ${DEPLOY_DIR_IMAGE}/${DEFAULT_METADATA_FILE}
 
 # Set some defaults for when metadata.inc is not available
 DEFAULT_RTOS_FAMILY = "jacinto"
-DEFAULT_RTOS_VERSION = "07_03_00_26"
-DEFAULT_RTOS_VERSION_DOT = "07.03.00.26"
+DEFAULT_RTOS_VERSION = "07_03_00_29"
+DEFAULT_RTOS_VERSION_DOT = "07.03.00.29"
 
 DEFAULT_RTOS_VERSION_am64xx = "07_03_00_19"
 DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.00.19"
@@ -48,8 +48,8 @@ DEFAULT_FIRMWARE_URL = "file://empty"
 DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
 
 DEFAULT_FIRMWARE_SHA256SUM = "unknown"
-DEFAULT_FIRMWARE_SHA256SUM_j7 = "d3fc9fbcfaf67ebd5a509e56ef30e9a54242c290baecfda15e7ff92c127738d0"
-DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "674040e161cb4b87845fd527dea166a2dd25d0df9136aa6206d73a9240058c40"
+DEFAULT_FIRMWARE_SHA256SUM_j7 = "1e306065d7273c4ac6f803d5b404ba5ff0ddd55a1afa2911944fe5e696629193"
+DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "28fa4f5c57459ea0adc44e8c83b814a4adcfb887bee69769c5656adf628586b2"
 DEFAULT_FIRMWARE_SHA256SUM_am65xx = "61e0be08bea8ab1055645bd96504a6a29c70318c5b277237dee9981cd94d7f79"
 DEFAULT_FIRMWARE_SHA256SUM_am64xx = "5d1785cbdb91904a5ef3027378061041c59186c4198d7ebcfa660a1ff513d528"
 
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index 9a1659dc..e435676f 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -18,7 +18,7 @@ PLAT_SFX_am64xx = "/am64x"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
 TI_RTOS_METADATA_PROTOCOL ?= "git"
-TI_RTOS_METADATA_SRCREV ?= "d45318854fcc9c664cb9c097afcc6ae08fa82876"
+TI_RTOS_METADATA_SRCREV ?= "2ecbf45af64bc47806623cc5bf7ab493489acaf9"
 TI_RTOS_METADATA_BRANCH ?= "master"
 TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
-- 
2.17.1

