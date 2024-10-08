Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20078CEFC2E
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 16:33:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.223.1728405211305773515
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 09:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=djxErvu9;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 498GXTLl118174;
	Tue, 8 Oct 2024 11:33:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728405209;
	bh=ZOWLwb1x/c7+lmy6xvCgg3uFyxf/NwaGzf5BaZHRP7Q=;
	h=From:To:Subject:Date;
	b=djxErvu9+QrhJWLwfwEt6BmdFwa8ooNszwKocve5fMKJor3b+kT0IEGaFR47RYnuZ
	 Id+I703wNqLRptqdq3tmrBM6OhTdvVyk01tqbTVNtAlZecosZxLzcMZZH0IrSFBGjD
	 36/8Ox9AIQuk2cU5IXRsPkfYO9zUYjwShKtsxkfA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 498GXTIu015547
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Oct 2024 11:33:29 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Oct 2024 11:33:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Oct 2024 11:33:29 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 498GXTmn056113;
	Tue, 8 Oct 2024 11:33:29 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1syD9N-0006Ko-1v; Tue, 08 Oct 2024 11:33:29 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] ti-bsp: Add RT and systest support
Date: Tue, 8 Oct 2024 11:33:29 -0500
Message-ID: <20241008163329.24214-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Oct 2024 16:33:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17984

We were missing controlling the versions for linux-ti-staging-rt and
linux-ti-staging-systest using the BSP framework.  Since the
PREFERRED_VERSION is not tied to the virtual/kernel we need two
additional settings for those alternate kernel package names.  For BSPs
that do not support the RT and systest variants, just set their name to
the main kernel package.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/ti-bsp.inc | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 9a15e164..96321e03 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -14,6 +14,8 @@ MACHINEOVERRIDES =. "bsp-${TI_PREFERRED_BSP}:"
 # latest upstream/mainline kernel, u-boot
 # ==========
 BSP_KERNEL_PROVIDER:bsp-mainline = "linux-ti-mainline"
+BSP_KERNEL_RT_PROVIDER:bsp-mainline = "linux-ti-mainline"
+BSP_KERNEL_SYSTEST_PROVIDER:bsp-mainline = "linux-ti-mainline"
 BSP_KERNEL_VERSION:bsp-mainline = "%"
 BSP_BOOTLOADER_PROVIDER:bsp-mainline = "u-boot-ti-mainline"
 BSP_BOOTLOADER_VERSION:bsp-mainline = "%"
@@ -27,6 +29,8 @@ MACHINE_FEATURES:remove:bsp-mainline = "gpu"
 # upcoming upstream/mainline kernel, u-boot
 # ==========
 BSP_KERNEL_PROVIDER:bsp-next = "linux-ti-next"
+BSP_KERNEL_RT_PROVIDER:bsp-next = "linux-ti-next"
+BSP_KERNEL_SYSTEST_PROVIDER:bsp-next = "linux-ti-next"
 BSP_KERNEL_VERSION:bsp-next = "%"
 BSP_BOOTLOADER_PROVIDER:bsp-next = "u-boot-ti-mainline"
 BSP_BOOTLOADER_VERSION:bsp-next = "%"
@@ -40,6 +44,8 @@ MACHINE_FEATURES:remove:bsp-next = "gpu"
 # TI staging kernel 6.12, u-boot 2024.10
 # ==========
 BSP_KERNEL_PROVIDER:bsp-ti-6_12 = "linux-ti-staging"
+BSP_KERNEL_RT_PROVIDER:bsp-ti-6_12 = "linux-ti-staging-rt"
+BSP_KERNEL_SYSTEST_PROVIDER:bsp-ti-6_12 = "linux-ti-staging-systest"
 BSP_KERNEL_VERSION:bsp-ti-6_12 = "6.12%"
 BSP_BOOTLOADER_PROVIDER:bsp-ti-6_12 = "u-boot-ti-staging"
 BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2024.10%"
@@ -53,6 +59,8 @@ MACHINE_FEATURES:remove:bsp-next = "gpu"
 # TI staging kernel 6.6, u-boot 2024.04
 # ==========
 BSP_KERNEL_PROVIDER:bsp-ti-6_6 = "linux-ti-staging"
+BSP_KERNEL_RT_PROVIDER:bsp-ti-6_6 = "linux-ti-staging-rt"
+BSP_KERNEL_SYSTEST_PROVIDER:bsp-ti-6_6 = "linux-ti-staging-systest"
 BSP_KERNEL_VERSION:bsp-ti-6_6 = "6.6%"
 BSP_BOOTLOADER_PROVIDER:bsp-ti-6_6 = "u-boot-ti-staging"
 BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024.04%"
@@ -68,6 +76,8 @@ BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "23%"
 # TI staging kernel 6.1, u-boot 2023.04
 # ==========
 BSP_KERNEL_PROVIDER:bsp-ti-6_1 = "linux-ti-staging"
+BSP_KERNEL_RT_PROVIDER:bsp-ti-6_1 = "linux-ti-staging-rt"
+BSP_KERNEL_SYSTEST_PROVIDER:bsp-ti-6_1 = "linux-ti-staging-systest"
 BSP_KERNEL_VERSION:bsp-ti-6_1 = "6.1%"
 BSP_BOOTLOADER_PROVIDER:bsp-ti-6_1 = "u-boot-ti-staging"
 BSP_BOOTLOADER_VERSION:bsp-ti-6_1 = "2023%"
@@ -87,6 +97,8 @@ BSP_MESA_PVR_VERSION:bsp-ti-6_1 = "22%"
 # but may not be up-to-date with TI version
 # ==========
 BSP_KERNEL_PROVIDER:bsp-bb_org = "linux-bb.org"
+BSP_KERNEL_RT_PROVIDER:bsp-bb_org = "linux-bb.org"
+BSP_KERNEL_SYSTEST_PROVIDER:bsp-bb_org = "linux-bb.org"
 BSP_KERNEL_VERSION:bsp-bb_org = "%"
 BSP_BOOTLOADER_PROVIDER:bsp-bb_org = "u-boot-bb.org"
 BSP_BOOTLOADER_VERSION:bsp-bb_org = "%"
@@ -105,6 +117,8 @@ BSP_MESA_PVR_VERSION:bsp-bb_org = "22%"
 # use default preference TI staging and SW-rendering graphics
 # ==========
 BSP_KERNEL_PROVIDER ?= "linux-ti-staging"
+BSP_KERNEL_RT_PROVIDER ?= "linux-ti-staging-rt"
+BSP_KERNEL_SYSTEST_PROVIDER ?= "linux-ti-staging-systest"
 BSP_KERNEL_VERSION ?= "%"
 BSP_BOOTLOADER_PROVIDER ?= "u-boot-ti-staging"
 BSP_BOOTLOADER_VERSION ?= "%"
@@ -122,6 +136,8 @@ BSP_MESA_PVR_VERSION ?= ""
 # ==========
 PREFERRED_PROVIDER_virtual/kernel ?= "${BSP_KERNEL_PROVIDER}"
 PREFERRED_VERSION_${BSP_KERNEL_PROVIDER} ?= "${BSP_KERNEL_VERSION}"
+PREFERRED_VERSION_${BSP_KERNEL_RT_PROVIDER} ?= "${BSP_KERNEL_VERSION}"
+PREFERRED_VERSION_${BSP_KERNEL_SYSTEST_PROVIDER} ?= "${BSP_KERNEL_VERSION}"
 PREFERRED_PROVIDER_virtual/bootloader ?= "${BSP_BOOTLOADER_PROVIDER}"
 PREFERRED_PROVIDER_u-boot ?= "${BSP_BOOTLOADER_PROVIDER}"
 PREFERRED_VERSION_${BSP_BOOTLOADER_PROVIDER} ?= "${BSP_BOOTLOADER_VERSION}"
-- 
2.17.1


