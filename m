Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693ABC3F2D4
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 22:02:42 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.44558.1656712952157554794
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Jul 2022 15:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aSxophp4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 261M2UYA006444;
	Fri, 1 Jul 2022 17:02:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656712950;
	bh=v/Zej3t3agg58uTgh6wVJm8EZ9ExB2cnZCuVrGkmBVA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aSxophp41oi8tfCmZhrS86fOewVa3JpTaFdu/sQPFZkMtohQPOxM2+KMNO2VJk6tN
	 gMkXkIHB3jBgdgeCGXAZQd/zcM5So5dddNkqtn2hdLQSiGiDWG/8gyPTH/A90W1NbW
	 7uqDXv74swUR56LfqS+BHbG+Ad3NRXltmAcXJ90w=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 261M2UFg019454
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 1 Jul 2022 17:02:30 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 1
 Jul 2022 17:02:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 1 Jul 2022 17:02:29 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 261M2SS5029974;
	Fri, 1 Jul 2022 17:02:29 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][RFC 2/6] ti-sci-fw: Use new SOC_TYPE and SYSFW_DIR
 to simplify recipe
Date: Fri, 1 Jul 2022 17:02:24 -0500
Message-ID: <20220701220228.5449-3-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701220228.5449-1-afd@ti.com>
References: <20220701220228.5449-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Jul 2022 22:02:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14862

The k3-image-gen now has two new helper flags SOC_TYPE and SYSFW_DIR
that we can use to simplify this recipe. With these we do not need to do
anything different here for HS builds, the SOC_TYPE selects this now.

DL_URL also do not need cleared anymore, the k3-image-gen will no longer
download missing files when not needed for the current build type.

do_install and do_deploy can also check for the existence of either
sysfw.itb or tiboot3.bin and install/deploy as needed. k3-image-gen only
gerneates the right one now depending on the SoC. Merge all these
steps for all SoCs.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 325 +++++++++----------------
 1 file changed, 116 insertions(+), 209 deletions(-)
 rewrite recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb (64%)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
dissimilarity index 64%
index 983d23e3..d1f2859e 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,209 +1,116 @@
-require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-
-DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
-DEPENDS_append_j7200-evm-k3r5 = " virtual/bootloader"
-DEPENDS_append_j7200-hs-evm-k3r5 = " virtual/bootloader"
-DEPENDS_append_j721s2-evm-k3r5 = " virtual/bootloader"
-DEPENDS_append_j721s2-hs-evm-k3r5 = " virtual/bootloader"
-DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
-DEPENDS_append_am64xx-hs-evm-k3r5 = " virtual/bootloader"
-DEPENDS_append_am62xx-evm-k3r5 = " virtual/bootloader"
-
-CLEANBROKEN = "1"
-PR = "${INC_PR}.2"
-
-# Loaded by R5F core
-COMPATIBLE_MACHINE = "k3r5"
-COMPATIBLE_MACHINE_aarch64 = "null"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-TI_SECURE_DEV_PKG ?= ""
-export TI_SECURE_DEV_PKG
-
-SYSFW_SOC ?= "unknown"
-SYSFW_CONFIG ?= "unknown"
-
-SYSFW_PREFIX = "ti-sci-firmware"
-SYSFW_PREFIX_j7-evm-k3r5 = "ti-fs-firmware"
-SYSFW_PREFIX_j7-hs-evm-k3r5 = "ti-fs-firmware"
-SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "ti-fs-firmware"
-SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"
-SYSFW_PREFIX_j7200-hs-evm-k3r5 = "ti-fs-firmware"
-SYSFW_PREFIX_j721s2-evm-k3r5 = "ti-fs-firmware"
-SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "ti-fs-firmware"
-SYSFW_PREFIX_am62xx-evm-k3r5 = "ti-fs-firmware"
-
-SYSFW_SUFFIX ?= "unknown"
-
-SYSFW_BASE = "${SYSFW_PREFIX}-${SYSFW_SOC}-${SYSFW_SUFFIX}"
-SYSFW_BASE_append = "${@['','*']['${SYSFW_SUFFIX}' == 'hs']}"
-
-SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}.bin"
-
-SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_SYMLINK ?= "sysfw.itb"
-
-CFLAGS[unexport] = "1"
-LDFLAGS[unexport] = "1"
-AS[unexport] = "1"
-LD[unexport] = "1"
-
-do_configure[noexec] = "1"
-
-EXTRA_OEMAKE = "\
-    CROSS_COMPILE=${TARGET_PREFIX} SYSFW_DL_URL='' SYSFW_HS_DL_URL='' SYSFW_HS_INNER_CERT_DL_URL='' \
-    SYSFW_PATH="${SYSFW_TISCI}" SOC=${SYSFW_SOC} CONFIG=${SYSFW_CONFIG} \
-"
-EXTRA_OEMAKE_HS = " \
-    HS=1 SW_REV=1 SYSFW_HS_PATH="${S}/ti-sysfw/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
-"
-EXTRA_OEMAKE_append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}"
-
-EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_append_j7200-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_append_j721s2-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_append_j721s2-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_append_am64xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-EXTRA_OEMAKE_append_am62xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
-
-do_compile() {
-	cd ${WORKDIR}/imggen/
-	oe_runmake
-}
-
-do_install() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${D}/boot/${SYSFW_VBINARY}
-	ln -sf ${SYSFW_VBINARY} ${D}/boot/${SYSFW_IMAGE}
-	if [ ! -z "${SYSFW_SYMLINK}" ]; then
-		ln -sf ${SYSFW_VBINARY} ${D}/boot/${SYSFW_SYMLINK}
-	fi
-}
-
-FILES_${PN} = "/boot"
-
-inherit deploy
-
-do_deploy () {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_VBINARY}
-	rm -f ${DEPLOYDIR}/${SYSFW_IMAGE}
-	ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
-	if [ ! -z "${SYSFW_SYMLINK}" ]; then
-		rm -f ${DEPLOYDIR}/${SYSFW_SYMLINK}
-		ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_SYMLINK}
-	fi
-
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
-
-do_install_j7200-evm-k3r5() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
-
-do_deploy_j7200-evm-k3r5() {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
-
-do_install_j7200-hs-evm-k3r5() {
-        install -d ${D}/boot
-        install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-        ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-        ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
-
-do_deploy_j7200-hs-evm-k3r5() {
-        install -d ${DEPLOYDIR}
-        install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-        ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-        ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-        install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
-
-do_install_j721s2-evm-k3r5() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
-
-do_deploy_j721s2-evm-k3r5() {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
-
-do_install_j721s2-hs-evm-k3r5() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
-
-do_deploy_j721s2-hs-evm-k3r5() {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
-
-do_install_am64xx-evm-k3r5() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
-
-do_deploy_am64xx-evm-k3r5() {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
-
-do_install_am64xx-hs-evm-k3r5() {
-        install -d ${D}/boot
-        install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-        ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-        ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
-
-do_deploy_am64xx-hs-evm-k3r5() {
-        install -d ${DEPLOYDIR}
-        install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-        ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-        ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-        install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
-
-do_install_am62xx-evm-k3r5() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
-
-do_deploy_am62xx-evm-k3r5() {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
-	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
-}
-
-addtask deploy before do_build after do_compile
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
+DEPENDS_append_j7200-evm-k3r5 = " virtual/bootloader"
+DEPENDS_append_j7200-hs-evm-k3r5 = " virtual/bootloader"
+DEPENDS_append_j721s2-evm-k3r5 = " virtual/bootloader"
+DEPENDS_append_j721s2-hs-evm-k3r5 = " virtual/bootloader"
+DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
+DEPENDS_append_am64xx-hs-evm-k3r5 = " virtual/bootloader"
+DEPENDS_append_am62xx-evm-k3r5 = " virtual/bootloader"
+
+CLEANBROKEN = "1"
+PR = "${INC_PR}.2"
+
+# Loaded by R5F core
+COMPATIBLE_MACHINE = "k3r5"
+COMPATIBLE_MACHINE_aarch64 = "null"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+TI_SECURE_DEV_PKG ?= ""
+export TI_SECURE_DEV_PKG
+
+SYSFW_SOC ?= "unknown"
+SYSFW_CONFIG ?= "unknown"
+
+SYSFW_PREFIX = "ti-sci-firmware"
+SYSFW_PREFIX_j7-evm-k3r5 = "ti-fs-firmware"
+SYSFW_PREFIX_j7-hs-evm-k3r5 = "ti-fs-firmware"
+SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "ti-fs-firmware"
+SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"
+SYSFW_PREFIX_j7200-hs-evm-k3r5 = "ti-fs-firmware"
+SYSFW_PREFIX_j721s2-evm-k3r5 = "ti-fs-firmware"
+SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "ti-fs-firmware"
+SYSFW_PREFIX_am62xx-evm-k3r5 = "ti-fs-firmware"
+
+SYSFW_SUFFIX ?= "unknown"
+
+SYSFW_BASE = "${SYSFW_PREFIX}-${SYSFW_SOC}-${SYSFW_SUFFIX}"
+SYSFW_BASE_append = "${@['','*']['${SYSFW_SUFFIX}' == 'hs']}"
+
+SYSFW_TISCI = "${S}/ti-sysfw/${SYSFW_BASE}.bin"
+
+SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_SYMLINK ?= "sysfw.itb"
+
+CFLAGS[unexport] = "1"
+LDFLAGS[unexport] = "1"
+AS[unexport] = "1"
+LD[unexport] = "1"
+
+do_configure[noexec] = "1"
+
+EXTRA_OEMAKE = "\
+    CROSS_COMPILE=${TARGET_PREFIX} SOC=${SYSFW_SOC} SOC_TYPE=${SYSFW_SUFFIX} \
+    CONFIG=${SYSFW_CONFIG} SYSFW_DIR="${S}/ti-sysfw" \
+"
+
+EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_append_j7200-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_append_j721s2-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_append_j721s2-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_append_am64xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_append_am62xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+
+do_compile() {
+	cd ${WORKDIR}/imggen/
+	oe_runmake
+}
+
+do_install() {
+	install -d ${D}/boot
+
+	if [ -f "${WORKDIR}/imggen/${SYSFW_BINARY}" ]; then
+		install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${D}/boot/${SYSFW_VBINARY}
+		ln -sf ${SYSFW_VBINARY} ${D}/boot/${SYSFW_IMAGE}
+		if [ ! -z "${SYSFW_SYMLINK}" ]; then
+			ln -sf ${SYSFW_VBINARY} ${D}/boot/${SYSFW_SYMLINK}
+		fi
+	fi
+
+	if [ -f "${WORKDIR}/imggen/${UBOOT_BINARY}" ]; then
+		install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+		ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
+		ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+	fi
+}
+
+FILES_${PN} = "/boot"
+
+inherit deploy
+
+do_deploy () {
+	install -d ${DEPLOYDIR}
+
+	if [ -f "${WORKDIR}/imggen/${SYSFW_BINARY}" ]; then
+		install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_VBINARY}
+		ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
+		if [ ! -z "${SYSFW_SYMLINK}" ]; then
+			ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_SYMLINK}
+		fi
+	fi
+
+	if [ -f "${WORKDIR}/imggen/${UBOOT_BINARY}" ]; then
+		install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+		ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+		ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	fi
+
+	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
+}
+
+addtask deploy before do_build after do_compile
-- 
2.36.1


