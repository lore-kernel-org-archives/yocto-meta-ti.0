Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.8413.1637060042003288569
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Nov 2021 02:54:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nOHOb8u4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AGAs1wn014947;
	Tue, 16 Nov 2021 04:54:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637060041;
	bh=RGN4OPHfgT7kBIZpjAJ8Xm4d7knQIM9/7FXmNPQeUW4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=nOHOb8u4Sozwf/ssQWCUU9NnaziReakC+z+ir8p+X3PTKLx0ndDawKF1NfoxegXUm
	 N5Qmp4d8gwGC2QOx7xanZ9VPIlyTVlOOHJOFsn1hwCfZ6AfM1UcQJZZVZ0f8ry/sWt
	 PWe2NHLvRM8DuCK6FzzudSGXTjyy18B/x4+PticE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AGAs1Ot070080
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Nov 2021 04:54:01 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 16
 Nov 2021 04:54:00 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 16 Nov 2021 04:54:00 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AGAs0Mx069729;
	Tue, 16 Nov 2021 04:54:00 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/3] j7200-hs: changes to support new hs platform
Date: Tue, 16 Nov 2021 10:54:00 +0000
Message-ID: <20211116105400.45878-4-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211116105400.45878-1-yogeshs@ti.com>
References: <20211116105400.45878-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Changes to support new j7200 hs platform in:
1) optee: sign the image
2) atf: sign the image
3) u-boot: Add u-boot-spl image for combined boot image
4) ti-sci-fw_git: Update firmware prefix for j7200 hs

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb         | 18 ++++++++++++++++++
 .../trusted-firmware-a_%.bbappend              |  8 ++++++++
 recipes-bsp/u-boot/u-boot-ti.inc               |  6 ++++++
 recipes-security/optee/optee-os_%.bbappend     |  4 ++++
 4 files changed, 36 insertions(+)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 9c70120c..4f1dd145 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -2,6 +2,7 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
 DEPENDS_append_j7200-evm-k3r5 = " virtual/bootloader"
+DEPENDS_append_j7200-hs-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_am64xx-hs-evm-k3r5 = " virtual/bootloader"
 
@@ -24,6 +25,7 @@ SYSFW_PREFIX = "ti-sci-firmware"
 SYSFW_PREFIX_j7-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX_j7-hs-evm-k3r5 = "ti-fs-firmware"
+SYSFW_PREFIX_j7200-hs-evm-k3r5 = "ti-fs-firmware"
 
 SYSFW_SUFFIX ?= "unknown"
 
@@ -54,6 +56,7 @@ EXTRA_OEMAKE_HS = " \
 EXTRA_OEMAKE_append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}"
 
 EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_append_j7200-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_am64xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 
@@ -103,6 +106,21 @@ do_deploy_j7200-evm-k3r5() {
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
+do_install_j7200-hs-evm-k3r5() {
+        install -d ${D}/boot
+        install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+        ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
+        ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+}
+
+do_deploy_j7200-hs-evm-k3r5() {
+        install -d ${DEPLOYDIR}
+        install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+        ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+        ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+        install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
+}
+
 do_install_am64xx-evm-k3r5() {
 	install -d ${D}/boot
 	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 90fa0333..2a8f41ee 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -31,3 +31,11 @@ do_compile_append_j7-hs-evm() {
 		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
 	)
 }
+
+do_compile_append_j7200-hs-evm() {
+        export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+        ( cd ${B}/${BUILD_DIR}/release/; \
+                mv bl31.bin bl31.bin.unsigned; \
+                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
+        )
+}
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 131c03e8..f9cbb074 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -65,6 +65,7 @@ SPL_UART_BINARY_keystone = ""
 SPL_UART_BINARY_k3r5 = ""
 SPL_UART_BINARY_lego-ev3 = ""
 SPL_UART_BINARY_j7200-evm-k3r5 = "u-boot-spl.bin"
+SPL_UART_BINARY_j7200-hs-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_am64xx-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_am64xx-hs-evm-k3r5 = "u-boot-spl.bin"
 
@@ -397,6 +398,11 @@ do_deploy_append_j7200-evm-k3r5 () {
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
 }
 
+do_deploy_append_j7200-hs-evm-k3r5 () {
+	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
+	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
+}
+
 do_deploy_append_am64xx-evm-k3r5 () {
 	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 401ac534..9bd0b933 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -69,6 +69,10 @@ do_compile_append_j7-hs-evm() {
     optee_sign_k3hs
 }
 
+do_compile_append_j7200-hs-evm() {
+    optee_sign_k3hs
+}
+
 do_install_append_ti-soc() {
     install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
     install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
-- 
2.17.1

