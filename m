Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6F5CF884C
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 15:19:05 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.24480.1728055139209725672
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Oct 2024 08:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Fracu478;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 494FIvmJ079702;
	Fri, 4 Oct 2024 10:18:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728055137;
	bh=06Ok04HrezyX8g0GDuvb23usb6MTZJiWIC9TW94HRVc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Fracu478dd3uCzCYz+rzuGm7qRXS+jDGFeerCsrkPnfVAkcC103x6mfZF/sBO/e3V
	 iPANEpOYQV5O9uQtiQwyqeLp2wha1u5libkCn2mv/VHiAFm0nNEj8xK0Z5qai8jb1O
	 iGxoJrCLU3HqsUj/0QjPf47WOUwUMlKy5ga208xw=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 494FIvmm045406
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Oct 2024 10:18:57 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 4
 Oct 2024 10:18:57 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Oct 2024 10:18:57 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 494FIvpw063149;
	Fri, 4 Oct 2024 10:18:57 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1swk53-0006PL-CS; Fri, 04 Oct 2024 10:18:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH 3/4] ti-bsp: Add ti-6_12
Date: Fri, 4 Oct 2024 10:18:56 -0500
Message-ID: <20241004151857.24578-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241004151857.24578-1-reatmon@ti.com>
References: <20241004151857.24578-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Oct 2024 15:19:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17981

Add new BSP for the 6.12 kernel and u-boot 2024.10 versions.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 33611689..9a15e164 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -35,6 +35,19 @@ BSP_BOOTLOADER_VERSION:bsp-next = "%"
 # in next, usually present in TI staging or derivative like BB.org
 MACHINE_FEATURES:remove:bsp-next = "gpu"
 
+# ==========
+# ti-6_12
+# TI staging kernel 6.12, u-boot 2024.10
+# ==========
+BSP_KERNEL_PROVIDER:bsp-ti-6_12 = "linux-ti-staging"
+BSP_KERNEL_VERSION:bsp-ti-6_12 = "6.12%"
+BSP_BOOTLOADER_PROVIDER:bsp-ti-6_12 = "u-boot-ti-staging"
+BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2024.10%"
+
+# GPU support requires out-of-tree SGX and Rogue drivers not available
+# in 6.12 yet
+MACHINE_FEATURES:remove:bsp-next = "gpu"
+
 # ==========
 # ti-6_6
 # TI staging kernel 6.6, u-boot 2024.04
@@ -42,7 +55,7 @@ MACHINE_FEATURES:remove:bsp-next = "gpu"
 BSP_KERNEL_PROVIDER:bsp-ti-6_6 = "linux-ti-staging"
 BSP_KERNEL_VERSION:bsp-ti-6_6 = "6.6%"
 BSP_BOOTLOADER_PROVIDER:bsp-ti-6_6 = "u-boot-ti-staging"
-BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024%"
+BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024.04%"
 
 # Only Rogue is enabled so far, SGX falls back to SW rendering
 BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
-- 
2.17.1


