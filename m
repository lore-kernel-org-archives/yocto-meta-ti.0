Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.16797.1616991114102313888
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 28 Mar 2021 21:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UfSv7ZHQ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: shiju@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12T4BrYw059767
	for <meta-ti@lists.yoctoproject.org>; Sun, 28 Mar 2021 23:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616991113;
	bh=XyYeovVKDVI8mf9XQrmfShS3RcchDUoOv+3N34t7HBg=;
	h=From:To:CC:Subject:Date;
	b=UfSv7ZHQJ4IcaFEb+AOnyxDTYMrRXgufIHe1RFC7bkGccP4SOwXgdYr35f2z3ExlP
	 Ieq90gA2W8xlt18LInyCp4fqBSGQNLOFM4IG1qs4bHqaNyc7gJrtjaKjPR5FIa0caa
	 xdyGyH9Kvrxk3MwvWfgm8U9TSzxlDo4ZO/DYGmUs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12T4BrMl122734
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sun, 28 Mar 2021 23:11:53 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 28
 Mar 2021 23:11:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Sun, 28 Mar 2021 23:11:52 -0500
Received: from uda0756868.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12T4BpSc064410;
	Sun, 28 Mar 2021 23:11:51 -0500
From: "Shiju Sivasankaran" <shiju@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Shiju Sivasankaran <shiju@ti.com>
Subject: [dunfell/master PATCH] ti-rtos: update metadata and version of am64x rtos firmware
Date: Mon, 29 Mar 2021 09:41:49 +0530
Message-ID: <20210329041149.26461-1-shiju@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

updated rtos firmware
am64xx: 07.03.00.13

rtos fw of am64x build and upload from mcu-plus-sdk repo.
rtos fw of am65x, j7 and j7200 build and upload from pdk repo.

Signed-off-by: Shiju Sivasankaran <shiju@ti.com>
---

v3 - The way this system was designed is to be used with nightly builds 
where commit is AUTOREV-ed (from next branch) and should work the same with 
master branch as well, hence TI_RTOS_METADATA_SRCREV_am64xx is removed
from previous patch

 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 6 +++---
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index e85948b2..fe020aa3 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -23,8 +23,8 @@ DEFAULT_RTOS_FAMILY = "jacinto"
 DEFAULT_RTOS_VERSION = "07_03_00_21"
 DEFAULT_RTOS_VERSION_DOT = "07.03.00.21"
 
-DEFAULT_RTOS_VERSION_am64xx = "07_03_00_03"
-DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.00.03"
+DEFAULT_RTOS_VERSION_am64xx = "07_03_00_13"
+DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.00.13"
 
 DEFAULT_RTOS_VERSION_am65xx = "07_03_00_22"
 DEFAULT_RTOS_VERSION_DOT_am65xx = "07.03.00.22"
@@ -51,7 +51,7 @@ DEFAULT_FIRMWARE_SHA256SUM = "unknown"
 DEFAULT_FIRMWARE_SHA256SUM_j7 = "fc7805ed3d6c1801efb2b85ac9af99a8657aa3a7a9327bc16a1163d566f11c2c"
 DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "71f282ba6768ad3b603a17d30851cc621986c88311c174960a50196bfc79f85c"
 DEFAULT_FIRMWARE_SHA256SUM_am65xx = "61e0be08bea8ab1055645bd96504a6a29c70318c5b277237dee9981cd94d7f79"
-DEFAULT_FIRMWARE_SHA256SUM_am64xx = "bc2d3d603ad30006ea3fefa3e777c26c19b95ee6d6f5a630259009f2f5a4996b"
+DEFAULT_FIRMWARE_SHA256SUM_am64xx = "0c43cea6ccaf45b3d7c48996f1c561e814a6e409a330da5d45877c82ce7a299a"
 
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
 CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index 83e0e901..d7f22a1a 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -18,7 +18,7 @@ PLAT_SFX_am64xx = "/am64x"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
 TI_RTOS_METADATA_PROTOCOL ?= "git"
-TI_RTOS_METADATA_SRCREV ?= "3cda650c9e22eb4fd4eb5797ad998991a6124243"
+TI_RTOS_METADATA_SRCREV ?= "051de801b539f4acc6e7630684f9993e34332dde"
 TI_RTOS_METADATA_BRANCH ?= "master"
 TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
-- 
2.17.1

