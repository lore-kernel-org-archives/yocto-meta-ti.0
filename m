Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F768C25B06
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 02:49:46 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2770.1659667778992074592
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Aug 2022 19:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vwMVeSUF;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2752naVm035238;
	Thu, 4 Aug 2022 21:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1659667776;
	bh=dN+eQsLvtbytWP/Qk138UYyeL8gI3itn2T6zegQ2doI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vwMVeSUFhcVjzOWiWnsz5xVrOuvMvImW6s9OYQbIYeLQdN3sC/gS4tDBLNHxUe/BF
	 PQlxwrr8oRBEpDkFLXzRPvcnhjLDfRa4rWx5u1VGc7pLXgro+W5QEefenvIBepZrfc
	 y+H7Amr0+oATusZCnhhFgYfTtxXXn9UfyANSF/4U=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2752na53041009
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Aug 2022 21:49:36 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 4
 Aug 2022 21:49:36 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 4 Aug 2022 21:49:36 -0500
Received: from ula0226330.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2752nYER111537;
	Thu, 4 Aug 2022 21:49:36 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 5/8] machine: k3r5: Make combined R5 boot
 the default
Date: Thu, 4 Aug 2022 21:49:31 -0500
Message-ID: <20220805024934.23349-5-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220805024934.23349-1-afd@ti.com>
References: <20220805024934.23349-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 05 Aug 2022 02:49:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14931

Going forward, the combined tiboot3.bin is going to be the standard. Only
AM65x and J721e will still use the split boot. Set the output of U-Boot
to be u-boot-spl.bin by default and override only for the two split boot
platforms. This makes it easier to add new platforms and simplifies
deployment logic.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 conf/machine/am65xx-evm-k3r5.conf    |  6 ++++
 conf/machine/am65xx-hs-evm-k3r5.conf |  6 ++++
 conf/machine/include/k3r5.inc        |  6 ++--
 conf/machine/j7-evm-k3r5.conf        |  6 ++++
 conf/machine/j7-hs-evm-k3r5.conf     |  6 ++++
 recipes-bsp/u-boot/u-boot-ti.inc     | 51 ++++------------------------
 6 files changed, 33 insertions(+), 48 deletions(-)

diff --git a/conf/machine/am65xx-evm-k3r5.conf b/conf/machine/am65xx-evm-k3r5.conf
index bd17474e..a484e444 100644
--- a/conf/machine/am65xx-evm-k3r5.conf
+++ b/conf/machine/am65xx-evm-k3r5.conf
@@ -9,4 +9,10 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 SYSFW_SYMLINK = ""
 
+SPL_BINARY = "spl/u-boot-spl.${UBOOT_SUFFIX}"
+SPL_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
+UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
+
 UBOOT_MACHINE = "am65x_evm_r5_defconfig"
diff --git a/conf/machine/am65xx-hs-evm-k3r5.conf b/conf/machine/am65xx-hs-evm-k3r5.conf
index d6d4b1e3..81b8c75f 100644
--- a/conf/machine/am65xx-hs-evm-k3r5.conf
+++ b/conf/machine/am65xx-hs-evm-k3r5.conf
@@ -9,6 +9,12 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
 SYSFW_SYMLINK = ""
 
+SPL_BINARY = "spl/u-boot-spl.${UBOOT_SUFFIX}"
+SPL_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
+UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
+
 UBOOT_MACHINE = "am65x_hs_evm_r5_defconfig"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/conf/machine/include/k3r5.inc b/conf/machine/include/k3r5.inc
index a32accae..035ad812 100644
--- a/conf/machine/include/k3r5.inc
+++ b/conf/machine/include/k3r5.inc
@@ -16,9 +16,9 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 SPL_BINARY = ""
 UBOOT_SUFFIX = "bin"
-UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
-UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
+UBOOT_BINARY = "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "u-boot-r5spl-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
 
 PACKAGECONFIG_pn-u-boot-ti-staging = ""
 PACKAGECONFIG_pn-u-boot-ti-mainline = ""
diff --git a/conf/machine/j7-evm-k3r5.conf b/conf/machine/j7-evm-k3r5.conf
index b9e8cc01..862b017c 100644
--- a/conf/machine/j7-evm-k3r5.conf
+++ b/conf/machine/j7-evm-k3r5.conf
@@ -8,4 +8,10 @@ SYSFW_SOC = "j721e"
 SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "gp"
 
+SPL_BINARY = "spl/u-boot-spl.${UBOOT_SUFFIX}"
+SPL_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
+UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
+
 UBOOT_MACHINE = "j721e_evm_r5_defconfig"
diff --git a/conf/machine/j7-hs-evm-k3r5.conf b/conf/machine/j7-hs-evm-k3r5.conf
index 92d37dee..c0ddfcec 100644
--- a/conf/machine/j7-hs-evm-k3r5.conf
+++ b/conf/machine/j7-hs-evm-k3r5.conf
@@ -9,6 +9,12 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs"
 SYSFW_SYMLINK = ""
 
+SPL_BINARY = "spl/u-boot-spl.${UBOOT_SUFFIX}"
+SPL_SYMLINK = "u-boot-r5spl.${UBOOT_SUFFIX}"
+UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
+UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
+
 UBOOT_MACHINE = "j721e_hs_evm_r5_defconfig"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_K3}"
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index acc06fea..e7020613 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -57,13 +57,6 @@ SPL_UART_BINARY = "u-boot-spl.bin"
 SPL_UART_BINARY_keystone = ""
 SPL_UART_BINARY_k3r5 = ""
 SPL_UART_BINARY_lego-ev3 = ""
-SPL_UART_BINARY_j7200-evm-k3r5 = "u-boot-spl.bin"
-SPL_UART_BINARY_j7200-hs-evm-k3r5 = "u-boot-spl.bin"
-SPL_UART_BINARY_j721s2-evm-k3r5 = "u-boot-spl.bin"
-SPL_UART_BINARY_j721s2-hs-evm-k3r5 = "u-boot-spl.bin"
-SPL_UART_BINARY_am64xx-evm-k3r5 = "u-boot-spl.bin"
-SPL_UART_BINARY_am64xx-hs-evm-k3r5 = "u-boot-spl.bin"
-SPL_UART_BINARY_am62xx-evm-k3r5 = "u-boot-spl.bin"
 
 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
@@ -113,6 +106,12 @@ UBOOT_HS_2ND_BINARY = "u-boot-spl_HS_2ND"
 UBOOT_HS_2ND_IMAGE = "u-boot-spl_HS_2ND-${MACHINE}-${PV}-${PR}"
 UBOOT_HS_2ND_SYMLINK = "u-boot-spl_HS_2ND-${MACHINE}"
 
+do_compile_append_k3r5 () {
+	if ! [ -f ${B}/${UBOOT_BINARY} ]; then
+		ln -s spl/${UBOOT_BINARY} ${B}/${UBOOT_BINARY}
+	fi
+}
+
 do_install_append () {
 	if [ -n "${UBOOT_CONFIG}" ]
 	then
@@ -386,42 +385,4 @@ do_deploy_append_keystone () {
 	fi
 }
 
-# j7200 uses combined image for tiboot3.bin that includes u-boot-spl.bin and sysfw
-# along with board PM/RM configs generated by k3-image-gen and comes from ti-sci-fw
-# hence move the legacy u-boot's tiboot3.bin and u-boot-spl.bin out of the way
-do_deploy_append_j7200-evm-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
-}
-
-do_deploy_append_j7200-hs-evm-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
-}
-
-do_deploy_append_j721s2-evm-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
-}
-
-do_deploy_append_j721s2-hs-evm-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
-}
-
-do_deploy_append_am64xx-evm-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
-}
-
-do_deploy_append_am64xx-hs-evm-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
-}
-
-do_deploy_append_am62xx-evm-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
-}
-
 TOOLCHAIN = "gcc"
-- 
2.36.1


