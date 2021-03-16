Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.4284.1615870226712313681
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Mar 2021 21:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JIgHF02I;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12G4oP6Y080160
	for <meta-ti@lists.yoctoproject.org>; Mon, 15 Mar 2021 23:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615870225;
	bh=m10fTzqf09jUCuV7vFdsBL8zc0UzHM8Rah0z8wf78Yc=;
	h=From:To:CC:Subject:Date;
	b=JIgHF02IpdbCdAIyssKvFGyCj5zwjTLjjuZr9qmO7fl5jZ56NK781xfMH8cM/eD/V
	 beSdHz0lnltMw0hPXefH97oxiFHU4YSH1gcmriUm+tLczsKghdWoa26mmd5hcRJBre
	 bsT9MHx7DOmMwzYpuM6267wpAXqCzSgvOmQZfwMM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12G4oPAu127391
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 15 Mar 2021 23:50:25 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 15
 Mar 2021 23:50:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 15 Mar 2021 23:50:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12G4oOHc068904;
	Mon, 15 Mar 2021 23:50:24 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <ankurbaranwal@ti.com>,
        <sujith.s@ti.com>
Subject: [dunfell/master PATCH] ti-rtos: Update metadata and versions for RTOS firmware
Date: Mon, 15 Mar 2021 23:50:24 -0500
Message-ID: <20210316045024.20448-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

updated rtos firmwares
j721e, j7200: 07.03.00.21
am65xx: 07.03.00.22

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 13 ++++++++-----
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  2 +-
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 507d0000..4e08a8ee 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -17,12 +17,15 @@ include ${DEPLOY_DIR_IMAGE}/metadata.inc
 
 # Set some defaults for when metadata.inc is not available
 DEFAULT_RTOS_FAMILY = "jacinto"
-DEFAULT_RTOS_VERSION = "07_03_00_16"
-DEFAULT_RTOS_VERSION_DOT = "07.03.00.16"
+DEFAULT_RTOS_VERSION = "07_03_00_21"
+DEFAULT_RTOS_VERSION_DOT = "07.03.00.21"
 
 DEFAULT_RTOS_VERSION_am64xx = "07_03_01_06"
 DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.01.06"
 
+DEFAULT_RTOS_VERSION_am65xx = "07_03_00_22"
+DEFAULT_RTOS_VERSION_DOT_am65xx = "07.03.00.22"
+
 DEFAULT_RTOS_SOC = "undefined"
 DEFAULT_RTOS_SOC_j7 = "j721e"
 DEFAULT_RTOS_SOC_j7200-evm = "j7200"
@@ -41,9 +44,9 @@ DEFAULT_FIRMWARE_URL = "file://empty"
 DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
 
 DEFAULT_FIRMWARE_SHA256SUM = "unknown"
-DEFAULT_FIRMWARE_SHA256SUM_j7 = "78f3ab929a0f3c6e2907538061de82e16d8aff7ffb2fac0c3c4d56df8abec3b0"
-DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "5bae696d35e206bbcd9b26ab6508af59a2c2d72f9b89aa1d3fc1aa808f7a8615"
-DEFAULT_FIRMWARE_SHA256SUM_am65xx = "7bd854dbf96c25683d684ac731fde3edd7fb8a65f8727f7aae3802a2e9a9cab6"
+DEFAULT_FIRMWARE_SHA256SUM_j7 = "fc7805ed3d6c1801efb2b85ac9af99a8657aa3a7a9327bc16a1163d566f11c2c"
+DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "71f282ba6768ad3b603a17d30851cc621986c88311c174960a50196bfc79f85c"
+DEFAULT_FIRMWARE_SHA256SUM_am65xx = "61e0be08bea8ab1055645bd96504a6a29c70318c5b277237dee9981cd94d7f79"
 DEFAULT_FIRMWARE_SHA256SUM_am64xx = "450bf23d659756695d62168fe06eebe4641522293d89692a9eea837426bac0f9"
 
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index 9bb0d3c5..abef8781 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -18,7 +18,7 @@ PLAT_SFX_am64xx = "/am64x"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
 TI_RTOS_METADATA_PROTOCOL ?= "git"
-TI_RTOS_METADATA_SRCREV ?= "ba81dc5a9342fc35435920092a0df2cb2ab342ef"
+TI_RTOS_METADATA_SRCREV ?= "3cda650c9e22eb4fd4eb5797ad998991a6124243"
 TI_RTOS_METADATA_BRANCH ?= "master"
 TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
-- 
2.17.1

