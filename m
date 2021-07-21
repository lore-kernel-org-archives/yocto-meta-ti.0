Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.3784.1626872802117259019
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 06:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=N6oa39th;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16LD6e8n092880;
	Wed, 21 Jul 2021 08:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626872800;
	bh=vSq9282NcRXuhNBEQas93Ix/Q3026d0LGGTltS4FGXY=;
	h=From:To:Subject:Date;
	b=N6oa39thNBLI3UruhOySKRfblSmXSJT/y9DiInTEiOeZMvj/SGozi0nfNXxe5QjeH
	 Wp70c4eMv+HBjxWC/Rkl5SnzA/wIQQYtC9vim9EWrMlD88sdz9FN8KzZSiMvvQon+q
	 ntib6am+yxZ1b/C8YxfkBABBzARl5CpoIk1/Ns5A=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16LD6e4D099416
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Jul 2021 08:06:40 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 21
 Jul 2021 08:06:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 21 Jul 2021 08:06:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16LD6eWA009411;
	Wed, 21 Jul 2021 08:06:40 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Suman Anna
	<s-anna@ti.com>
Subject: [meta-ti][dunfell/master][PATCH v2] ti-rtos-firmware: Add soft link to the rtos firmware binaries
Date: Wed, 21 Jul 2021 13:06:40 +0000
Message-ID: <20210721130640.49011-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Changes for firmware update( eff643e5 ti-rtos-firmware: update the
source to ti-linux-firmware) were in-complete without soft link.
1) Added soft link missing for the rtos firmware.
2) Updated the IPC am64x firmware name to be consistent with 7.3

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---

Changes from last version:
1) Fixed the j7-main-r5f0_0-fw and j7200-main-r5f0_0-fw soft link
2) Cleaned-up extra white space.

 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 185 ++++++++++++++++++---
 1 file changed, 164 insertions(+), 21 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index e50cb933..16a40b08 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -10,6 +10,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 INHIBIT_DEFAULT_DEPS = "1"
 
 inherit deploy
+inherit update-alternatives
 
 PLAT_SFX = ""
 PLAT_SFX_j7 = "j721e"
@@ -23,8 +24,7 @@ CORESDK_RTOS_VERSION ?= "08.00.00.26"
 PV = "${CORESDK_RTOS_VERSION}"
 
 CLEANBROKEN = "1"
-PR = "r1"
-
+PR = "r2"
 
 # Secure Build 
 DEPENDS += "openssl-native"
@@ -39,13 +39,13 @@ RTOS_IPC_FW_DIR = "${S}/ti-ipc/${PLAT_SFX}"
 
 # For back-ward compatability keeping legacy firmware folder name
 # TODO: fix this in next version
-LEGACY_ETH_FW_DIR = "${D}${base_libdir}/firmware/ethfw"
-LEGACY_IPC_FW_DIR = "${D}${base_libdir}/firmware/pdk-ipc"
-LEGACY_DM_FW_DIR  = "${D}${base_libdir}/firmware/ethfw"
+LEGACY_ETH_FW_DIR = "${D}${base_libdir}/firmware/ethfw/"
+LEGACY_IPC_FW_DIR = "${D}${base_libdir}/firmware/pdk-ipc/"
+LEGACY_DM_FW_DIR  = "${D}${base_libdir}/firmware/pdk-ipc/"
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
-# Install
+# J7 HS support
 do_install_prepend_j7-hs-evm() {
 	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
 	( cd ${RTOS_DM_FW_DIR}; \
@@ -54,35 +54,178 @@ do_install_prepend_j7-hs-evm() {
 	)
 }
 
+# Update the am64xx ipc binaries to be consistent with other platforms
+do_install_prepend_am64xx() {
+        ( cd ${RTOS_IPC_FW_DIR}; \
+                mv am64-main-r5f0_0-fw ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f; \
+                mv am64-main-r5f0_1-fw ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f; \
+                mv am64-main-r5f1_0-fw ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f; \
+                mv am64-main-r5f1_1-fw ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f; \
+        )
+}
+
+#Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
 do_install() {
-  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-  install -d ${LEGACY_ETH_FW_DIR}
-  install -d ${LEGACY_IPC_FW_DIR}
-  cp ${CP_ARGS} "${RTOS_ETH_FW_DIR}/." ${LEGACY_ETH_FW_DIR}
-  cp ${CP_ARGS} "${RTOS_IPC_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
-  cp ${CP_ARGS} "${RTOS_DM_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
+    install -d ${LEGACY_IPC_FW_DIR}
+}
+
+do_install_append_j7-evm() {
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_1_release_strip.xe66 ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_2_release_strip.xe66 ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c7x_1_release_strip.xe71 ${LEGACY_IPC_FW_DIR}
+    # DM Firmware
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
+    # ETH firmware
+    install -d ${LEGACY_ETH_FW_DIR}
+    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
+}
+
+do_install_append_j7200-evm() {
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    # DM Firmware
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
+    # ETH firmware
+    install -d ${LEGACY_ETH_FW_DIR}
+    install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitchcfg_server_strip.xer5f ${LEGACY_ETH_FW_DIR}
 }
 
-do_install_am65xx() {
-  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-  install -d ${LEGACY_IPC_FW_DIR}
-  cp ${CP_ARGS} "${RTOS_IPC_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
+do_install_append_am65xx() {
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
 }
 
-do_install_am64xx() {
-  CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
-  install -d ${LEGACY_IPC_FW_DIR}
-  cp ${CP_ARGS} "${RTOS_IPC_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
+do_install_append_am64xx() {
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
 }
 
+# Set up names for the firmwares
+ALTERNATIVE_${PN}_am65xx = "\
+                    am65x-mcu-r5f0_0-fw \
+                    am65x-mcu-r5f0_1-fw \
+                    "
+
+ALTERNATIVE_${PN}_am64xx = "\
+                    am64-main-r5f0_0-fw \
+                    am64-main-r5f0_1-fw \
+                    am64-main-r5f1_0-fw \
+                    am64-main-r5f1_1-fw \
+                    "
+
+ALTERNATIVE_${PN}_j7 = "\
+                    j7-mcu-r5f0_0-fw \
+                    j7-mcu-r5f0_1-fw \
+                    j7-main-r5f0_0-fw \
+                    j7-main-r5f0_1-fw \
+                    j7-main-r5f1_0-fw \
+                    j7-main-r5f1_1-fw \
+                    j7-c66_0-fw \
+                    j7-c66_1-fw \
+                    j7-c71_0-fw\
+                    "
+
+ALTERNATIVE_${PN}_j7200-evm = "\
+                    j7200-mcu-r5f0_0-fw \
+                    j7200-mcu-r5f0_1-fw \
+                    j7200-main-r5f0_0-fw \
+                    j7200-main-r5f0_1-fw \
+                    "
+
+# Set up link names for the firmwares
+
+TARGET_MCU_R5FSS0_0_am65xx = "am65x-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1_am65xx = "am65x-mcu-r5f0_1-fw"
+
+TARGET_MAIN_R5FSS0_0_am64xx = "am64-main-r5f0_0-fw"
+TARGET_MAIN_R5FSS0_1_am64xx = "am64-main-r5f0_1-fw"
+TARGET_MAIN_R5FSS1_0_am64xx = "am64-main-r5f1_0-fw"
+TARGET_MAIN_R5FSS1_1_am64xx = "am64-main-r5f1_1-fw"
+
+TARGET_MCU_R5FSS0_0_j7 = "j7-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1_j7 = "j7-mcu-r5f0_1-fw"
+TARGET_MAIN_R5FSS0_0_j7 = "j7-main-r5f0_0-fw"
+TARGET_MAIN_R5FSS0_1_j7 = "j7-main-r5f0_1-fw"
+TARGET_MAIN_R5FSS1_0_j7 = "j7-main-r5f1_0-fw"
+TARGET_MAIN_R5FSS1_1_j7 = "j7-main-r5f1_1-fw"
+TARGET_C66_0_j7 = "j7-c66_0-fw"
+TARGET_C66_1_j7 = "j7-c66_1-fw"
+TARGET_C7X_j7 = "j7-c71_0-fw"
+
+TARGET_MCU_R5FSS0_0_j7200-evm = "j7200-mcu-r5f0_0-fw"
+TARGET_MCU_R5FSS0_1_j7200-evm = "j7200-mcu-r5f0_1-fw"
+TARGET_MAIN_R5FSS0_0_j7200-evm = "j7200-main-r5f0_0-fw"
+TARGET_MAIN_R5FSS0_1_j7200-evm = "j7200-main-r5f0_1-fw"
+
+ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
+
+ALTERNATIVE_LINK_NAME[am64-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[am64-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
+ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
+
+ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
+ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
+ALTERNATIVE_LINK_NAME[j7-c66_0-fw] = "${base_libdir}/firmware/${TARGET_C66_0}"
+ALTERNATIVE_LINK_NAME[j7-c66_1-fw] = "${base_libdir}/firmware/${TARGET_C66_1}"
+ALTERNATIVE_LINK_NAME[j7-c71_0-fw] = "${base_libdir}/firmware/${TARGET_C7X}"
+
+ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
+
+# Create the firmware alternatives
+
+ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
+
+ALTERNATIVE_TARGET[am64-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[am64-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f"
+
+ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7-c66_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_1_release_strip.xe66"
+ALTERNATIVE_TARGET[j7-c66_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release_strip.xe66"
+ALTERNATIVE_TARGET[j7-c71_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe71"
+
+ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
+ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
+ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xer5f"
+
+ALTERNATIVE_PRIORITY = "10"
 
 # make sure that lib/firmware, and all its contents are part of the package
 FILES_${PN} += "${base_libdir}/firmware"
 
-
+# This is used to prevent the build system to_strip the executables
 INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+# This is used to prevent the build system to split the debug info in a separate file
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+# As it likely to be a different arch from the Yocto build, disable checking by adding "arch" to INSANE_SKIP
 INSANE_SKIP_${PN} += "arch"
 
+# we don't want to configure and build the source code
 do_compile[noexec] = "1"
 do_configure[noexec] = "1"
-- 
2.17.1

