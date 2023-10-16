Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03ADFCDB474
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 14:42:31 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.127652.1697467346649693554
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 07:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gGxvjG38;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39GEgQnA037665
	for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 09:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697467346;
	bh=wlpctwdWCaG4Weo2Zk9cnGbvbywhvL5KLWz1HCbkXds=;
	h=Date:From:Subject:To:CC:References:In-Reply-To;
	b=gGxvjG38RgihBJo19W9aQe2G8wHzLVUuadz4qKEAj75Wu5DDG2rmxGmsHzmKrAE81
	 IDvyd31+qKUoqQe1Iilx4HLMibl0r4UeptS1kvZgFfq3qjCPiPHEPDathJd0AAsI3I
	 xb4ERTVS/zQ8ngZU/zHiv2o+pH02cJPBA6ZcvjPE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39GEgQDl073144
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 09:42:26 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Oct 2023 09:42:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Oct 2023 09:42:25 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39GEgMir002617;
	Mon, 16 Oct 2023 09:42:25 -0500
Message-ID: <f23dcd5e-9a30-4309-b641-7a31edb8f15a@ti.com>
Date: Mon, 16 Oct 2023 09:42:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 1/2] ti-eth-fw: Fix firmware
 alternative names for j784s4
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <minas@ti.com>, <s-vadapalli@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
References: <20231013134612.35960-1-a-limaye@ti.com>
Content-Language: en-US
In-Reply-To: <20231013134612.35960-1-a-limaye@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 14:42:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17118

The main-r5f0_0 softlinks should be pointing to the ethfw binaries
instead of the mcu-r5f0_0

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
  meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb 
b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
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
@@ -87,8 +87,8 @@ ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw-sec]    = 
"${nonarch_base_libdir}/firmwa
  ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw]     = 
"${nonarch_base_libdir}/firmware/j7200-main-r5f0_0-fw"
  ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw-sec] = 
"${nonarch_base_libdir}/firmware/j7200-main-r5f0_0-fw-sec"
  -ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw]     = 
"${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_0-fw"
-ALTERNATIVE_LINK_NAME[j784s4-mcu-r5f0_0-fw-sec] = 
"${nonarch_base_libdir}/firmware/j784s4-mcu-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw]     = 
"${nonarch_base_libdir}/firmware/j784s4-main-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[j784s4-main-r5f0_0-fw-sec] = 
"${nonarch_base_libdir}/firmware/j784s4-main-r5f0_0-fw-sec"
   # Create the firmware alternatives
  ALTERNATIVE_TARGET[j7-main-r5f0_0-fw]        = 
"${INSTALL_ETH_FW_DIR}/${ETH_FW}"
@@ -97,8 +97,8 @@ ALTERNATIVE_TARGET[j7-main-r5f0_0-fw-sec]    = 
"${INSTALL_ETH_FW_DIR}/${ETH_FW}.
  ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw]     = 
"${INSTALL_ETH_FW_DIR}/${ETH_FW}"
  ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = 
"${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
  -ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw]     = 
"${INSTALL_ETH_FW_DIR}/${ETH_FW}"
-ALTERNATIVE_TARGET[j784s4-mcu-r5f0_0-fw-sec] = 
"${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw]     = 
"${INSTALL_ETH_FW_DIR}/${ETH_FW}"
+ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw-sec] = 
"${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
   ALTERNATIVE_PRIORITY = "20"
  -- 2.34.1


