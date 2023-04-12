Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF849C77B78
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 18:42:48 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.418.1681324965019107165
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 11:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YaufrakI;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33CIgi2l011802;
	Wed, 12 Apr 2023 13:42:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681324964;
	bh=XsEsdIGMGAAqqA2KoG29B3LFaVEvegTAFE5aXnjNAzE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YaufrakILHQZObviNsaNEMI3ctKmczsDiG9o8KOKz0vNP8rkzuCJJcG5Sw7RTsxuj
	 T3LJ1W5h6pdUvFrHKFvMNGuA3mUt4WC4paStoVBfZqzM89NpbXgiAsecBsVgFdnlw0
	 UeRRTUVuKkSC2UnglqF4itXATxjhuavZ/HbiBcwk=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33CIgi99036795
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Apr 2023 13:42:44 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 12
 Apr 2023 13:42:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 12 Apr 2023 13:42:43 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33CIggZX023440;
	Wed, 12 Apr 2023 13:42:43 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 3/6] ti-sgx-ddk-km: Be specific on supported K3 machines
Date: Wed, 12 Apr 2023 13:42:39 -0500
Message-ID: <20230412184242.29743-3-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412184242.29743-1-afd@ti.com>
References: <20230412184242.29743-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Apr 2023 18:42:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16377

Of the K3 family only the AM65x device is currently supported by this
driver. COMPATIBLE_MACHINE should match.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index 13b8757c..dcceed69 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -7,7 +7,7 @@ inherit module
 
 PROVIDES = "virtual/gpudriver"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|am65xx"
 
 MACHINE_KERNEL_PR:append = "x"
 PR = "${MACHINE_KERNEL_PR}"
@@ -27,7 +27,7 @@ SRCREV = "eda7780bfd5277e16913c9bc0b0e6892b4e79063"
 TARGET_PRODUCT:omap-a15 = "jacinto6evm"
 TARGET_PRODUCT:ti33x = "ti335x"
 TARGET_PRODUCT:ti43x = "ti437x"
-TARGET_PRODUCT:k3 = "ti654x"
+TARGET_PRODUCT:am65xx = "ti654x"
 
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT} WINDOW_SYSTEM=nulldrmws'
 
-- 
2.39.2


