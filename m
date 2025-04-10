Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED1BC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 10:31:09 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.30886.1744281067395382066
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Apr 2025 03:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SXca186R;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: b-padhi@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53AAV6lF1261079
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Apr 2025 05:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744281066;
	bh=eFRG2kkL3YHIfOSQJuXKoIYqF6/1xAwp6Bk0BqveKTA=;
	h=From:To:CC:Subject:Date;
	b=SXca186R6KIYzuKeTE5xgtZWh4lhRQKJ+53APMv//HAFl2SzwBICucRR5iTbj8NvU
	 MSm7ESuqB+YVr2lCN4yHH6DLt+w1PXMe+hvczrIQnuAiF3U5HlWit9IwzEQxdslezO
	 nVkmkeqZJrgNI/gCF8I1sBjQp40hIee+XFTDoO3o=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53AAV6Kn059956
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Apr 2025 05:31:06 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 10
 Apr 2025 05:31:05 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 10 Apr 2025 05:31:05 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53AAV3oA016341;
	Thu, 10 Apr 2025 05:31:03 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>, <s-anna@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH v2] ti-hsm-demo-fw: Add a recipe to export prebuilt HSM demo firmware
Date: Thu, 10 Apr 2025 16:01:02 +0530
Message-ID: <20250410103102.2984208-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Apr 2025 10:31:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18456

Add a recipe to deploy the HSM demo firmware to the DEPLOYDIR, to be
picked up by the tisdk-core-bundle for the prebuilt binaries directory.
This firmware is then further picked by U-Boot and packaged inside
tispl.bin FIT image for loading the HSM M4 core in applicable SoCs.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. Added COMPATIBLE_MACHINE as j721s2|j784s4 for this recipe.
2. Used ti-hsm-demo-fw throughout instead of ti-hsm-fw.
3. Updated commit description to call out how the firmware will be used.
4. Removed the do_install() task from the recipe as this firmware is not used in
the rootfs.

Link to v1:
https://lore.kernel.org/all/20250327092323.1726839-1-b-padhi@ti.com/

Sorry for the delay, took some time to test this patch. Had issues with my
setup.

 .../ti-hsm-fw/ti-hsm-demo-fw_git.bb           | 24 +++++++++++++++++++
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  4 ++++
 3 files changed, 29 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-demo-fw_git.bb

diff --git a/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-demo-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-demo-fw_git.bb
new file mode 100644
index 00000000..f6a7b43f
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-demo-fw_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "TI HSM demo Firmware"
+
+inherit deploy
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PV = "${TI_HSM_DEMO_FW_VERSION}"
+PR = "${INC_PR}.0"
+
+COMPATIBLE_MACHINE = "j721s2|j784s4"
+
+HSM_FW_SOC:j721s2 = "j721s2"
+HSM_FW_SOC:j784s4 = "j784s4"
+
+HSM_BINARY = "hsm-demo-firmware-${HSM_FW_SOC}*.bin"
+
+do_deploy() {
+	install -d ${DEPLOYDIR}/ti-hsm
+	install -m 644 ${S}/ti-hsm/${HSM_BINARY} ${DEPLOYDIR}/ti-hsm
+}
+
+addtask deploy before do_build after do_compile
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index d69109f4..ba58747a 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -16,6 +16,7 @@ IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.7"
 TI_DM_FW_VERSION = "11.00.09"
 TI_SYSFW_VERSION = "11.00.07"
+TI_HSM_DEMO_FW_VERSION = "11.00.09"
 
 TI_LINUX_FW_SRCREV ?= "27003b6bff61a55dd1fff2cc777e5e07b092b1f7"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 41d4abdd..3c56d8b2 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -40,6 +40,10 @@ DEPENDS += "python3-pyelftools-native python3-pyyaml-native python3-jsonschema-n
 DEPENDS:append:k3 = " ti-sci-fw"
 DEPENDS:append:k3r5 = " ti-sci-fw"
 
+# HSM Demo Firmware is only applicable for J721S2 & J784S4 devices
+DEPENDS:append:j721s2 = " ti-hsm-demo-fw"
+DEPENDS:append:j784s4 = " ti-hsm-demo-fw"
+
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
 PLAT_SFX = ""
-- 
2.34.1


