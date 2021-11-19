Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3413.1637290745491431175
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 18:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D1BBE40C61
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bn-godamJsXd for <meta-ti@lists.yoctoproject.org>;
	Fri, 19 Nov 2021 02:59:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CB31C40C8F
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8BA371746DB
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Nov 2021 21:59:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 20/20] j7200-hs: changes to support new hs platform
Date: Thu, 18 Nov 2021 21:59:01 -0500
Message-Id: <1637290741-8603-21-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637290741-8603-1-git-send-email-denis@denix.org>
References: <1637290741-8603-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

Changes to support new j7200 hs platform in:
1) optee: sign the image
2) atf: sign the image
3) u-boot: Add u-boot-spl image for combined boot image
4) ti-sci-fw_git: Update firmware prefix for j7200 hs

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb                 | 18 ++++++++++++++++++
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend   |  8 ++++++++
 recipes-bsp/u-boot/u-boot-ti.inc                       |  6 ++++++
 recipes-security/optee/optee-os_%.bbappend             |  4 ++++
 4 files changed, 36 insertions(+)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index dd0ce09..f70c3ae 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -2,6 +2,7 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
 DEPENDS:append:j7200-evm-k3r5 = " virtual/bootloader"
+DEPENDS:append:j7200-hs-evm-k3r5 = " virtual/bootloader"
 DEPENDS:append:am64xx-evm-k3r5 = " virtual/bootloader"
 DEPENDS:append:am64xx-hs-evm-k3r5 = " virtual/bootloader"
 
@@ -24,6 +25,7 @@ SYSFW_PREFIX = "ti-sci-firmware"
 SYSFW_PREFIX:j7-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX:j7200-evm-k3r5 = "ti-fs-firmware"
 SYSFW_PREFIX:j7-hs-evm-k3r5 = "ti-fs-firmware"
+SYSFW_PREFIX:j7200-hs-evm-k3r5 = "ti-fs-firmware"
 
 SYSFW_SUFFIX ?= "unknown"
 
@@ -54,6 +56,7 @@ EXTRA_OEMAKE_HS = " \
 EXTRA_OEMAKE:append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}"
 
 EXTRA_OEMAKE:append:j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE:append:j7200-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE:append:am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE:append:am64xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 
@@ -103,6 +106,21 @@ do_deploy:j7200-evm-k3r5() {
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
+do_install:j7200-hs-evm-k3r5() {
+	install -d ${D}/boot
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+}
+
+do_deploy:j7200-hs-evm-k3r5() {
+	install -d ${DEPLOYDIR}
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
+}
+
 do_install:am64xx-evm-k3r5() {
 	install -d ${D}/boot
 	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 8fdccbe..42e867a 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -31,3 +31,11 @@ do_compile:append:j7-hs-evm() {
 		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
 	)
 }
+
+do_compile:append:j7200-hs-evm() {
+	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+	( cd ${B}/${BUILD_DIR}/release/; \
+		mv bl31.bin bl31.bin.unsigned; \
+		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
+	)
+}
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 633975c..8ded12c 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -65,6 +65,7 @@ SPL_UART_BINARY:keystone = ""
 SPL_UART_BINARY:k3r5 = ""
 SPL_UART_BINARY:lego-ev3 = ""
 SPL_UART_BINARY:j7200-evm-k3r5 = "u-boot-spl.bin"
+SPL_UART_BINARY:j7200-hs-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY:am64xx-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY:am64xx-hs-evm-k3r5 = "u-boot-spl.bin"
 
@@ -397,6 +398,11 @@ do_deploy:append:j7200-evm-k3r5 () {
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
 }
 
+do_deploy:append:j7200-hs-evm-k3r5 () {
+	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
+	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
+}
+
 do_deploy:append:am64xx-evm-k3r5 () {
 	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index 0a40fa2..5cb70df 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -57,6 +57,10 @@ do_compile:append:j7-hs-evm() {
     optee_sign_k3hs
 }
 
+do_compile:append:j7200-hs-evm() {
+    optee_sign_k3hs
+}
+
 do_install:append:ti-soc() {
     install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || true
     install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ || true
-- 
2.7.4

