Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE35CEDD94
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 13:44:11 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.16713.1728481450193333144
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 06:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=g2gWEKXD;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 499Di8SS030326;
	Wed, 9 Oct 2024 08:44:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728481448;
	bh=LH4RYs53wS1oHGlY8698kwU0d7TYG+SpQ921kVhyB68=;
	h=From:To:Subject:Date;
	b=g2gWEKXDzkejDewOfN3/Y+ZdraxrOX/hMQ9R7mlQOf1EGPojG4EwJsIQiP/EZRg/g
	 E16/A/hDgU4y+HcGr8s79Cx6A/4GUHAiHkufyekeR3v6L1eoPUmy+ZUmAc0HAVWMiO
	 nhJUyiDkosJPFWL0gkf1yne64Qy/N7Rp1v+DawUo=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 499Di8FP009146;
	Wed, 9 Oct 2024 08:44:08 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Oct 2024 08:44:08 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Oct 2024 08:44:08 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 499Di815045007;
	Wed, 9 Oct 2024 08:44:08 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1syWz2-0002Bl-6F; Wed, 09 Oct 2024 08:44:08 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v2] ti-bsp: Add RT and systest support
Date: Wed, 9 Oct 2024 08:44:08 -0500
Message-ID: <20241009134408.8374-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 09 Oct 2024 13:44:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17999

We were missing controlling the versions for linux-ti-staging-rt and
linux-ti-staging-systest using the BSP framework.  Since the
PREFERRED_VERSION is not tied to the virtual/kernel we need two
additional settings for those alternate kernel package names.

For BSPs that do not have the -rt and -systest recipes then the two
new variable settings should effectively be ignored and case no issues.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Remove the extra variables and just set PREFERRED_VERSION.

 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 4cb2aab4..0c8f657d 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -122,6 +122,8 @@ BSP_MESA_PVR_VERSION ?= ""
 # ==========
 PREFERRED_PROVIDER_virtual/kernel ?= "${BSP_KERNEL_PROVIDER}"
 PREFERRED_VERSION_${BSP_KERNEL_PROVIDER} ?= "${BSP_KERNEL_VERSION}"
+PREFERRED_VERSION_${BSP_KERNEL_PROVIDER}-rt ?= "${BSP_KERNEL_VERSION}"
+PREFERRED_VERSION_${BSP_KERNEL_PROVIDER}-systest ?= "${BSP_KERNEL_VERSION}"
 PREFERRED_PROVIDER_virtual/bootloader ?= "${BSP_BOOTLOADER_PROVIDER}"
 PREFERRED_PROVIDER_u-boot ?= "${BSP_BOOTLOADER_PROVIDER}"
 PREFERRED_VERSION_${BSP_BOOTLOADER_PROVIDER} ?= "${BSP_BOOTLOADER_VERSION}"
-- 
2.17.1


