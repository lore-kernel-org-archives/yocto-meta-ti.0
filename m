Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30ACBC7EE37
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 18:11:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.18761.1685038297312654436
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 May 2023 11:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=f7m0fxUn;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34PIBaQJ020398;
	Thu, 25 May 2023 13:11:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685038296;
	bh=LDKq4ahfKhfLmWzJ7dYeDVF5uH1bf88rCl12qCGthuc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f7m0fxUn2Ztzn9pWsh0IIIi+SrPAiwSJjcUmQMTzCWEN9zUIfsCMpngq9VvmSRU+d
	 o8yIG46ndL8EesQFqyjfp/1n1NWPEtfxkFz7V2HfpKSdpmUeXuXOUkTfetLAKxxEs3
	 Z7TjO/V/TZW2D+KNeqp5JHZ31GaIc2ILUpWeNefA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34PIBaV7059586
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 May 2023 13:11:36 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 May 2023 13:11:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 May 2023 13:11:36 -0500
Received: from lelv0326.itg.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34PIBXGx102467;
	Thu, 25 May 2023 13:11:35 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 6/9] ti-sci-fw: Drop k3-image-gen and only provide firmware
Date: Thu, 25 May 2023 13:11:29 -0500
Message-ID: <20230525181132.417197-7-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525181132.417197-1-afd@ti.com>
References: <20230525181132.417197-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 May 2023 18:11:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16591

This converts ti-sci-fw into a standard firmware provider package. We do
not need to do anything additional here with that firmware as U-Boot now
does that for us with binman.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  14 +-
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 144 ++----------------
 2 files changed, 12 insertions(+), 146 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index c971321f..a0c2f79c 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -1,4 +1,4 @@
-SUMMARY = "TI SCI firmware (SYSFW)"
+SUMMARY = "Common include for TI Linux firmware"
 
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
@@ -16,21 +16,13 @@ IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.00"
 TIFS_LPM_STUB_FW_VERSION = "08.06.04"
 TI_DM_FW_VERSION = "08.06.04"
+TI_SYSFW_VERSION = "08.06.04"
 
 TI_LINUX_FW_SRCREV ?= "56819cfa9e72a4575b2aef6f8b986092d7d3efa9"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "150f1956b4bdcba36e7dffc78a4342df602f8d6e"
-SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
-SRCREV_FORMAT = "imggen"
-
-K3_IMAGE_GEN_BRANCH ?= "master"
-
-SRC_URI = " \
-	git://git.ti.com/git/processor-firmware/ti-linux-firmware.git;protocol=https;branch=${BRANCH} \
-	git://git.ti.com/git/k3-image-gen/k3-image-gen.git;protocol=https;branch=${K3_IMAGE_GEN_BRANCH};destsuffix=imggen;name=imggen \
-"
+SRC_URI = "git://git.ti.com/git/processor-firmware/ti-linux-firmware.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index ee995fa5..6a4c03f9 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,149 +1,23 @@
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-DEPENDS = "openssl-native u-boot-mkimage-native dtc-native virtual/bootloader"
-DEPENDS:remove:am65xx-evm-k3r5 = "virtual/bootloader"
-DEPENDS:remove:am65xx-evm-k3r5-sr2 = "virtual/bootloader"
-DEPENDS:remove:am65xx-hs-evm-k3r5 = "virtual/bootloader"
-DEPENDS:remove:am65xx-hs-evm-k3r5-sr2 = "virtual/bootloader"
-DEPENDS:remove:j721e-evm-k3r5 = "virtual/bootloader"
-DEPENDS:remove:j721e-hs-evm-k3r5 = "virtual/bootloader"
-DEPENDS:remove:j721e-hs-evm-k3r5-sr1-1 = "virtual/bootloader"
-DEPENDS:remove:beaglebone-ai64-k3r5 = "virtual/bootloader"
-
-CLEANBROKEN = "1"
-PR = "${INC_PR}.2"
+SUMMARY = "TI SYSFW/TIFS Firmware"
 
-# Loaded by R5F core
-COMPATIBLE_MACHINE = "k3r5"
-COMPATIBLE_MACHINE:aarch64 = "null"
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-# Use TI SECDEV for signing
-inherit ti-secdev
-
-SYSFW_SOC ?= "unknown"
-SYSFW_SUFFIX ?= "unknown"
-SYSFW_CONFIG ?= "unknown"
-
-SYSFW_PREFIX = "sci"
-SYSFW_PREFIX:j721e-evm-k3r5 = "fs"
-SYSFW_PREFIX:j721e-hs-evm-k3r5 = "fs"
-SYSFW_PREFIX:j721e-hs-evm-k3r5-sr1-1 = "fs"
-SYSFW_PREFIX:beaglebone-ai64-k3r5 = "fs"
-SYSFW_PREFIX:j7200-evm-k3r5 = "fs"
-SYSFW_PREFIX:j7200-hs-evm-k3r5 = "fs"
-SYSFW_PREFIX:j721s2-evm-k3r5-gp = "fs"
-SYSFW_PREFIX:j721s2-evm-k3r5-sr1-hs-fs = "fs"
-SYSFW_PREFIX:j721s2-hs-evm-k3r5 = "fs"
-SYSFW_PREFIX:j784s4-evm-k3r5-gp = "fs"
-SYSFW_PREFIX:j784s4-evm-k3r5-sr1-hs-fs = "fs"
-SYSFW_PREFIX:j784s4-hs-evm-k3r5 = "fs"
-SYSFW_PREFIX:am62xx-evm-k3r5-gp = "fs"
-SYSFW_PREFIX:am62xx-evm-k3r5-hs-se = "fs"
-SYSFW_PREFIX:am62xx-evm-k3r5-hs-fs = "fs"
-SYSFW_PREFIX:beagleplay-k3r5 = "fs"
-SYSFW_PREFIX:am62xx-lp-evm-k3r5 = "fs"
-SYSFW_PREFIX:am62xx-lp-evm-k3r5-hs-se = "fs"
-SYSFW_PREFIX:am62xx-lp-evm-k3r5-hs-fs = "fs"
-SYSFW_PREFIX:am62axx-evm-k3r5-gp = "fs"
-SYSFW_PREFIX:am62axx-evm-k3r5-hs-fs = "fs"
-SYSFW_PREFIX:am62axx-evm-k3r5-hs-se = "fs"
-
-SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
-
-SYSFW_TIBOOT3 = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.bin"
-SYSFW_TIBOOT3_SYMLINK ?= "tiboot3.bin"
-
-SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_SYMLINK ?= "sysfw.itb"
-
-SYSFW_VBINARY:am65xx-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:am65xx-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:am65xx-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:am65xx-hs-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:j721e-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:j721e-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:j721e-hs-evm-k3r5-sr1-1 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-
-SYSFW_IMAGE:am65xx-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:am65xx-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:am65xx-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:am65xx-hs-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:j721e-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:j721e-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:j721e-hs-evm-k3r5-sr1-1 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-
 CFLAGS[unexport] = "1"
 LDFLAGS[unexport] = "1"
 AS[unexport] = "1"
 LD[unexport] = "1"
 
-do_configure[noexec] = "1"
-
-EXTRA_OEMAKE = "\
-    CROSS_COMPILE=${TARGET_PREFIX} SOC=${SYSFW_SOC} SOC_TYPE=${SYSFW_SUFFIX} \
-    CONFIG=${SYSFW_CONFIG} SYSFW_DIR="${S}/ti-sysfw" \
-    SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin" \
-"
-EXTRA_OEMAKE:remove:am65xx-evm-k3r5 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE:remove:am65xx-evm-k3r5-sr2 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE:remove:am65xx-hs-evm-k3r5 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE:remove:am65xx-hs-evm-k3r5-sr2 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE:remove:j721e-evm-k3r5 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE:remove:j721e-hs-evm-k3r5 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE:remove:j721e-hs-evm-k3r5-sr1-1 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE:remove:beaglebone-ai64-k3r5 = "SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+PV = "${TI_SYSFW_VERSION}"
+PR = "${INC_PR}.0"
 
-do_compile() {
-	cd ${WORKDIR}/imggen/
-	oe_runmake
-}
+CLEANBROKEN = "1"
 
 do_install() {
-	install -d ${D}/boot
-
-	if [ -f "${WORKDIR}/imggen/${SYSFW_BINARY}" ]; then
-		install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${D}/boot/${SYSFW_VBINARY}
-		ln -sf ${SYSFW_VBINARY} ${D}/boot/${SYSFW_IMAGE}
-		if [ ! -z "${SYSFW_SYMLINK}" ]; then
-			ln -sf ${SYSFW_VBINARY} ${D}/boot/${SYSFW_SYMLINK}
-		fi
-	fi
-
-	if [ -f "${WORKDIR}/imggen/${SYSFW_TIBOOT3}" ]; then
-		install -m 644 ${WORKDIR}/imggen/${SYSFW_TIBOOT3} ${D}/boot/${SYSFW_TIBOOT3}
-		if [ ! -z "${SYSFW_TIBOOT3_SYMLINK}" ]; then
-			ln -sf ${SYSFW_TIBOOT3} ${D}/boot/${SYSFW_TIBOOT3_SYMLINK}
-		fi
-	fi
-}
-
-FILES:${PN} = "/boot"
-
-inherit deploy
-
-do_deploy () {
-	install -d ${DEPLOYDIR}
-
-	if [ -f "${WORKDIR}/imggen/${SYSFW_BINARY}" ]; then
-		install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_VBINARY}
-		ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
-		if [ ! -z "${SYSFW_SYMLINK}" ]; then
-			ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_SYMLINK}
-			install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-		fi
-	fi
-
-	if [ -f "${WORKDIR}/imggen/${SYSFW_TIBOOT3}" ]; then
-		install -m 644 ${WORKDIR}/imggen/${SYSFW_TIBOOT3} ${DEPLOYDIR}/${SYSFW_TIBOOT3}
-		if [ ! -z "${SYSFW_TIBOOT3_SYMLINK}" ]; then
-			ln -sf ${SYSFW_TIBOOT3} ${DEPLOYDIR}/${SYSFW_TIBOOT3_SYMLINK}
-			install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-		fi
-	fi
+	install -d ${D}${nonarch_base_libdir}/firmware/ti-sysfw
+	install -m 644 ${S}/ti-sysfw/ti-sci-firmware-* ${D}${nonarch_base_libdir}/firmware/ti-sysfw
+	install -m 644 ${S}/ti-sysfw/ti-fs-firmware-* ${D}${nonarch_base_libdir}/firmware/ti-sysfw
 }
 
-addtask deploy before do_build after do_compile
+FILES:${PN} = "${nonarch_base_libdir}/firmware"
-- 
2.39.2


