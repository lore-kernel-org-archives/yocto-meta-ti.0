Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F91CA0EED
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 10:24:02 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.10752.1755599039592651584
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Aug 2025 03:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=t1hCSg4r;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: b-padhi@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57JANwqJ3380437;
	Tue, 19 Aug 2025 05:23:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755599038;
	bh=uzDaC6X3pDAfenXMxXpcNXt/MBqNq+okWDOiWCmjFf0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=t1hCSg4rvNe9IiiFLfocTXQIzpQXv62pA5xpOL3Vo/scOSvF71oFSh/i8YontbiwV
	 nkeolaCcDbQED0oS+P1SaNmeo0dgUBW29GZAzOb9g4XtTn1FPxFWbBqRYyRL7PKulk
	 JvLWX4TkrfqtVWL1z+MmVuoU3LHANbmrKW7DzDOM=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57JANwYX521863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 05:23:58 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 05:23:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 05:23:58 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57JANpHK2850983;
	Tue, 19 Aug 2025 05:23:56 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH v3 2/3] ti-rtos-messageq-test-fw: Add a recipe to package prebuilt IPC firmware
Date: Tue, 19 Aug 2025 15:53:49 +0530
Message-ID: <20250819102350.2915102-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250819102350.2915102-1-b-padhi@ti.com>
References: <20250819102350.2915102-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Aug 2025 10:24:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18938

The messageq IPC firmware example for AM57xx SoCs is available in
ti-linux-firmware repository. Add a recipe to package the prebuilt
messageq firmware into the rootfs.

Additionally, make sure the firmware for IPU1 rproc is copied into boot
partition by updating the dependency in omap-a15 machine conf to the
above recipe. This is needed for Early Boot use cases and gets rid of
dependency on meta-ti-extras layer.

There is no need to deploy the vayu IPC firmware anymore. Remove
the deploy task from ti-ipc-rtos recipe.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 meta-ti-bsp/conf/machine/include/omap-a15.inc |  2 +-
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
 .../ti-rtos-messageq-test-fw_git.bb           | 67 +++++++++++++++++++
 .../recipes-ti/ipc/ti-ipc-rtos_git.bb         | 12 ----
 4 files changed, 69 insertions(+), 13 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb

diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/conf/machine/include/omap-a15.inc
index 3b8eb0fd..2179476f 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -48,4 +48,4 @@ IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 WKS_FILE ?= "sdimage-2part.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ${UBOOT_EXTLINUX_BOOT_FILES} ipc/dra7-ipu1-fw.xem4;dra7-ipu1-fw.xem4"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
-do_image_wic[depends] += "ti-ipc-rtos:do_deploy"
+do_image_wic[depends] += "ti-rtos-messageq-test-fw:do_deploy"
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 47ce5616..6787018e 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -19,6 +19,7 @@ TI_SYSFW_VERSION = "11.01.05"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TAD5212_FW_VERSION = "1.0.0.0"
 TI_PKA_FW_VERSION = "2.1.0"
+TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 
 TI_LINUX_FW_SRCREV ?= "e89a348f4618a26812fb353a04ed9532ef890a2f"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb
new file mode 100644
index 00000000..980fe5cc
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb
@@ -0,0 +1,67 @@
+SUMMARY = "TI MessageQ prebuilt binary firmware images"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
+
+COMPATIBLE_MACHINE = "am57xx"
+
+inherit update-alternatives
+inherit deploy
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+PV = "${TI_IPC_EXAMPLES_FW_VERSION}"
+PR = "${INC_PR}.0"
+
+INSTALL_IPC_FW_DIR = "${nonarch_base_libdir}/firmware/ipc"
+
+IPU_1_FW = "messageq_server_ipu1.xem4"
+IPU_2_FW = "messageq_server_ipu2.xem4"
+DSP_1_FW = "messageq_server_dsp1.xe66"
+DSP_2_FW = "messageq_server_dsp2.xe66"
+
+IPU_1_FW_DIR = "ti_platforms_evmDRA7XX_ipu1"
+IPU_2_FW_DIR = "ti_platforms_evmDRA7XX_ipu2"
+DSP_1_FW_DIR = "ti_platforms_evmDRA7XX_dsp1"
+DSP_2_FW_DIR = "ti_platforms_evmDRA7XX_dsp2"
+
+do_install() {
+    # Install Firmware
+    install -d ${D}${INSTALL_IPC_FW_DIR}/${IPU_1_FW_DIR}
+    install -d ${D}${INSTALL_IPC_FW_DIR}/${IPU_2_FW_DIR}
+    install -d ${D}${INSTALL_IPC_FW_DIR}/${DSP_1_FW_DIR}
+    install -d ${D}${INSTALL_IPC_FW_DIR}/${DSP_2_FW_DIR}
+
+    install -m 0644 ${S}/ti-ipc/am57xx/${IPU_1_FW} ${D}${INSTALL_IPC_FW_DIR}/${IPU_1_FW_DIR}
+    install -m 0644 ${S}/ti-ipc/am57xx/${IPU_2_FW} ${D}${INSTALL_IPC_FW_DIR}/${IPU_2_FW_DIR}
+    install -m 0644 ${S}/ti-ipc/am57xx/${DSP_1_FW} ${D}${INSTALL_IPC_FW_DIR}/${DSP_1_FW_DIR}
+    install -m 0644 ${S}/ti-ipc/am57xx/${DSP_2_FW} ${D}${INSTALL_IPC_FW_DIR}/${DSP_2_FW_DIR}
+}
+
+do_deploy() {
+    install -d ${DEPLOYDIR}/ipc
+    install -m 0644 ${S}/ti-ipc/am57xx/${IPU_1_FW} ${DEPLOYDIR}/ipc/dra7-ipu1-fw.xem4
+}
+
+addtask deploy after do_install
+
+# Set up names for the firmwares
+
+ALTERNATIVE:${PN} = "\
+                    dra7-ipu1-fw.xem4 \
+                    dra7-ipu2-fw.xem4 \
+                    dra7-dsp1-fw.xe66 \
+                    dra7-dsp2-fw.xe66 \
+                    "
+
+ALTERNATIVE_LINK_NAME[dra7-ipu1-fw.xem4] = "${nonarch_base_libdir}/firmware/dra7-ipu1-fw.xem4"
+ALTERNATIVE_LINK_NAME[dra7-ipu2-fw.xem4] = "${nonarch_base_libdir}/firmware/dra7-ipu2-fw.xem4"
+ALTERNATIVE_LINK_NAME[dra7-dsp1-fw.xe66] = "${nonarch_base_libdir}/firmware/dra7-dsp1-fw.xe66"
+ALTERNATIVE_LINK_NAME[dra7-dsp2-fw.xe66] = "${nonarch_base_libdir}/firmware/dra7-dsp2-fw.xe66"
+
+ALTERNATIVE_TARGET[dra7-ipu1-fw.xem4] = "${INSTALL_IPC_FW_DIR}/${IPU_1_FW_DIR}/${IPU_1_FW}"
+ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] = "${INSTALL_IPC_FW_DIR}/${IPU_2_FW_DIR}/${IPU_2_FW}"
+ALTERNATIVE_TARGET[dra7-dsp1-fw.xe66] = "${INSTALL_IPC_FW_DIR}/${DSP_1_FW_DIR}/${DSP_1_FW}"
+ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] = "${INSTALL_IPC_FW_DIR}/${DSP_2_FW_DIR}/${DSP_2_FW}"
+
+ALTERNATIVE_PRIORITY = "30"
diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 853fa117..d2ac6276 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -2,7 +2,6 @@ require recipes-ti/ipc/ti-ipc.inc
 require recipes-ti/ipc/ti-ipc-common.inc
 require ti-ipc-rtos.inc
 
-inherit deploy
 inherit update-alternatives
 
 DEPENDS = "ti-xdctools-native ti-sysbios doxygen-native zip-native"
@@ -100,17 +99,6 @@ ALTERNATIVE_TARGET[dra7-dsp2-fw.xe66] = "${nonarch_base_libdir}/firmware/ipc/ti_
 ALTERNATIVE_TARGET[dra7-ipu1-fw.xem4] = "${nonarch_base_libdir}/firmware/ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4"
 ALTERNATIVE_TARGET[dra7-ipu2-fw.xem4] = "${nonarch_base_libdir}/firmware/ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4"
 
-do_deploy() {
-  install -d ${DEPLOYDIR}
-}
-
-do_deploy:append:omap-a15() {
-  install -d ${DEPLOYDIR}/ipc
-  install -m 0644 ${S}/packages/ti/ipc/tests/bin/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4 ${DEPLOYDIR}/ipc/dra7-ipu1-fw.xem4
-}
-
-addtask deploy after do_install
-
 # Disable the "buildpaths" check while we figure out how we are
 # going to address this issue.
 #
-- 
2.34.1


