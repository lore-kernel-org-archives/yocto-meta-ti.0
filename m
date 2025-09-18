Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25EBCAC5AC
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 13:28:53 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.14329.1758202126042224133
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 06:28:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fRCcZPTg;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58IDSiOY490967;
	Thu, 18 Sep 2025 08:28:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758202124;
	bh=UDbJof4Ed2ZbnkX+5YScntYA65/7fGu9skxNKVplOtg=;
	h=From:To:CC:Subject:Date;
	b=fRCcZPTgqyui9CUQrMIJdZrQQwCBwt218W+DuJ68behdOwxmekVR/yQgeshBlNozP
	 bAEObQx9cGi82K7S2Q/RnSUCyNpLT/+Wf3xHSApi7Oe90Tatqlbx03KooHGAHi/V7f
	 DJHlYpgTzD+ViNTMHiQPE2eQJkDzPqAWSa5goUqE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58IDSiPD2138923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 08:28:44 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 08:28:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 08:28:44 -0500
Received: from fllvem-mr07.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58IDShh4651606;
	Thu, 18 Sep 2025 08:28:43 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master][PATCH 1/5] ti-sgx-ddk-um: UM side driver depends on KM side driver
Date: Thu, 18 Sep 2025 08:28:38 -0500
Message-ID: <20250918132842.1183883-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Sep 2025 13:28:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19032

This also matches what is done for ti-img-rogue-umlibs.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb              | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
index 84a9afcf..af27981f 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
@@ -40,9 +40,7 @@ TARGET_PRODUCT:ti43x = "ti437x_linux"
 TARGET_PRODUCT:omap-a15 = "ti572x_linux"
 TARGET_PRODUCT:am65xx = "ti654x_linux"
 
-RDEPENDS:${PN} += "libdrm"
-
-RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
+RDEPENDS:${PN} += "libdrm ti-sgx-ddk-km"
 
 EXTRA_OEMAKE += "DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} ${PACKAGECONFIG_CONFARGS}"
 
-- 
2.39.2


