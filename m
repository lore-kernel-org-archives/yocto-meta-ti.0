Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7D6C4167B
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 18:16:01 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.13644.1647972960406019313
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 11:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=a8giuWsi;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MIFwMN067319;
	Tue, 22 Mar 2022 13:15:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647972958;
	bh=B5VibK0kOLCGtaQQuoXi9FVqbaJp3hz4DfRePBrfrOE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=a8giuWsiLxoMZ+MoVLbyuHjsY9dtpkgd7WMWPySxCITnkkdvruslLKYeJC1u6tJlk
	 xnAOw1xZIwRj61Sa3p/7GfPAsio0cafvuCy83R1LsuG5W72yPazqU4Hh8YBaf85O4t
	 /rsGTQGjr41Yc/QrI+ZQErNVeY28yN+j3cE0ma+k=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MIFw5Q105687
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 13:15:58 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 13:15:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 13:15:58 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MIFwh7015149;
	Tue, 22 Mar 2022 13:15:58 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nWj30-0005OT-FY; Tue, 22 Mar 2022 13:15:58 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 1/7] machine: Add am62xx evm
 configuration
Date: Tue, 22 Mar 2022 13:15:52 -0500
Message-ID: <20220322181558.20684-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220322181558.20684-1-reatmon@ti.com>
References: <20220322181558.20684-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 18:16:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14528

From: Nishanth Menon <nm@ti.com>

Lets add the basic AM62xx-evm configuration.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 conf/machine/am62xx-evm-k3r5.conf      | 11 +++++++++++
 conf/machine/am62xx-evm.conf           | 13 +++++++++++++
 conf/machine/include/am62xx.inc        | 17 +++++++++++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 18 ++++++++++++++++++
 recipes-bsp/u-boot/u-boot-ti.inc       |  6 ++++++
 5 files changed, 65 insertions(+)
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
index 00000000..06bac922
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
+# AM64 supports multi-certificate images, use the same
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
index 7ed6c5b4..6098f989 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -69,6 +69,7 @@ SPL_UART_BINARY_j7200-hs-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_j721s2-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_am64xx-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_am64xx-hs-evm-k3r5 = "u-boot-spl.bin"
+SPL_UART_BINARY_am62xx-evm-k3r5 = "u-boot-spl.bin"
 
 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
@@ -419,4 +420,9 @@ do_deploy_append_am64xx-hs-evm-k3r5 () {
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
 }
 
+do_deploy_append_am62xx-evm-k3r5 () {
+	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
+	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
+}
+
 TOOLCHAIN = "gcc"
-- 
2.17.1


