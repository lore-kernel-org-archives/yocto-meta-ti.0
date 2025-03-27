Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3766DC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 09:23:38 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.45933.1743067408082389851
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 02:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=D5AOcq6J;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: b-padhi@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52R9NQxH2443283
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 04:23:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743067406;
	bh=SpwFFRAyP6xmO+iXq2VvFf7uiq5I3w+gSM27/afur7I=;
	h=From:To:CC:Subject:Date;
	b=D5AOcq6J/G6OzCHsumh8fY9/ed089x3GmkcjOqCOKzn7jAQ/8wvp2TZfW/b5d00eb
	 08fvfyINr1o4cbnl4YRudxV907suQwd2zQVTxxHqc8dOlyjCn2u7KIbd13lsiuoUxy
	 +Tsl+TAuExxq/FmC2aE0JUVtn1unAqe/5HPMw32U=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52R9NQKL059445
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Mar 2025 04:23:26 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Mar 2025 04:23:25 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Mar 2025 04:23:25 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52R9NNqJ053372;
	Thu, 27 Mar 2025 04:23:24 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH] ti-hsm-fw: Add a recipe to export prebuilt HSM firmware
Date: Thu, 27 Mar 2025 14:53:23 +0530
Message-ID: <20250327092323.1726839-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Mar 2025 09:23:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18422

Add a recipe to deploy the HSM firmware to the DEPLOYDIR, to be picked
up by the tisdk-core-bundle for the prebuilt binaries directory.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 .../recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb    | 28 +++++++++++++++++++
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  4 +++
 3 files changed, 33 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb

diff --git a/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
new file mode 100644
index 00000000..8b225421
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
@@ -0,0 +1,28 @@
+SUMMARY = "TI HSM Firmware"
+
+inherit deploy
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PV = "${TI_HSM_FW_VERSION}"
+PR = "${INC_PR}.0"
+
+SYSFW_SOC ?= "*"
+SYSFW_SOC:j721s2 = "j721s2"
+SYSFW_SOC:j784s4 = "j784s4"
+
+HSM_BINARY = "hsm-demo-firmware-${SYSFW_SOC}*.bin"
+
+do_install() {
+	install -d ${D}${nonarch_base_libdir}/firmware/ti-hsm
+	install -m 644 ${S}/ti-hsm/${HSM_BINARY} ${D}${nonarch_base_libdir}/firmware/ti-hsm
+}
+
+do_deploy() {
+	install -d ${DEPLOYDIR}/ti-hsm
+	install -m 644 ${S}/ti-hsm/${HSM_BINARY} ${DEPLOYDIR}/ti-hsm
+}
+
+addtask deploy before do_build after do_compile
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 0d912625..4e9c385c 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -16,6 +16,7 @@ IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.7"
 TI_DM_FW_VERSION = "11.00.09"
 TI_SYSFW_VERSION = "11.00.07"
+TI_HSM_FW_VERSION = "11.00.09"
 
 TI_LINUX_FW_SRCREV ?= "27003b6bff61a55dd1fff2cc777e5e07b092b1f7"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 41d4abdd..8a800193 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -40,6 +40,10 @@ DEPENDS += "python3-pyelftools-native python3-pyyaml-native python3-jsonschema-n
 DEPENDS:append:k3 = " ti-sci-fw"
 DEPENDS:append:k3r5 = " ti-sci-fw"
 
+# HSM Firmware is only applicable for J721S2 & J784S4 devices
+DEPENDS:append:j721s2 = " ti-hsm-fw"
+DEPENDS:append:j784s4 = " ti-hsm-fw"
+
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
 PLAT_SFX = ""
-- 
2.34.1


