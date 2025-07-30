Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4E3C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 07:48:38 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.29951.1753861717360132616
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 00:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ggJ+Vpw/;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: b-padhi@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56U7mY9Q3197678;
	Wed, 30 Jul 2025 02:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753861714;
	bh=9erKqC95XscrsvkttL9pqjTlKUTYrxbciUJNn5zD7WQ=;
	h=From:To:CC:Subject:Date;
	b=ggJ+Vpw/36fCP8TOvQMUx3zZ0fGbOgmFxha7PVhp5SfA/53s+gsr/0tMZe22T5Tlh
	 nOOCqhEY/GEfz9zuR0v5F7WxK8DYLJN74oMOFS51Ngw+j0LhWnzkl6LRQ4jWJBNAH8
	 ZopSSXEtd4zgkbU5/nV3o6aboGaU5uYVd/F3djX4=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56U7mYXR3040415
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 30 Jul 2025 02:48:34 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 30
 Jul 2025 02:48:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 30 Jul 2025 02:48:34 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56U7mVeb892284;
	Wed, 30 Jul 2025 02:48:32 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH] ti-pka-fw: Add a recipe to package prebuilt PKA firmware
Date: Wed, 30 Jul 2025 13:18:31 +0530
Message-ID: <20250730074831.2640806-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Jul 2025 07:48:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18854

Add a recipe to install the PKA firmware in root filesystem needed by
sa2_ul driver for PKA operations.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  1 +
 .../recipes-bsp/ti-pka-fw/ti-pka-fw.bb        | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw.bb

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
diff --git a/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw.bb b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw.bb
new file mode 100644
index 00000000..a24a5f4e
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/ti-pka-fw/ti-pka-fw.bb
@@ -0,0 +1,38 @@
+SUMMARY = "TI PKA prebuilt binary firmware image"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://${THISDIR}/../../licenses/TI-TFL;md5=a1b59cb7ba626b9dbbcbf00f3fbc438a"
+
+COMPATIBLE_MACHINE = "k3"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit update-alternatives
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+PV = "${TI_PKA_FW_VERSION}"
+PR = "${INC_PR}.0"
+
+PKA_FW_DIR = "ti-pka"
+
+INSTALL_PKA_FW_DIR = "${nonarch_base_libdir}/firmware/${PKA_FW_DIR}"
+
+PKA_FW_NAME = "eip29t2_2.1.0.bin"
+
+do_install() {
+    # Install Firmware
+    install -d ${D}${INSTALL_PKA_FW_DIR}
+    install -m 0644 ${S}/${PKA_FW_DIR}/${PKA_FW_NAME} ${D}${INSTALL_PKA_FW_DIR}
+}
+
+# Set up names for the firmwares
+ALTERNATIVE:${PN} = "eip29t2_2.1.0.bin"
+
+# Set up link names for the firmware
+ALTERNATIVE_LINK_NAME[eip29t2_2.1.0.bin] = "${nonarch_base_libdir}/firmware/${PKA_FW_NAME}"
+
+# Create the firmware alternative
+ALTERNATIVE_TARGET[eip29t2_2.1.0.bin] = "${INSTALL_PKA_FW_DIR}/${PKA_FW_NAME}"
+
+ALTERNATIVE_PRIORITY = "10"
-- 
2.34.1


