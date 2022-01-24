Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.4860.1643037256803143491
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 07:14:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nEXg8NcH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20OFEDd0061522;
	Mon, 24 Jan 2022 09:14:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643037253;
	bh=XE836BTCdUbbyzgeaLTUAvrg2hfRPct1XjmHrYFgKsY=;
	h=From:To:Subject:Date;
	b=nEXg8NcHmgQYZPs26JVF7q3AtYUaw6n4hBw3leAs7xoiAtrxdBxXp/21qSEC+BRQg
	 HqFJA85P8EAMXSo51QHwKdVp0uBd5l7oJkK3Clr6qdWv97SlX7ZRKA52HoH3/YnnJE
	 maXLnsKgk9DP21m2tfe6Biq7uVzihuV6jtwMM0qI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20OFEDNc089719
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Jan 2022 09:14:13 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 24
 Jan 2022 09:14:13 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 24 Jan 2022 09:14:13 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20OFEDrv082000;
	Mon, 24 Jan 2022 09:14:13 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nC12r-00011k-36; Mon, 24 Jan 2022 09:14:13 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] machine: Add j721s2 evm configuration
Date: Mon, 24 Jan 2022 09:14:13 -0600
Message-ID: <20220124151413.3861-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nishanth Menon <nm@ti.com>

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 conf/machine/j721s2-evm-k3r5.conf      | 11 +++++++++++
 conf/machine/j721s2-evm.conf           | 22 ++++++++++++++++++++++
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 23 +++++++++++++++++++++--
 recipes-bsp/u-boot/u-boot-ti.inc       |  6 ++++++
 4 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 conf/machine/j721s2-evm-k3r5.conf
 create mode 100644 conf/machine/j721s2-evm.conf

diff --git a/conf/machine/j721s2-evm-k3r5.conf b/conf/machine/j721s2-evm-k3r5.conf
new file mode 100644
index 00000000..508e96e5
--- /dev/null
+++ b/conf/machine/j721s2-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: J721S2 EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J721S2 EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "j721s2"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "gp"
+
+UBOOT_MACHINE = "j721s2_evm_r5_defconfig"
diff --git a/conf/machine/j721s2-evm.conf b/conf/machine/j721s2-evm.conf
new file mode 100644
index 00000000..82fd33da
--- /dev/null
+++ b/conf/machine/j721s2-evm.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@NAME: J721S2 EVM
+#@DESCRIPTION: Machine configuration for the TI J721S2 EVM
+
+require conf/machine/include/j7.inc
+
+SERIAL_CONSOLES = "115200;ttyS10"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+TFA_K3_USART = "0x8"
+OPTEE_K3_USART = "0x8"
+
+KERNEL_DEVICETREE = " \
+    ti/k3-j721s2-common-proc-board.dtb \
+"
+
+UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
+
+# J721S2 supports multi-certificate images, use the same
+IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
+
+do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 13ae1f6b..d70d664c 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -3,11 +3,12 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
 DEPENDS_append_j7200-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_j7200-hs-evm-k3r5 = " virtual/bootloader"
+DEPENDS_append_j721s2-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_am64xx-hs-evm-k3r5 = " virtual/bootloader"
 
 CLEANBROKEN = "1"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 # Loaded by R5F core
 COMPATIBLE_MACHINE = "k3r5"
@@ -23,10 +24,11 @@ SYSFW_CONFIG ?= "unknown"
 
 SYSFW_PREFIX = "ti-sci-firmware"
 SYSFW_PREFIX_j7-evm-k3r5 = "ti-fs-firmware"
-SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX_j7-hs-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "ti-fs-firmware"
+SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX_j7200-hs-evm-k3r5 = "ti-fs-firmware"
+SYSFW_PREFIX_j721s2-evm-k3r5 = "ti-fs-firmware"
 
 SYSFW_SUFFIX ?= "unknown"
 
@@ -63,6 +65,7 @@ EXTRA_OEMAKE_append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}
 
 EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_j7200-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_append_j721s2-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_am64xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 
@@ -127,6 +130,21 @@ do_deploy_j7200-hs-evm-k3r5() {
         install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
+do_install_j721s2-evm-k3r5() {
+	install -d ${D}/boot
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+}
+
+do_deploy_j721s2-evm-k3r5() {
+	install -d ${DEPLOYDIR}
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
+}
+
 do_install_am64xx-evm-k3r5() {
 	install -d ${D}/boot
 	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
@@ -156,4 +174,5 @@ do_deploy_am64xx-hs-evm-k3r5() {
         ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
         install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
+
 addtask deploy before do_build after do_compile
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index f9cbb074..aceabe86 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -66,6 +66,7 @@ SPL_UART_BINARY_k3r5 = ""
 SPL_UART_BINARY_lego-ev3 = ""
 SPL_UART_BINARY_j7200-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_j7200-hs-evm-k3r5 = "u-boot-spl.bin"
+SPL_UART_BINARY_j721s2-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_am64xx-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_am64xx-hs-evm-k3r5 = "u-boot-spl.bin"
 
@@ -403,6 +404,11 @@ do_deploy_append_j7200-hs-evm-k3r5 () {
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
 }
 
+do_deploy_append_j721s2-evm-k3r5 () {
+	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
+	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
+}
+
 do_deploy_append_am64xx-evm-k3r5 () {
 	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
-- 
2.17.1

