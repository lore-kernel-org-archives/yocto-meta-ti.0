Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED2DC636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 20:56:17 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.10649.1675889775259513331
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 12:56:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=EnBKTCHC;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 318KuCr9019091;
	Wed, 8 Feb 2023 14:56:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675889772;
	bh=5n/SW9UhWhYuqKJ2CkcpNdE7lEZu8hGvd5rZ7jbucIs=;
	h=From:To:Subject:Date;
	b=EnBKTCHCiUJEQNvCSPWUBStNJ/ey6Y8IrmTBDMy9YGLyCJOWDkJznHR/DAFMRMcVm
	 NSySm8GtJ6Va2l3k8AokxFSj/pI8a/SYdkHevpYzTGR+FnFWOnHMvytF/piCcdZ8MR
	 QQqtwoXJrxymGnZhqKorVXtG4dxNqiMK83NWWF9k=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 318KuC7w076733
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Feb 2023 14:56:12 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 8
 Feb 2023 14:56:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 8 Feb 2023 14:56:12 -0600
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 318KuCl2051383;
	Wed, 8 Feb 2023 14:56:12 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pPrUC-0006gR-3G; Wed, 08 Feb 2023 14:56:12 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] ti-rtos-firmware: Use ti-k3-secdev if TI_SECURE_DEV_PKG_K3 not defined
Date: Wed, 8 Feb 2023 14:56:12 -0600
Message-ID: <20230208205612.25652-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Feb 2023 20:56:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15760

Use ti-k3-secdev native package to provide secure-binary-image.sh script
when it is not passed on as an environment variable. This fixes and issue
with AM64xx which is always HS but should not require TI_SECURE_DEV_PKG
when building for HS-FS platforms.

This is backported from a patch for kirkstone. [1]

[1] https://lists.yoctoproject.org/g/meta-ti/topic/master_kirkstone_patch_1_8/96819771

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 72d85a6b..982171e6 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -37,11 +37,14 @@ CLEANBROKEN = "1"
 PR = "${INC_PR}.0"
 
 # Secure Build
+include recipes-ti/includes/ti-paths.inc
 DEPENDS += "openssl-native"
 
 FILES_${PN} += "${base_libdir}"
 
-TI_SECURE_DEV_PKG ?= ""
+DEPENDS_append = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
+TI_SECURE_DEV_PKG = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
+export TI_SECURE_DEV_PKG
 
 RTOS_ETH_FW_DIR = "${S}/ti-eth/${PLAT_SFX}"
 RTOS_DM_FW_DIR = "${S}/ti-dm/${PLAT_SFX}"
@@ -57,7 +60,6 @@ DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
 # J7 HS support
 do_install_prepend_j7-hs-evm() {
-        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
         ( cd ${RTOS_DM_FW_DIR}; \
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
                 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
@@ -88,7 +90,6 @@ do_install_prepend_j7-hs-evm() {
 
 # J7 HS support
 do_install_prepend_j7200-hs-evm() {
-        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
         ( cd ${RTOS_DM_FW_DIR}; \
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
                 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
@@ -109,7 +110,6 @@ do_install_prepend_j7200-hs-evm() {
 
 # J7 HS support
 do_install_prepend_j721s2-hs-evm() {
-        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
         ( cd ${RTOS_DM_FW_DIR}; \
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
                 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
@@ -133,7 +133,6 @@ do_install_prepend_j721s2-hs-evm() {
 
 # J784S4 support
 do_install_prepend_j784s4-hs-evm() {
-        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
         ( cd ${RTOS_DM_FW_DIR}; \
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
                 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
@@ -176,7 +175,6 @@ do_install_prepend_am64xx() {
 
 # AM62Q HS-SE support
 do_install_prepend_am62xx() {
-        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
         ( cd ${RTOS_DM_FW_DIR}; \
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
                 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
-- 
2.17.1


