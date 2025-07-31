Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF58C87FC9
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 02:17:56 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.52478.1753928269784195617
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 19:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=STZ53EYn;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: b-padhi@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56V2Hmfa3379638;
	Wed, 30 Jul 2025 21:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753928268;
	bh=wK1MxVA1rojJtO7M7JEW1K/giR84PxDh8AhFNHZ4Qm0=;
	h=From:To:CC:Subject:Date;
	b=STZ53EYn90hio5yywtzKOJRq5lNDb/H2+yJUDuc1dXm3LoPvLek3PbBnyqdhFCZRH
	 FRnCKW7KFx3+bs3ZetXc7JunkIOGeoTrr58X691oG/DyYazYGVZxgmGM8vWo5KZBFA
	 H7hRDx9UM1Zrkg35WWUwe4JkHTMImoGoqPMq42ig=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56V2Hm5R3617315
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 30 Jul 2025 21:17:48 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 30
 Jul 2025 21:17:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 30 Jul 2025 21:17:47 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56V2HjpS2176124;
	Wed, 30 Jul 2025 21:17:46 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH v3] ti-pka-fw: Add a recipe to package prebuilt PKA firmware
Date: Thu, 31 Jul 2025 07:47:44 +0530
Message-ID: <20250731021744.1256347-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 31 Jul 2025 02:17:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18858

Add a recipe to install the PKA firmware in root filesystem needed by
sa2_ul driver for PKA operations across all K3 platforms.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v3: Changelog:
1. Add '&' in Licence instead of '|'.
2. Remove alternatives, directly install firmware in /lib/firmware

Link to v2:
https://lore.kernel.org/all/20250730180302.7507-1-b-padhi@ti.com/

v2: Changelog:
1. Use MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS to package PKA firmware from
within meta-ti itself.
2. Update LICENCE name and LIC_FILES_CHKSUM to appropriate licence from
ti-linux-firmware.

Link to v1:
https://lore.kernel.org/all/20250730074831.2640806-1-b-padhi@ti.com/

 meta-ti-bsp/conf/machine/include/k3.inc       |  1 +
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
 .../recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb    | 23 +++++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index 7ec6b51e..fdcf193d 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -40,6 +40,7 @@ UBI_VOLNAME = "rootfs"
 
 # List common SoC features, may need to add touchscreen for specific machines
 MACHINE_FEATURES = "apm usbgadget usbhost vfat ext2 alsa pci optee-ftpm"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "ti-pka-fw"
 
 IMAGE_FSTYPES += "tar.xz wic.xz wic.bmap"
 
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 863d1a7e..7fe2c592 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -18,6 +18,7 @@ TI_DM_FW_VERSION = "11.01.09"
 TI_SYSFW_VERSION = "11.01.05"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TAD5212_FW_VERSION = "1.0.0.0"
+TI_PKA_FW_VERSION = "2.1.0"
 
 TI_LINUX_FW_SRCREV ?= "f59a711599249ecac75fea38b7a15ef9137d650d"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
diff --git a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
new file mode 100644
index 00000000..49ae0251
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "PKA prebuilt binary firmware image"
+
+LICENSE = "TI-TFL & INSIDE Secure"
+LIC_FILES_CHKSUM = "file://LICENCE.pka_fw;md5=dc20391b287874f0dce069cf87917206"
+
+COMPATIBLE_MACHINE = "k3"
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+PV = "${TI_PKA_FW_VERSION}"
+PR = "${INC_PR}.0"
+
+PKA_FW_DIR = "ti-pka"
+
+INSTALL_PKA_FW_DIR = "${nonarch_base_libdir}/firmware"
+
+PKA_FW_NAME = "eip29t2_2.1.0.bin"
+
+do_install() {
+    # Install Firmware
+    install -d ${D}${INSTALL_PKA_FW_DIR}
+    install -m 0644 ${S}/${PKA_FW_DIR}/${PKA_FW_NAME} ${D}/${INSTALL_PKA_FW_DIR}/${PKA_FW_NAME}
+}
-- 
2.34.1


