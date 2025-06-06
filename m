Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8752C5B549
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 07:33:38 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.28492.1749195217004987439
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Jun 2025 00:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=oPgD9Yqe;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: p-bhagat@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5567XXVQ106760;
	Fri, 6 Jun 2025 02:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749195213;
	bh=3EgAzXpCO5iOAH8QiW0a2g4UyIzt7egFVq+EgRAiZ0A=;
	h=From:To:CC:Subject:Date;
	b=oPgD9YqeXYtusYORRmzGfmxSDwCcfUyGd7EWEGYlTi/o/CXfoMG3oL69JN5nfAqde
	 NszCKsX8B6WEnr+7dlU0PIw+2rRHhnS98g1CWZCG7hItXOQBy8d7Co5XRmz72YVeLB
	 hPWFzY4s89bZK7dAWsK4gcoB6EDQEyt9TOMKm2TY=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5567XXG81504924
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 6 Jun 2025 02:33:33 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Jun 2025 02:33:33 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Jun 2025 02:33:33 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5567XWXe616441;
	Fri, 6 Jun 2025 02:33:32 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
        <reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <anoop.rk@ti.com>,
        <afd@ti.com>
Subject: [scarthgap][RFC] meta-ti-bsp: ti-rtos-fw: Update IPC firmwares for am62dxx
Date: Fri, 6 Jun 2025 13:03:12 +0530
Message-ID: <20250606073312.195092-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Jun 2025 07:33:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18622

Previously, AM62d build reused AM62a's IPC firmwares. Now that
dedicated AM62d IPC firmwares are being added to ti-linux-firmware
repo, package the new IPC firmwares.

Patch for AM62d IPC firmwares.
https://serenity.dal.design.ti.com/patchwork/project/linux-patch-review/patch/20250602060924.479712-1-anoop.rk@ti.com/

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../ti-rtos-fw/ti-rtos-echo-test-fw.bb        | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
index 1fe67be8..c4840e63 100644
--- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
@@ -20,7 +20,7 @@ PLAT_SFX:am65xx = "am65xx"
 PLAT_SFX:am64xx = "am64xx"
 PLAT_SFX:am62xx = "am62xx"
 PLAT_SFX:am62axx = "am62axx"
-PLAT_SFX:am62dxx = "am62axx"
+PLAT_SFX:am62dxx = "am62dxx"
 PLAT_SFX:am62pxx = "am62pxx"
 
 FILESEXTRAPATHS:prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
@@ -39,6 +39,7 @@ INSTALL_IPC_FW_DIR = "${nonarch_base_libdir}/firmware/${IPC_FW_DIR}"
 MCU_1_0_FW =       "ipc_echo_test_mcu1_0_release_strip.xer5f"
 MCU_1_1_FW =       "ipc_echo_test_mcu1_1_release_strip.xer5f"
 MCU_2_0_FW =       "ipc_echo_test_mcu2_0_release_strip.xer5f"
+MCU_2_0_FW:am62dxx = "ipc_rpmsg_echo_linux.mcu-r5f0_0.release.strip.out"
 MCU_2_1_FW =       "ipc_echo_test_mcu2_1_release_strip.xer5f"
 MCU_3_0_FW =       "ipc_echo_test_mcu3_0_release_strip.xer5f"
 MCU_3_1_FW =       "ipc_echo_test_mcu3_1_release_strip.xer5f"
@@ -48,6 +49,7 @@ C66_1_FW =         "ipc_echo_test_c66xdsp_1_release_strip.xe66"
 C66_2_FW =         "ipc_echo_test_c66xdsp_2_release_strip.xe66"
 C7X_1_FW =         "ipc_echo_test_c7x_1_release_strip.xe71"
 C7X_1_FW:am62axx = "dsp_edgeai_c7x_1_release_strip.out"
+C7X_1_FW:am62dxx = "ipc_rpmsg_echo_linux.c75ss0-0.release.strip.out"
 C7X_2_FW =         "ipc_echo_test_c7x_2_release_strip.xe71"
 C7X_3_FW =         "ipc_echo_test_c7x_3_release_strip.xe71"
 C7X_4_FW =         "ipc_echo_test_c7x_4_release_strip.xe71"
@@ -98,13 +100,6 @@ do_install:prepend:am62axx() {
         )
 }
 
-# Update the am62dxx ipc binaries to be consistent with other platforms
-do_install:prepend:am62dxx() {
-        ( cd ${S}/${IPC_FW_DIR}; \
-                ln -sf am62a-mcu-r5f0_0-fw ${MCU_2_0_FW}; \
-        )
-}
-
 do_install() {
     # IPC Firmware
     for FW_NAME in ${IPC_FW_LIST}
@@ -149,8 +144,8 @@ ALTERNATIVE:${PN}:am62axx = "\
                     "
 
 ALTERNATIVE:${PN}:am62dxx = "\
-                    am62a-mcu-r5f0_0-fw   am62a-mcu-r5f0_0-fw-sec \
-                    am62a-c71_0-fw        am62a-c71_0-fw-sec \
+                    am62d-mcu-r5f0_0-fw   am62d-mcu-r5f0_0-fw-sec \
+                    am62d-c71_0-fw        am62d-c71_0-fw-sec \
                     "
 
 ALTERNATIVE:${PN}:j721e = "\
@@ -243,6 +238,11 @@ ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmwar
 ALTERNATIVE_LINK_NAME[am62a-c71_0-fw]     = "${nonarch_base_libdir}/firmware/am62a-c71_0-fw"
 ALTERNATIVE_LINK_NAME[am62a-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62a-c71_0-fw-sec"
 
+ALTERNATIVE_LINK_NAME[am62d-mcu-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/am62d-mcu-r5f0_0-fw"
+ALTERNATIVE_LINK_NAME[am62d-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62d-mcu-r5f0_0-fw-sec"
+ALTERNATIVE_LINK_NAME[am62d-c71_0-fw]     = "${nonarch_base_libdir}/firmware/am62d-c71_0-fw"
+ALTERNATIVE_LINK_NAME[am62d-c71_0-fw-sec] = "${nonarch_base_libdir}/firmware/am62d-c71_0-fw-sec"
+
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw]     = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_1-fw"
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw-sec] = "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_1-fw-sec"
 ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw]     = "${nonarch_base_libdir}/firmware/j7-main-r5f0_0-fw"
@@ -364,6 +364,11 @@ ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_F
 ALTERNATIVE_TARGET[am62a-c71_0-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
 ALTERNATIVE_TARGET[am62a-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
 
+ALTERNATIVE_TARGET[am62d-mcu-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
+ALTERNATIVE_TARGET[am62d-mcu-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
+ALTERNATIVE_TARGET[am62d-c71_0-fw]     = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
+ALTERNATIVE_TARGET[am62d-c71_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
+
 ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
 ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}.signed"
 ALTERNATIVE_TARGET[j7-main-r5f0_0-fw]     = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
-- 
2.34.1


