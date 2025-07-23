Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB78FC83F17
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 21:16:21 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.1612.1753305375968295410
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Jul 2025 14:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rG31sHUI;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56NLGE3x1350623;
	Wed, 23 Jul 2025 16:16:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753305374;
	bh=7HJ5N5gwFmxqtO5zibPUWUhOZ1SPIyi8jF0HWGC4iDI=;
	h=From:To:Subject:Date;
	b=rG31sHUIw65ECN1fACcqSDwQFRce1hx1gUSMO1uvukPylVLR7QXMn6kcqmVRiyDV1
	 QSa4+m0dtODYkVSQ0m4+pOdNeiSI+iQp+T/9Zh2Qq+a9USDuE1Hqv5tr38ebDrV34A
	 mQcsyLaLVUKP8toq91hw/zSX8se2ryYtAJ0v8poU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56NLGELY1003232
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 23 Jul 2025 16:16:14 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 23
 Jul 2025 16:16:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 23 Jul 2025 16:16:14 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56NLGEsD3300608;
	Wed, 23 Jul 2025 16:16:14 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uegov-0004DR-UT; Wed, 23 Jul 2025 16:16:13 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 1/3] conf: machine: am64xx: Cleanup assignment whitespace
Date: Wed, 23 Jul 2025 16:16:11 -0500
Message-ID: <20250723211613.16164-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Jul 2025 21:16:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18816

A recent change in bitbake requires that all variable assignments have
whitespace between the variable, the operator and the value.

FOO = "1"

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/am64xx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 56b56afe..27165547 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -35,4 +35,4 @@ OPTEEMACHINE = "k3-am64x"
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw"
 
-TI_WKS_BOOTLOADER_APPEND="console=ttyS2,115200n8"
+TI_WKS_BOOTLOADER_APPEND = "console=ttyS2,115200n8"
-- 
2.17.1


