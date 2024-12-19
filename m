Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D02FE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 15:16:44 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.131045.1734621401554003876
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 07:16:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wA0lS5wn;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJFGePt326207
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 19 Dec 2024 09:16:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734621400;
	bh=jVYiz+Zu7ohPAZvVrDEXNeqPsBPY/C4bZbeqEU/ASQk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=wA0lS5wn1614HNaM0tSv4rFSGPM+1EHtrRXm7yF7OE46DKMTRqXToslU7FexLNLqE
	 DtKPUw8eOlQJ/H61cm7n36XTvnYTwe+SUnIQlzckRHdec9JlFjHyoIP6+jyGQIkDhK
	 q7A1DVuAhtBKdYeEVTCX1oHpFMxY2cVOw41bBf5I=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJFGe2s086222;
	Thu, 19 Dec 2024 09:16:40 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 09:16:39 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 09:16:39 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJFGdr5102260;
	Thu, 19 Dec 2024 09:16:39 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOIGV-0008TB-Lh; Thu, 19 Dec 2024 09:16:39 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] u-boot-ti-staging: Move 2024.10 to 2025.01 for ltsprep
Date: Thu, 19 Dec 2024 09:16:39 -0600
Message-ID: <20241219151639.32515-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219151639.32515-1-reatmon@ti.com>
References: <20241219151639.32515-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 15:16:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18145

We are moving to 2025.01 for the next LTS, so rename the previous ltsprep
recipe and update it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc                   | 4 ++--
 ...oot-ti-staging_2024.10.bb => u-boot-ti-staging_2025.01.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-ti-bsp/recipes-bsp/u-boot/{u-boot-ti-staging_2024.10.bb => u-boot-ti-staging_2025.01.bb} (64%)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 814c6ca8..6549ff73 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -37,12 +37,12 @@ MACHINE_FEATURES:remove:bsp-next = "gpu"
 
 # ==========
 # ti-6_12
-# TI staging kernel 6.12, u-boot 2024.10
+# TI staging kernel 6.12, u-boot 2025.01
 # ==========
 BSP_KERNEL_PROVIDER:bsp-ti-6_12 = "linux-ti-staging"
 BSP_KERNEL_VERSION:bsp-ti-6_12 = "6.12%"
 BSP_BOOTLOADER_PROVIDER:bsp-ti-6_12 = "u-boot-ti-staging"
-BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2024.10%"
+BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2025.01%"
 
 # GPU support requires out-of-tree SGX and Rogue drivers not available
 # in 6.12 yet
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
similarity index 64%
rename from meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb
rename to meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 46536877..e71008fa 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -6,6 +6,6 @@ include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
 
 PR = "r0"
 
-BRANCH = "ti-u-boot-2024.10"
+BRANCH = "ti-u-boot-2025.01"
 
-SRCREV = "f919c3a889f0ec7d63a48b5d0ed064386b0980bd"
+SRCREV = "b841e559cd26ffcb20f22e8ee75debed9616c002"
-- 
2.17.1


