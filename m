Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81DEE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 20:51:53 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.31798.1736369508673122677
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jan 2025 12:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=aFSZ8A6e;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 508Kpl4A100963;
	Wed, 8 Jan 2025 14:51:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736369507;
	bh=jZVxvaoqxT6iE1w+8miPXVFp4FtPaJDro8t7WVF3Zz8=;
	h=From:To:CC:Subject:Date;
	b=aFSZ8A6eHZPqQRcHY1F/pX71gS3UE9OZHLPaGn5fQkbqwRd3P/IiRqb0PkwfkU1R2
	 ixOftIhWtu6mTAN+JDpbVXxm6YSdFu3Nd13/HgTl4EBu1JjkCv9nORIk3Llwx5S+r0
	 5DP+EauPBXI1Rw1uSL8Tux1LdwBioKYf9VJj73xc=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508Kpltn016120;
	Wed, 8 Jan 2025 14:51:47 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 14:51:47 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 14:51:47 -0600
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508Kpk7C130459;
	Wed, 8 Jan 2025 14:51:46 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH v2] ti-bsp: Disable GC320 support conditionally on BSP version
Date: Wed, 8 Jan 2025 14:51:45 -0600
Message-ID: <20250108205145.542754-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Jan 2025 20:51:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18171

Like we do with GPU support, GC320 support is conditional on the
kernel we are building and so should be disabled here for kernels
on which it is not functional yet.

We can then remove these disabling lines as the driver is updated
for each supported kernel, instead of blanket disabling in the
distro layer as done currently.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - Rebased on latest with new meta-beagle layer

 meta-beagle/conf/machine/include/beagle-bsp.inc |  6 ++++++
 meta-ti-bsp/conf/machine/include/ti-bsp.inc     | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/conf/machine/include/beagle-bsp.inc
index 34889b41..06483ba9 100644
--- a/meta-beagle/conf/machine/include/beagle-bsp.inc
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -23,6 +23,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_1 = "23%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_1 = "23%"
 BSP_MESA_PVR_VERSION:bsp-bb_org-6_1 = "22%"
 
+# GC320 support requires out-of-tree drivers not yet available in bb.org 6.1
+MACHINE_FEATURES:remove:bsp-bb_org-6_1 = "gc320"
+
 # ==========
 # bb_org-6_6
 # BeagleBoard.org kernel 6.6, Upstream u-boot 2024.07
@@ -41,3 +44,6 @@ BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org-6_6 = "ti-img-rogue-driver"
 BSP_ROGUE_DRIVER_VERSION:bsp-bb_org-6_6 = "24%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org-6_6 = "24%"
 BSP_MESA_PVR_VERSION:bsp-bb_org-6_6 = "23%"
+
+# GC320 support requires out-of-tree drivers not yet available in bb.org 6.6
+MACHINE_FEATURES:remove:bsp-bb_org-6_6 = "gc320"
diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 4bbe7668..6773bb7a 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -22,6 +22,9 @@ BSP_BOOTLOADER_VERSION:bsp-mainline = "%"
 # in mainline, usually present in TI staging or derivative like BB.org
 MACHINE_FEATURES:remove:bsp-mainline = "gpu"
 
+# GC320 support requires out-of-tree drivers not available in mainline
+MACHINE_FEATURES:remove:bsp-mainline = "gc320"
+
 # ==========
 # next
 # upcoming upstream/mainline kernel, u-boot
@@ -35,6 +38,9 @@ BSP_BOOTLOADER_VERSION:bsp-next = "%"
 # in next, usually present in TI staging or derivative like BB.org
 MACHINE_FEATURES:remove:bsp-next = "gpu"
 
+# GC320 support requires out-of-tree drivers not available in next
+MACHINE_FEATURES:remove:bsp-next = "gc320"
+
 # ==========
 # ti-6_12
 # TI staging kernel 6.12, u-boot 2024.10
@@ -48,6 +54,9 @@ BSP_BOOTLOADER_VERSION:bsp-ti-6_12 = "2024.10%"
 # in 6.12 yet
 MACHINE_FEATURES:remove:bsp-ti-6_12 = "gpu"
 
+# GC320 support requires out-of-tree drivers not yet available in 6.12
+MACHINE_FEATURES:remove:bsp-ti-6_12 = "gc320"
+
 # ==========
 # ti-6_6
 # TI staging kernel 6.6, u-boot 2024.04
@@ -65,6 +74,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 = "24%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "23%"
 
+# GC320 support requires out-of-tree drivers not yet available in 6.6
+MACHINE_FEATURES:remove:bsp-ti-6_6 = "gc320"
+
 # ==========
 # ti-6_1
 # TI staging kernel 6.1, u-boot 2023.04
@@ -82,6 +94,9 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_1 = "23%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_1 = "23%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_1 = "22%"
 
+# GC320 support requires out-of-tree drivers not yet available in 6.1
+MACHINE_FEATURES:remove:bsp-ti-6_1 = "gc320"
+
 # ==========
 # sane fallback defaults
 # if specific values are not defined or bsp is set incorrectly
-- 
2.39.2


