Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EE6C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 21:29:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.54957.1677014986536901818
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 13:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=b4CdBvHO;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31LLTifd045181;
	Tue, 21 Feb 2023 15:29:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677014984;
	bh=jB30yGCA0DWADOeOJa6ylNn07/mt5ohNSH9y/5eRppE=;
	h=From:To:CC:Subject:Date;
	b=b4CdBvHOpIjSKWnvhoauo2oop9itfKLs29Uh7eVK6ACOteNp4OVMTO77MPwsgmwmw
	 CXNwewdmjpUeuFLOEMbDlofbNTNSK6sQ7Qs5B5MI/KPz34dppnSYApXCw4POKuORMq
	 8W4W1VHUUYQZdxpzQK+kb7Dbj4OXmmsND/yg110E=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31LLTic2034449
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Feb 2023 15:29:44 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 21
 Feb 2023 15:29:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 21 Feb 2023 15:29:43 -0600
Received: from ula0226330.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31LLThCA048397;
	Tue, 21 Feb 2023 15:29:43 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] ti-linux-fw: update to the latest
Date: Tue, 21 Feb 2023 15:29:43 -0600
Message-ID: <20230221212943.19511-1-afd@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Feb 2023 21:29:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15898

While here update FW versions and remove those no longer used.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc      | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 0b2e8bd6..74c26707 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -4,28 +4,24 @@ LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
 PV = "2022.01"
-INC_PR = "r3"
+INC_PR = "r4"
 
 # Firmware versions
 CORESDK_RTOS_VERSION = "08.02.00.04"
-SERDES_FW_VERSION = "3.3.0.2c"
-NETCP_SA_FW_VERSION = "1.0.0"
-NETCP_PA_FW_VERSION = "3.0.2.3"
-QMSS_PDSP_FW_VERSION = "1.0.0.9"
 PRUETH_FW_AM65X_VERSION = "08.00.00.20"
-PRUETH_FW_AM65X_SR2_VERSION = "02.02.09.07"
+PRUETH_FW_AM65X_SR2_VERSION = "02.02.11.02"
 GOODIX_FW_VERSION = "1.0.0.0"
-CADENCE_MHDP_FW_VERSION = "1.2.17"
+CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.00"
-TIFS_LPM_STUB_FW_VERSION = "08.03.02"
+TIFS_LPM_STUB_FW_VERSION = "08.06.04"
 
-TI_LINUX_FW_SRCREV ?= "7875237b357ecf27300658e65e9927cef7e299ed"
+TI_LINUX_FW_SRCREV ?= "340194800a581baf976360386dfc7b5acab8d948"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "a9a43d5effcd17b4f3364cc7e6d483abd7f56e0f"
+K3_IMAGE_GEN_SRCREV ?= "ffae8800a5c81c149835ed1aa5e2fbbe65a49c0d"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
-- 
2.39.1


