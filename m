Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.13257.1603292546139125651
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 08:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OgP+yi45;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id C519D38C08AF
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 08:02:14 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09LF2DX2108881
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 10:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603292534;
	bh=mG8voPed4u1W/ILbOih35mNCm+g4T/9a34omT+WJd3Q=;
	h=From:To:CC:Subject:Date;
	b=OgP+yi45S1dImuUKfHRVx559vGB6wsE96XXziaE+u48d3rcNWyLdIzKICPJ/dVTYQ
	 bH0f/ZLd0zjWaZUMjgSAB/wSR8YvdKqzPW6unikO+jXsebT++IbUvatjl/71rq8/N8
	 THyHDoQX7Ns1HYOZIem9R5iznPezWMH4HVRJNnuc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09LF2DN6072904
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 10:02:13 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 21
 Oct 2020 10:02:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 21 Oct 2020 10:02:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09LF2CgD110422;
	Wed, 21 Oct 2020 10:02:13 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>
CC: <s-anna@ti.com>, <praneeth@ti.com>, <meta-ti@yoctoproject.org>,
        Dan Murphy
	<dmurphy@ti.com>
Subject: [PATCH 1/3] ti-rtos: update metadata and firmware to 07.01.00.24
Date: Wed, 21 Oct 2020 10:02:08 -0500
Message-ID: <20201021150210.29966-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 10 +++++-----
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 2bbdd018fc92..61c2e97ed898 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -17,8 +17,8 @@ include ${DEPLOY_DIR_IMAGE}/metadata.inc
 
 # Set some defaults for when metadata.inc is not available
 DEFAULT_RTOS_FAMILY = "jacinto"
-DEFAULT_RTOS_VERSION = "07_01_00_17"
-DEFAULT_RTOS_VERSION_DOT = "07.01.00.17"
+DEFAULT_RTOS_VERSION = "07_01_00_24"
+DEFAULT_RTOS_VERSION_DOT = "07.01.00.24"
 
 DEFAULT_RTOS_SOC = "undefined"
 DEFAULT_RTOS_SOC_j7 = "j721e"
@@ -35,9 +35,9 @@ DEFAULT_FIRMWARE_URL = "file://empty"
 DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
 
 DEFAULT_FIRMWARE_SHA256SUM = "unknown"
-DEFAULT_FIRMWARE_SHA256SUM_j7 = "8c8fbd4494bd5f07eb5215b32ba9323332fafdecf9f08af961b7436830f46937"
-DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "af7084807706d36422c63eaff5e683412199521377fabfce052fd462074fb2a3"
-DEFAULT_FIRMWARE_SHA256SUM_am65xx = "a46ac63fda7400d24f63ab67afcaff4329bd840799baaf074cffa642c25b1158"
+DEFAULT_FIRMWARE_SHA256SUM_j7 = "725fa18b12bf9f4406b934b2779f9bded34c2e146667bf021deeb547de083e39"
+DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "5fbde0825051e4a17ec3eadb11a81ccdd5a89638259075b8a8a6e0742f0b297c"
+DEFAULT_FIRMWARE_SHA256SUM_am65xx = "8c9ec14b045ed70021804e9a37152aa947e332c34b230f5ea3da5fdeaf37dc0b"
 
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
 CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index 09035b99ed05..37463869ba1e 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -17,7 +17,7 @@ PLAT_SFX_am65xx = "/am65xx"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
 TI_RTOS_METADATA_PROTOCOL ?= "git"
-TI_RTOS_METADATA_SRCREV ?= "905500d6da77511730c4820efce8eaf07dcb504e"
+TI_RTOS_METADATA_SRCREV ?= "c98bc5cf4e5ab0633dfcbb35a87d543cc7607325"
 TI_RTOS_METADATA_BRANCH ?= "master"
 TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
-- 
2.17.1

