Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EFD2C021A8
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 23:48:35 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.8492.1739490506522732928
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2025 15:48:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KQ9y3FAY;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51DNmO9i4102446
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2025 17:48:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739490504;
	bh=wx3yZX9RtgjERtzQuGsL7iZAXTFXW0DfO2+9GXlduKs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KQ9y3FAYQnMqcbg8x4Y1JtzW8vkridRqJkCfM36WaUtKsYi30lD3pPzvunCxDNFhX
	 mIVGuVbP7UncnB5GoV0IpIyzvIIU6dp8oe0kC0mGEHqcgFDf2P5qtdk2iSUZUhpORF
	 TNQ0euMBedEZ3FMPTfhglpWZmL77VHDJAWpvr888=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51DNmObo087691
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Feb 2025 17:48:24 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Feb 2025 17:48:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Feb 2025 17:48:23 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51DNmNcO056749;
	Thu, 13 Feb 2025 17:48:23 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <detheridge@ti.com>
Subject: [meta-ti][scarthgap][PATCH 3/7] ti-bsp: select the graphics 24.2 packages
Date: Thu, 13 Feb 2025 17:48:09 -0600
Message-ID: <20250213234813.3618729-4-rs@ti.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213234813.3618729-1-rs@ti.com>
References: <20250213234813.3618729-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Feb 2025 23:48:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18314

From: Randolph Sapp <rs@ti.com>

Since this is new logic is in place, switch the k6.6 and k6.12 configs
to use these new libraries. Do not enable GFX on 6.12 just yet. Still
need some kernel patches on the SGX side.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index c3bdbcf8..796564b8 100644
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
@@ -69,7 +74,7 @@ BSP_SGX_UMLIBS_VERSION:bsp-ti-6_6 = "1.17%"
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
 BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 = "24%"
-BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "23%"
+BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "24%"
 
 # GC320 support requires out-of-tree drivers not yet available in 6.6
 MACHINE_FEATURES:remove:bsp-ti-6_6 = "gc320"
-- 
2.48.1


