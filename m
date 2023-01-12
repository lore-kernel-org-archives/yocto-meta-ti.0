Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB199C677F1
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 11:28:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.52635.1673522888942554647
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Jan 2023 03:28:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ecOHoSqb;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30CBS3jA114764;
	Thu, 12 Jan 2023 05:28:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673522883;
	bh=DQ69TpWYpjtKDRw4V+ldk14ETmMoDNC11JkNSGzXrkw=;
	h=From:To:CC:Subject:Date;
	b=ecOHoSqb7Dp6po44/uLAuJICitdj3iAoaHLlMG2vaXhaqFA+OLuYRuZJZCAy3nx8O
	 C+9pkobrcYVWkfyFqBIPf+wqvk5wZrHx51kCAaEde7feSQvqUo5Qsswlpt7oeQlKND
	 cULa1/p6fr2c7yIHZJ3iKNhwakEkViZXgd5xwbnU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30CBS3sF099823
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Jan 2023 05:28:03 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 12
 Jan 2023 05:28:02 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 12 Jan 2023 05:28:03 -0600
Received: from chirag (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30CBS2m9019366;
	Thu, 12 Jan 2023 05:28:02 -0600
Received: from sadivi by chirag with local (Exim 4.90_1)
	(envelope-from <c-shilwant@ti.com>)
	id 1pFvkX-0002p3-RQ; Thu, 12 Jan 2023 16:58:01 +0530
From: Chirag Shilwant <c-shilwant@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
Subject: [meta-ti][dunfell][PATCH] am62xx: Add support for secure RTOS IPC Firmware images
Date: Thu, 12 Jan 2023 16:57:55 +0530
Message-ID: <20230112112755.10791-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Jan 2023 11:28:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15556

- Let's add support for secure RTOS IPC Firmware images for am62xx. This will sign RTOS IPC Firmware for all EVMs based on am62xx (i.e AM62X and AM62X-LP-EVM)

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 28 +++++++---------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 47b29632..72d85a6b 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -174,20 +174,18 @@ do_install_prepend_am64xx() {
         )
 }
 
-# Update the am62xx ipc binaries to be consistent with other platforms
-do_install_prepend_am62xx() {
-        ( cd ${RTOS_IPC_FW_DIR}; \
-                mv am62-mcu-m4f0_0-fw ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f; \
-        )
-}
-
 # AM62Q HS-SE support
-do_install_prepend_am62xx-lp-evm() {
+do_install_prepend_am62xx() {
         export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
         ( cd ${RTOS_DM_FW_DIR}; \
                 mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
                 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
         )
+        ( cd ${RTOS_IPC_FW_DIR}; \
+                mv am62-mcu-m4f0_0-fw ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f \
+                    ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f.signed; \
+        )
 }
 
 #Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
@@ -361,13 +359,8 @@ do_install_am64xx() {
 do_install_am62xx() {
     install -d ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
-    # DM Firmware
-    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
-}
-
-do_install_am62xx-lp-evm() {
-    install -d ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    # Signed Firmware
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f.signed ${LEGACY_IPC_FW_DIR}
     # DM Firmware
     install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR} 
 }
@@ -389,11 +382,6 @@ do_deploy_am62xx() {
     install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}
 }
 
-do_deploy_am62xx-lp-evm() {
-    install -d ${DEPLOYDIR}
-    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}
-}
-
 do_deploy_am62axx() {
     install -d ${DEPLOYDIR}
     install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}
-- 
2.17.1


