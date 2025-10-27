Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F3CCCF9E0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 04:05:50 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.24815.1761537940918260854
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 26 Oct 2025 21:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pIR/VdTc;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: v-singh1@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59R45cVY1196345;
	Sun, 26 Oct 2025 23:05:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761537938;
	bh=IKbb6/zx9ryguCrPNJL3FBc1xdaCbv2vXLiqJS8eIRw=;
	h=From:To:Subject:Date;
	b=pIR/VdTctNIsYxCPR2J5C8qP4S5ab0zUo6vuvNbVphHgfioEv/bPyQfW/WV+PI7wC
	 1sVsPLjOOvJTkqZCge1HN7tfMYTGHjCaypuPGb7PH21y0w8nISzVaGCqWhc9Z7PrqK
	 9eL9zSCc06aq/k5IU10neKJX60fHWFln1CaI9xzo=
Received: from DLEE213.ent.ti.com (dlee213.ent.ti.com [157.170.170.116])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59R45cFM972379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 26 Oct 2025 23:05:38 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 26 Oct
 2025 23:05:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 26 Oct 2025 23:05:37 -0500
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [10.24.69.90])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59R45aV4027700;
	Sun, 26 Oct 2025 23:05:36 -0500
From: vishnu singh <v-singh1@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: [PATCH v2] meta-ti-bsp : ipc: update ti-librpmsg-dma srcrev & license
Date: Mon, 27 Oct 2025 09:35:35 +0530
Message-ID: <20251027040535.3340080-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Oct 2025 04:05:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19181

From: Vishnu Singh <v-singh1@ti.com>

Update recipe license to TI-TFL, use scarthgap branch
Disable 2dfft and audio offload example build for rpmsg-dma library.

License-Update: license change to TI-TFL

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
index b624871d..7600f867 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
@@ -1,9 +1,9 @@
 SUMMARY = "RPMsg DMA shared library"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=91dc4ee6d125d0aaba4e5bd2fcc50ed3"
 
-SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
-SRCREV = "609fd72f458ba56f80d06810509ef88d010d2c03"
+SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=scarthgap"
+SRCREV = "33d20a5a488844ace45ffb9dbbad9f043c5c897f"
 
 S = "${WORKDIR}/git"
 
@@ -11,6 +11,6 @@ inherit cmake
 
 DEPENDS = "ti-rpmsg-char"
 
-EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_EXAMPLE=OFF"
+EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_AUDIO_OFFLOAD_EXAMPLE=OFF -DBUILD_2DFFT_OFFLOAD_EXAMPLE=OFF"
 
 COMPATIBLE_MACHINE = "^(k3)$"
-- 
2.50.1


