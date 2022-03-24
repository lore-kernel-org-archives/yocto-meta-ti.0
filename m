Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D47C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 22:21:34 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.1058.1648160493309252260
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Mar 2022 15:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=e6qyZEX4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22OMLTDe028173;
	Thu, 24 Mar 2022 17:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648160489;
	bh=k9OewyGrIe1ANwfPwiQaFWnthv9J/mlkFKxnTdnckC0=;
	h=From:To:Subject:Date;
	b=e6qyZEX4TYGP9SFiM9Ahjy9l85e5WMharZfzqMLvmohhl/gzu6NHhWOcC6Ky1PQZk
	 fjvVlygXo2yAQTEF0yziSUnRb6ijUdgrRpFfD2G175JzbzZzQ7r+gxPEv9NPKAGeaB
	 hGqGlOCD1flijoRq4KqVF8Qg9dpY5cCL/dL9VH+E=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22OMLTjw013145
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Mar 2022 17:21:29 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 24
 Mar 2022 17:21:29 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 24 Mar 2022 17:21:29 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22OMLTIB070173;
	Thu, 24 Mar 2022 17:21:29 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nXVph-0002Qu-BQ; Thu, 24 Mar 2022 17:21:29 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v3] machine: Add am62xx evm configuration
Date: Thu, 24 Mar 2022 17:21:29 -0500
Message-ID: <20220324222129.9313-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Mar 2022 22:21:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14546

From: Nishanth Menon <nm@ti.com>

Lets add the basic AM62xx-evm configuration.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Removed ti-graphics patch, and removed lpm-demo patches.
v3: Squashed and cleaned up the previous patches.

 conf/machine/am62xx-evm-k3r5.conf          | 11 +++++++++
 conf/machine/am62xx-evm.conf               | 13 ++++++++++
 conf/machine/include/am62xx.inc            | 17 +++++++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb     | 18 ++++++++++++++
 recipes-bsp/u-boot/u-boot-ti.inc           |  7 ++++++
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 28 ++++++++++++++++++++++
 6 files changed, 94 insertions(+)
 create mode 100644 conf/machine/am62xx-evm-k3r5.conf
 create mode 100644 conf/machine/am62xx-evm.conf
 create mode 100644 conf/machine/include/am62xx.inc

diff --git a/conf/machine/am62xx-evm-k3r5.conf b/conf/machine/am62xx-evm-k3r5.conf
new file mode 100644
index 00000000..724a8d4a
--- /dev/null
+++ b/conf/machine/am62xx-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: AM62XX EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "am62x"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+
+UBOOT_MACHINE = "am62x_evm_r5_defconfig"
diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
new file mode 100644
index 00000000..600abb58
--- /dev/null
+++ b/conf/machine/am62xx-evm.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: AM62XX EVM
+#@DESCRIPTION: Machine configuration for the TI AM62XX EVM
+
+require conf/machine/include/am62xx.inc
+
+KERNEL_DEVICETREE = " \
+    ti/k3-am625-sk.dtb \
+    ti/k3-am625-sk-lpmdemo.dtb \
+    ti/k3-am625-minimal.dtb \
+"
+
+UBOOT_MACHINE = "am62x_evm_a53_defconfig"
diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am62xx.inc
new file mode 100644
index 00000000..e8823dd2
--- /dev/null
+++ b/conf/machine/include/am62xx.inc
@@ -0,0 +1,17 @@
+require conf/machine/include/k3.inc
+SOC_FAMILY_append = ":am62xx"
+
+MACHINE_FEATURES += "screen touchscreen"
+
+SERIAL_CONSOLES = "115200;ttyS2"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+
+# AM62 supports multi-certificate images, use the same
+IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
+
+do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+
+TFA_BOARD = "lite"
+OPTEEMACHINE = "k3-am65x"
+OPTEEOUTPUTMACHINE = "k3"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 646833a7..099473b4 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -6,6 +6,7 @@ DEPENDS_append_j7200-hs-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_j721s2-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_am64xx-hs-evm-k3r5 = " virtual/bootloader"
+DEPENDS_append_am62xx-evm-k3r5 = " virtual/bootloader"
 
 CLEANBROKEN = "1"
 PR = "${INC_PR}.2"
@@ -29,6 +30,7 @@ SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "ti-fs-firmware"
 SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX_j7200-hs-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX_j721s2-evm-k3r5 = "ti-fs-firmware"
+SYSFW_PREFIX_am62xx-evm-k3r5 = "ti-fs-firmware"
 
 SYSFW_SUFFIX ?= "unknown"
 
@@ -63,6 +65,7 @@ EXTRA_OEMAKE_append_j7200-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-s
 EXTRA_OEMAKE_append_j721s2-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_am64xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_append_am62xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 
 do_compile() {
 	cd ${WORKDIR}/imggen/
@@ -170,4 +173,19 @@ do_deploy_am64xx-hs-evm-k3r5() {
         install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
+do_install_am62xx-evm-k3r5() {
+	install -d ${D}/boot
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+}
+
+do_deploy_am62xx-evm-k3r5() {
+	install -d ${DEPLOYDIR}
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
+}
+
 addtask deploy before do_build after do_compile
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 7ed6c5b4..231b7647 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -41,6 +41,7 @@ PACKAGECONFIG[dm] = "DM=${STAGING_DIR_HOST}${nonarch_base_libdir}/firmware/pdk-i
 
 PACKAGECONFIG_append_aarch64 = " atf optee"
 PACKAGECONFIG_append_j7 = " dm"
+PACKAGECONFIG_append_am62xx = " dm"
 
 COMPATIBLE_MACHINE = "(ti-soc)"
 
@@ -69,6 +70,7 @@ SPL_UART_BINARY_j7200-hs-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_j721s2-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_am64xx-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_am64xx-hs-evm-k3r5 = "u-boot-spl.bin"
+SPL_UART_BINARY_am62xx-evm-k3r5 = "u-boot-spl.bin"
 
 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
@@ -419,4 +421,9 @@ do_deploy_append_am64xx-hs-evm-k3r5 () {
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
 }
 
+do_deploy_append_am62xx-evm-k3r5 () {
+	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
+	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
+}
+
 TOOLCHAIN = "gcc"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index c5852dbd..d219d4f0 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -19,6 +19,7 @@ PLAT_SFX_j7200-hs-evm = "j7200"
 PLAT_SFX_j721s2-evm = "j721s2"
 PLAT_SFX_am65xx = "am65xx"
 PLAT_SFX_am64xx = "am64xx"
+PLAT_SFX_am62xx = "am62x"
 
 FILESEXTRAPATHS_prepend := "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -77,6 +78,13 @@ do_install_prepend_am64xx() {
         )
 }
 
+# Update the am62xx ipc binaries to be consistent with other platforms
+do_install_prepend_am62xx() {
+        ( cd ${RTOS_IPC_FW_DIR}; \
+                mv am62-mcu-m4f0_0-fw ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f; \
+        )
+}
+
 #Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc, with softlinks up a level
 do_install() {
 
@@ -154,6 +162,13 @@ do_install_am64xx() {
     install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
 }
 
+do_install_am62xx() {
+    install -d ${LEGACY_IPC_FW_DIR}
+    install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f ${LEGACY_IPC_FW_DIR}
+    # DM Firmware
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
+}
+
 # Set up names for the firmwares
 ALTERNATIVE_${PN}_am65xx = "\
                     am65x-mcu-r5f0_0-fw \
@@ -167,6 +182,10 @@ ALTERNATIVE_${PN}_am64xx = "\
                     am64-main-r5f1_1-fw \
                     am64-mcu-m4f0_0-fw \
                     "
+ALTERNATIVE_${PN}_am62xx = "\
+                    am62-mcu-m4f0_0-fw \
+		            am62-main-r5f0_0-fw \
+                    "
 
 ALTERNATIVE_${PN}_j7 = "\
                     j7-mcu-r5f0_0-fw \
@@ -216,6 +235,9 @@ TARGET_MAIN_R5FSS1_0_am64xx = "am64-main-r5f1_0-fw"
 TARGET_MAIN_R5FSS1_1_am64xx = "am64-main-r5f1_1-fw"
 TARGET_MCU_M4FSS0_0_am64xx = "am64-mcu-m4f0_0-fw"
 
+TARGET_MAIN_R5FSS0_0_am62xx = "am62-main-r5f0_0-fw"
+TARGET_MCU_M4FSS0_0_am62xx = "am62-mcu-m4f0_0-fw"
+
 TARGET_MCU_R5FSS0_0_j7 = "j7-mcu-r5f0_0-fw"
 TARGET_MCU_R5FSS0_1_j7 = "j7-mcu-r5f0_1-fw"
 TARGET_MAIN_R5FSS0_0_j7 = "j7-main-r5f0_0-fw"
@@ -254,6 +276,9 @@ ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] = "${base_libdir}/firmware/${TARGET_M
 ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
 ALTERNATIVE_LINK_NAME[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
 
+ALTERNATIVE_LINK_NAME[am62-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
+ALTERNATIVE_LINK_NAME[am62-mcu-m4f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_M4FSS0_0}"
+
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
 ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
@@ -289,6 +314,9 @@ ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_e
 ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f"
 ALTERNATIVE_TARGET[am64-mcu-m4f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu3_0_release_strip.xer5f"
 
+ALTERNATIVE_TARGET[am62-main-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
+ALTERNATIVE_TARGET[am62-mcu-m4f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f"
+
 ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.xer5f"
 ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] = "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xer5f"
 ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] = "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
-- 
2.17.1


