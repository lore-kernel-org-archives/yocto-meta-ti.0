Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1115DC433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 15:31:06 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.7635.1665415865163682641
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 08:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jS/7CL3+;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-choudhary@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29AFV4ON120451
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 10:31:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665415864;
	bh=LE+zb7Bg0J+Be9pxrgZ4iNdiJcWzIey5vCJS0JG8prI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jS/7CL3+3F3rFGC1kbvQQWC5XNKUNS7UOsJK4ktnp0NXj4u8tHhLpiQ9tg6VjGXq/
	 Z9NvgTiHgw7+8KL7b6WdQs/XAEPo/wqWxBrh2aFMtVOfwyUG25/tvn2gK6Tj8Ju0tb
	 /kfX5mqJmLdUvzxa5mprrlzIuuHBDfgj7uj3GCM0=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29AFV45o027479
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 10 Oct 2022 10:31:04 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 10:31:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 10:31:04 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29AFV3uc020144;
	Mon, 10 Oct 2022 10:31:03 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>, <j-choudhary@ti.com>
Subject: [meta-ti][dunfell PATCH v2 3/4] conf: machine: j721s2: Add OP-TEE
 flavour
Date: Mon, 10 Oct 2022 21:00:57 +0530
Message-ID: <20221010153058.28310-4-j-choudhary@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15129

Change the OP-TEE flavour from default k3-j721e to k3-j784s4
as sa3ul support for j784s4 is upstreamed in OP-TEE and we
can use the same settings in j721s2 to access TRNG.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 conf/machine/j721s2-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
index ba5e8def..ec9b7454 100644
--- a/conf/machine/j721s2-evm.conf
+++ b/conf/machine/j721s2-evm.conf
@@ -9,6 +9,7 @@ MACHINE_FEATURES += "gpu"
 SERIAL_CONSOLES = "115200;ttyS10"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 TFA_K3_USART = "0x8"
+OPTEEMACHINE = "k3-j784s4"
 OPTEE_K3_USART = "0x8"
 
 KERNEL_DEVICETREE = " \
-- 
2.17.1


