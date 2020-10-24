Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.18233.1603575924950742536
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 24 Oct 2020 14:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UmI6Rizs;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09OLjOJe097048
	for <meta-ti@lists.yoctoproject.org>; Sat, 24 Oct 2020 16:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603575924;
	bh=WXW6yV3tYWs/SQKOtXGNhDEMSvrKpEaYoS1maMZF0x4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UmI6RizsVVUAh3sqWtztn2fl6/SYjLxnzQboGixq9UiIWbtj5S/q5yyVc8+joPHG7
	 MjTWaQFDddygp6HLUTcwUiiX4qwb6n1dkTbcU3SN0KCpxRiVf4uEEW6VwXhSkOC8Vh
	 9N81ygaZ6CfnjqGSnmE7klkfeuSf1Fh4nKLnDvk0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09OLjOx5071937
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sat, 24 Oct 2020 16:45:24 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 24
 Oct 2020 16:45:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 24 Oct 2020 16:45:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09OLjOqn125361;
	Sat, 24 Oct 2020 16:45:24 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <denys@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/2] ti-rtos: update metadata and firmware to 07.01.00.25
Date: Sat, 24 Oct 2020 16:45:12 -0500
Message-ID: <20201024214512.3655-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201024214512.3655-1-dmurphy@ti.com>
References: <20201024214512.3655-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 10 +++++-----
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 61c2e97ed898..d40b6a4b5192 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -17,8 +17,8 @@ include ${DEPLOY_DIR_IMAGE}/metadata.inc
 
 # Set some defaults for when metadata.inc is not available
 DEFAULT_RTOS_FAMILY = "jacinto"
-DEFAULT_RTOS_VERSION = "07_01_00_24"
-DEFAULT_RTOS_VERSION_DOT = "07.01.00.24"
+DEFAULT_RTOS_VERSION = "07_01_00_25"
+DEFAULT_RTOS_VERSION_DOT = "07.01.00.25"
 
 DEFAULT_RTOS_SOC = "undefined"
 DEFAULT_RTOS_SOC_j7 = "j721e"
@@ -35,9 +35,9 @@ DEFAULT_FIRMWARE_URL = "file://empty"
 DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
 
 DEFAULT_FIRMWARE_SHA256SUM = "unknown"
-DEFAULT_FIRMWARE_SHA256SUM_j7 = "725fa18b12bf9f4406b934b2779f9bded34c2e146667bf021deeb547de083e39"
-DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "5fbde0825051e4a17ec3eadb11a81ccdd5a89638259075b8a8a6e0742f0b297c"
-DEFAULT_FIRMWARE_SHA256SUM_am65xx = "8c9ec14b045ed70021804e9a37152aa947e332c34b230f5ea3da5fdeaf37dc0b"
+DEFAULT_FIRMWARE_SHA256SUM_j7 = "f66057d3dcdf9a615f3f10847a7f4ac6aa55a091f8431d0771498990ec11384e"
+DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "4a7b80748740dc4bdd5894c1bbebd4628ad2a12fa5f233504157c971b2fcfce3"
+DEFAULT_FIRMWARE_SHA256SUM_am65xx = "b7955e46a8da5300c32d391989281406e650ccb09bbdc27d61fa57824e102457"
 
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
 CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index 37463869ba1e..a7ba38fd5670 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -17,7 +17,7 @@ PLAT_SFX_am65xx = "/am65xx"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
 TI_RTOS_METADATA_PROTOCOL ?= "git"
-TI_RTOS_METADATA_SRCREV ?= "c98bc5cf4e5ab0633dfcbb35a87d543cc7607325"
+TI_RTOS_METADATA_SRCREV ?= "1dbda7181905cd255c44f2170be83b2466000f8c"
 TI_RTOS_METADATA_BRANCH ?= "master"
 TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
-- 
2.28.0.585.ge1cfff676549

