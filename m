Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AC0C77B7C
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 17:23:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.85708.1682443429836431023
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Apr 2023 10:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XjbYMcAy;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33PHNmnp052991;
	Tue, 25 Apr 2023 12:23:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682443429;
	bh=DHF/Z88IfhNPF4FjNv3d96U9m35Fbplrggy2wzJ2FdM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XjbYMcAyNctuTOqDJ8Xqc2m26/ygY0RueVR/saILqqMyTzVrpKzRT2qyYY0rkStxV
	 uWApinLpMVw98XnQMVVSbA3AUS63cdmOVybosJdQMuv+k782sv0uQywiFcYXdQtyLv
	 gF2f50wOR2/zksxslaVn1yEo4kxj1iwyF6hbaQAA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33PHNmHK031732
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Apr 2023 12:23:48 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 25
 Apr 2023 12:23:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Apr 2023 12:23:48 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33PHNj0t030178;
	Tue, 25 Apr 2023 12:23:48 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Neha Malcom Francis <n-francis@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][RFC 6/9] ti-sci-fw: Drop k3-image-gen and only provide firmware
Date: Tue, 25 Apr 2023 12:23:42 -0500
Message-ID: <20230425172345.12293-7-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230425172345.12293-1-afd@ti.com>
References: <20230425172345.12293-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Apr 2023 17:23:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16424

This converts ti-sci-fw into a standard firmware provider package. We do
not need to do anything additional here with that firmware as U-Boot now
does that for us with binman.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  14 +-
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 144 ++----------------
 2 files changed, 12 insertions(+), 146 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 912ca63f..f42b5210 100644
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
 
 TI_LINUX_FW_SRCREV ?= "79c498ef6ab1558b699a2243a26c4a65a1c44d26"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "1319f46f3899e62d88e0a5cedad5b454d0432ddb"
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
index cde768df..6a4c03f9 100644
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
-SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
-SYSFW_SYMLINK ?= "sysfw.itb"
-
-SYSFW_VBINARY:am65xx-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:am65xx-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:am65xx-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:am65xx-hs-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:j721e-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:j721e-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:j721e-hs-evm-k3r5-sr1-1 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-
-SYSFW_IMAGE:am65xx-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:am65xx-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:am65xx-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:am65xx-hs-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:j721e-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:j721e-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:j721e-hs-evm-k3r5-sr1-1 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
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


