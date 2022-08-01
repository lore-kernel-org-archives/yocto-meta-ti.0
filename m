Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCF6C19F2C
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 21:40:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.3259.1659390011087960428
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 14:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NwrQYE7R;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 271LeAwo036096;
	Mon, 1 Aug 2022 16:40:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659390010;
	bh=HWezkUS7OFkc6DXbiQGQ0xaZUH17KTZC/CBBq6HT4Gw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NwrQYE7RlMrpbem+zQvXWb0d2flNUHOolo6OjY4421k+MAX1PdZZfJnXYRwZJkZln
	 YNuVDR+AAnbMTmHeYxa2m21As6So4l/mZ0ujahVARNa058ihaPftaEeSebvhz5TFZG
	 8nkRdPVbVi8S7GuXKT4RSPIaH5zu2RYW2Mjg6tj8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 271LeAWD051703
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Aug 2022 16:40:10 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 1
 Aug 2022 16:40:09 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 1 Aug 2022 16:40:09 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 271Le78h035718;
	Mon, 1 Aug 2022 16:40:09 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 2/4] ti-sci-fw: Use new SOC_TYPE and
 SYSFW_DIR to simplify recipe
Date: Mon, 1 Aug 2022 16:40:05 -0500
Message-ID: <20220801214007.25463-2-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220801214007.25463-1-afd@ti.com>
References: <20220801214007.25463-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 01 Aug 2022 21:40:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14915

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
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc |   2 +-
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb  | 147 +++++-------------------
 2 files changed, 28 insertions(+), 121 deletions(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 8aaf1559..a8627c68 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -25,7 +25,7 @@ SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "85a70059fc24242ea03653a5014b98100e4da2d6"
+K3_IMAGE_GEN_SRCREV ?= "91a75b17c616a5cc41b3345905dccba5c29aca66"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 983d23e3..d1f2859e 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -54,13 +54,9 @@ LD[unexport] = "1"
 do_configure[noexec] = "1"
 
 EXTRA_OEMAKE = "\
-    CROSS_COMPILE=${TARGET_PREFIX} SYSFW_DL_URL='' SYSFW_HS_DL_URL='' SYSFW_HS_INNER_CERT_DL_URL='' \
-    SYSFW_PATH="${SYSFW_TISCI}" SOC=${SYSFW_SOC} CONFIG=${SYSFW_CONFIG} \
+    CROSS_COMPILE=${TARGET_PREFIX} SOC=${SYSFW_SOC} SOC_TYPE=${SYSFW_SUFFIX} \
+    CONFIG=${SYSFW_CONFIG} SYSFW_DIR="${S}/ti-sysfw" \
 "
-EXTRA_OEMAKE_HS = " \
-    HS=1 SW_REV=1 SYSFW_HS_PATH="${S}/ti-sysfw/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
-"
-EXTRA_OEMAKE_append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}"
 
 EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_j7200-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
@@ -77,10 +73,19 @@ do_compile() {
 
 do_install() {
 	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${D}/boot/${SYSFW_VBINARY}
-	ln -sf ${SYSFW_VBINARY} ${D}/boot/${SYSFW_IMAGE}
-	if [ ! -z "${SYSFW_SYMLINK}" ]; then
-		ln -sf ${SYSFW_VBINARY} ${D}/boot/${SYSFW_SYMLINK}
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
 	fi
 }
 
@@ -90,119 +95,21 @@ inherit deploy
 
 do_deploy () {
 	install -d ${DEPLOYDIR}
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
+	if [ -f "${WORKDIR}/imggen/${SYSFW_BINARY}" ]; then
+		install -m 644 ${WORKDIR}/imggen/${SYSFW_BINARY} ${DEPLOYDIR}/${SYSFW_VBINARY}
+		ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_IMAGE}
+		if [ ! -z "${SYSFW_SYMLINK}" ]; then
+			ln -sf ${SYSFW_VBINARY} ${DEPLOYDIR}/${SYSFW_SYMLINK}
+		fi
+	fi
 
-do_install_am62xx-evm-k3r5() {
-	install -d ${D}/boot
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
-}
+	if [ -f "${WORKDIR}/imggen/${UBOOT_BINARY}" ]; then
+		install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+		ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+		ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	fi
 
-do_deploy_am62xx-evm-k3r5() {
-	install -d ${DEPLOYDIR}
-	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
-	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
-- 
2.36.1


