Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D857DCDB482
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 14:15:00 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.39476.1697206497843071127
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 07:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Iw+9v1Dc;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39DEEvC6073184
	for <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 09:14:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697206497;
	bh=huV6kX4UODuL1HlFTshmAZ9069ALdQ0+6E2g15235AQ=;
	h=From:To:CC:Subject:Date;
	b=Iw+9v1DcpYpkEWGpZy+P57TpWhVyZWfvvCvbYFhNLv1HwMLATyN13o6qFxqbLkpXm
	 dungz77Ex5O1TWlXLPxujYgeeTT2oQXHiQGaAKAz5GKveNpq+IzTbCic72knigL4PV
	 79S5qvk7Zx5R/t+z5/XY+8WDsz92OLw4/JRxzVGw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39DEEvGq062127
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 09:14:57 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Oct 2023 09:14:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Oct 2023 09:14:56 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39DEErcw009156;
	Fri, 13 Oct 2023 09:14:54 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <minas@ti.com>, <s-vadapalli@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 2/2] ti-eth-fw: Reduce priority for softlinks to 5.
Date: Fri, 13 Oct 2023 19:44:39 +0530
Message-ID: <20231013141439.38381-3-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 14:15:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17108

Makes ti-ipc firmware as default for main-r5f0_0 firmware softlink
The ti-eth-fw binaries are tested at the SDK level and should be
made default only at that level

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
index 970bfa0a..e1d442d3 100644
--- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -100,7 +100,7 @@ ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.
 ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw]     = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
 ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
 
-ALTERNATIVE_PRIORITY = "20"
+ALTERNATIVE_PRIORITY = "5"
 
 # make sure that lib/firmware, and all its contents are part of the package
 FILES:${PN} += "${nonarch_base_libdir}/firmware"
-- 
2.34.1


