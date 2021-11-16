Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.8282.1637060042751073327
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 02:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xTEo0q+6;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AGAs1B4110825;
	Tue, 16 Nov 2021 04:54:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637060041;
	bh=DfWTiseIjS2hbdiboZ6IMIdt/hERJYsmCMHgUnI4d54=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=xTEo0q+61ely7HfH7xzxoXKZJ/8/x4YYzr/8nKNeRbexCUMXrhSNfDmS6niZSqiSt
	 XpoYskmPUq4glMyFE8jltPhVfPVIsjzDw5z9SUF+39AmnsYogOYiCZvurVNDpi2X1Z
	 xAEFhNKRoRvb+dhRjCOB1Lvtotw4DBKeYPs9q7os=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AGAs0rQ094506
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Nov 2021 04:54:01 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 16
 Nov 2021 04:54:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 16 Nov 2021 04:54:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AGAs0Fl067227;
	Tue, 16 Nov 2021 04:54:00 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/3] ti-rtos-firmware: Add j7200 hs support
Date: Tue, 16 Nov 2021 10:53:59 +0000
Message-ID: <20211116105400.45878-3-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211116105400.45878-1-yogeshs@ti.com>
References: <20211116105400.45878-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

We cannot use j7200 keyword for match b'n j7200-evm and j7200-hs-evm due
to existing j7 keyword, we need to duplicate all the j7200 entries for hs.

Also sign the DM firmware for J7200 similar to J7 HS

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index ea69ad89..6d24f7fe 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -15,6 +15,7 @@ inherit update-alternatives
 PLAT_SFX = ""
 PLAT_SFX_j7 = "j721e"
 PLAT_SFX_j7200-evm = "j7200"
+PLAT_SFX_j7200-hs-evm = "j7200"
 PLAT_SFX_am65xx = "am65xx"
 PLAT_SFX_am64xx = "am64xx"
 
@@ -55,6 +56,15 @@ do_install_prepend_j7-hs-evm() {
 	)
 }
 
+# J7 HS support
+do_install_prepend_j7200-hs-evm() {
+        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+        ( cd ${RTOS_DM_FW_DIR}; \
+                mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
+        )
+}
+
 # Update the am64xx ipc binaries to be consistent with other platforms
 do_install_prepend_am64xx() {
         ( cd ${RTOS_IPC_FW_DIR}; \
@@ -100,6 +110,18 @@ do_install_j7200-evm() {
     install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
 }
 
+do_install_j7200-hs-evm() {
+    install -d ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    # DM Firmware
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
+    # ETH firmware
+    install -d ${LEGACY_ETH_FW_DIR}
+    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
+}
+
 do_install_am65xx() {
     install -d ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
@@ -148,6 +170,13 @@ ALTERNATIVE_${PN}_j7200-evm = "\
                     j7200-main-r5f0_1-fw \
                     "
 
+ALTERNATIVE_${PN}_j7200-hs-evm = "\
+                    j7200-mcu-r5f0_0-fw \
+                    j7200-mcu-r5f0_1-fw \
+                    j7200-main-r5f0_0-fw \
+                    j7200-main-r5f0_1-fw \
+                    "
+
 # Set up link names for the firmwares
 
 TARGET_MCU_R5FSS0_0_am65xx = "am65x-mcu-r5f0_0-fw"
@@ -174,6 +203,11 @@ TARGET_MCU_R5FSS0_1_j7200-evm = "j7200-mcu-r5f0_1-fw"
 TARGET_MAIN_R5FSS0_0_j7200-evm = "j7200-main-r5f0_0-fw"
 TARGET_MAIN_R5FSS0_1_j7200-evm = "j7200-main-r5f0_1-fw"
 
+TARGET_MCU_R5FSS0_0_j7200-hs-evm = "j7200-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1_j7200-hs-evm = "j7200-mcu-r5f0_1-fw"
+TARGET_MAIN_R5FSS0_0_j7200-hs-evm = "j7200-main-r5f0_0-fw"
+TARGET_MAIN_R5FSS0_1_j7200-hs-evm = "j7200-main-r5f0_1-fw"
+
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
 
-- 
2.17.1

