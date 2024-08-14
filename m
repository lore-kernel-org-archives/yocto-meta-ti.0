Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1538BC52D7D
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 15:27:52 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.100985.1723649266412642036
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Aug 2024 08:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=llobrrbe;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47EFRjFw048165;
	Wed, 14 Aug 2024 10:27:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723649265;
	bh=mYhOqzxyGE4T1fjNnu8oUzT67Jd3C9e0kvZo0UKAhKQ=;
	h=From:To:Subject:Date;
	b=llobrrbehl8LWh5YMRpoEvpjr/4yiP0v51nwiJFrT57o6IJvWywvVnVmpQl4envYk
	 WBDo2pJwiWlh1xPOXcAPAIFgdt4gAUA25LZcyzmL5wtFyTgM3GPj6SVWVixQLpNMJB
	 fDMV+D5WYaTwDQ3YMLfxGgQbJSwzXa9j72NpYjuc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47EFRjXx085594
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Aug 2024 10:27:45 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Aug 2024 10:27:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Aug 2024 10:27:44 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47EFRiBd091559;
	Wed, 14 Aug 2024 10:27:44 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1seFua-000596-NQ; Wed, 14 Aug 2024 10:27:44 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][RFC v2 1/3] conf: machine: Breakout IMAGE_BOOT_FILES into new variables
Date: Wed, 14 Aug 2024 10:27:42 -0500
Message-ID: <20240814152744.19738-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Aug 2024 15:27:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17934

The IMAGE_BOOT_FILES variable has been overloaded to include additional
files that should be included in the boot partition but are not boot
loaders themselves (images, etc...).

There is also a need to generate a report in the deploy directory for
the list of actual bootloader files that were constructed as part of the
build.

Solution, break the IMAGE_BOOT_FILES into two new variables
TI_BOOTLAODERS and TI_MULTICONFIGS and default IMAGE_BOOT_FILES to
TI_BOOTLOADERS.  This way we can stick additional boot loaders into a
new variable and they will will end up in the IMAGE_BOOT_FILES list.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/am62axx.inc  |  9 +++++---
 meta-ti-bsp/conf/machine/include/am62pxx.inc  |  3 ++-
 meta-ti-bsp/conf/machine/include/am62xx.inc   |  9 +++++---
 meta-ti-bsp/conf/machine/include/am64xx.inc   |  9 +++++---
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 10 ++++----
 meta-ti-bsp/conf/machine/include/am68.inc     |  6 +++--
 meta-ti-bsp/conf/machine/include/am69.inc     |  6 +++--
 meta-ti-bsp/conf/machine/include/j7200.inc    | 16 +++++++++----
 meta-ti-bsp/conf/machine/include/j721e.inc    | 23 +++++++++++++------
 meta-ti-bsp/conf/machine/include/j721s2.inc   |  9 +++++---
 meta-ti-bsp/conf/machine/include/j722s.inc    |  9 ++++++--
 meta-ti-bsp/conf/machine/include/j742s2.inc   |  6 +++--
 meta-ti-bsp/conf/machine/include/j784s4.inc   |  9 +++++---
 meta-ti-bsp/conf/machine/include/k3.inc       |  5 +++-
 meta-ti-bsp/conf/machine/include/omap-a15.inc |  3 ++-
 meta-ti-bsp/conf/machine/include/ti33x.inc    |  3 ++-
 meta-ti-bsp/conf/machine/include/ti43x.inc    |  3 ++-
 17 files changed, 95 insertions(+), 43 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
index 93a41d8d..8268a956 100644
--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
@@ -6,13 +6,16 @@ MACHINE_FEATURES += "screen touchscreen"
 TFA_K3_SYSTEM_SUSPEND = "1"
 
 # Default tiboot3.bin on AM62A is for HS-FS
-IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-fs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-am62ax-hs-fs-evm.bin"
+TI_MULTICONFIGS += "am62ax-hs-fs-evm"
 
 # Since default tiboot3.bin on AM62A is for HS-FS, add a version for GP
-IMAGE_BOOT_FILES += "tiboot3-am62ax-gp-evm.bin"
+TI_BOOTLOADERS += "tiboot3-am62ax-gp-evm.bin"
+TI_MULTICONFIGS += "am62ax-gp-evm"
 
 # Since default tiboot3.bin on AM62A is for HS-FS, add a version for HS-SE
-IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-am62ax-hs-evm.bin"
+TI_MULTICONFIGS += "am62ax-hs-evm"
 
 TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am62x"
diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/conf/machine/include/am62pxx.inc
index a2825905..cc9a2c01 100644
--- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
@@ -7,7 +7,8 @@ require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 # Default tiboot3.bin on AM62Px is for HS-FS
-IMAGE_BOOT_FILES += "tiboot3-am62px-hs-fs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-am62px-hs-fs-evm.bin"
+TI_MULTICONFIGS += "am62px-hs-fs-evm"
 
 TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/conf/machine/include/am62xx.inc
index 070a691b..21b6d1ec 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -7,13 +7,16 @@ require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 # Default tiboot3.bin on AM62x is for HS-FS
-IMAGE_BOOT_FILES += "tiboot3-am62x-hs-fs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-am62x-hs-fs-evm.bin"
+TI_MULTICONFIGS += "am62x-hs-fs-evm"
 
 # Since default tiboot3.bin on AM62x is for HS-FS, add a version for GP
-IMAGE_BOOT_FILES += "tiboot3-am62x-gp-evm.bin"
+TI_BOOTLOADERS += "tiboot3-am62x-gp-evm.bin"
+TI_MULTICONFIGS += "am62x-gp-evm"
 
 # Since default tiboot3.bin on AM62x is for HS-FS, add a version for HS-SE
-IMAGE_BOOT_FILES += "tiboot3-am62x-hs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-am62x-hs-evm.bin"
+TI_MULTICONFIGS += "am62x-hs-evm"
 
 # Bitmap image tarball for early splashscreen
 IMAGE_BOOT_FILES += "ti_logo_414x97_32bpp.bmp.gz"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 56b6df78..95529a83 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -16,13 +16,16 @@ KERNEL_DEVICETREE = " \
 "
 
 # Default tiboot3.bin on AM64x is for SR2.0 HS-FS
-IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-fs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-am64x_sr2-hs-fs-evm.bin"
+TI_MULTICONFIGS += "am64x_sr2-hs-fs-evm"
 
 # Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
-IMAGE_BOOT_FILES += "tiboot3-am64x-gp-evm.bin"
+TI_BOOTLOADERS += "tiboot3-am64x-gp-evm.bin"
+TI_MULTICONFIGS += "am64x-gp-evm"
 
 # Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for SR2.0 HS-SE
-IMAGE_BOOT_FILES += "tiboot3-am64x_sr2-hs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-am64x_sr2-hs-evm.bin"
+TI_MULTICONFIGS += "am64x_sr2-hs-evm"
 
 TFA_BOARD = "lite"
 
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 46513141..485dcc54 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -24,12 +24,14 @@ KERNEL_DEVICETREE = " \
 IMAGE_BOOT_FILES += "sysfw.itb"
 
 # Default on AM65x is for GP
-IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-gp-evm.bin"
-IMAGE_BOOT_FILES += "sysfw-am65x_sr2-gp-evm.itb"
+TI_BOOTLOADERS += "tiboot3-am65x_sr2-gp-evm.bin"
+TI_BOOTLOADERS += "sysfw-am65x_sr2-gp-evm.itb"
+TI_MULTICONFIGS += "am65x_sr2-gp-evm"
 
 # Since default on AM65x is for GP, add a version for HS-SE
-IMAGE_BOOT_FILES += "tiboot3-am65x_sr2-hs-evm.bin"
-IMAGE_BOOT_FILES += "sysfw-am65x_sr2-hs-evm.itb"
+TI_BOOTLOADERS += "tiboot3-am65x_sr2-hs-evm.bin"
+TI_BOOTLOADERS += "sysfw-am65x_sr2-hs-evm.itb"
+TI_MULTICONFIGS += "am65x_sr2-hs-evm"
 
 TFA_BOARD = "generic"
 
diff --git a/meta-ti-bsp/conf/machine/include/am68.inc b/meta-ti-bsp/conf/machine/include/am68.inc
index 327366be..a7ccea79 100644
--- a/meta-ti-bsp/conf/machine/include/am68.inc
+++ b/meta-ti-bsp/conf/machine/include/am68.inc
@@ -7,10 +7,12 @@ require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 # Default tiboot3.bin on AM68 is for SR1.0 HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-fs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-j721s2-hs-fs-evm.bin"
+TI_MULTICONFIGS += "j721s2-hs-fs-evm"
 
 # Since default tiboot3.bin on AM68 is for HS-FS, add a version for SR1.0 HS-SE
-IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-j721s2-hs-evm.bin"
+TI_MULTICONFIGS += "j721s2-hs-evm"
 
 TFA_BOARD = "generic"
 
diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/conf/machine/include/am69.inc
index 488f9c33..d18cf740 100644
--- a/meta-ti-bsp/conf/machine/include/am69.inc
+++ b/meta-ti-bsp/conf/machine/include/am69.inc
@@ -7,10 +7,12 @@ require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 # Default tiboot3.bin on AM69 is for SR1.0 HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-j784s4-hs-fs-evm.bin"
+TI_MULTICONFIGS += "j784s4-hs-fs-evm"
 
 # Since default tiboot3.bin on AM69 is for HS-FS, add a version for SR1.0 HS-SE
-IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-j784s4-hs-evm.bin"
+TI_MULTICONFIGS += "j784s4-hs-evm"
 
 TFA_BOARD = "j784s4"
 
diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/conf/machine/include/j7200.inc
index 2a11e3dd..bee2345f 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -7,18 +7,26 @@ IMAGE_BOOT_FILES += "tiboot3-j7200-gp-evm.bin"
 # Since default tiboot3.bin on J7200 is for GP, add a version for SR1.0 HS-FS
 IMAGE_SR1_HS_FS_FILES = "tiboot3-j7200-hs-fs-evm.bin"
 IMAGE_SR1_HS_FS_FILES:bsp-mainline = ""
-IMAGE_BOOT_FILES += "${IMAGE_SR1_HS_FS_FILES}"
+MULTICONFIG_SR1_HS_FS = "j7200-hs-fs-evm"
+MULTICONFIG_SR1_HS_FS:bsp-mainline = ""
+TI_BOOTLOADERS += "${IMAGE_SR1_HS_FS_FILES}"
+TI_MULTICONFIGS += "${MULTICONFIG_SR1_HS_FS}"
 
 # Since default tiboot3.bin on J7200 is for GP, add a version for SR1.0 HS-SE
 IMAGE_SR1_HS_SE_FILES = "tiboot3-j7200-hs-evm.bin"
 IMAGE_SR1_HS_SE_FILES:bsp-mainline = ""
-IMAGE_BOOT_FILES += "${IMAGE_SR1_HS_SE_FILES}"
+MULTICONFIG_SR1_HS_SE = "j7200-hs-evm"
+MULTICONFIG_SR1_HS_SE:bsp-mainline = ""
+TI_BOOTLOADERS += "${IMAGE_SR1_HS_SE_FILES}"
+TI_MULTICONFIGS += "${MULTICONFIG_SR1_HS_SE}"
 
 # Since default tiboot3.bin on J7200 is for GP, add a version for SR2.0 HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-fs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-j7200_sr2-hs-fs-evm.bin"
+TI_MULTICONFIGS += "j7200_sr2-hs-fs-evm"
 
 # Since default tiboot3.bin on J721e is for GP, add a version for SR2.0 HS-SE
-IMAGE_BOOT_FILES += "tiboot3-j7200_sr2-hs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-j7200_sr2-hs-evm.bin"
+TI_MULTICONFIGS += "j7200_sr2-hs-evm"
 
 TFA_BOARD = "generic"
 
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/conf/machine/include/j721e.inc
index 62487aa9..29e50023 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -6,29 +6,38 @@ MACHINE_FEATURES += "screen gpu"
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
-IMAGE_BOOT_FILES += "sysfw.itb"
+TI_BOOTLOADERS += "sysfw.itb"
 
 # Default on J721e is for GP
-IMAGE_BOOT_FILES += "tiboot3-j721e-gp-evm.bin"
-IMAGE_BOOT_FILES += "sysfw-j721e-gp-evm.itb"
+TI_BOOTLOADERS += "tiboot3-j721e-gp-evm.bin"
+TI_BOOTLOADERS += "sysfw-j721e-gp-evm.itb"
+TI_MULTICONFIGS += "j721e-gp-evm"
 
 # Since default on J721e is for GP, add a version for SR1.1 HS-FS
 IMAGE_SR1_1_HS_FS_FILES = "tiboot3-j721e_sr1_1-hs-fs-evm.bin sysfw-j721e_sr1_1-hs-fs-evm.itb"
 IMAGE_SR1_1_HS_FS_FILES:bsp-mainline = ""
-IMAGE_BOOT_FILES += "${IMAGE_SR1_1_HS_FS_FILES}"
+MULTICONFIG_SR1_1_HS_FS = "j721e_sr1_1-hs-fs-evm"
+MULTICONFIG_SR1_1_HS_FS:bsp-mainline = ""
+TI_BOOTLOADERS += "${IMAGE_SR1_1_HS_FS_FILES}"
+TI_MULTICONFIGS += "${MULTICONFIG_SR1_1_HS_FS}"
 
 # Since default on J721e is for GP, add a version for SR1.1 HS-SE
 IMAGE_SR1_1_HS_SE_FILES = "tiboot3-j721e_sr1_1-hs-evm.bin sysfw-j721e_sr1_1-hs-evm.itb"
-IMAGE_BOOT_FILES += "${IMAGE_SR1_1_HS_SE_FILES}"
+TI_BOOTLOADERS += "${IMAGE_SR1_1_HS_SE_FILES}"
+TI_MULTICONFIGS += "j721e_sr1_1-hs-evm"
 
 # Since default on J721e is for GP, add a version for SR2.0 HS-FS
 IMAGE_SR2_HS_FS_FILES = "tiboot3-j721e_sr2-hs-fs-evm.bin sysfw-j721e_sr2-hs-fs-evm.itb"
-IMAGE_BOOT_FILES += "${IMAGE_SR2_HS_FS_FILES}"
+TI_BOOTLOADERS += "${IMAGE_SR2_HS_FS_FILES}"
+TI_MULTICONFIGS += "j721e_sr2-hs-fs-evm"
 
 # Since default on J721e is for GP, add a version for SR2.0 HS-SE
 IMAGE_SR2_HS_SE_FILES = "tiboot3-j721e_sr2-hs-evm.bin sysfw-j721e_sr2-hs-evm.itb"
 IMAGE_SR2_HS_SE_FILES:bsp-mainline = ""
-IMAGE_BOOT_FILES += "${IMAGE_SR2_HS_SE_FILES}"
+MULTICONFIG_SR2_HS_SE = "j721e_sr2-hs-evm"
+MULTICONFIG_SR2_HS_SE:bsp-mainline = ""
+TI_BOOTLOADERS += "${IMAGE_SR2_HS_SE_FILES}"
+TI_MULTICONFIGS += "${MULTICONFIG_SR2_HS_SE}"
 
 TFA_BOARD = "generic"
 
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/conf/machine/include/j721s2.inc
index 9cd88d9b..5ebb4a16 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -7,13 +7,16 @@ require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 # Default tiboot3.bin on J721S2 is for GP
-IMAGE_BOOT_FILES += "tiboot3-j721s2-gp-evm.bin"
+TI_BOOTLOADERS += "tiboot3-j721s2-gp-evm.bin"
+TI_MULTICONFIGS += "j721s2-gp-evm"
 
 # Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-fs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-j721s2-hs-fs-evm.bin"
+TI_MULTICONFIGS += "j721s2-hs-fs-evm"
 
 # Since default tiboot3.bin on J721S2 is for GP, add a version for SR1.0 HS-SE
-IMAGE_BOOT_FILES += "tiboot3-j721s2-hs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-j721s2-hs-evm.bin"
+TI_MULTICONFIGS += "j721s2-hs-evm"
 
 TFA_BOARD = "generic"
 
diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/conf/machine/include/j722s.inc
index ef35d83a..42f50feb 100644
--- a/meta-ti-bsp/conf/machine/include/j722s.inc
+++ b/meta-ti-bsp/conf/machine/include/j722s.inc
@@ -7,13 +7,18 @@ require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 # Default tiboot3.bin on J722S is for HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j722s-hs-fs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-j722s-hs-fs-evm.bin"
+TI_MULTICONFIGS += "j722s-hs-fs-evm"
 
 # Since default tiboot3.bin on J722S is for HS-FS, add a version for HS-SE
 IMAGE_SR1_HS_SE_FILES = "tiboot3-j722s-hs-evm.bin"
 IMAGE_SR1_HS_SE_FILES:bsp-mainline = ""
 IMAGE_SR1_HS_SE_FILES:bsp-next = ""
-IMAGE_BOOT_FILES += "${IMAGE_SR1_HS_SE_FILES}"
+MULTICONFIG_SR1_HS_SE = "j722s-hs-evm"
+MULTICONFIG_SR1_HS_SE:bsp-mainline = ""
+MULTICONFIG_SR1_HS_SE:bsp-next = ""
+TI_BOOTLOADERS += "${IMAGE_SR1_HS_SE_FILES}"
+TI_MULTICONFIGS += "${MULTICONFIG_SR1_HS_SE}"
 
 TFA_BOARD = "lite"
 TFA_K3_SYSTEM_SUSPEND = "1"
diff --git a/meta-ti-bsp/conf/machine/include/j742s2.inc b/meta-ti-bsp/conf/machine/include/j742s2.inc
index aad7a768..7c248310 100644
--- a/meta-ti-bsp/conf/machine/include/j742s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j742s2.inc
@@ -7,10 +7,12 @@ require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 # Default tiboot3.bin on J742S2 is for HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j742s2-hs-fs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-j742s2-hs-fs-evm.bin"
+TI_MULTICONFIGS += "j742s2-hs-fs-evm"
 
 # Since default tiboot3.bin on J742S2 is for HS-FS, add a version for SR1.0 HS-SE
-IMAGE_BOOT_FILES += "tiboot3-j742s2-hs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-j742s2-hs-evm.bin"
+TI_MULTICONFIGS += "j742s2-hs-evm"
 
 TFA_BOARD = "j784s4"
 
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/conf/machine/include/j784s4.inc
index 883c4a6e..6fb26bbc 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -7,13 +7,16 @@ require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?= "${BSP_ROGUE_DRIVER_PROVIDER}"
 
 # Default tiboot3.bin on J784S4 is for GP
-IMAGE_BOOT_FILES += "tiboot3-j784s4-gp-evm.bin"
+TI_BOOTLOADERS += "tiboot3-j784s4-gp-evm.bin"
+TI_MULTICONFIGS += "j784s4-gp-evm"
 
 # Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0 HS-FS
-IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-j784s4-hs-fs-evm.bin"
+TI_MULTICONFIGS += "j784s4-hs-fs-evm"
 
 # Since default tiboot3.bin on J784S4 is for GP, add a version for SR1.0 HS-SE
-IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-evm.bin"
+TI_BOOTLOADERS += "tiboot3-j784s4-hs-evm.bin"
+TI_MULTICONFIGS += "j784s4-hs-evm"
 
 TFA_BOARD = "j784s4"
 
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 34991ec9..2e5ffe09 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -48,7 +48,10 @@ MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa pci"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 
-IMAGE_BOOT_FILES ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
+TI_BOOTLOADERS ?= "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
+TI_MULTICONFIGS = ""
+
+IMAGE_BOOT_FILES ?= "${TI_BOOTLOADERS}"
 IMAGE_EFI_BOOT_FILES ?= "${IMAGE_BOOT_FILES}"
 
 EFI_PROVIDER ?= "grub-efi"
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index be086936..6092040a 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -48,5 +48,6 @@ MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa gpu mmip dsp gc3
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
-IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
+TI_BOOTLOADERS ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
+TI_MULTICONFIGS = ""
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/conf/machine/include/ti33x.inc
index 7e9eb48c..2287f24c 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -94,5 +94,6 @@ MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa gpu"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
-IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
+TI_BOOTLOADERS ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
+TI_MULTICONFIGS = ""
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/conf/machine/include/ti43x.inc
index 2621d19a..74c1defa 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -66,5 +66,6 @@ MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 screen alsa gpu"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
-IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
+TI_BOOTLOADERS ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES}"
+TI_MULTICONFIGS = ""
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
-- 
2.17.1


