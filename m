Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8648DCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 13:47:20 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.38796.1697204830584493568
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 06:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=c3RUpoEq;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39DDl95G066140
	for <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 08:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697204829;
	bh=nmEvLmKEVi8j9+7bgutDAjkbuUmfGLeni9mALBxeXhY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=c3RUpoEqHRyx8rLyqAvuZDtzQ8CMTNNYrlyymRlMQ7QkrBqLR8R6JtGXAqM2CpXXp
	 TJNK1RcvGLuw4yImNM8XqNYEjkF6v133w5qWFK4kpWSuq2FEnnd3IHQpfs8iozRAu5
	 wJZD6cf5vU/iMyPY51wUaXenO2ufr9NST0VlJfoY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39DDl93J017819
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 08:47:09 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Oct 2023 08:47:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Oct 2023 08:47:09 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39DDkXeg107108;
	Fri, 13 Oct 2023 08:47:07 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <minas@ti.com>, <s-vadapalli@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 1/2] ti-eth-fw: Fix firmware alternative names for j784s4
Date: Fri, 13 Oct 2023 19:16:11 +0530
Message-ID: <20231013134612.35960-2-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231013134612.35960-1-a-limaye@ti.com>
References: <20231013134612.35960-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Oct 2023 13:47:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17107

The main-r5f0_0 softlinks should be pointing to the ethfw binaries
instead of the mcu-r5f0_0

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
index 1a8d4aef..970bfa0a 100644
--- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -76,8 +76,8 @@ ALTERNATIVE:${PN}:j7200 = "\
                     "
 
 ALTERNATIVE:${PN}:j784s4 = "\
-                    j784s4-mcu-r5f0_0-fw \
-                    j784s4-mcu-r5f0_0-fw-sec \
+                    j784s4-main-r5f0_0-fw \
+                    j784s4-main-r5f0_0-fw-sec \
                     "
 
 # Set up link names for the firmwares
@@ -87,8 +87,8 @@ ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw-sec]    = "${nonarch_base_libdir}/firmwa
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_0-fw"
 ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j7200-main-r5f0_0-fw-sec"
 
-ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j784s4-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/j784s4-main-r5f0_0-fw-sec"
 
 # Create the firmware alternatives
 ALTERNATIVE_TARGET[j7-main-r5f0_0-fw]        = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
@@ -97,8 +97,8 @@ ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec]    = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.
 ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw]     = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
 ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
 
-ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw]     = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
-ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw]     = "${INSTALL_ETH_FW_DIR}/${ETH_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw-sec] = "${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
 
 ALTERNATIVE_PRIORITY = "20"
 
-- 
2.34.1


