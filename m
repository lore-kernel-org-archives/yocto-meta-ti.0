Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF7CCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 12:30:20 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.37125.1697200219491576078
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 05:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FJPDnoVv;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39DCUIQq015512
	for <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 07:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697200218;
	bh=xMQ6vEZ4vmV7u/yQeqz32H58pgwrGhQLbeF/jMcMjH8=;
	h=From:To:CC:Subject:Date;
	b=FJPDnoVvTgz1k+DSXSdc4TwEqujO9CsKZoifckDrFWF6QwErQKP7AtFSC4DDc6LRt
	 I+qoWK2rvFoSEKWkI34OVjGCeOR2yyyOww6P3eEylE8RItGcJxpVwQ1TqB9ukuzyHj
	 G1I2iEgr8k+M9LFf0H2gqqUzvBF6grhTnY9dUV3k=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39DCUIcB122027
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 07:30:18 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Oct 2023 07:30:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Oct 2023 07:30:18 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39DCUFZC116925;
	Fri, 13 Oct 2023 07:30:16 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <minas@ti.com>, <s-vadapalli@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2] ti-eth-fw: Reduce priority for softlinks to 5.
Date: Fri, 13 Oct 2023 18:00:08 +0530
Message-ID: <20231013123008.31667-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 12:30:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17101

Makes ti-ipc firmware as default for main-r5f0_0 firmware softlink
The ti-eth-fw binaries are tested at the SDK level and should be added
there instead

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
v1: https://lists.yoctoproject.org/g/meta-ti/message/17094
Changes in v2:
    Instead of removing ti-eth-fw entirely, only reduce
    priority of softlinks
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


