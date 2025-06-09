Return-Path: <v-singh1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C08C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 12:55:06 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.58987.1749473698749624034
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Jun 2025 05:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RNpVd/nx;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: v-singh1@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 559Cstd6771769;
	Mon, 9 Jun 2025 07:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749473695;
	bh=zNc6ATBezI4iJxRxupj3GqO5lzgPH25eK850jP9DkxU=;
	h=From:To:CC:Subject:Date;
	b=RNpVd/nxeGo1iheBnDcsYZvHzM6hlcSFSjKrFVE0J4V8RwU4HOcqmE81qDpAF9ZIt
	 97xNtjfu2lIsdmCMyYNWbFwr0BA6KmJbotZLGS7yaBJ27ke4pLZZfDxWx77HbJALmg
	 18qkaA3f2CPTZZpxJIxdJ2gMQUZTuL25hNwLETfk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 559Cstn13698063
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 9 Jun 2025 07:54:55 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Jun 2025 07:54:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Jun 2025 07:54:55 -0500
Received: from uda0513920.dhcp.ti.com (uda0513920.dhcp.ti.com [172.24.227.153])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 559Csqwp1427615;
	Mon, 9 Jun 2025 07:54:52 -0500
From: vishnu singh <v-singh1@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
CC: <praneeth@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <p-bhagat@ti.com>
Subject: [[scarthgap][PATCH V4]] meta-ti-bsp : ipc: Add RPMsg DMA library
Date: Mon, 9 Jun 2025 18:24:51 +0530
Message-ID: <20250609125451.17148-1-v-singh1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Jun 2025 12:55:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18628

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
 .../recipes-ti/ipc/ti-librpmsg-dma_1.0.bb        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
new file mode 100644
index 00000000..c6d1f229
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-librpmsg-dma_1.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "RPMsg DMA shared library"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=744e63d2bb8c6151dcdd97f49aa02c53"
+
+SRC_URI = "git://github.com/TexasInstruments/rpmsg-dma.git;protocol=https;branch=main"
+SRCREV = "609fd72f458ba56f80d06810509ef88d010d2c03"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+DEPENDS = "ti-rpmsg-char "
+
+EXTRA_OECMAKE += "-DBUILD_LIB=ON -DBUILD_EXAMPLE=OFF -DCMAKE_INSTALL_PREFIX=${prefix} -DCMAKE_INSTALL_LIBDIR=${libdir}"
+
+FILES:${PN} += "${libdir}/libti_rpmsg_dma.so"
-- 
2.34.1


