Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B2AC0218A
	for <webhook@archiver.kernel.org>; Sat, 18 Jan 2025 01:00:49 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.2939.1737162048402504134
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 17:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=j+243oCD;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50I10gYq279889
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 19:00:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737162042;
	bh=8nM2kfXnBb5de+DevDWD9/dT2oKRGygVouArfZprurs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=j+243oCDUW1XZs42tZKRub4SlnRFDVMsfd1h9XGBuvn+1VsNclJjBguJ6jMQCO9AU
	 v87PZcyhXR3EwSR7Z/QKFlCAq77NRW/gVBsepOab680fiuHDhwERn30SjByzJVQcBZ
	 IGbahcUrF0YpfUhpEWcEYg0OhE+x+akj4al/P63Q=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50I10grb113541
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Jan 2025 19:00:42 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 Jan 2025 19:00:42 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 Jan 2025 19:00:42 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50I10gEW117516;
	Fri, 17 Jan 2025 19:00:42 -0600
From: <rs@ti.com>
To: <matthias.schiffer@ew.tq-group.com>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCHv2 3/4] ti-bsp: select the graphics 24.2 packages
Date: Fri, 17 Jan 2025 19:00:31 -0600
Message-ID: <20250118010032.4092491-4-rs@ti.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250118010032.4092491-1-rs@ti.com>
References: <20250118010032.4092491-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 18 Jan 2025 01:00:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18204

From: Randolph Sapp <rs@ti.com>

Since this is new logic is in place, switch the k6.6 and k6.12 configs
to use these new libraries. Do not enable GFX on 6.12 just yet. Still
need some kernel patches on the SGX side.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 4bbe7668..1afc98dd 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -44,6 +44,11 @@ BSP_KERNEL_VERSION:bsp-ti-6_12 = "6.12%"
 BSP_BOOTLOADER_PROVIDER:bsp-ti-6_12 = "u-boot-ti-staging"
 BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2024.10%"
 
+BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_12 = "ti-img-rogue-driver"
+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_12 = "24%"
+BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_12 = "24%"
+BSP_MESA_PVR_VERSION:bsp-ti-6_12 = "24%"
+
 # GPU support requires out-of-tree SGX and Rogue drivers not available
 # in 6.12 yet
 MACHINE_FEATURES:remove:bsp-ti-6_12 = "gpu"
@@ -63,7 +68,7 @@ BSP_SGX_UMLIBS_VERSION:bsp-ti-6_6 = "1.17%"
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
 BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 = "24%"
-BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "23%"
+BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "24%"
 
 # ==========
 # ti-6_1
-- 
2.47.1


