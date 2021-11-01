Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1224.1635795196245598984
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 12:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EDAFD40C83
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ZseRJv35pjg for <meta-ti@lists.yoctoproject.org>;
	Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E3FE140C93
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id ACBDF1746B6
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 15:33:13 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 22/22] ti-rtos-firmware: Update M4F binary for AM64x SoCs
Date: Mon,  1 Nov 2021 15:33:12 -0400
Message-Id: <1635795192-43144-23-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635795192-43144-1-git-send-email-denis@denix.org>
References: <1635795192-43144-1-git-send-email-denis@denix.org>

From: Hari Nagalla <hnagalla@ti.com>

AM64x SoCs have a Cortex-M4F core in MCU domain. This core is used a
standalone device for safety applications. For non safety applications,
the device is exposed as a remote processor with Linux rpmsg framework.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 079be84..1248c9e 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -62,6 +62,7 @@ do_install:prepend:am64xx() {
                 mv am64-main-r5f0_1-fw ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f; \
                 mv am64-main-r5f1_0-fw ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f; \
                 mv am64-main-r5f1_1-fw ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f; \
+                mv am64-mcu-m4f0_0-fw ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f; \
         )
 }
 
@@ -111,6 +112,7 @@ do_install:am64xx() {
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
 }
 
 # Set up names for the firmwares
@@ -124,6 +126,7 @@ ALTERNATIVE:${PN}:am64xx = "\
                     am64-main-r5f0_1-fw \
                     am64-main-r5f1_0-fw \
                     am64-main-r5f1_1-fw \
+                    am64-mcu-m4f0_0-fw \
                     "
 
 ALTERNATIVE:${PN}:j7 = "\
@@ -154,6 +157,7 @@ TARGET_MAIN_R5FSS0_0:am64xx = "am64-main-r5f0_0-fw"
 TARGET_MAIN_R5FSS0_1:am64xx = "am64-main-r5f0_1-fw"
 TARGET_MAIN_R5FSS1_0:am64xx = "am64-main-r5f1_0-fw"
 TARGET_MAIN_R5FSS1_1:am64xx = "am64-main-r5f1_1-fw"
+TARGET_MCU_M4FSS0_0:am64xx = "am64-mcu-m4f0_0-fw"
 
 TARGET_MCU_R5FSS0_0:j7 = "j7-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1:j7 = "j7-mcu-r5f0_1-fw"
@@ -177,6 +181,7 @@ ALTERNATIVE_LINK_NAME[am64-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_M
 ALTERNATIVE_LINK_NAME[am64-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
 ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
 ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
+ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
 
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
@@ -202,6 +207,7 @@ ALTERNATIVE_TARGET[am64-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_e
 ALTERNATIVE_TARGET[am64-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f"
 ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f"
 
 ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
-- 
2.7.4

