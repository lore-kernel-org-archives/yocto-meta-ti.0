Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B70C25B6F
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 22:22:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.27992.1698445334355545441
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Oct 2023 15:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=g/xsyXSZ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39RMMC0t044002;
	Fri, 27 Oct 2023 17:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698445332;
	bh=2MYXWif7gmih756DdqBV8qvCnX1Biyu6nA3SHCdV/rI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=g/xsyXSZYH5exvv85xct1XeYNc2KKTVIk51rEPuSModgU85ZS+KlJKHA3oVGsMcUU
	 Nf6GScesshCbe0wX2qbTMMG/ZodJ+v+67iEquJ7EyuEWJuBX2ZUGhNgN73WjWIgSpO
	 keaJOD4EO5PNCo40CMHAw4foyybdVvqtHfM8XRy8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39RMMC3R018141
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Oct 2023 17:22:12 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 27
 Oct 2023 17:22:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 27 Oct 2023 17:22:12 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39RMMBQR014476;
	Fri, 27 Oct 2023 17:22:12 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>,
        Randolph Sapp
	<rs@ti.com>
Subject: [meta-ti][kirkstone][PATCH 4/4] am62pxx: set default gpudriver to ti-img-rogue-driver
Date: Fri, 27 Oct 2023 17:22:00 -0500
Message-ID: <20231027222200.3659634-5-rs@ti.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231027222200.3659634-1-rs@ti.com>
References: <20231027222200.3659634-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Oct 2023 22:22:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17216

From: Randolph Sapp <rs@ti.com>

Enable the GPU on the am62pxx-evm machine target.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62pxx.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/conf/machine/include/am62pxx.inc
index d61ad62b..694a192c 100644
--- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append = ":am62pxx"
 MACHINE_FEATURES += "screen gpu"
 
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 
 # Default tiboot3.bin on AM62Px is for HS-FS
 IMAGE_BOOT_FILES += "tiboot3-am62px-hs-fs-evm.bin"
-- 
2.42.0


