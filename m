Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EDA5E67485
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 20:50:00 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.22905.1730407797263182551
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 31 Oct 2024 13:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pSuU3iER;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49VKnuta079654;
	Thu, 31 Oct 2024 15:49:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730407796;
	bh=0tYehrp6ALjLrNY7T+FHqD+qBkmu5Hxalz1272i8S1Q=;
	h=From:To:Subject:Date;
	b=pSuU3iER1yM2C1V/h8Mg/S+ztaSIfetkQLEMp928m488/ZMhQokC4e/+i1MYsdqL0
	 q3MYPkdyOEIVl3lLusH8uJRR7zAKr2ApfOYi41HZVjHwkvMT9/kLf4zp5whUbHFu70
	 Fdr6dpgx5tTZMflk08t/QQg3xYHLmWqGZmTDjIEU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49VKnupm034938;
	Thu, 31 Oct 2024 15:49:56 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 31
 Oct 2024 15:49:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 31 Oct 2024 15:49:55 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49VKntKu040764;
	Thu, 31 Oct 2024 15:49:55 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1t6c79-00069F-IK; Thu, 31 Oct 2024 15:49:55 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] ti-bsp: Tighten up versions for PREFERRED_VERSION
Date: Thu, 31 Oct 2024 15:49:55 -0500
Message-ID: <20241031204955.23594-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 31 Oct 2024 20:50:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18030

PREFERRED_VERSION matches against the PV in the recipe, not against the
file name.  With the upcoming 6.12, the 6.1 kernel version string was a
little too loose. The "6.1%" could glob onto the 6.12 recipe.  Take
this time to also clean up a couple of the other versions and narrow
them down.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 2eb3bd19..d27bbe3c 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -53,7 +53,7 @@ MACHINE_FEATURES:remove:bsp-ti-6_12 = "gpu"
 # TI staging kernel 6.6, u-boot 2024.04
 # ==========
 BSP_KERNEL_PROVIDER:bsp-ti-6_6 = "linux-ti-staging"
-BSP_KERNEL_VERSION:bsp-ti-6_6 = "6.6%"
+BSP_KERNEL_VERSION:bsp-ti-6_6 = "6.6.%"
 BSP_BOOTLOADER_PROVIDER:bsp-ti-6_6 = "u-boot-ti-staging"
 BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024.04%"
 
@@ -68,9 +68,9 @@ BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "23%"
 # TI staging kernel 6.1, u-boot 2023.04
 # ==========
 BSP_KERNEL_PROVIDER:bsp-ti-6_1 = "linux-ti-staging"
-BSP_KERNEL_VERSION:bsp-ti-6_1 = "6.1%"
+BSP_KERNEL_VERSION:bsp-ti-6_1 = "6.1.%"
 BSP_BOOTLOADER_PROVIDER:bsp-ti-6_1 = "u-boot-ti-staging"
-BSP_BOOTLOADER_VERSION:bsp-ti-6_1 = "2023%"
+BSP_BOOTLOADER_VERSION:bsp-ti-6_1 = "2023.04%"
 
 BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_1 = "ti-sgx-ddk-km"
 BSP_SGX_DRIVER_VERSION:bsp-ti-6_1 = "1.17%"
-- 
2.17.1


