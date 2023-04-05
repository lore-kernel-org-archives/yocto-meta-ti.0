Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABBBC7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 18:57:00 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.139456.1680721011597909615
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 11:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MgHcyLgw;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 335IunEJ071081;
	Wed, 5 Apr 2023 13:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680721009;
	bh=pSU7M85sIel8+u6E/N719Vcve8HUqHcfbLMW+OLhjKs=;
	h=From:To:Subject:Date;
	b=MgHcyLgwYs30wOMPCBeGlQqLrjJawT4+rwfMRbFZZasD/Zixi6eNh38dvkY0ABWNl
	 nxlMcba+BO/x4X0Tdbc5ljXhxS5/3cv9ywQXymWPYsBmomungnDtZgjK335JF4998r
	 PxZ17nkrABtpdS8TVh/kk2IxBw78ItjdVEr/cP8E=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 335IunZ6012115
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Apr 2023 13:56:49 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 5
 Apr 2023 13:56:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 5 Apr 2023 13:56:49 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 335Iunur031087;
	Wed, 5 Apr 2023 13:56:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pk8JN-0007Vi-8o; Wed, 05 Apr 2023 13:56:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH v2] conf: change from do_image_wic/tar to do_image_complete
Date: Wed, 5 Apr 2023 13:56:49 -0500
Message-ID: <20230405185649.28830-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Apr 2023 18:57:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16295

When trying to support OpenBMC, we found that our use of do_image_wic
and do_image_tar for adding depends and mcdepends was too limiting.
Moving to do_image_complete is a higher level in the tree that means
for any image type the dependencies will be correct.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Rebased these changes onto the latest commits, and changes to
do_image_complete per Denys' suggesstion.

 meta-ti-bsp/conf/machine/include/am62axx.inc   | 6 +++---
 meta-ti-bsp/conf/machine/include/am62xx-lp.inc | 4 ++--
 meta-ti-bsp/conf/machine/include/am62xx.inc    | 6 +++---
 meta-ti-bsp/conf/machine/include/am64xx.inc    | 6 +++---
 meta-ti-bsp/conf/machine/include/am65xx.inc    | 4 ++--
 meta-ti-bsp/conf/machine/include/j721e.inc     | 2 +-
 meta-ti-bsp/conf/machine/include/k3.inc        | 2 +-
 meta-ti-bsp/conf/machine/j721s2-evm.conf       | 4 ++--
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf    | 2 +-
 meta-ti-bsp/conf/machine/j784s4-evm.conf       | 4 ++--
 meta-ti-bsp/conf/machine/j784s4-hs-evm.conf    | 2 +-
 11 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
index d0970948..434b2a0f 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -10,17 +10,17 @@ TFA_K3_SYSTEM_SUSPEND = "1"
 
 # Default tiboot3.bin on AM62A is for HS-FS
 BBMULTICONFIG = "k3r5-hs-fs"
-do_image_wic[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on AM62A is for HS-FS, add a version for GP
 BBMULTICONFIG += "k3r5-gp"
 IMAGE_BOOT_FILES += "tiboot3-am62ax-gp-evm.bin"
-do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on AM62A is for HS-FS, add a version for HS-SE
 BBMULTICONFIG += "k3r5-hs-se"
 IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-evm.bin"
-do_image_wic[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
 
 TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am62x"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
index d37d4673..ad5cf997 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx-lp.inc
@@ -10,12 +10,12 @@ TFA_K3_SYSTEM_SUSPEND = "1"
 
 # Default tiboot3.bin on AM62x LP is for HS-FS
 BBMULTICONFIG = "k3r5-hs-fs"
-do_image_wic[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on AM62x LP is for HS-FS, add a version for HS-SE
 BBMULTICONFIG += "k3r5-hs-se"
 IMAGE_BOOT_FILES += "tiboot3-am62x-hs-evm.bin"
-do_image_wic[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
 
 TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am62x"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index af6a6db4..de180127 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -10,17 +10,17 @@ PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 
 # Default tiboot3.bin on AM62x is for HS-FS
 BBMULTICONFIG = "k3r5-hs-fs"
-do_image_wic[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] = "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on AM62x is for HS-FS, add a version for GP
 BBMULTICONFIG += "k3r5-gp"
 IMAGE_BOOT_FILES += "tiboot3-am62x-gp-evm.bin"
-do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on AM62x is for HS-FS, add a version for HS-SE
 BBMULTICONFIG += "k3r5-hs-se"
 IMAGE_BOOT_FILES += "tiboot3-am62x-hs-evm.bin"
-do_image_wic[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] += "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
 
 TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 157bf5d5..bff0de1f 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -13,17 +13,17 @@ KERNEL_DEVICETREE = " \
 
 # Default tiboot3.bin on AM64x is for SR2.0 HS-FS
 BBMULTICONFIG = "k3r5-sr2-hs-fs"
-do_image_wic[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
 IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-fs-evm.bin"
 
 # Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
 BBMULTICONFIG += "k3r5-gp"
-do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
 IMAGE_BOOT_FILES += "tiboot3-am64x-gp-evm.bin"
 
 # Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for SR2.0 HS-SE
 BBMULTICONFIG += "k3r5-sr2-hs-se"
-do_image_wic[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
 IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-evm.bin"
 
 TFA_BOARD = "lite"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 564d61b0..edfc7c11 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -15,11 +15,11 @@ KERNEL_DEVICETREE = " \
 "
 
 # On AM65x the file tiboot3.bin comes from the bootloader not ti-sci-fw
-do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
+do_image_complete[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
 
 # Default sysfw.itb on AM65x is for SR2.0
 BBMULTICONFIG += "k3r5-sr2"
-do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 IMAGE_BOOT_FILES += "sysfw.itb"
 
 # Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index 8f9c24e6..5e325ffe 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -6,7 +6,7 @@ MACHINE_FEATURES += "screen gpu"
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 
 # On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
-do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
+do_image_complete[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy"
 
 IMAGE_BOOT_FILES += "sysfw.itb"
 
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 93bcea76..94c0e7e3 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -52,4 +52,4 @@ MACHINE_FEATURES += "efi"
 
 WKS_FILE ?= "sdimage-2part-efi.wks"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
-do_image_wic[mcdepends] += "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] += "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index 1f54c7b1..bef5684f 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -22,9 +22,9 @@ UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
 
 # Default tiboot3.bin on J721S2 is for GP
 BBMULTICONFIG = "k3r5-gp"
-do_image_wic[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-FS
 BBMULTICONFIG += "k3r5-sr1-hs-fs"
 IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-fs-evm.bin"
-do_image_wic[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
index 8fa98440..7ce5000a 100644
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
@@ -17,7 +17,7 @@ KERNEL_DEVICETREE = " \
 
 UBOOT_MACHINE = "j721s2_hs_evm_a72_defconfig"
 
-do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 
 SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 53bb4e4f..42e9ea1a 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -20,9 +20,9 @@ UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
 
 # Default tiboot3.bin on J784S4 is for GP
 BBMULTICONFIG = "k3r5-gp"
-do_image_wic[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
 
 # Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0 HS-FS
 BBMULTICONFIG += "k3r5-sr1-hs-fs"
 IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
-do_image_wic[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] += "mc::k3r5-sr1-hs-fs:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
index 1c56f55a..42bca6e6 100644
--- a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
@@ -16,7 +16,7 @@ KERNEL_DEVICETREE = " \
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
 
-do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_complete[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 
 TFA_BOARD = "j784s4"
 
-- 
2.17.1


