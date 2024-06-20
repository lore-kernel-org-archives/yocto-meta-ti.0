Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6FBC2BA1A
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 16:27:32 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.52179.1718900845250677165
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Jun 2024 09:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gXx4F2lg;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45KGRO7r006039;
	Thu, 20 Jun 2024 11:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718900844;
	bh=EFK/I6fkny4LFryXxOUJE6XI6iOtNR+FCZL6Vrq0MYs=;
	h=From:To:Subject:Date;
	b=gXx4F2lg11jQyxF9SCXLV7sj6l5GrBDapplovbYPdj0xmGU2U+738X+ZTPCl0hCa6
	 Oq+Y9hM54IrO/My4uC9mAiqcjePKziOTkSEbxSj+uezel9f4PPdTXtu/JbPkNFIGSS
	 4DG8EH4pucDjCCmOC8XY73l4ghDDxFgBMb9WPnog=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45KGROBv040426
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jun 2024 11:27:24 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 11:27:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 11:27:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45KGROED028061;
	Thu, 20 Jun 2024 11:27:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sKKdA-0005YF-0W; Thu, 20 Jun 2024 11:27:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] j722s: next BSP doesn't support all SR and HS variants
Date: Thu, 20 Jun 2024 11:27:23 -0500
Message-ID: <20240620162723.21300-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Jun 2024 16:27:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17776

Adjust IMAGE_BOOT_FILES list as next BSP does not support all combinations
of SR1.0, HS-FS and HS-SE variants.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/j722s.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/conf/machine/include/j722s.inc
index 3c0717a0..7d4c167f 100644
--- a/meta-ti-bsp/conf/machine/include/j722s.inc
+++ b/meta-ti-bsp/conf/machine/include/j722s.inc
@@ -10,7 +10,9 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 IMAGE_BOOT_FILES += "tiboot3-j722s-hs-fs-evm.bin"
 
 # Since default tiboot3.bin on J722S is for HS-FS, add a version for HS-SE
-IMAGE_BOOT_FILES += "tiboot3-j722s-hs-evm.bin"
+IMAGE_SR1_HS_SE_FILES = "tiboot3-j722s-hs-evm.bin"
+IMAGE_SR1_HS_SE_FILES:bsp-next = ""
+IMAGE_BOOT_FILES += "${IMAGE_SR1_HS_SE_FILES}"
 
 TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
-- 
2.17.1


