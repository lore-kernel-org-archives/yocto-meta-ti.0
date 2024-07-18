Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB3EC3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 07:58:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.10183.1721289497951028881
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Jul 2024 00:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=I4Fh0qoY;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46I7wHGd035579
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 02:58:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721289497;
	bh=FxlwxTfgdSAUEJ7QPbvJSyD3r4lv3+GP6Thl+VlzGJc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=I4Fh0qoYbHxcH7UfkjyIib0C6X9jsRY3DPIfpSTmCt+EfJz6dEXa/eHfmPNs/JRWi
	 Wbu8tWbE6bIrtahf0F5xLQaLOOhxzD50bQavhAAZ4RXLCR8NTXM8oss/3WBhNCDYmi
	 wcTwZcn9oVvGZ/HAHAm9jQ2eq8JDfieJUFeGBVZg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46I7wHo3112147
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 02:58:17 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 Jul 2024 02:58:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 Jul 2024 02:58:17 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46I7tY0P086409;
	Thu, 18 Jul 2024 02:58:15 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <m-chawdhry@ti.com>, <n-francis@ti.com>,
        <u-kumar1@ti.com>, <detheridge@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2 3/3] meta-ti-bsp: j742s2: add Rogue GPU driver to machine definition
Date: Thu, 18 Jul 2024 13:25:29 +0530
Message-ID: <20240718075526.1427615-4-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718075526.1427615-1-a-limaye@ti.com>
References: <20240718075526.1427615-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Jul 2024 07:58:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17885

Add ti-img-rogue-driver as the preferred provider and enable the gpu
driver in the image.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
Changes in v2:
- Use the new BSP support framework instead of setting GPU driver
  explicitly
---
 meta-ti-bsp/conf/machine/include/j742s2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/j742s2.inc b/meta-ti-bsp/conf/machine/include/j742s2.inc
index b7d87112..aad7a768 100644
--- a/meta-ti-bsp/conf/machine/include/j742s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j742s2.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append = ":j742s2"
 MACHINE_FEATURES += "screen gpu"
 
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 # Default tiboot3.bin on J742S2 is for HS-FS
 IMAGE_BOOT_FILES += "tiboot3-j742s2-hs-fs-evm.bin"
-- 
2.34.1


