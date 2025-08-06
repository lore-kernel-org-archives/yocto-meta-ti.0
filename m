Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47111C87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 17:04:54 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.30544.1754499891431899266
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 Aug 2025 10:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=El+NJ/a6;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: b-padhi@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 576H4ok1169168;
	Wed, 6 Aug 2025 12:04:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754499890;
	bh=hFiiJ4eySpLJ/BjC6Rqrhr+EGLLm3GA314S2h+DIB9Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=El+NJ/a6KL4Rg7HV6lD7WqY9fsb5AwdMFg+sfxMfAgv9KD0+YwYVFS4eDWOqbjbE8
	 plq6EfhgXVq54EB9sAKr0IgQb5mHzjdF5+0H2F1XX+0yLZWCzdDTinedy0cpAzJE8Q
	 sOHoDKqtT/NGwmr8Fn0DFD/xRjPMYneq3Vj9t6yo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 576H4oSU271490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 6 Aug 2025 12:04:50 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 6
 Aug 2025 12:04:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 6 Aug 2025 12:04:50 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 576H4gP63869168;
	Wed, 6 Aug 2025 12:04:48 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH v2 2/5] ti-rtos-messageq-test-fw: Add a recipe to package prebuilt IPC firmware
Date: Wed, 6 Aug 2025 22:34:39 +0530
Message-ID: <20250806170442.243461-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806170442.243461-1-b-padhi@ti.com>
References: <20250806170442.243461-1-b-padhi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 06 Aug 2025 17:04:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18898

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
-- 
2.34.1


