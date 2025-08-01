Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14F3CA0EC0
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 15:00:55 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.89970.1754060447523059167
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 01 Aug 2025 08:00:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lyVRmau3;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: b-padhi@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 571F0jOn3268443;
	Fri, 1 Aug 2025 10:00:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754060445;
	bh=Aud4JkuZIXOaRbx6jj1T/fG/VLnFvEBATzalC2qCEaw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lyVRmau3WGvwntCg/BmMn+4Cuui6nSAis/YvFeINq2xB/YcWx8LtDMAL3cDyRwXy5
	 qhpV4DvEJ5Gpa7MCNtKy3hC4bqwwyGLSCn1p5i234VLIX0afFkuIhEOoagifkAMEa7
	 oionxpXQkwnT/bpeShfx9+ZssxxN1hZswnpsCz28=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 571F0jV74173870
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 1 Aug 2025 10:00:45 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 1
 Aug 2025 10:00:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 1 Aug 2025 10:00:44 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 571F0bWS256132;
	Fri, 1 Aug 2025 10:00:43 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH 2/5] ti-rtos-messageq-test-fw: Add a recipe to package prebuilt IPC firmware
Date: Fri, 1 Aug 2025 20:30:34 +0530
Message-ID: <20250801150037.2650736-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801150037.2650736-1-b-padhi@ti.com>
References: <20250801150037.2650736-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 01 Aug 2025 15:00:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18880

The messageq IPC firmware example for AM57xx SoCs is available in
ti-linux-firmware repository. Add a recipe to package the prebuilt
messageq firmware into the rootfs. Additionally, make sure the firmware
for IPU1 rproc is copied into boot partition as well for Early Boot use
cases.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
 .../ti-rtos-messageq-test-fw_git.bb           | 67 +++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 863d1a7e..e0695e15 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -18,6 +18,7 @@ TI_DM_FW_VERSION = "11.01.09"
 TI_SYSFW_VERSION = "11.01.05"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TAD5212_FW_VERSION = "1.0.0.0"
+TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 
 TI_LINUX_FW_SRCREV ?= "f59a711599249ecac75fea38b7a15ef9137d650d"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-messageq-test-fw_git.bb
new file mode 100644
index 00000000..a1d8ce29
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
+ALTERNATIVE_PRIORITY = "10"
-- 
2.34.1


