Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2457.1614024728981634570
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Feb 2021 12:12:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kgb64wpm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11MKC8iq070877
	for <meta-ti@lists.yoctoproject.org>; Mon, 22 Feb 2021 14:12:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614024728;
	bh=mSeaaN7+QrrZOII/MTEJ2CM9hLHBrzAcrGx0QXM8RCI=;
	h=From:To:CC:Subject:Date;
	b=kgb64wpmT36jywyLZbDd/t7lEpqIK3GEkC7rM96kKzBKwxQ8CHIRtRExd0UVfD9h1
	 8nzXcL/sbaza5jHnRFa6C3VoWmJL1C6wXHm0OtTkH/ozdu4rHKANmtKiDjk64i2APk
	 +2o3hLPNjZ1aLvDBvl/rsA8dW2h0XkL9PE2CAlcM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11MKC8d3122665
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 22 Feb 2021 14:12:08 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 22
 Feb 2021 14:12:06 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 22 Feb 2021 14:12:06 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11MKC5Kl046812;
	Mon, 22 Feb 2021 14:12:06 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>,
        Aparna Balasubramanian
	<aparnab@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/next PATCH] ti-rtos: Update metadata and versions for RTOS firmware
Date: Mon, 22 Feb 2021 14:12:05 -0600
Message-ID: <20210222201205.28790-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

updated rtos firmwares
am64xx: 07.03.01.02
am65xx: 07.03.00.10
j721e: 07.03.00.12
j7200: 07.03.00.10

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 22 ++++++++++++++--------
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  2 +-
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 10e971a2..ed62b876 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -17,11 +17,17 @@ include ${DEPLOY_DIR_IMAGE}/metadata.inc
 
 # Set some defaults for when metadata.inc is not available
 DEFAULT_RTOS_FAMILY = "jacinto"
-DEFAULT_RTOS_VERSION = "07_02_00_10"
-DEFAULT_RTOS_VERSION_DOT = "07.02.00.10"
+DEFAULT_RTOS_VERSION = "07_03_00_12"
+DEFAULT_RTOS_VERSION_DOT = "07.03.00.12"
 
-DEFAULT_RTOS_VERSION_am64xx = "07_02_01_06"
-DEFAULT_RTOS_VERSION_DOT_am64xx = "07.02.01.06"
+DEFAULT_RTOS_VERSION_j7200 = "07_03_00_10"
+DEFAULT_RTOS_VERSION_DOT_j7200 = "07.03.00.10"
+
+DEFAULT_RTOS_VERSION_am64xx = "07_03_01_02"
+DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.01.02"
+
+DEFAULT_RTOS_VERSION_am65xx = "07_03_00_10"
+DEFAULT_RTOS_VERSION_DOT_am65xx = "07.03.00.10"
 
 DEFAULT_RTOS_SOC = "undefined"
 DEFAULT_RTOS_SOC_j7 = "j721e"
@@ -40,10 +46,10 @@ DEFAULT_FIRMWARE_URL = "file://empty"
 DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
 
 DEFAULT_FIRMWARE_SHA256SUM = "unknown"
-DEFAULT_FIRMWARE_SHA256SUM_j7 = "c1a1a44ff1a027c9f1d3aefdcfcddde1cd0ecb03465b9490d4ef8f6da0d15e2e"
-DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "41febbfe971e2fe31061e339406e3528ccf967f44dba61d3ffedc0ec7c0a4ab4"
-DEFAULT_FIRMWARE_SHA256SUM_am65xx = "139297fa2cd537d5ca911528ad492e10b4f470b9bb9466d218e84a6ebff48477"
-DEFAULT_FIRMWARE_SHA256SUM_am64xx = "2557fa08872d4c335e87699730227c238cff525276f669dfcbd5803365aa5c01"
+DEFAULT_FIRMWARE_SHA256SUM_j7 = "69cc16c30c895fe813002bd7bdb3d30e6ca622d86b008a6bf6e2a24b86550969"
+DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "a16865d928b2b00bfca64e0c41b02dcfc0ac8ec1ce125fbfd3581a1c610847f8"
+DEFAULT_FIRMWARE_SHA256SUM_am65xx = "aa121c10d3099dd61ef898717245ecee25b501170607c9a95afd741e05783a5d"
+DEFAULT_FIRMWARE_SHA256SUM_am64xx = "9e9efeef0b1dbb101de97e58cfda8bf052a697f2ea635fdf6ca5158fffdc212b"
 
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
 CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index 46fd3996..1bbe5f22 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -18,7 +18,7 @@ PLAT_SFX_am64xx = "/am64x"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
 TI_RTOS_METADATA_PROTOCOL ?= "git"
-TI_RTOS_METADATA_SRCREV ?= "66af60bbb229b2fb586cb55466fe61cfc653c6c8"
+TI_RTOS_METADATA_SRCREV ?= "e15de0d731606abdf112f2910543fd08b781ad64"
 TI_RTOS_METADATA_BRANCH ?= "master"
 TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
-- 
2.17.1

