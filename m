Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E601AECAAD4
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 17:53:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.2079.1661968398583266984
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Aug 2022 10:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=t8Eqn8pZ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27VHrH7n004758;
	Wed, 31 Aug 2022 12:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1661968397;
	bh=3jK+qUkKiM513KsbycdhFxxiK4ftbtXTEp/Z+M1MXSs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=t8Eqn8pZlxvmWbMFJBt4S8svuf4Hqz3vkpblpgUBH1hcjcPPxfNDLyiIBAWg/q8II
	 KuJoE/rUvDe+GZsdBXQ5fi4+MTkKroVvUKwBeh43AbpuPSQOvaNZ3+qDdz/b2C/Cxw
	 vO1B0tCSlHxbFy1FtG0S6uJrrTR9AQ8Mel5dsTAs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27VHrHNe050902
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Aug 2022 12:53:17 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 31
 Aug 2022 12:53:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 31 Aug 2022 12:53:16 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27VHrFtt033174;
	Wed, 31 Aug 2022 12:53:16 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 1/3] meta-ti: Rename j7-evm to j721e-evm
Date: Wed, 31 Aug 2022 12:53:13 -0500
Message-ID: <20220831175315.15942-2-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220831175315.15942-1-afd@ti.com>
References: <20220831175315.15942-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 31 Aug 2022 17:53:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14980

In many places we use "j7" (the family name) when we should be using a
specific SoC or EVM and vice-versa. For instance when including graphics
drivers we add for all the "j7" family, but what we really want is only
for some specific j7 SoCs.

First step in untangling this is to make it clear that there is no SoC
called "j7". There is a SoC called j721e with a j721e-evm.

Fix up this naming here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../{j7-evm-k3r5.conf => j721e-evm-k3r5.conf}  |  4 ++--
 conf/machine/{j7-evm.conf => j721e-evm.conf}   |  4 ++--
 ...sr1-1.conf => j721e-hs-evm-k3r5-sr1-1.conf} |  6 +++---
 ...hs-evm-k3r5.conf => j721e-hs-evm-k3r5.conf} |  4 ++--
 .../{j7-hs-evm.conf => j721e-hs-evm.conf}      |  6 +++---
 .../cadence-mhdp-fw/cadence-mhdp-fw_git.bb     |  2 +-
 .../ti-img-rogue-driver_1.15.6133109.bb        | 10 +++++-----
 recipes-bsp/sciclient/sciclient-rtos_git.bb    |  6 +++---
 .../viddec-test-app_1.0.0.bb                   |  2 +-
 .../videnc-test-app_1.0.0.bb                   |  2 +-
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb         | 18 +++++++++---------
 .../trusted-firmware-a_%.bbappend              |  2 +-
 .../ti-img-rogue-umlibs_1.15.6133109.bb        |  6 +++---
 recipes-kernel/linux/kernel-rdepends.inc       |  4 ++--
 recipes-security/optee/optee-os_%.bbappend     |  2 +-
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb     |  2 +-
 16 files changed, 40 insertions(+), 40 deletions(-)
 rename conf/machine/{j7-evm-k3r5.conf => j721e-evm-k3r5.conf} (81%)
 rename conf/machine/{j7-evm.conf => j721e-evm.conf} (87%)
 rename conf/machine/{j7-hs-evm-k3r5-sr1-1.conf => j721e-hs-evm-k3r5-sr1-1.conf} (53%)
 rename conf/machine/{j7-hs-evm-k3r5.conf => j721e-hs-evm-k3r5.conf} (81%)
 rename conf/machine/{j7-hs-evm.conf => j721e-hs-evm.conf} (85%)

diff --git a/conf/machine/j7-evm-k3r5.conf b/conf/machine/j721e-evm-k3r5.conf
similarity index 81%
rename from conf/machine/j7-evm-k3r5.conf
rename to conf/machine/j721e-evm-k3r5.conf
index 862b017c..9544cdb6 100644
--- a/conf/machine/j7-evm-k3r5.conf
+++ b/conf/machine/j721e-evm-k3r5.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: J7 EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J7 EVM (R5F core)
+#@NAME: J721e EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J721e EVM (R5F core)
 
 require conf/machine/include/k3r5.inc
 
diff --git a/conf/machine/j7-evm.conf b/conf/machine/j721e-evm.conf
similarity index 87%
rename from conf/machine/j7-evm.conf
rename to conf/machine/j721e-evm.conf
index 514695d6..8598c672 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j721e-evm.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: J7 EVM
-#@DESCRIPTION: Machine configuration for the TI J7 EVM
+#@NAME: J721e EVM
+#@DESCRIPTION: Machine configuration for the TI J721e EVM
 
 require conf/machine/include/j7.inc
 
diff --git a/conf/machine/j7-hs-evm-k3r5-sr1-1.conf b/conf/machine/j721e-hs-evm-k3r5-sr1-1.conf
similarity index 53%
rename from conf/machine/j7-hs-evm-k3r5-sr1-1.conf
rename to conf/machine/j721e-hs-evm-k3r5-sr1-1.conf
index 7d1f4afc..f8004413 100644
--- a/conf/machine/j7-hs-evm-k3r5-sr1-1.conf
+++ b/conf/machine/j721e-hs-evm-k3r5-sr1-1.conf
@@ -1,10 +1,10 @@
 #@TYPE: Machine
-#@NAME: J7 SR1.1 HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J7 SR1.1 HS EVM (R5F core)
+#@NAME: J721e SR1.1 HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J721e SR1.1 HS EVM (R5F core)
 
 # Booting SR1.1 requires different SYSFW, the rest is handled at runtime
 
-require conf/machine/j7-hs-evm-k3r5.conf
+require conf/machine/j721e-hs-evm-k3r5.conf
 SOC_FAMILY_append = ":k3r5-sr1-1"
 
 SYSFW_SOC = "j721e_sr1_1"
diff --git a/conf/machine/j7-hs-evm-k3r5.conf b/conf/machine/j721e-hs-evm-k3r5.conf
similarity index 81%
rename from conf/machine/j7-hs-evm-k3r5.conf
rename to conf/machine/j721e-hs-evm-k3r5.conf
index e4b233db..a0d000b2 100644
--- a/conf/machine/j7-hs-evm-k3r5.conf
+++ b/conf/machine/j721e-hs-evm-k3r5.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
-#@NAME: J7 HS EVM (R5F)
-#@DESCRIPTION: Machine configuration for the TI J7 HS EVM (R5F core)
+#@NAME: J721e HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J721e HS EVM (R5F core)
 
 require conf/machine/include/k3r5.inc
 
diff --git a/conf/machine/j7-hs-evm.conf b/conf/machine/j721e-hs-evm.conf
similarity index 85%
rename from conf/machine/j7-hs-evm.conf
rename to conf/machine/j721e-hs-evm.conf
index bbfe6fcb..26db61c7 100644
--- a/conf/machine/j7-hs-evm.conf
+++ b/conf/machine/j721e-hs-evm.conf
@@ -1,8 +1,8 @@
 #@TYPE: Machine
-#@NAME: J7 HS EVM
-#@DESCRIPTION: Machine configuration for the TI J7 HS EVM
+#@NAME: J721e HS EVM
+#@DESCRIPTION: Machine configuration for the TI J721e HS EVM
 
-require conf/machine/j7-evm.conf
+require conf/machine/j721e-evm.conf
 
 UBOOT_MACHINE = "j721e_hs_evm_a72_defconfig"
 
diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index ec102761..0967e674 100644
--- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -10,7 +10,7 @@ PR = "${INC_PR}.0"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm"
+COMPATIBLE_MACHINE = "j721e-evm|j721e-hs-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
index 7fcbd96a..bdb48b85 100644
--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
@@ -11,7 +11,7 @@ MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|am62xx"
+COMPATIBLE_MACHINE = "j721e-evm|j721e-hs-evm|j721s2-evm|j721s2-hs-evm|am62xx"
 
 DEPENDS = "virtual/kernel"
 
@@ -28,13 +28,13 @@ S = "${WORKDIR}/git"
 
 SRCREV = "6d3d62a15ceb85b719c35f34c6c9e35f556b406b"
 
-TARGET_PRODUCT_j7-evm = "j721e_linux"
-TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
+TARGET_PRODUCT_j721e-evm = "j721e_linux"
+TARGET_PRODUCT_j721e-hs-evm = "j721e_linux"
 TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
 TARGET_PRODUCT_j721s2-hs-evm = "j721s2_linux"
 TARGET_PRODUCT_am62xx = "am62_linux"
-TARGET_BVNC_j7-evm = "22.104.208.318"
-TARGET_BVNC_j7-hs-evm = "22.104.208.318"
+TARGET_BVNC_j721e-evm = "22.104.208.318"
+TARGET_BVNC_j721e-hs-evm = "22.104.208.318"
 TARGET_BVNC_j721s2-evm = "36.53.104.796"
 TARGET_BVNC_j721s2-hs-evm = "36.53.104.796"
 TARGET_BVNC_am62xx = "33.15.11.3"
diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index deaf0b12..77de0aab 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -27,7 +27,7 @@ export PDK_SCICLIENT_ROOT_PATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/pac
 
 BUILD_HS = ""
 BUILD_HS_am65xx-hs-evm = "yes"
-BUILD_HS_j7-hs-evm = "yes"
+BUILD_HS_j721e-hs-evm = "yes"
 export BUILD_HS
 
 # Sciclient for am65x supports mcu1_1 in addition to the default cores in TI_PDK_LIMIT_CORES
@@ -92,7 +92,7 @@ do_compile_prepend_am65xx-evm() {
 }
 
 
-do_compile_prepend_j7-evm() {
+do_compile_prepend_j721e-evm() {
 
     cd ${SCICLIENT_ROOTPATH}/tools
     # Create the .bin file for GP
@@ -100,7 +100,7 @@ do_compile_prepend_j7-evm() {
     cd -
 }
 
-do_compile_prepend_j7-hs-evm() {
+do_compile_prepend_j721e-hs-evm() {
 
     cd ${SCICLIENT_ROOTPATH}/tools
     # Create the .bin file for HS
diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
index bd863c0a..4add7e33 100644
--- a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libdrm ffmpeg"
 
 inherit autotools pkgconfig
 
-COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm"
+COMPATIBLE_MACHINE = "j721e-evm|j721e-hs-evm"
 
 PR = "r1"
 SRCREV = "94a80c8c090dbfdc7fafd4e5bb78c2091e715af2"
diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
index 71f5cfbf..a57acf64 100644
--- a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "libdrm"
 
 inherit autotools pkgconfig
 
-COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm"
+COMPATIBLE_MACHINE = "j721e-evm|j721e-hs-evm"
 
 PR = "r0"
 SRCREV = "a5e7d820bea1be24f25a8369d4d4521c784f869a"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 3986af47..59193dfe 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -6,9 +6,9 @@ DEPENDS_remove_am65xx-evm-k3r5 = " virtual/bootloader"
 DEPENDS_remove_am65xx-evm-k3r5-sr2 = " virtual/bootloader"
 DEPENDS_remove_am65xx-hs-evm-k3r5 = " virtual/bootloader"
 DEPENDS_remove_am65xx-hs-evm-k3r5-sr2 = " virtual/bootloader"
-DEPENDS_remove_j7-evm-k3r5 = " virtual/bootloader"
-DEPENDS_remove_j7-hs-evm-k3r5 = " virtual/bootloader"
-DEPENDS_remove_j7-hs-evm-k3r5-sr1-1 = " virtual/bootloader"
+DEPENDS_remove_j721e-evm-k3r5 = " virtual/bootloader"
+DEPENDS_remove_j721e-hs-evm-k3r5 = " virtual/bootloader"
+DEPENDS_remove_j721e-hs-evm-k3r5-sr1-1 = " virtual/bootloader"
 DEPENDS_append = " ${@ '' if '${TI_SECURE_DEV_PKG_K3}' else 'ti-k3-secdev-native' }"
 
 CLEANBROKEN = "1"
@@ -28,9 +28,9 @@ SYSFW_SUFFIX ?= "unknown"
 SYSFW_CONFIG ?= "unknown"
 
 SYSFW_PREFIX = "sci"
-SYSFW_PREFIX_j7-evm-k3r5 = "fs"
-SYSFW_PREFIX_j7-hs-evm-k3r5 = "fs"
-SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "fs"
+SYSFW_PREFIX_j721e-evm-k3r5 = "fs"
+SYSFW_PREFIX_j721e-hs-evm-k3r5 = "fs"
+SYSFW_PREFIX_j721e-hs-evm-k3r5-sr1-1 = "fs"
 SYSFW_PREFIX_j7200-evm-k3r5 = "fs"
 SYSFW_PREFIX_j7200-hs-evm-k3r5 = "fs"
 SYSFW_PREFIX_j721s2-evm-k3r5 = "fs"
@@ -64,9 +64,9 @@ EXTRA_OEMAKE_remove_am65xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl
 EXTRA_OEMAKE_remove_am65xx-evm-k3r5-sr2 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_remove_am65xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_remove_am65xx-hs-evm-k3r5-sr2 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_remove_j7-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_remove_j7-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_remove_j7-hs-evm-k3r5-sr1-1 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_remove_j721e-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_remove_j721e-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_remove_j721e-hs-evm-k3r5-sr1-1 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 
 do_compile() {
 	cd ${WORKDIR}/imggen/
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index a1df380f..4b0414bc 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -31,7 +31,7 @@ do_compile_append_am64xx-evm() {
 	tfa_sign_k3hs
 }
 
-do_compile_append_j7-hs-evm() {
+do_compile_append_j721e-hs-evm() {
 	tfa_sign_k3hs
 }
 
diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
index 323978bf..5c6484a5 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
@@ -8,7 +8,7 @@ inherit features_check
 REQUIRED_MACHINE_FEATURES = "gpu"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|j721s2-hs-evm|am62xx"
+COMPATIBLE_MACHINE = "j721e-evm|j721e-hs-evm|j721s2-evm|j721s2-hs-evm|am62xx"
 
 PR = "r2"
 
@@ -17,8 +17,8 @@ BRANCH = "linuxws/dunfell/k5.10/${PV}_unified_fw_pagesize"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
 SRCREV = "fba0c770b712640ab3761dbe8369d43f89f616ed"
 
-TARGET_PRODUCT_j7-evm = "j721e_linux"
-TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
+TARGET_PRODUCT_j721e-evm = "j721e_linux"
+TARGET_PRODUCT_j721e-hs-evm = "j721e_linux"
 TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
 TARGET_PRODUCT_j721s2-hs-evm = "j721s2_linux"
 TARGET_PRODUCT_am62xx = "am62_linux"
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index c181c893..c6bae54b 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -38,8 +38,8 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2 p
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx = " prueth-fw-am65x-sr2"
 
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7-evm = " cadence-mhdp-fw"
-RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7-hs-evm = " cadence-mhdp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721e-evm = " cadence-mhdp-fw"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721e-hs-evm = " cadence-mhdp-fw"
 
 # Add run-time dependency for Video Decoding firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index cc9857e0..02ed576f 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -71,7 +71,7 @@ do_compile_append_am64xx-evm() {
     optee_sign_k3hs
 }
 
-do_compile_append_j7-hs-evm() {
+do_compile_append_j721e-hs-evm() {
     optee_sign_k3hs
 }
 
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 19ea93f1..adfd3f57 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -51,7 +51,7 @@ LEGACY_DM_FW_DIR  = "${D}${base_libdir}/firmware/pdk-ipc/"
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
 # J7 HS support
-do_install_prepend_j7-hs-evm() {
+do_install_prepend_j721e-hs-evm() {
         export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
         ( cd ${RTOS_DM_FW_DIR}; \
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
-- 
2.36.1


