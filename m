Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.980.1617216984096230422
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 11:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Xa/spr5T;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: shiju@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VIuNw2005217
	for <meta-ti@lists.yoctoproject.org>; Wed, 31 Mar 2021 13:56:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617216983;
	bh=uIR3cOX3k11h5cc9CoEvd4eqod8+lJwS0lKqyHpJNfI=;
	h=From:To:CC:Subject:Date;
	b=Xa/spr5TJVJa3Io+g5dpFPIR7opaHO3I0yFGQQ1CadxlZ+p83toChBblKtXIdRONX
	 ZgkIhURxjq2X2jdGBBBZlnHFxXjC8mkyFxn5GvLVf2t+XI/exAW19UGr0xcyU+xwUJ
	 kwa0IEJEY71MAmRTaiVqs05t3hocpTtWEZEUMHPY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VIuN0E008855
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 31 Mar 2021 13:56:23 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 13:56:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 13:56:22 -0500
Received: from uda0756868.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VIuLdR104652;
	Wed, 31 Mar 2021 13:56:21 -0500
From: "Shiju Sivasankaran" <shiju@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Shiju Sivasankaran <shiju@ti.com>
Subject: [dunfell/master PATCH] ti-rtos: update metadata and version of am64x rtos firmware
Date: Thu, 1 Apr 2021 00:26:18 +0530
Message-ID: <20210331185618.29065-1-shiju@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

updated am64x rtos release mode firmware
am64xx: 07.03.00.18

Signed-off-by: Shiju Sivasankaran <shiju@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 6 +++---
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 1820858f..176d0ad0 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -23,8 +23,8 @@ DEFAULT_RTOS_FAMILY = "jacinto"
 DEFAULT_RTOS_VERSION = "07_03_00_21"
 DEFAULT_RTOS_VERSION_DOT = "07.03.00.21"
 
-DEFAULT_RTOS_VERSION_am64xx = "07_03_00_13"
-DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.00.13"
+DEFAULT_RTOS_VERSION_am64xx = "07_03_00_18"
+DEFAULT_RTOS_VERSION_DOT_am64xx = "07.03.00.18"
 
 DEFAULT_RTOS_VERSION_am65xx = "07_03_00_22"
 DEFAULT_RTOS_VERSION_DOT_am65xx = "07.03.00.22"
@@ -51,7 +51,7 @@ DEFAULT_FIRMWARE_SHA256SUM = "unknown"
 DEFAULT_FIRMWARE_SHA256SUM_j7 = "fc7805ed3d6c1801efb2b85ac9af99a8657aa3a7a9327bc16a1163d566f11c2c"
 DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "71f282ba6768ad3b603a17d30851cc621986c88311c174960a50196bfc79f85c"
 DEFAULT_FIRMWARE_SHA256SUM_am65xx = "61e0be08bea8ab1055645bd96504a6a29c70318c5b277237dee9981cd94d7f79"
-DEFAULT_FIRMWARE_SHA256SUM_am64xx = "0c43cea6ccaf45b3d7c48996f1c561e814a6e409a330da5d45877c82ce7a299a"
+DEFAULT_FIRMWARE_SHA256SUM_am64xx = "1b44bccd20b767568e996e924a2ef18cabd1c3e16d3412629ff72d83b81b152f"
 
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
 CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index d7f22a1a..c07e932d 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -18,7 +18,7 @@ PLAT_SFX_am64xx = "/am64x"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
 TI_RTOS_METADATA_PROTOCOL ?= "git"
-TI_RTOS_METADATA_SRCREV ?= "051de801b539f4acc6e7630684f9993e34332dde"
+TI_RTOS_METADATA_SRCREV ?= "12a455643928b9fc22af4d85f2aac7894b80e6a5"
 TI_RTOS_METADATA_BRANCH ?= "master"
 TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
-- 
2.17.1

