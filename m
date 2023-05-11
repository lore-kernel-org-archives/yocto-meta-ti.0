Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB70EC7EE25
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 18:43:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.4639.1683830585834263785
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 11:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2A47240CA2;
	Thu, 11 May 2023 18:43:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5PF0I9xOzBY3; Thu, 11 May 2023 18:43:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1102940C98;
	Thu, 11 May 2023 18:43:04 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 124571638CA;
	Thu, 11 May 2023 14:42:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 2/2] trusted-firmware-a: only activate customizations for TI platforms
Date: Thu, 11 May 2023 18:43:01 +0000
Message-Id: <20230511184301.1075335-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230511184301.1075335-1-denis@denix.org>
References: <20230511184301.1075335-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 18:43:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16518

From: Denys Dmytriyenko <denys@konsulko.com>

Avoid inheriting ti-secdev class and adding unconditional dependency
on TI_SECURE_DEV_PKG and other variables, when meta-ti-bsp is in the
bblayers.conf stack, but not building for TI platforms. This solves
yocto-check-layer signature test for Yocto Project compliance.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...a_%.bbappend =3D> trusted-firmware-a-ti.inc} |  0
 .../trusted-firmware-a_%.bbappend             | 72 +------------------
 2 files changed, 3 insertions(+), 69 deletions(-)
 copy meta-ti-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_%.bb=
append =3D> trusted-firmware-a-ti.inc} (100%)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a-ti.inc
similarity index 100%
copy from meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%=
.bbappend
copy to meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.=
inc
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_%.bbappend
index 4ea63205..00d08a51 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
@@ -1,70 +1,4 @@
-PV:k3 =3D "2.8+git${SRCPV}"
-SRCREV_tfa:k3 =3D "2fcd408bb3a6756767a43c073c597cef06e7f2d5"
-SRC_URI:k3 =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.gi=
t;protocol=3Dhttps;name=3Dtfa;branch=3Dmaster"
-COMPATIBLE_MACHINE:k3 =3D "k3"
-TFA_BUILD_TARGET:k3 =3D "all"
-TFA_INSTALL_TARGET:k3 =3D "bl31"
-TFA_SPD:k3 =3D "opteed"
+TFA_TI =3D ""
+TFA_TI:k3 =3D "trusted-firmware-a-ti.inc"
=20
-SRC_URI:append:k3 =3D " file://rwx-segments-ti.patch"
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
-
-# Use TI SECDEV for signing
-inherit ti-secdev
-
-EXTRA_OEMAKE:append:k3 =3D "${@ ' K3_USART=3D' + d.getVar('TFA_K3_USART'=
) if d.getVar('TFA_K3_USART') else ''}"
-EXTRA_OEMAKE:append:k3 =3D "${@ ' K3_PM_SYSTEM_SUSPEND=3D' + d.getVar('T=
FA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
-
-# Signing procedure for K3 HS devices
-tfa_sign_k3hs() {
-	mv ${BUILD_DIR}/bl31.bin ${BUILD_DIR}/bl31.bin.unsigned
-	${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${BUILD_DIR}/bl31.b=
in.unsigned ${BUILD_DIR}/bl31.bin
-}
-
-do_compile:append:am65xx-hs-evm() {
-    tfa_sign_k3hs
-}
-
-do_compile:append:am64xx-evm() {
-    tfa_sign_k3hs
-}
-
-do_compile:append:am62xx-evm() {
-    tfa_sign_k3hs
-}
-
-do_compile:append:am62xx-lp-evm() {
-    tfa_sign_k3hs
-}
-
-do_compile:append:am62axx-evm() {
-    tfa_sign_k3hs
-}
-
-do_compile:append:j721e-hs-evm() {
-    tfa_sign_k3hs
-}
-
-do_compile:append:j7200-hs-evm() {
-    tfa_sign_k3hs
-}
-
-do_compile:append:j721s2-hs-evm() {
-    tfa_sign_k3hs
-}
-
-do_compile:append:j784s4-hs-evm() {
-    tfa_sign_k3hs
-}
-
-do_install:append:k3() {
-    if [ -f ${BUILD_DIR}/bl31.bin.unsigned ]; then
-        echo "Install bl31.bin.unsigned"
-        install -m 0644 ${BUILD_DIR}/bl31.bin.unsigned \
-        ${D}/firmware/bl31.bin.unsigned
-    else
-        echo "Install bl31.bin.unsigned"
-        install -m 0644 ${BUILD_DIR}/bl31.bin \
-        ${D}/firmware/bl31.bin.unsigned
-    fi
-}
+require ${TFA_TI}
--=20
2.25.1


