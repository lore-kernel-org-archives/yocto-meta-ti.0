Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2696.1614746547659273742
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Mar 2021 20:42:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=J4+ngEN2;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1234gO4D032401;
	Tue, 2 Mar 2021 22:42:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614746544;
	bh=DGxzHfWY/RK/HIqpebfi7KYY12QUQlaJBb1yYQWY2do=;
	h=From:To:CC:Subject:Date;
	b=J4+ngEN2827Csx/rFBV8df0YjNoz8sc1arxLFp0qu3Kyj0nsVAoG+pwsHPPSkCshl
	 r3zW+V2QASz4o3teAnBamL+Mv+++89xj7EEpcDbMhllu7CtVsWZxWRlYXTQKz3r3Uw
	 qUMw7/cmDTnetiWGayPl7nvFDnX6CUwJ7S5PuVso=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1234gOWg064148
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Mar 2021 22:42:24 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 2 Mar
 2021 22:42:23 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 2 Mar 2021 22:42:24 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1234gNaE035818;
	Tue, 2 Mar 2021 22:42:23 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v2] ti-rtos: Update metadata and versions for RTOS firmware
Date: Tue, 2 Mar 2021 22:42:23 -0600
Message-ID: <20210303044223.6167-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

updated rtos firmwares
am64xx: 07.03.01.06
j721e, j7200, am65xx: 07.03.00.16

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 22 ++++++++--------------
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  2 +-
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index ed62b876..e5c35689 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -17,17 +17,11 @@ include ${DEPLOY_DIR_IMAGE}/metadata.inc
 
 # Set some defaults for when metadata.inc is not available
 DEFAULT_RTOS_FAMILY = "jacinto"
-DEFAULT_RTOS_VERSION = "07_03_00_12"
-DEFAULT_RTOS_VERSION_DOT = "07.03.00.12"
+DEFAULT_RTOS_VERSION = "07_03_00_16"
+DEFAULT_RTOS_VERSION_DOT = "07.03.00.16"
 
-DEFAULT_RTOS_VERSION_j7200 = "07_03_00_10"
-DEFAULT_RTOS_VERSION_DOT_j7200 = "07.03.00.10"
-
-DEFAULT_RTOS_VERSION_am64xx = "07_03_01_02"
-DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.01.02"
-
-DEFAULT_RTOS_VERSION_am65xx = "07_03_00_10"
-DEFAULT_RTOS_VERSION_DOT_am65xx = "07.03.00.10"
+DEFAULT_RTOS_VERSION_am64xx = "07_03_01_06"
+DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.01.06"
 
 DEFAULT_RTOS_SOC = "undefined"
 DEFAULT_RTOS_SOC_j7 = "j721e"
@@ -46,10 +40,10 @@ DEFAULT_FIRMWARE_URL = "file://empty"
 DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
 
 DEFAULT_FIRMWARE_SHA256SUM = "unknown"
-DEFAULT_FIRMWARE_SHA256SUM_j7 = "69cc16c30c895fe813002bd7bdb3d30e6ca622d86b008a6bf6e2a24b86550969"
-DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "a16865d928b2b00bfca64e0c41b02dcfc0ac8ec1ce125fbfd3581a1c610847f8"
-DEFAULT_FIRMWARE_SHA256SUM_am65xx = "aa121c10d3099dd61ef898717245ecee25b501170607c9a95afd741e05783a5d"
-DEFAULT_FIRMWARE_SHA256SUM_am64xx = "9e9efeef0b1dbb101de97e58cfda8bf052a697f2ea635fdf6ca5158fffdc212b"
+DEFAULT_FIRMWARE_SHA256SUM_j7 = "78f3ab929a0f3c6e2907538061de82e16d8aff7ffb2fac0c3c4d56df8abec3b0"
+DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "5bae696d35e206bbcd9b26ab6508af59a2c2d72f9b89aa1d3fc1aa808f7a8615"
+DEFAULT_FIRMWARE_SHA256SUM_am65xx = "7bd854dbf96c25683d684ac731fde3edd7fb8a65f8727f7aae3802a2e9a9cab6"
+DEFAULT_FIRMWARE_SHA256SUM_am64xx = "450bf23d659756695d62168fe06eebe4641522293d89692a9eea837426bac0f9"
 
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
 CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index 1bbe5f22..9bb0d3c5 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -18,7 +18,7 @@ PLAT_SFX_am64xx = "/am64x"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
 TI_RTOS_METADATA_PROTOCOL ?= "git"
-TI_RTOS_METADATA_SRCREV ?= "e15de0d731606abdf112f2910543fd08b781ad64"
+TI_RTOS_METADATA_SRCREV ?= "ba81dc5a9342fc35435920092a0df2cb2ab342ef"
 TI_RTOS_METADATA_BRANCH ?= "master"
 TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
-- 
2.17.1

