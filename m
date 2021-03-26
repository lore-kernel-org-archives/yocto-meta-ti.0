Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.9264.1616743064177996881
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Mar 2021 00:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ksh2tDlC;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: shiju@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12Q7HhFR092751
	for <meta-ti@lists.yoctoproject.org>; Fri, 26 Mar 2021 02:17:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616743063;
	bh=qThVNiFq9NU2zwol6eOdq5/V6qgxH/VHn8VyFb5YGtY=;
	h=From:To:CC:Subject:Date;
	b=ksh2tDlCbTW0LcHvsYkjBrIC6Lc+CaAaeKe2DK7VFuiqKN/RyBuebILOhOLJDKjCI
	 eF13G54I+KRmfjnfvP1o/zIwkWfPzwUXm3Wxkanh5ueZVpu3SIYmQQVJ00z3EeBbHQ
	 tOGZseVoOYOGa7GgeZlIZ++LxB+75xahLmLwEjFo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12Q7HhWO015802
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 26 Mar 2021 02:17:43 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 26
 Mar 2021 02:17:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 26 Mar 2021 02:17:42 -0500
Received: from uda0756868.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12Q7Hfcq077458;
	Fri, 26 Mar 2021 02:17:41 -0500
From: "Shiju Sivasankaran" <shiju@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Shiju Sivasankaran <shiju@ti.com>
Subject: [dunfell/master PATCH] ti-rtos: update metadata and version of am64x rtos firmware
Date: Fri, 26 Mar 2021 12:47:32 +0530
Message-ID: <20210326071732.5268-1-shiju@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

updated rtos firmware
am64xx: 07.03.00.13

rtos fw of am64x build and upload from mcu-plus-sdk repo.
rtos fw of am65x, j7 and j7200 build and upload from pdk repo.
a separate TI_RTOS_METADATA_SRCREV_am64xx for pining am64x fw
from mcu-plus-sdk avoids syncing of builds from two different repos.

Signed-off-by: Shiju Sivasankaran <shiju@ti.com>
---

v2 - typo in the commit-message corrected

All the FW are hosted on same repo processor-sdk/coresdk_rtos_releases. 
But its only hosting purpose, these FW are builds from PDK (all device 
except AM64x) and mcu-plus-sdk (AM64x alone) Similarly metadata.inc will 
be used to get the version/urls details for all devices except AM64x and 
mcusdk_metadata.inc is used for AM64x. Same metadata.inc for mcu-plus-sdk 
is a big risk as any PDK build of AM64x can override this.

coresdk_rtos_releases  has 2 branches - master & next.  
All metadata files and tags are applied on next and during RC period 
coreSDK team merge next to master.  At the same time next-branch also 
carry the metadata files from daily build as well.  During this merge 
they make sure only release builds of all devices on that tag/commit, 
as only release build points the FW url from external location.  
If any daily build of any device happens in between the tagging and 
as daily build has TI internal url for FW will spoil the purpose.  
AM65x, J7 & J7200 builds of PSDK should have happen one after another 
without any daily builds in between, this can be controlled as all these 
are built from same codebase of PDK.  As AM64x builds from mcu-plus-sdk, 
a different codebase, code-freeze and RC timing rarely match.  
Rebuild of all devices and recipe updates will arises if builds from 
both repo doesn't happen at same time. Separate TI_RTOS_METADATA_SRCREV_am64xx 
is added to avoid this syncing of builds from two different repos.


 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 6 +++---
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 1 +
 2 files changed, 4 insertions(+), 3 deletions(-)

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
index 83e0e901..f052c627 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -19,6 +19,7 @@ PLAT_SFX_am64xx = "/am64x"
 TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
 TI_RTOS_METADATA_PROTOCOL ?= "git"
 TI_RTOS_METADATA_SRCREV ?= "3cda650c9e22eb4fd4eb5797ad998991a6124243"
+TI_RTOS_METADATA_SRCREV_am64xx ?= "051de801b539f4acc6e7630684f9993e34332dde"
 TI_RTOS_METADATA_BRANCH ?= "master"
 TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
-- 
2.17.1

