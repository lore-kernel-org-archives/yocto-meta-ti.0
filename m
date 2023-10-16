Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B1DCDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 14:42:30 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.127553.1697467349469015192
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 07:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vgJJu14a;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39GEgSaK001577
	for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 09:42:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697467348;
	bh=qgDtGvDFdw2YhsgOQDCpbhttl3T95795O52sOo8eTc0=;
	h=Date:From:Subject:To:CC;
	b=vgJJu14aZyqvL0lIazFELc+jTD7GlDlVNtQ7pxKajYI5RkTZCj5KKOQ8ZvjR1MMoC
	 JueABumXnSVn/h5UYxD9JQPcmLbVlBTLS5Jpflc8KMlMGTm5qxjypjlFJv4h2OabHY
	 FVehNVKZFQOfVbIH/fn/6rgbGNFbHjKqwOggZmmc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39GEgS3S073166
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 09:42:28 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Oct 2023 09:42:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Oct 2023 09:42:28 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39GEgMis002617;
	Mon, 16 Oct 2023 09:42:27 -0500
Message-ID: <eba5d168-dc83-4f5e-bfef-3f1dc2918cec@ti.com>
Date: Mon, 16 Oct 2023 09:42:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 2/2] ti-eth-fw: Reduce priority
 for softlinks to 5.
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <minas@ti.com>, <s-vadapalli@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Oct 2023 14:42:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17119

Makes ti-ipc firmware as default for main-r5f0_0 firmware softlink
The ti-eth-fw binaries are tested at the SDK level and should be
made default only at that level

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
  meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb 
b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
index 970bfa0a..e1d442d3 100644
--- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -100,7 +100,7 @@ ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw-sec] = 
"${INSTALL_ETH_FW_DIR}/${ETH_FW}.
  ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw]     = 
"${INSTALL_ETH_FW_DIR}/${ETH_FW}"
  ALTERNATIVE_TARGET[j784s4-main-r5f0_0-fw-sec] = 
"${INSTALL_ETH_FW_DIR}/${ETH_FW}.signed"
  -ALTERNATIVE_PRIORITY = "20"
+ALTERNATIVE_PRIORITY = "5"
   # make sure that lib/firmware, and all its contents are part of the 
package
  FILES:${PN} += "${nonarch_base_libdir}/firmware"
-- 
2.34.1


