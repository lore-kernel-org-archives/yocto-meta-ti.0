Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C602C6FD23
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:55:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.833.1663041348006721351
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EFD4140D8B
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fCP8oMalvh0a for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D681740D8A
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6BA3C1749DC
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 16/65] j721s2-hs: changes to support new hs
 platform
Date: Tue, 13 Sep 2022 03:54:52 +0000
Message-Id: <20220913035541.2364351-17-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15044

From: Jayesh Choudhary <j-choudhary@ti.com>

Changes to support new j721s2-hs platform in:
1) ti-sci-fw_git: Update firmware prefix for j721s2-hs
2) atf: sign the image
3) u-boot: Add u-boot-spl image for combined boot image
4) optee: sign the image

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb     | 18 ++++++++++++++++++
 .../trusted-firmware-a_%.bbappend              |  8 ++++++++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc   |  6 ++++++
 .../recipes-security/optee/optee-os_%.bbappend |  4 ++++
 4 files changed, 36 insertions(+)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 530b25b8..6a381447 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -4,6 +4,7 @@ DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-nat=
ive"
 DEPENDS:append:j7200-evm-k3r5 =3D " virtual/bootloader"
 DEPENDS:append:j7200-hs-evm-k3r5 =3D " virtual/bootloader"
 DEPENDS:append:j721s2-evm-k3r5 =3D " virtual/bootloader"
+DEPENDS:append:j721s2-hs-evm-k3r5 =3D " virtual/bootloader"
 DEPENDS:append:am64xx-evm-k3r5 =3D " virtual/bootloader"
 DEPENDS:append:am64xx-hs-evm-k3r5 =3D " virtual/bootloader"
 DEPENDS:append:am62xx-evm-k3r5 =3D " virtual/bootloader"
@@ -30,6 +31,7 @@ SYSFW_PREFIX:j721e-hs-evm-k3r5-sr1-1 =3D "ti-fs-firmwar=
e"
 SYSFW_PREFIX:j7200-evm-k3r5 =3D "ti-fs-firmware"
 SYSFW_PREFIX:j7200-hs-evm-k3r5 =3D "ti-fs-firmware"
 SYSFW_PREFIX:j721s2-evm-k3r5 =3D "ti-fs-firmware"
+SYSFW_PREFIX:j721s2-hs-evm-k3r5 =3D "ti-fs-firmware"
 SYSFW_PREFIX:am62xx-evm-k3r5 =3D "ti-fs-firmware"
=20
 SYSFW_SUFFIX ?=3D "unknown"
@@ -63,6 +65,7 @@ EXTRA_OEMAKE:append =3D "${@['',' ${EXTRA_OEMAKE_HS}'][=
'${SYSFW_SUFFIX}' =3D=3D 'hs']}
 EXTRA_OEMAKE:append:j7200-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boot=
/u-boot-spl.bin""
 EXTRA_OEMAKE:append:j7200-hs-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/b=
oot/u-boot-spl.bin""
 EXTRA_OEMAKE:append:j721s2-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boo=
t/u-boot-spl.bin""
+EXTRA_OEMAKE:append:j721s2-hs-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/=
boot/u-boot-spl.bin""
 EXTRA_OEMAKE:append:am64xx-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boo=
t/u-boot-spl.bin""
 EXTRA_OEMAKE:append:am64xx-hs-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/=
boot/u-boot-spl.bin""
 EXTRA_OEMAKE:append:am62xx-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boo=
t/u-boot-spl.bin""
@@ -143,6 +146,21 @@ do_deploy:j721s2-evm-k3r5() {
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
 }
=20
+do_install:j721s2-hs-evm-k3r5() {
+	install -d ${D}/boot
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAG=
E}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+}
+
+do_deploy:j721s2-hs-evm-k3r5() {
+	install -d ${DEPLOYDIR}
+	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_I=
MAGE}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
+	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
+	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
+}
+
 do_install:am64xx-evm-k3r5() {
 	install -d ${D}/boot
 	install -m 644 ${WORKDIR}/imggen/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAG=
E}
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_%.bbappend
index 45d56451..6254d09e 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
@@ -42,3 +42,11 @@ do_compile:append:j7200-hs-evm() {
 		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned =
bl31.bin; \
 	)
 }
+
+do_compile:append:j721s2-hs-evm() {
+	export TI_SECURE_DEV_PKG=3D${TI_SECURE_DEV_PKG}
+	( cd ${B}/${BUILD_DIR}/release/; \
+		mv bl31.bin bl31.bin.unsigned; \
+		${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned =
bl31.bin; \
+	)
+}
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti.inc
index dddf6284..f470c95e 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -59,6 +59,7 @@ SPL_UART_BINARY:lego-ev3 =3D ""
 SPL_UART_BINARY:j7200-evm-k3r5 =3D "u-boot-spl.bin"
 SPL_UART_BINARY:j7200-hs-evm-k3r5 =3D "u-boot-spl.bin"
 SPL_UART_BINARY:j721s2-evm-k3r5 =3D "u-boot-spl.bin"
+SPL_UART_BINARY:j721s2-hs-evm-k3r5 =3D "u-boot-spl.bin"
 SPL_UART_BINARY:am64xx-evm-k3r5 =3D "u-boot-spl.bin"
 SPL_UART_BINARY:am64xx-hs-evm-k3r5 =3D "u-boot-spl.bin"
 SPL_UART_BINARY:am62xx-evm-k3r5 =3D "u-boot-spl.bin"
@@ -277,6 +278,11 @@ do_deploy:append:j721s2-evm-k3r5 () {
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
 }
=20
+do_deploy:append:j721s2-hs-evm-k3r5 () {
+	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
+	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
+}
+
 do_deploy:append:am64xx-evm-k3r5 () {
 	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
 	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/met=
a-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index 6097580f..d55bbc90 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -63,6 +63,10 @@ do_compile:append:j7200-hs-evm() {
     optee_sign_k3hs
 }
=20
+do_compile:append:j721s2-hs-evm() {
+    optee_sign_k3hs
+}
+
 do_install:append:ti-soc() {
     install -m 644 ${B}/*.optee ${D}${nonarch_base_libdir}/firmware/ || =
true
     install -m 644 ${B}/bl32.bin ${D}${nonarch_base_libdir}/firmware/ ||=
 true
--=20
2.25.1


