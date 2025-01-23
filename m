Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0905FC0218F
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 01:08:37 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.1256.1737594510571793486
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2025 17:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MyhzVGew;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50N18TuL289161
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jan 2025 19:08:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737594509;
	bh=cbAifbTKxx5oQs3yRAhaQNeY5OcxuqbjHgVGrOyH9gE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MyhzVGewFWcjvJXUnyYZV4JfCVxNAK7H43U49fr6XPUO3prlj2kFYZ7d6DEYAkQ24
	 cmIxMsr1JBLmN0Tsjg/uv7L9+bdb6HEtXPoshDlQcJMDx2saEBDAXsIKlniqijjOD1
	 W07DoTw1bPeom+BJE07QJ6Ek6UKT7Du+7JclAeh0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50N18Tix012920
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Jan 2025 19:08:29 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Jan 2025 19:08:29 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Jan 2025 19:08:29 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50N18RUB079409;
	Wed, 22 Jan 2025 19:08:29 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-ti][master][PATCHv3 3/4] ti-bsp: select the graphics 24.2 packages
Date: Wed, 22 Jan 2025 19:08:18 -0600
Message-ID: <20250123010819.2798518-4-rs@ti.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123010819.2798518-1-rs@ti.com>
References: <20250123010819.2798518-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Jan 2025 01:08:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18228

From: Randolph Sapp <rs@ti.com>

Since this is new logic is in place, switch the k6.6 and k6.12 configs
to use these new libraries. Do not enable GFX on 6.12 just yet. Still
need some kernel patches on the SGX side.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 0d519671..1e84d0fb 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -50,6 +50,11 @@ BSP_KERNEL_VERSION:bsp-ti-6_12 = "6.12%"
 BSP_BOOTLOADER_PROVIDER:bsp-ti-6_12 = "u-boot-ti-staging"
 BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2025.01%"
 
+BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_12 = "ti-img-rogue-driver"
+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 = "24%"
+BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_12 = "24%"
+BSP_MESA_PVR_VERSION:bsp-ti-6_12 = "24%"
+
 # GPU support requires out-of-tree SGX and Rogue drivers not available
 # in 6.12 yet
 MACHINE_FEATURES:remove:bsp-ti-6_12 = "gpu"
@@ -72,7 +77,7 @@ BSP_SGX_UMLIBS_VERSION:bsp-ti-6_6 = "1.17%"
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
 BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 = "24%"
-BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "23%"
+BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "24%"
 
 # GC320 support requires out-of-tree drivers not yet available in 6.6
 MACHINE_FEATURES:remove:bsp-ti-6_6 = "gc320"
-- 
2.47.1


