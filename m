Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC90C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 22:16:40 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.67725.1699049799402358845
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 15:16:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=k2TZFqTa;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A3MGbb4032692;
	Fri, 3 Nov 2023 17:16:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699049797;
	bh=X+XnLaXb8isk6rS7v3AWUsQgWZ4O8Qz1Pn6qoyo0TCw=;
	h=From:To:Subject:Date;
	b=k2TZFqTaLB5MavqUFO5ykU+55uzhKUKvQhEb/TSUvye/ZMO3bEyS0TSRO7TtMD1Rv
	 bblBqkTyvls8XdC75T4vHlOp6/jjoRnUc/lRNlkMO/lSoK/GBvlh3mYK6n9I0y3zyL
	 Y100SXmDziOHdvI3W5mu7ei6+lQfKuZD3WqIZPvI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A3MGbrI093975
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Nov 2023 17:16:37 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 Nov 2023 17:16:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 Nov 2023 17:16:37 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A3MGbrI049274;
	Fri, 3 Nov 2023 17:16:37 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qz2Sz-0003i8-2e; Fri, 03 Nov 2023 17:16:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH] k3r5: Remove ?= default assignment for the kernel
Date: Fri, 3 Nov 2023 17:16:37 -0500
Message-ID: <20231103221637.14224-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Nov 2023 22:16:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17242

The previous allowance for overriding the value for the kernel is
incorrect.  The kernel should not be changed from linux-dummy for the
k3r5 multiconfigs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3r5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf/machine/include/k3r5.inc
index 184d3a09..63267a5e 100644
--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
+++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
@@ -11,7 +11,7 @@ require conf/machine/include/arm/armv7a/tune-cortexa8.inc
 # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/j721e_evm.rst
 # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/am62x_sk.rst
 # https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/doc/board/ti/k3.rst
-PREFERRED_PROVIDER_virtual/kernel ?= "linux-dummy"
+PREFERRED_PROVIDER_virtual/kernel = "linux-dummy"
 PREFERRED_PROVIDER_virtual/bootloader ?= "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?= "u-boot-ti-staging"
 
-- 
2.17.1


