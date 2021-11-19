Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.3487.1637290749553994977
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 18:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E63F240C16
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zSwo-QtETTX1 for <meta-ti@lists.yoctoproject.org>;
	Fri, 19 Nov 2021 02:59:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5CB9640C98
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 458C61746D2
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Nov 2021 21:59:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 14/20] ti-sci-fw: changes to build combined boot image for hs build
Date: Thu, 18 Nov 2021 21:58:55 -0500
Message-Id: <1637290741-8603-15-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637290741-8603-1-git-send-email-denis@denix.org>
References: <1637290741-8603-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

Added support to build combined boot image for hs build.
This required k3 image gen patch that is already merged.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 4fa8f1f..dd0ce09 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -3,9 +3,10 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
 DEPENDS:append:j7200-evm-k3r5 = " virtual/bootloader"
 DEPENDS:append:am64xx-evm-k3r5 = " virtual/bootloader"
+DEPENDS:append:am64xx-hs-evm-k3r5 = " virtual/bootloader"
 
 CLEANBROKEN = "1"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 # Loaded by R5F core
 COMPATIBLE_MACHINE = "k3r5"
@@ -48,12 +49,13 @@ EXTRA_OEMAKE = "\
     SYSFW_PATH="${SYSFW_TISCI}" SOC=${SYSFW_SOC} CONFIG=${SYSFW_CONFIG} \
 "
 EXTRA_OEMAKE_HS = " \
-    HS=1 SYSFW_HS_PATH="${S}/ti-sysfw/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
+    HS=1 SW_REV=1 SYSFW_HS_PATH="${S}/ti-sysfw/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${S}/ti-sysfw/${SYSFW_BASE}-cert.bin" \
 "
 EXTRA_OEMAKE:append = "${@['',' ${EXTRA_OEMAKE_HS}']['${SYSFW_SUFFIX}' == 'hs']}"
 
 EXTRA_OEMAKE:append:j7200-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 EXTRA_OEMAKE:append:am64xx-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE:append:am64xx-hs-evm-k3r5 = " SBL="${STAGING_DIR_HOST}/boot/u-boot-spl.bin""
 
 do_compile() {
 	cd ${WORKDIR}/imggen/
@@ -116,4 +118,19 @@ do_deploy:am64xx-evm-k3r5() {
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
 
+do_install:am64xx-hs-evm-k3r5() {
+	install -d ${D}/boot
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+}
+
+do_deploy:am64xx-hs-evm-k3r5() {
+	install -d ${DEPLOYDIR}
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
+}
+
 addtask deploy before do_build after do_compile
-- 
2.7.4

