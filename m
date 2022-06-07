Return-Path: <j-choudhary@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEB1C3F2D4
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 10:35:40 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.10868.1654598137181162083
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 03:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HbEQAngf;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: j-choudhary@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 257AZavV123737
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jun 2022 05:35:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654598136;
	bh=M4f3e3KaJNJrr3oswCVV2hkpqTI6dZ3vHVLAAhTApiQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HbEQAngfjEkzzhvYj+TyyB8HxSTb3JdVZtGIh6O7OUTkutUvAXvwnvJpo/yGsJRGy
	 l1A1dVBv7QSAMIdN20ZQhaU2fnL2ddkHs6HKHtKaeN4PKV3oyKLpYC9DcdPMMJtaTH
	 KioGeGe8yWz3WDCWnaj8NN4+DpimDZsouk49TICQ=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 257AZaFj097010
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 7 Jun 2022 05:35:36 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 7
 Jun 2022 05:35:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 7 Jun 2022 05:35:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 257AZY6x001591;
	Tue, 7 Jun 2022 05:35:34 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <afd@ti.com>, <praneeth@ti.com>, <reatmon@ti.com>, <j-choudhary@ti.com>
Subject: [meta-ti] [dunfell PATCH v2 3/5] j721s2-hs: changes to support new hs
 platform
Date: Tue, 7 Jun 2022 16:05:27 +0530
Message-ID: <20220607103529.13068-4-j-choudhary@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220607103529.13068-1-j-choudhary@ti.com>
References: <20220607103529.13068-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Jun 2022 10:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14789

Changes to support new j721s2-hs platform in:
1) ti-sci-fw_git: Update firmware prefix for j721s2-hs
2) atf: sign the image
3) u-boot: Add u-boot-spl image for combined boot image
4) optee: sign the image

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb         | 18 ++++++++++++++++++
 .../trusted-firmware-a_%.bbappend              |  8 ++++++++
 recipes-bsp/u-boot/u-boot-ti.inc               |  6 ++++++
 recipes-security/optee/optee-os_%.bbappend     |  4 ++++
 4 files changed, 36 insertions(+)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 099473b4..983d23e3 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -4,6 +4,7 @@ DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
 DEPENDS_append_j7200-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_j7200-hs-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_j721s2-evm-k3r5 = " virtual/bootloader"
+DEPENDS_append_j721s2-hs-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_am64xx-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_am64xx-hs-evm-k3r5 = " virtual/bootloader"
 DEPENDS_append_am62xx-evm-k3r5 = " virtual/bootloader"
@@ -30,6 +31,7 @@ SYSFW_PREFIX_j7-hs-evm-k3r5-sr1-1 = "ti-fs-firmware"
 SYSFW_PREFIX_j7200-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX_j7200-hs-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX_j721s2-evm-k3r5 = "ti-fs-firmware"
+SYSFW_PREFIX_j721s2-hs-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX_am62xx-evm-k3r5 = "ti-fs-firmware"
 
 SYSFW_SUFFIX ?= "unknown"
@@ -63,6 +65,7 @@ EXTRA_OEMAKE_append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}
 EXTRA_OEMAKE_append_j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_j7200-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_j721s2-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE_append_j721s2-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_am64xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE_append_am62xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
@@ -143,6 +146,21 @@ do_deploy_j721s2-evm-k3r5() {
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
+do_install_j721s2-hs-evm-k3r5() {
+	install -d ${D}/boot
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+}
+
+do_deploy_j721s2-hs-evm-k3r5() {
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
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 68bfa899..9f741e3a 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -42,3 +42,11 @@ do_compile_append_j7200-hs-evm() {
                 ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
         )
 }
+
+do_compile_append_j721s2-hs-evm() {
+	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+	( cd ${B}/${BUILD_DIR}/release/; \
+		mv bl31.bin bl31.bin.unsigned; \
+		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
+	)
+}
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 903c61f0..e7c93335 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -60,6 +60,7 @@ SPL_UART_BINARY_lego-ev3 = ""
 SPL_UART_BINARY_j7200-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_j7200-hs-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_j721s2-evm-k3r5 = "u-boot-spl.bin"
+SPL_UART_BINARY_j721s2-hs-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_am64xx-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_am64xx-hs-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY_am62xx-evm-k3r5 = "u-boot-spl.bin"
@@ -403,6 +404,11 @@ do_deploy_append_j721s2-evm-k3r5 () {
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
 }
 
+do_deploy_append_j721s2-hs-evm-k3r5 () {
+	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
+	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
+}
+
 do_deploy_append_am64xx-evm-k3r5 () {
 	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 4e01ea74..e128da89 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -75,6 +75,10 @@ do_compile_append_j7200-hs-evm() {
     optee_sign_k3hs
 }
 
+do_compile_append_j721s2-hs-evm() {
+    optee_sign_k3hs
+}
+
 do_install_append_ti-soc() {
     install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
     install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
-- 
2.17.1


