Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14894C63705
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 21:43:24 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.29817.1670449396750933943
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 13:43:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=k68/lCyv;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B7LhEwG045393;
	Wed, 7 Dec 2022 15:43:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670449394;
	bh=ohsNJnPq2tzCh2lWUjKsXwZY4bCj6ArNbobOX/keF0E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=k68/lCyvWVwZ7prb4lwNGvjYiTWifRSJRhDRC8RzeASGVkU9CvJEC2b9A7GD8XJbV
	 zFkbJATRBNaZ5++idHXfkNc9zxOq8Npw8Y+GFvUUQZHKR6DH7vYcULPbcXJfh+4OyZ
	 QvKnX8jOYKs1CllW6padKnJuufJnoQebseqO2BqU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B7LhEGW021385
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Dec 2022 15:43:14 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 7
 Dec 2022 15:43:14 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 7 Dec 2022 15:43:14 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B7LhCOZ007888;
	Wed, 7 Dec 2022 15:43:14 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 6/7] conf: machine: Move TFA_BOARD and OPTEEMACHINE to the SoC level
Date: Wed, 7 Dec 2022 15:43:11 -0600
Message-ID: <20221207214312.21735-6-afd@ti.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221207214312.21735-1-afd@ti.com>
References: <20221207214312.21735-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Dec 2022 21:43:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15427

These defines are specific to a SoC, not a SoC family (K3) nor
any specific board. Move these to the SoC level for all boards
to be consistent with boards already doing this correctly.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/machine/include/am64xx.inc | 1 +
 meta-ti-bsp/conf/machine/include/am65xx.inc | 2 ++
 meta-ti-bsp/conf/machine/include/j7200.inc  | 2 ++
 meta-ti-bsp/conf/machine/include/j721e.inc  | 6 ++++--
 meta-ti-bsp/conf/machine/include/j721s2.inc | 6 ++++--
 meta-ti-bsp/conf/machine/include/j784s4.inc | 6 ++++--
 meta-ti-bsp/conf/machine/include/k3.inc     | 1 -
 meta-ti-bsp/conf/machine/j721s2-evm.conf    | 1 -
 meta-ti-bsp/conf/machine/j784s4-evm.conf    | 4 ----
 9 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 7c46b630..f1a91991 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -32,4 +32,5 @@ do_image_wic[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
 
 TFA_BOARD = "lite"
+
 OPTEEMACHINE = "k3-am64x"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 14e0d07f..88259717 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -37,4 +37,6 @@ IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
 do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 
+TFA_BOARD = "generic"
+
 OPTEEMACHINE = "k3-am65x"
diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
index 1eaf7806..d21e26cc 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append = ":j7200"
 
+TFA_BOARD = "generic"
+
 OPTEEMACHINE = "k3-j721e"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index 34569a01..12ee0c90 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -1,8 +1,6 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append = ":j721e"
 
-OPTEEMACHINE = "k3-j721e"
-
 MACHINE_FEATURES += "gpu"
 
 PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
@@ -10,3 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
+
+TFA_BOARD = "generic"
+
+OPTEEMACHINE = "k3-j721e"
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
index 2a60458e..fc6493b8 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -1,8 +1,6 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append = ":j721s2"
 
-OPTEEMACHINE = "k3-j721e"
-
 MACHINE_FEATURES += "gpu"
 
 PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
@@ -10,3 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
+
+TFA_BOARD = "generic"
+
+OPTEEMACHINE = "k3-j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
index e2f053ac..d268b810 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -1,8 +1,6 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append = ":j784s4"
 
-OPTEEMACHINE = "k3-j721e"
-
 MACHINE_FEATURES += "gpu"
 
 PREFERRED_PROVIDER_virtual/egl ?= "ti-img-rogue-umlibs"
@@ -10,3 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgbm ?= "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
+
+TFA_BOARD = "j784s4"
+
+OPTEEMACHINE = "k3-j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 84afd2e2..bd71becf 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -29,7 +29,6 @@ UBOOT_SUFFIX = "img"
 EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 TFA_PLATFORM = "k3"
-TFA_BOARD = "generic"
 
 # Use the expected value of the ubifs filesystem's volume name in the kernel
 # and u-boot.
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index 37353df4..46d5dbf6 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -7,7 +7,6 @@ require conf/machine/include/j721s2.inc
 SERIAL_CONSOLES = "115200;ttyS2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 TFA_K3_USART = "0x8"
-OPTEEMACHINE = "k3-j784s4"
 OPTEE_K3_USART = "0x8"
 
 KERNEL_DEVICETREE = " \
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 10d8aad0..f8be7d18 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -7,7 +7,6 @@ require conf/machine/include/j784s4.inc
 SERIAL_CONSOLES = "115200;ttyS2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 TFA_K3_USART = "0x8"
-OPTEEMACHINE = "k3-j784s4"
 OPTEE_K3_USART = "0x8"
 
 KERNEL_DEVICETREE = " \
@@ -18,6 +17,3 @@ UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
 
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-
-TFA_BOARD = "j784s4"
-
-- 
2.38.1


