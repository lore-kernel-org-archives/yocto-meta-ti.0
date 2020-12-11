Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.6745.1607693534952328011
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Dec 2020 05:32:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QQRYV/zz;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BBDWD4I058116
	for <meta-ti@lists.yoctoproject.org>; Fri, 11 Dec 2020 07:32:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607693533;
	bh=P4n1z5hSS6SlElIxMkao7g1XMKAP7z3zkesNn0PJzus=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QQRYV/zzAyUqepFgvxkj8YqDVZTWY2oohWPpMig6HNWTY0qCARmyGGn/WaXScHO4e
	 2SlnMXEjPULrQYzDwYiTuuxCOic2usrag5ieTE4jwKQs8kNzEePdMhwfWbV4R6wCSe
	 OScibNiWclhdfdlr0IyLVRcKAlIorw404HwEKk/g=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BBDWDe7070872
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 11 Dec 2020 07:32:13 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Dec 2020 07:32:13 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 11 Dec 2020 07:32:13 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BBDWD7C063846;
	Fri, 11 Dec 2020 07:32:13 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 4/4] ti-rtos: Update metadata with AM64 firmware
Date: Fri, 11 Dec 2020 07:32:01 -0600
Message-ID: <20201211133201.10923-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201211133201.10923-1-dmurphy@ti.com>
References: <20201211133201.10923-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 6 ++++++
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 01cf0fc91aa6..74aac2c9fa0d 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -20,14 +20,19 @@ DEFAULT_RTOS_FAMILY = "jacinto"
 DEFAULT_RTOS_VERSION = "07_01_00_38"
 DEFAULT_RTOS_VERSION_DOT = "07.01.00.38"
 
+DEFAULT_RTOS_VERSION_am64xx = "07_01_03_01"
+DEFAULT_RTOS_VERSION_DOT_am64xx = "07.01.03.01"
+
 DEFAULT_RTOS_SOC = "undefined"
 DEFAULT_RTOS_SOC_j7 = "j721e"
 DEFAULT_RTOS_SOC_j7200-evm = "j7200"
 DEFAULT_RTOS_SOC_am65xx = "am65xx"
+DEFAULT_RTOS_SOC_am64xx = "am64xx"
 
 DEFAULT_RTOS_WEBLINK = "undefined"
 DEFAULT_RTOS_WEBLINK_j7 = "https://software-dl.ti.com/jacinto7/esd/processor-sdk-rtos-jacinto7/firmware/${CORESDK_RTOS_VERSION}"
 DEFAULT_RTOS_WEBLINK_am65xx = "https://software-dl.ti.com/processor-sdk-rtos/esd/AM65X/firmware/${CORESDK_RTOS_VERSION}"
+DEFAULT_RTOS_WEBLINK_am64xx = "https://software-dl.ti.com/processor-sdk-rtos/esd/AM64X/firmware/${CORESDK_RTOS_VERSION}"
 
 DEFAULT_FIRMWARE_FILE = "coresdk_rtos_${CORESDK_RTOS_SOC}_${CORESDK_RTOS_VERSION}_firmware.tar.xz"
 
@@ -38,6 +43,7 @@ DEFAULT_FIRMWARE_SHA256SUM = "unknown"
 DEFAULT_FIRMWARE_SHA256SUM_j7 = "93e4d3742a922015f3295f5c20ef4bc2b9751139ffcd5620b8df7047bff50651"
 DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "cd5071a8f6ddaec05346e4c2bbeed6dc7bcb376d6edc47f81b9aeaf38f151176"
 DEFAULT_FIRMWARE_SHA256SUM_am65xx = "e54cc8da7fefa1ebf55454b184b42c364de3eebb34a328d244b8275b7763eb58"
+DEFAULT_FIRMWARE_SHA256SUM_am64xx = "dc1a39b7a7f403235364a84ed5291666a84a5fa7fe8c136ec07d45848c1017f4"
 
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
 CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index 15c0c68cc2d8..21e7b1dc71c2 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -13,11 +13,12 @@ PLAT_SFX = ""
 PLAT_SFX_j7 = "/j721e"
 PLAT_SFX_j7200-evm = "/j7200"
 PLAT_SFX_am65xx = "/am65xx"
+PLAT_SFX_am64xx = "/am64xx"
 
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
 TI_RTOS_METADATA_PROTOCOL ?= "git"
-TI_RTOS_METADATA_SRCREV ?= "6b63577eec787cde277d3d12b23ea80578b6ad91"
+TI_RTOS_METADATA_SRCREV ?= "d946278e9a40632d05cd1e953f5f200011be69a9"
 TI_RTOS_METADATA_BRANCH ?= "master"
 TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
-- 
2.17.1

