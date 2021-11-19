Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3359.1637290749573293256
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 18:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E5D7C40BEA
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OFgFXiTRsi6l for <meta-ti@lists.yoctoproject.org>;
	Fri, 19 Nov 2021 02:59:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 689BE40CA2
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5124E1746D4
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Nov 2021 21:59:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 15/20] am64xx-hs: changes to support new hs platform
Date: Thu, 18 Nov 2021 21:58:56 -0500
Message-Id: <1637290741-8603-16-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637290741-8603-1-git-send-email-denis@denix.org>
References: <1637290741-8603-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

Changes to support new am64x hs platform in:
1) optee: sign the image
2) atf: sign the image
3) u-boot: Add u-boot-spl image for combined boot image

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 8 ++++++++
 recipes-bsp/u-boot/u-boot-ti.inc                             | 6 ++++++
 recipes-security/optee/optee-os_%.bbappend                   | 4 ++++
 3 files changed, 18 insertions(+)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 2258258..8fdccbe 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -16,6 +16,14 @@ do_compile:append:am65xx-hs-evm() {
 	)
 }
 
+do_compile:append:am64xx-hs-evm() {
+	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
+	( cd ${B}/${BUILD_DIR}/release/; \
+		mv bl31.bin bl31.bin.unsigned; \
+		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
+	)
+}
+
 do_compile:append:j7-hs-evm() {
 	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
 	( cd ${BUILD_DIR}; \
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 8a42061..633975c 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -66,6 +66,7 @@ SPL_UART_BINARY:k3r5 = ""
 SPL_UART_BINARY:lego-ev3 = ""
 SPL_UART_BINARY:j7200-evm-k3r5 = "u-boot-spl.bin"
 SPL_UART_BINARY:am64xx-evm-k3r5 = "u-boot-spl.bin"
+SPL_UART_BINARY:am64xx-hs-evm-k3r5 = "u-boot-spl.bin"
 
 SPL_UART_IMAGE ?= "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?= "${SPL_UART_BINARY}-${MACHINE}"
@@ -401,4 +402,9 @@ do_deploy:append:am64xx-evm-k3r5 () {
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
 }
 
+do_deploy:append:am64xx-hs-evm-k3r5 () {
+	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
+	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || true
+}
+
 TOOLCHAIN = "gcc"
diff --git a/recipes-security/optee/optee-os_%.bbappend b/recipes-security/optee/optee-os_%.bbappend
index aac14a5..0a40fa2 100644
--- a/recipes-security/optee/optee-os_%.bbappend
+++ b/recipes-security/optee/optee-os_%.bbappend
@@ -49,6 +49,10 @@ do_compile:append:am65xx-hs-evm() {
     optee_sign_k3hs
 }
 
+do_compile:append:am64xx-hs-evm() {
+    optee_sign_k3hs
+}
+
 do_compile:append:j7-hs-evm() {
     optee_sign_k3hs
 }
-- 
2.7.4

