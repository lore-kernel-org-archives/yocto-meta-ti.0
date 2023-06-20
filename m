Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25098EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 21:18:40 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1659.1687295917557337757
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 14:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eHsROLqH;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35KLIaVQ000864;
	Tue, 20 Jun 2023 16:18:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687295916;
	bh=ArjqZdsAtModMNr3RMAgxOvA7wT4siB8DIIiuq53k+g=;
	h=From:To:Subject:Date;
	b=eHsROLqHYJHFwquKHw4EpfL7KKxPBh06gj97Q6OYqIaWhBL1FsACm9CKUFxpavgIT
	 6SBgFxULZGl4dwbVmhTOBm26bmDqoDqQq06IDofmsd/QY+7/qoCJRSrzOSqaNpPvHh
	 +cw5wrPTDoe0K3i/D+x0I2mymIgFKsE/9LqS3gBI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35KLIa6l019123
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Jun 2023 16:18:36 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Jun 2023 16:18:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Jun 2023 16:18:35 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35KLIZvw121133;
	Tue, 20 Jun 2023 16:18:35 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qBikF-0008IZ-Po; Tue, 20 Jun 2023 16:18:35 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH v2] kernel-rdepends: Add ti-eth-fw as an RDEPENDS
Date: Tue, 20 Jun 2023 16:18:35 -0500
Message-ID: <20230620211835.31859-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 20 Jun 2023 21:18:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16752

When the ti-eth-fw recipe was split out from the ti-rtos-firmware recipe
we forgot to add it as a dependency.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Changed the overrides to just the platforms that match and not k3.

 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
index 18984e80..d2dcc3e5 100644
--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
@@ -31,3 +31,8 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " vxd-dec-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 = " cnm-wave-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 = " cnm-wave-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62axx = " cnm-wave-fw"
+
+# Add run-time dependency for TI ETH firmware to the rootfs
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " ti-eth-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7200 = " ti-eth-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 = " ti-eth-fw"
-- 
2.17.1


