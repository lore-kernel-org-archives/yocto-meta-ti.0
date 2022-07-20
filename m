Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB05CC43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 21:01:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.2710.1658350893048785467
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 14:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pC0k3jYo;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26KL1Vhd130958;
	Wed, 20 Jul 2022 16:01:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658350891;
	bh=Bsm1EQGe4LroTCZ3JPU0IovaRsQjHMTjndXJwlPfSLo=;
	h=From:To:Subject:Date;
	b=pC0k3jYovibzD2aNj02DgbZ0hKDhJpPAEY1ckbRR9zhc97SJMugzetPjfM6IKO14u
	 vPlyzSBmJgwK3o4nQRh4rHvatTh/FvYOxCeB3G8swYZ7myIT2ZZaf4K0vXwHVPGouX
	 gnKuyf4tYhYj/896PBa9VHzJ7x3V9BARNctJ2Oko=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26KL1V4r039281
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Jul 2022 16:01:31 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Jul 2022 16:01:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Jul 2022 16:01:31 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26KL1Vfb029733;
	Wed, 20 Jul 2022 16:01:31 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oEGp1-000643-C7; Wed, 20 Jul 2022 16:01:31 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] kernel u-boot: Fix formulation of
 LOCALVERSION
Date: Wed, 20 Jul 2022 16:01:31 -0500
Message-ID: <20220720210131.23272-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 20 Jul 2022 21:01:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14891

devtool does not work with the current formulation of
the LOCALVERSION variables.  We need to use SRCPV to
avoid AUTOREV on bleeding builds, but there will be no
+ in the string, so we cannot split on that.  Just
use SRCPV directly.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc         | 2 +-
 recipes-kernel/linux/setup-defconfig.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index e7c93335..c2da2281 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -1,6 +1,6 @@
 # UBOOT_LOCALVERSION can be set to add a tag to the end of the
 # U-boot version string.  such as the commit id
-UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
+UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True)[:10]}"
 
 UBOOT_SUFFIX ?= "img"
 SPL_BINARY ?= "MLO"
diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
index 1e97acc0..08e9b638 100644
--- a/recipes-kernel/linux/setup-defconfig.inc
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -1,6 +1,6 @@
 # KERNEL_LOCALVERSION can be set to add a tag to the end of the
 # kernel version string.  such as the commit id
-KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
+KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True)[:10]}"
 
 # Check the defconfig file and see if it points to an in kernel
 # defconfig that should be used, or if it is a complete config file
-- 
2.17.1


