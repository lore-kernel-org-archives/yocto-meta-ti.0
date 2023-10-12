Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D09CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 12:45:41 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.10111.1697114740530196490
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Oct 2023 05:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LW+H6RXJ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39CCjdOD027112
	for <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 07:45:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697114739;
	bh=3zhF7qzom5onkLxX+pDkLeA9dIS2Y+GIz4nH4Se+Cl8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LW+H6RXJngez6z4b3wd2YhBUxhL+cAUPftgEDwjUCQhEtur8ZPYaBnqtwW8eOlNqF
	 5O/GlAHooAbvrrILFkOsUpYv0j9U18ozFb3kM4pVOOryJnvqgvkL0wCQ6qV15qG7jE
	 FL2GwaM6VV0ZULq06E/SAXZ5+zGxUSuIMBwik1OA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39CCjdtR038374
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 07:45:39 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Oct 2023 07:45:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Oct 2023 07:45:38 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39CCjYqA014631;
	Thu, 12 Oct 2023 07:45:37 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <minas@ti.com>, <s-vadapalli@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/2] kernel-rdepends: Removing ti-eth-fw for j721e,j7200,j784s4
Date: Thu, 12 Oct 2023 18:15:01 +0530
Message-ID: <20231012124501.1338975-2-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012124501.1338975-1-a-limaye@ti.com>
References: <20231012124501.1338975-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Oct 2023 12:45:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17094

The ti-eth-fw binaries are tested at the SDK level and should be added
there instead... Removing from here to have the ipc binaries as default

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
index 266a7ef5..0f0405fb 100644
--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
@@ -31,8 +31,3 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " vxd-dec-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 = " cnm-wave-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 = " cnm-wave-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62axx = " cnm-wave-fw"
-
-# Add run-time dependency for TI ETH firmware to the rootfs
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " ti-eth-fw"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7200 = " ti-eth-fw"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 = " ti-eth-fw"
-- 
2.34.1


