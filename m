Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9D90E77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 19:53:53 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.30387.1736366027439167531
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jan 2025 11:53:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=h5msp/ze;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 508JrjUg3053025
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 13:53:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736366025;
	bh=s9Ta3vJunWfRei3Z7OZpy175I+DzE4O+i7rlVVeCerM=;
	h=From:To:Subject:Date;
	b=h5msp/zeuhcYqo1F3yvBTRdJlaG5qp3lTj3sv4Ml7Wl5JtVwUXKziCKdId4hTtgfM
	 PuTMpb5c2rPNOfPxinJ+97basUsg2JoJKE6knOSdHHEvRMeis8SAEMI58Aw81NR8Nt
	 Ez/fDegML+xTh56CRQcHirjNwO+8SrErekPFXMKA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508JrjVg098276
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 13:53:45 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 13:53:45 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 13:53:45 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508JrjIn089274;
	Wed, 8 Jan 2025 13:53:45 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tVc7c-0003eI-U9; Wed, 08 Jan 2025 13:53:44 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v2] ti-bsp: Change to 6.12 as the default
Date: Wed, 8 Jan 2025 13:53:44 -0600
Message-ID: <20250108195344.13985-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jan 2025 19:53:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18169

We are moving to 6.12 to be our new LTS, so we are switching the default
BSP to that.  You can still access the 6.6 kernel if you need to by using
the BSP system and setting TI_PREFERRED_BSP = "ti-6_6" in your
local.conf.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Remove the DEFAULT_PREFERENCE settings on the kernel/u-boot recipes.

 meta-ti-bsp/conf/machine/include/ti-bsp.inc                     | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb     | 2 --
 .../recipes-kernel/linux/linux-ti-staging-systest_6.12.bb       | 2 --
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb       | 2 --
 4 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 083177dc..f19a0c9c 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -4,7 +4,7 @@
 # well as a dedicated machine override.
 
 # Supported options are: mainline, next, ti-6_12, ti-6_6, ti-6_1
-TI_PREFERRED_BSP ??= "ti-6_6"
+TI_PREFERRED_BSP ??= "ti-6_12"
 
 # Use bsp-* namespace for overrides
 MACHINEOVERRIDES =. "bsp-${TI_PREFERRED_BSP}:"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index e71008fa..4a3b347d 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -1,7 +1,5 @@
 require u-boot-ti.inc
 
-DEFAULT_PREFERENCE = "-1"
-
 include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
 
 PR = "r0"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb
index 8ce23368..b0dcab52 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.12.bb
@@ -1,7 +1,5 @@
 require linux-ti-staging_6.12.bb
 
-DEFAULT_PREFERENCE = "-1"
-
 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 7f61b8ab..2ddced64 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 inherit ti-secdev
 inherit kernel
 
-DEFAULT_PREFERENCE = "-1"
-
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/ti-kernel.inc
 include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
-- 
2.17.1


