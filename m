Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371E9EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:52:20 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9715.1689691932262587510
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 07:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ODHb36rS;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 36IEqAA5087086;
	Tue, 18 Jul 2023 09:52:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1689691930;
	bh=8y/0tKxmYhYF/79l21jefcPPrB1evkFOQbdxmosHV/E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ODHb36rSjVOPzgzGe/EJ4BftlY4soVAR4DiEmg9fqv89h3WnJY4tOlP00mjsCVZ8z
	 EwBoMa9ENPzLS2VA+Vm3hS/M3dYPSlqzP/P9wFfM0XYXVst+rjvOU5UVTl1Rkalh3Y
	 zFY/iKCEHx90Q/S/noEca9N1dektca9GhmY9Zgss=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 36IEqAEv016203
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Jul 2023 09:52:10 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jul 2023 09:52:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jul 2023 09:52:10 -0500
Received: from lelv0327.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 36IEq9Na005203;
	Tue, 18 Jul 2023 09:52:10 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 3/3] conf: machine: am65xx: Remove SYSFW_SUFFIX from non-k3r5 configs
Date: Tue, 18 Jul 2023 09:52:08 -0500
Message-ID: <20230718145208.18584-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718145208.18584-1-afd@ti.com>
References: <20230718145208.18584-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Jul 2023 14:52:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16851

This definition is only needed in the "-k3r5" multiconfig files.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/am65xx-evm.conf    | 2 --
 meta-ti-bsp/conf/machine/am65xx-hs-evm.conf | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am65xx-evm.conf b/meta-ti-bsp/conf/machine/am65xx-evm.conf
index 63f2ecc5..8b6ef546 100644
--- a/meta-ti-bsp/conf/machine/am65xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-evm.conf
@@ -2,8 +2,6 @@
 #@NAME: AM65xx EVM
 #@DESCRIPTION: Machine configuration for the TI AM65xx EVM
 
-SYSFW_SUFFIX = "gp"
-
 require conf/machine/include/am65xx.inc
 
 UBOOT_MACHINE = "am65x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
index 3c6a1574..0addec90 100644
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
@@ -2,8 +2,6 @@
 #@NAME: AM65xx HS EVM
 #@DESCRIPTION: Machine configuration for the TI AM65xx HS EVM
 
-SYSFW_SUFFIX = "hs"
-
 require conf/machine/include/am65xx.inc
 
 UBOOT_MACHINE = "am65x_hs_evm_a53_defconfig"
-- 
2.39.2


