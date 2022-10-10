Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1536AC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 15:31:06 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.7633.1665415864286503559
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 08:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lhVPss+3;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: j-choudhary@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29AFV3Y3079230
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 10:31:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665415863;
	bh=kkRMGDaQ9UJiPlCGgbAM0ka0ZsmgNTOJATtvkdvD8+k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lhVPss+3wYsvdj8EQRKk6fa2qyStuBNs4u1O0wPibs53IEfmLT1aiSpIYH6dBpzcp
	 utyjoFx8HxxThYFV8k9mYj4DvTHFxniyilK6dUOSbL93y/tOPMNmODapfoxLEc6yks
	 OAc2AiC+zpj8h3kOACl7GXkx0Tk5HfxzY3qBiVJU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29AFV3hb093187
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 10:31:03 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 10:31:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 10:31:02 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29AFV19V020084;
	Mon, 10 Oct 2022 10:31:02 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>, <j-choudhary@ti.com>
Subject: [meta-ti][dunfell PATCH v2 2/4] conf: machine: j784s4: Add OP-TEE
 flavour
Date: Mon, 10 Oct 2022 21:00:56 +0530
Message-ID: <20221010153058.28310-3-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010153058.28310-1-j-choudhary@ti.com>
References: <20221010153058.28310-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 15:31:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15128

Add the new OP-TEE flavour for J784S4 instead of default k3-j721e.
The TI-SCI ID for MCU domain sa2ul/sa3ul are not the same for
J721E and J784S4. So a new flavour is added in upstream OP-TEE.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 conf/machine/j784s4-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j784s4-evm.conf b/conf/machine/j784s4-evm.conf
index a8ad25f6..4696b07b 100644
--- a/conf/machine/j784s4-evm.conf
+++ b/conf/machine/j784s4-evm.conf
@@ -9,6 +9,7 @@ MACHINE_FEATURES += "gpu"
 SERIAL_CONSOLES = "115200;ttyS10"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 TFA_K3_USART = "0x8"
+OPTEEMACHINE = "k3-j784s4"
 OPTEE_K3_USART = "0x8"
 
 KERNEL_DEVICETREE = " \
-- 
2.17.1


