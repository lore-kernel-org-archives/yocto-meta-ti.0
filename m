Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A41C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 15:16:37 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.89869.1749568588911692944
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 08:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WyAgz11v;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: v-singh1@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55AFGQb31109814;
	Tue, 10 Jun 2025 10:16:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749568586;
	bh=aXkgPBsVtXZUc7/Jz7yiqdsFXG0IetEKBNb72RXLUCs=;
	h=From:To:CC:Subject:Date;
	b=WyAgz11vFhikIQLuPXgCxqEVluXfR4VUQfwTS+cKJseZr0gxOMif9DrSw9HiEqCqb
	 keU45vfHbT8VaoCjsKG3Ty0IIk82M1lyUROdRvL1OJdRZTMKawD7uXUbwE0H97HUQA
	 KS+OOZkX++Z/r03b067ji+ckFfOUaF85QzPuxskQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55AFGQK42204188
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 10 Jun 2025 10:16:26 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Jun 2025 10:16:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 10 Jun 2025 10:16:26 -0500
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [172.24.227.153])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55AFGNvU3251164;
	Tue, 10 Jun 2025 10:16:24 -0500
From: vishnu singh <v-singh1@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
CC: <praneeth@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
Subject: [scarthgap][PATCH V5] meta-ti-bsp : ipc: Add RPMsg DMA library
Date: Tue, 10 Jun 2025 20:46:23 +0530
Message-ID: <20250610151623.211459-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Jun 2025 15:16:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18635

From: Vishnu Singh <v-singh1@ti.com>

This commit introduces the RPMsg DMA library:

RPMsg DMA library (meta-ti-bsp/recipes-ti/ipc):
   - Provides librpmsg_dma.so shared library.
   - Includes APIs for:
     - RPMsg interface initialization
     - RPMsg-based send/receive communication
     - DMA heap buffer management
     - DSP firmware dynamic load/unload

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
new file mode 100644
index 00000000..5dd3d6c7
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "RPMsg DMA shared library"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
+
+SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
+SRCREV = "609fd72f458ba56f80d06810509ef88d010d2c03"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+DEPENDS = "ti-rpmsg-char"
+
+EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_EXAMPLE=OFF"
-- 
2.34.1


