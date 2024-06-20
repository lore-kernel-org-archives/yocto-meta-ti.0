Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F443C2BA1A
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 16:27:12 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.52135.1718900830643241211
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 09:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Tw3ld/u3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45KGR9IR006001;
	Thu, 20 Jun 2024 11:27:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718900829;
	bh=+rNc92G/VYPLs+I5gXoF58c2QGpY+cpz/2qQYC6d2gs=;
	h=From:To:Subject:Date;
	b=Tw3ld/u33MvmM+tUpG1Uitt9I4GskZSlxbHt3SEEkPZmmic9XGSUPlAtbl5F51OY4
	 KsO8ryWloRbFDjUHzxa5jihUoIu7aAsqC14LHA/rcT4Zkzr5/bfuqcTJgZWeH8St+T
	 Igv+SMbc27rvKDdkaQwoEzdmbSjHgnzGp/5uUuDs=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45KGR98u006444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jun 2024 11:27:09 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 11:27:08 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 11:27:08 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45KGR88i027857;
	Thu, 20 Jun 2024 11:27:08 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sKKcu-0005X1-MH; Thu, 20 Jun 2024 11:27:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] conf/machine, ti-bsp: Add support for next BSP provider
Date: Thu, 20 Jun 2024 11:27:08 -0500
Message-ID: <20240620162708.21223-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 16:27:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17775

For our upstream testing flow we have the need to have a "next" BSP for
configuring various settings based on building the latest kernel/uboot.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 953737a0..33611689 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -3,7 +3,7 @@
 # preferences for kernel, bootloader and graphics components, as
 # well as a dedicated machine override.
 
-# Supported options are: mainline, ti-6_6, ti-6_1, bb_org
+# Supported options are: mainline, next, ti-6_6, ti-6_1, bb_org
 TI_PREFERRED_BSP ??= "ti-6_6"
 
 # Use bsp-* namespace for overrides
@@ -22,6 +22,19 @@ BSP_BOOTLOADER_VERSION:bsp-mainline = "%"
 # in mainline, usually present in TI staging or derivative like BB.org
 MACHINE_FEATURES:remove:bsp-mainline = "gpu"
 
+# ==========
+# next
+# upcoming upstream/mainline kernel, u-boot
+# ==========
+BSP_KERNEL_PROVIDER:bsp-next = "linux-ti-next"
+BSP_KERNEL_VERSION:bsp-next = "%"
+BSP_BOOTLOADER_PROVIDER:bsp-next = "u-boot-ti-mainline"
+BSP_BOOTLOADER_VERSION:bsp-next = "%"
+
+# GPU support requires out-of-tree SGX and Rogue drivers not available
+# in next, usually present in TI staging or derivative like BB.org
+MACHINE_FEATURES:remove:bsp-next = "gpu"
+
 # ==========
 # ti-6_6
 # TI staging kernel 6.6, u-boot 2024.04
-- 
2.17.1


