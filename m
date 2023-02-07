Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D616C636CD
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 23:42:45 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.6624.1675813361834959910
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 15:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sO+pCJhK;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 317NgfJm038816;
	Tue, 7 Feb 2023 17:42:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675813361;
	bh=SmtaGGmPdeztuReFVu2M0QsttOtrF/QILNpfzVLkG8A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sO+pCJhKMQ0sFSb5CsmuX7SJsrtFdI5mXiZwoHGZr6Jq5xt/9Ubb9TMzYi6K35tze
	 0nGLmF5x5EGpMMPfJdwtLENe6kGabQFh6z+B8TuJkWOWHR3QQhPyYplo+E/0UvzTQe
	 kWn3jSLeD3vi1qrn0HcxLFZg6wgHWOOqu3orLvh0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 317Ngfcp103824
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Feb 2023 17:42:41 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 7
 Feb 2023 17:42:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 7 Feb 2023 17:42:40 -0600
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 317NgdTe050846;
	Tue, 7 Feb 2023 17:42:40 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 3/8] ti-rtos-firmware: Fix name for AM64x and AM62x firmware
Date: Tue, 7 Feb 2023 17:42:34 -0600
Message-ID: <20230207234239.30720-3-afd@ti.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207234239.30720-1-afd@ti.com>
References: <20230207234239.30720-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Feb 2023 23:42:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15741

The firmware for AM64x and AM62x are renamed to match the other platforms,
but we don't actually change them to match. Remove baremetal from the
names.

These are only referenced to by softlink, so this change will have no
effect on Linux users.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../ti-rtos-bin/ti-rtos-firmware.bb           | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index e0b262da..c09f67b5 100644
--- a/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -125,18 +125,18 @@ do_install:prepend:j721s2-hs-evm() {
 # Update the am64xx ipc binaries to be consistent with other platforms
 do_install:prepend:am64xx() {
         ( cd ${RTOS_IPC_FW_DIR}; \
-                mv am64-main-r5f0_0-fw ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f; \
-                mv am64-main-r5f0_1-fw ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f; \
-                mv am64-main-r5f1_0-fw ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f; \
-                mv am64-main-r5f1_1-fw ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f; \
-                mv am64-mcu-m4f0_0-fw ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f; \
+                mv am64-main-r5f0_0-fw ipc_echo_test_mcu1_0_release_strip.xer5f; \
+                mv am64-main-r5f0_1-fw ipc_echo_test_mcu1_1_release_strip.xer5f; \
+                mv am64-main-r5f1_0-fw ipc_echo_test_mcu2_0_release_strip.xer5f; \
+                mv am64-main-r5f1_1-fw ipc_echo_test_mcu2_1_release_strip.xer5f; \
+                mv am64-mcu-m4f0_0-fw ipc_echo_test_mcu3_0_release_strip.xer5f; \
         )
 }
 
 # Update the am62xx ipc binaries to be consistent with other platforms
 do_install:prepend:am62xx() {
         ( cd ${RTOS_IPC_FW_DIR}; \
-                mv am62-mcu-m4f0_0-fw ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f; \
+                mv am62-mcu-m4f0_0-fw ipc_echo_test_mcu2_0_release_strip.xer5f; \
         )
 }
 
@@ -270,16 +270,16 @@ do_install:am65xx() {
 
 do_install:am64xx() {
     install -d ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
 }
 
 do_install:am62xx() {
     install -d ${LEGACY_IPC_FW_DIR}
-    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
     # DM Firmware
     install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
 }
@@ -476,14 +476,14 @@ ALTERNATIVE_LINK_NAME[j784s4-c71_3-fw] = "${base_libdir}/firmware/j784s4-c71_3-f
 ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
 
-ALTERNATIVE_TARGET[am64-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[am64-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f"
-ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f"
-ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[am64-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[am64-main-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
 
 ALTERNATIVE_TARGET[am62-main-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
-ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_0_release_strip.xer5f"
 
 ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${nonarch_base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
-- 
2.39.1


