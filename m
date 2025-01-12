Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87F8E77188
	for <webhook@archiver.kernel.org>; Sun, 12 Jan 2025 20:22:01 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1838.1736713319876111477
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 12 Jan 2025 12:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dC5jsyQW;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50CKLw563596270
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 12 Jan 2025 14:21:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736713318;
	bh=hsdfiwHLCAzYQZaYWTB3tvZBQLN+vn/JKzma/4PlRJw=;
	h=From:To:Subject:Date;
	b=dC5jsyQWWHaceWEzkG84T+I41yX58nkK+WF4zk1QwhOQvZ1EGPWLcbJvIoRDczNRK
	 kZY7ZbPhhrZscci3tML1ZgkE7JoGWLpwUgvgYoAcN8KTUiaIKzf/SCtjmUMPDLAxUM
	 FhaDgB+IoS5t5nxXHyVjQX02NCqdeYegY8/ZkQ4c=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50CKLwmM015882
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 12 Jan 2025 14:21:58 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 12
 Jan 2025 14:21:58 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 12 Jan 2025 14:21:57 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50CKLwGi040415;
	Sun, 12 Jan 2025 14:21:58 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tX4T7-0000mN-Qv; Sun, 12 Jan 2025 14:21:57 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v3] ti-bsp: Change to 6.12 as the default
Date: Sun, 12 Jan 2025 14:21:57 -0600
Message-ID: <20250112202157.2954-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 12 Jan 2025 20:22:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18189

We are moving to 6.12 to be our new LTS, so we are switching the default
BSP to that.  You can still access the 6.6 kernel if you need to by using
the BSP system and setting TI_PREFERRED_BSP = "ti-6_6" in your
local.conf.

Current known issues:
- Hardware graphics is disabled until we get a patch that updates the
patches to work with the 6.12 kernel.  Falling back to software
rendering.
- am62xxsip-evm and j742s2-evm are not supported in the 2025.01 u-boot
yet.  They will fail to build until the u-boot recipe is updated to
point to a commit that fixes their support.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Remove the DEFAULT_PREFERENCE settings on the kernel/u-boot recipes.
v3: Add Current known issues section to commit message.

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


