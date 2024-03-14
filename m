Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B47AC54E5D
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 15:29:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.15889.1710430148628648846
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 08:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AJOwZ12M;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42EFT8L8019474
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 10:29:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710430148;
	bh=VvCGZWIHq0QlzvDtCiRVVpRoig4ATUyw8tUpOQq3v0Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AJOwZ12Ml5q9HWPUleLE/000ygkh6lsVUZq9FYYaAsqnR2dKoTvszQFljUwPcVfqC
	 BdIfg/BGlLZIZTEi0AqAnk9yqeF21XpTR+fnbR0xI7XlXk46VrHH7Jq7XtN1SWhUI/
	 NkZ9+7+yhr5e7sWNT/BwXfX1nKrif+aS5XVxP00g=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42EFT8Cr053717
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 10:29:08 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Mar 2024 10:29:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Mar 2024 10:29:08 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42EFT2O7081019;
	Thu, 14 Mar 2024 10:29:06 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <n-francis@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][kirkstone][PATCH 2/2] conf: machine: j7200: Add support for HSSE1.0 and HSFS1.0
Date: Thu, 14 Mar 2024 20:58:55 +0530
Message-ID: <20240314152855.499510-3-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240314152855.499510-1-a-limaye@ti.com>
References: <20240314152855.499510-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 15:29:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17529

Latest ti-u-boot will be supporting HSSE1.0 and HSFS1.0 versions of the
j7200 soc through the binman dts nodes. Add support in yocto to package
the created binaries in the wic images.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/conf/machine/include/j7200.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
index 66a07da8..caa79876 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -4,6 +4,12 @@ SOC_FAMILY:append = ":j7200"
 # Default tiboot3.bin on J7200 is for GP
 IMAGE_BOOT_FILES += "tiboot3-j7200-gp-evm.bin"
 
+# Since default tiboot3.bin on J7200 is for GP, add a version for SR1.0 HS-FS
+IMAGE_BOOT_FILES += "tiboot3-j7200-hs-fs-evm.bin"
+
+# Since default tiboot3.bin on J7200 is for GP, add a version for SR1.0 HS-SE
+IMAGE_BOOT_FILES += "tiboot3-j7200-hs-evm.bin"
+
 # Since default tiboot3.bin on J7200 is for GP, add a version for SR2.0 HS-FS
 IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-fs-evm.bin"
 
-- 
2.34.1


