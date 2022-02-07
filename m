Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.3246.1644272397398534973
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Feb 2022 14:19:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yksbXP4k;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 217MJt77088512;
	Mon, 7 Feb 2022 16:19:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1644272395;
	bh=rBJFxvepGI6Djzead4B8rsdQvuBEXoeOQ8peRNJReO0=;
	h=From:To:Subject:Date;
	b=yksbXP4khHnvh3c8dJVzFmMN7ypph5s9Qy77DKjMNJfDtg2H65xmAwxQSdOIyVHdu
	 E3DZTY2PgpXGYB6jYOF1jq7N5dGhcMenov4IK7wEOQUAUF6TEm9YKi0nF46l+s5EEj
	 SUrw8KWB2nM5gZStI9dHB9QKVyi/AhR80UzaiAmQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 217MJtNt039740
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Feb 2022 16:19:55 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 7
 Feb 2022 16:19:13 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 7 Feb 2022 16:19:13 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 217MJDFH062047;
	Mon, 7 Feb 2022 16:19:13 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nHCLp-0002qU-A7; Mon, 07 Feb 2022 16:19:13 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2] ti-linux-fw: Bump to 08.02.00.001 release
Date: Mon, 7 Feb 2022 16:19:13 -0600
Message-ID: <20220207221913.10898-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Updated the ti-linux-fw version for 08.02.00.001
  - Changed CORESDK_RTOS_VERSION version to 08.02.00.04

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 014e89c8..ded9d0d6 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -7,7 +7,7 @@ PV = "2022.01"
 INC_PR = "r2"
 
 # Firmware versions
-CORESDK_RTOS_VERSION = "08.01.00.02"
+CORESDK_RTOS_VERSION = "08.02.00.04"
 SERDES_FW_VERSION = "3.3.0.2c"
 NETCP_SA_FW_VERSION = "1.0.0"
 NETCP_PA_FW_VERSION = "3.0.2.3"
@@ -19,7 +19,7 @@ CADENCE_MHDP_FW_VERSION = "1.2.17"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.00"
 
-TI_LINUX_FW_SRCREV ?= "6070de0ae4095d291e1f7679d1fe6e07253a2fc3"
+TI_LINUX_FW_SRCREV ?= "028414712b4ab3861dc4cc2aa14d7c5f5a37b521"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
-- 
2.17.1

