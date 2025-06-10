Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2E7C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 18:17:39 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.94463.1749579453337936312
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 11:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Tcm8Rgms;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: p-bhagat@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55AIHUge2363930;
	Tue, 10 Jun 2025 13:17:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749579450;
	bh=QkvPvXxgY+GsVzu1+ivczVEkns0RfnrOqYM37kg73aQ=;
	h=From:To:CC:Subject:Date;
	b=Tcm8Rgmshrt7T/spNv6MxvctJU9jWJ0G2k+FBv2vrxrVar/4KhD138+KR0IwdacaV
	 pNSt1Ewin43W4Pm0Nh8HY7IZljebjM5KTr3Q67W+NmX1e1K/wAXpWZO10xh7bQQewU
	 1wgazrNVNWLyNf6Liu1i03Ls9t3tIe05oDicZh9Y=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55AIHUGs2296140
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 10 Jun 2025 13:17:30 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 10
 Jun 2025 13:17:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 10 Jun 2025 13:17:29 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55AIHTjS3454296;
	Tue, 10 Jun 2025 13:17:29 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
        <reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <anoop.rk@ti.com>,
        <afd@ti.com>
Subject: [scarthgap][PATCH v2] meta-ti-bsp: ti-rtos-fw: Update IPC firmwares for am62dxx
Date: Tue, 10 Jun 2025 23:47:23 +0530
Message-ID: <20250610181723.820388-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Jun 2025 18:17:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18638

Previously, AM62d build reused AM62a's IPC firmwares. Now that
dedicated AM62d IPC firmwares are being pushed to ti-linux-firmware
repo, package the new IPC firmwares for echo test.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---

Boot logs
https://gist.github.com/paresh-bhagat12/6fef215c80fa03c8ea55952f46328b83

Change log:
V1 -> V2:
	- Use do_install:prepend to update firmware name instead of
	  overriding the variables.

 .../ti-rtos-fw/ti-rtos-echo-test-fw.bb        | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
index 1fe67be8..7961413c 100644
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
@@ -101,7 +101,8 @@ do_install:prepend:am62axx() {
 # Update the am62dxx ipc binaries to be consistent with other platforms
 do_install:prepend:am62dxx() {
         ( cd ${S}/${IPC_FW_DIR}; \
-                ln -sf am62a-mcu-r5f0_0-fw ${MCU_2_0_FW}; \
+                ln -sf ipc_rpmsg_echo_linux.mcu-r5f0_0.release.strip.out ${MCU_2_0_FW}; \
+                ln -sf ipc_rpmsg_echo_linux.c75ss0-0.release.strip.out ${C7X_1_FW}; \
         )
 }
 
@@ -149,8 +150,8 @@ ALTERNATIVE:${PN}:am62axx = "\
                     "
 
 ALTERNATIVE:${PN}:am62dxx = "\
-                    am62a-mcu-r5f0_0-fw   am62a-mcu-r5f0_0-fw-sec \
-                    am62a-c71_0-fw        am62a-c71_0-fw-sec \
+                    am62d-mcu-r5f0_0-fw   am62d-mcu-r5f0_0-fw-sec \
+                    am62d-c71_0-fw        am62d-c71_0-fw-sec \
                     "
 
 ALTERNATIVE:${PN}:j721e = "\
@@ -243,6 +244,11 @@ ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw-sec] = "${nonarch_base_libdir}/firmwar
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
@@ -364,6 +370,11 @@ ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw-sec] = "${INSTALL_IPC_FW_DIR}/${MCU_2_0_F
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


