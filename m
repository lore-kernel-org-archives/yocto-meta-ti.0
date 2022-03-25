Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DEEC433FE
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 18:41:55 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.542.1648233713971105313
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Mar 2022 11:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=dwpifHMR;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22PIfqRf013726;
	Fri, 25 Mar 2022 13:41:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648233712;
	bh=Ywn2hflM8VKz7MT2BZ2E1N1kajGNJit1xTqowbn3r3I=;
	h=From:To:CC:Subject:Date;
	b=dwpifHMReE0snBh5tWdA+lgSSAp2FLguRB9hJ57IVp9yt1u0SCqytqmuZfmgPZ1ou
	 FAgkX0qQhJszqgyRjA+lUYQ2rSxhaSRnwnlSCZ0AUTCeruvk8fczFKhBxzbmgmUvMV
	 4K5DhKQYhZZJ06IZlxt1gJ85TD3C/33Js0nFMDhs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22PIfq6N031626
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Mar 2022 13:41:52 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Mar 2022 13:41:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Mar 2022 13:41:51 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22PIfpLs022723;
	Fri, 25 Mar 2022 13:41:51 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Darren Etheridge <detheridge@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: "Andrew F . Davis" <afd@ti.com>
Subject: [meta-ti][master][PATCH 1/4] meta-ti: rename j7-evm to j721e-evm
Date: Fri, 25 Mar 2022 13:41:48 -0500
Message-ID: <20220325184151.16940-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Mar 2022 18:41:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14549

In many places we use "j7" the family when we should be using a
specific SoC or EVM and vice-versa. For instance when including
graphics drivers we add for all "j7" family, but what we really
want is only for some specific j7 SoC.

First step in untangling this is to make it clear that there is
no SoC called j7. There is a SoC called j721e with a j721e-evm.

Fix up this naming here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../machine/{j7-evm-k3r5.conf => j721e-evm-k3r5.conf}     | 4 ++--
 meta-ti-bsp/conf/machine/{j7-evm.conf => j721e-evm.conf}  | 4 ++--
 ...s-evm-k3r5-sr1-1.conf => j721e-hs-evm-k3r5-sr1-1.conf} | 6 +++---
 .../{j7-hs-evm-k3r5.conf => j721e-hs-evm-k3r5.conf}       | 4 ++--
 .../conf/machine/{j7-hs-evm.conf => j721e-hs-evm.conf}    | 8 ++++----
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb        | 6 +++---
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend      | 2 +-
 meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend    | 2 +-
 meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 2 +-
 9 files changed, 19 insertions(+), 19 deletions(-)
 rename meta-ti-bsp/conf/machine/{j7-evm-k3r5.conf => j721e-evm-k3r5.conf} (63%)
 rename meta-ti-bsp/conf/machine/{j7-evm.conf => j721e-evm.conf} (82%)
 rename meta-ti-bsp/conf/machine/{j7-hs-evm-k3r5-sr1-1.conf => j721e-hs-evm-k3r5-sr1-1.conf} (53%)
 rename meta-ti-bsp/conf/machine/{j7-hs-evm-k3r5.conf => j721e-hs-evm-k3r5.conf} (67%)
 rename meta-ti-bsp/conf/machine/{j7-hs-evm.conf => j721e-hs-evm.conf} (79%)

diff --git a/meta-ti-bsp/conf/machine/j7-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
similarity index 63%
rename from meta-ti-bsp/conf/machine/j7-evm-k3r5.conf
rename to meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
index b9e8cc01..070bf7aa 100644
--- a/meta-ti-bsp/conf/machine/j7-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: J7 EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J7 EVM (R5F core)
+#@NAME: J721e EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J721e EVM (R5F core)
 
 require conf/machine/include/k3r5.inc
 
diff --git a/meta-ti-bsp/conf/machine/j7-evm.conf b/meta-ti-bsp/conf/machine/j721e-evm.conf
similarity index 82%
rename from meta-ti-bsp/conf/machine/j7-evm.conf
rename to meta-ti-bsp/conf/machine/j721e-evm.conf
index 267a5e14..12d4fecb 100644
--- a/meta-ti-bsp/conf/machine/j7-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: J7 EVM
-#@DESCRIPTION: Machine configuration for the TI J7 EVM
+#@NAME: J721e EVM
+#@DESCRIPTION: Machine configuration for the TI J721e EVM
 
 require conf/machine/include/j7.inc
 
diff --git a/meta-ti-bsp/conf/machine/j7-hs-evm-k3r5-sr1-1.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5-sr1-1.conf
similarity index 53%
rename from meta-ti-bsp/conf/machine/j7-hs-evm-k3r5-sr1-1.conf
rename to meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5-sr1-1.conf
index 73f5afd6..6e809f46 100644
--- a/meta-ti-bsp/conf/machine/j7-hs-evm-k3r5-sr1-1.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5-sr1-1.conf
@@ -1,10 +1,10 @@
 #@TYPE: Machine
-#@NAME: J7 SR1.1 HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J7 SR1.1 HS EVM (R5F core)
+#@NAME: J721e SR1.1 HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J721e SR1.1 HS EVM (R5F core)
 
 # Booting SR1.1 requires different SYSFW, the rest is handled at runtime
 
-require conf/machine/j7-hs-evm-k3r5.conf
+require conf/machine/j721e-hs-evm-k3r5.conf
 SOC_FAMILY:append = ":k3r5-sr1-1"
 
 SYSFW_SOC = "j721e_sr1_1"
diff --git a/meta-ti-bsp/conf/machine/j7-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
similarity index 67%
rename from meta-ti-bsp/conf/machine/j7-hs-evm-k3r5.conf
rename to meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
index 53a7016f..80f3b969 100644
--- a/meta-ti-bsp/conf/machine/j7-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: J7 HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J7 HS EVM (R5F core)
+#@NAME: J721e HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J721e HS EVM (R5F core)
 
 require conf/machine/include/k3r5.inc
 
diff --git a/meta-ti-bsp/conf/machine/j7-hs-evm.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
similarity index 79%
rename from meta-ti-bsp/conf/machine/j7-hs-evm.conf
rename to meta-ti-bsp/conf/machine/j721e-hs-evm.conf
index f2e3ccf5..433863dd 100644
--- a/meta-ti-bsp/conf/machine/j7-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
@@ -1,8 +1,8 @@
 #@TYPE: Machine
-#@NAME: J7 HS EVM
-#@DESCRIPTION: Machine configuration for the TI J7 HS EVM
+#@NAME: J721e HS EVM
+#@DESCRIPTION: Machine configuration for the TI J721e HS EVM
 
-require conf/machine/j7-evm.conf
+require conf/machine/j721e-evm.conf
 
 UBOOT_MACHINE = "j721e_hs_evm_a72_defconfig"
 
@@ -22,7 +22,7 @@ IMAGE_BOOT_FILES = "${UBOOT_BINARY}"
 BBMULTICONFIG += "k3r5-sr1-1"
 
 # Use default IMAGE_BOOT_FILES_LEGACY files
-# Since default sysfw.itb on J7 is for SR1.1, add a version for SR1.0
+# Since default sysfw.itb on J721e is for SR1.1, add a version for SR1.0
 IMAGE_BOOT_FILES += "sysfw-j721e-evm.itb"
 do_image_wic[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 3d50b112..33333e3c 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -23,9 +23,9 @@ SYSFW_SOC ?= "unknown"
 SYSFW_CONFIG ?= "unknown"
 
 SYSFW_PREFIX = "ti-sci-firmware"
-SYSFW_PREFIX:j7-evm-k3r5 = "ti-fs-firmware"
-SYSFW_PREFIX:j7-hs-evm-k3r5 = "ti-fs-firmware"
-SYSFW_PREFIX:j7-hs-evm-k3r5-sr1-1 = "ti-fs-firmware"
+SYSFW_PREFIX:j721e-evm-k3r5 = "ti-fs-firmware"
+SYSFW_PREFIX:j721e-hs-evm-k3r5 = "ti-fs-firmware"
+SYSFW_PREFIX:j721e-hs-evm-k3r5-sr1-1 = "ti-fs-firmware"
 SYSFW_PREFIX:j7200-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX:j7200-hs-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX:j721s2-evm-k3r5 = "ti-fs-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 581f7454..35cb9c95 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -26,7 +26,7 @@ do_compile:append:am64xx-hs-evm() {
 	)
 }
 
-do_compile:append:j7-hs-evm() {
+do_compile:append:j721e-hs-evm() {
 	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
 	( cd ${BUILD_DIR}; \
 		mv bl31.bin bl31.bin.unsigned; \
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index f1d7fc9a..f9660bfe 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -55,7 +55,7 @@ do_compile:append:am64xx-hs-evm() {
     optee_sign_k3hs
 }
 
-do_compile:append:j7-hs-evm() {
+do_compile:append:j721e-hs-evm() {
     optee_sign_k3hs
 }
 
diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 8aa823cc..03408528 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -49,7 +49,7 @@ LEGACY_DM_FW_DIR  = "${D}${nonarch_base_libdir}/firmware/pdk-ipc/"
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
 # J7 HS support
-do_install:prepend:j7-hs-evm() {
+do_install:prepend:j721e-hs-evm() {
 	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
 	( cd ${RTOS_DM_FW_DIR}; \
 		mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
-- 
2.17.1


