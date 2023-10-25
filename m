Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 633C0C07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 16:56:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.178847.1698252994960702937
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 09:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rkWr9jN0;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39PGuWjA047969;
	Wed, 25 Oct 2023 11:56:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698252992;
	bh=lwdn3dWEMlldZCB5mpBByhFPM4DbrHJJJGJ9uFOb/r0=;
	h=From:To:CC:Subject:Date;
	b=rkWr9jN0bYRL5UC3hBlKKcGWuTyoX35X+kmtBre1nvn3a33vK5ZGpvt5mGqIWUL9u
	 qjHl9pOgeISPZl7agmeYFLg2v+mtaInZEuXUhka7AhA/kenpVl2A7Do5+xVVHwt2oQ
	 kSSEjOcwElRpTE7FazwEKCps5IOZCIPMY1dTS7tY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39PGuW7w018251
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Oct 2023 11:56:32 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 25
 Oct 2023 11:56:32 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 25 Oct 2023 11:56:31 -0500
Received: from lelv0326.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39PGuVEO008415;
	Wed, 25 Oct 2023 11:56:31 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/8] conf: machine: Move IMAGE_BOOT_FILES to the SoC inc for J721s2 and J784s4
Date: Wed, 25 Oct 2023 11:56:23 -0500
Message-ID: <20231025165630.2274889-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Oct 2023 16:56:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17189

These defines are specific to a SoC, not any specific board. Move these
to the SoC level for these boards to be consistent with boards already
doing this correctly.

J7200 didn't have these at all, add them while we are here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/j7200.inc  | 9 +++++++++
 meta-ti-bsp/conf/machine/include/j721s2.inc | 6 ++++++
 meta-ti-bsp/conf/machine/include/j784s4.inc | 6 ++++++
 meta-ti-bsp/conf/machine/j721s2-evm.conf    | 6 ------
 meta-ti-bsp/conf/machine/j784s4-evm.conf    | 6 ------
 5 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
index d21e26cc..af43605d 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -1,6 +1,15 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append = ":j7200"
 
+# Default tiboot3.bin on J7200 is for GP
+IMAGE_BOOT_FILES += "tiboot3-j7200-gp-evm.bin"
+
+# Since default tiboot3.bin on J7200 is for GP, add a version for SR2.0 HS-FS
+IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-fs-evm.bin"
+
+# Since default tiboot3.bin on J721e is for GP, add a version for SR2.0 HS-SE
+IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-evm.bin"
+
 TFA_BOARD = "generic"
 
 OPTEEMACHINE = "k3-j721e"
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
index 98cc611f..98495582 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -6,6 +6,12 @@ MACHINE_FEATURES += "screen gpu"
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 
+# Default tiboot3.bin on J721S2 is for GP
+IMAGE_BOOT_FILES += "tiboot3-j721s2-gp-evm.bin"
+
+# Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-FS
+IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-fs-evm.bin"
+
 TFA_BOARD = "generic"
 
 OPTEEMACHINE = "k3-j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
index de207687..053d378e 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -6,6 +6,12 @@ MACHINE_FEATURES += "screen gpu"
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 
+# Default tiboot3.bin on J784S4 is for GP
+IMAGE_BOOT_FILES += "tiboot3-j784s4-gp-evm.bin"
+
+# Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0 HS-FS
+IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
+
 TFA_BOARD = "j784s4"
 
 OPTEEMACHINE = "k3-j784s4"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index 56a949e5..ecb1836f 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -19,9 +19,3 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
-
-# Default tiboot3.bin on J721S2 is for GP
-IMAGE_BOOT_FILES += "tiboot3-j721s2-gp-evm.bin"
-
-# Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-fs-evm.bin"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 2421b0b9..40a63651 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -19,9 +19,3 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
-
-# Default tiboot3.bin on J784S4 is for GP
-IMAGE_BOOT_FILES += "tiboot3-j784s4-gp-evm.bin"
-
-# Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0 HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
-- 
2.39.2


