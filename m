Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D4E1C63719
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.191.1667598058708175101
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AB0B640D85
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-92YU-wzR4i for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 89CE040D80
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id E50B3163677
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 01/47] machine: k3r5: Make combined R5 boot the default
Date: Fri,  4 Nov 2022 21:40:09 +0000
Message-Id: <20221104214055.1221197-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214055.1221197-1-denis@denix.org>
References: <20221104214055.1221197-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15226

From: Andrew Davis <afd@ti.com>

Going forward, the combined tiboot3.bin is going to be the standard. Only
AM65x and J721e will still use the split boot. Set the output of U-Boot
to be u-boot-spl.bin by default and override only for the two split boot
platforms. This makes it easier to add new platforms and simplifies
deployment logic.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf |  6 +++
 .../conf/machine/am65xx-hs-evm-k3r5.conf      |  6 +++
 meta-ti-bsp/conf/machine/include/k3r5.inc     |  6 +--
 meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf  |  6 +++
 .../conf/machine/j721e-hs-evm-k3r5.conf       |  6 +++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  | 51 +++----------------
 6 files changed, 33 insertions(+), 48 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf b/meta-ti-bsp/=
conf/machine/am65xx-evm-k3r5.conf
index bd17474e..a484e444 100644
--- a/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-evm-k3r5.conf
@@ -9,4 +9,10 @@ SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "gp"
 SYSFW_SYMLINK =3D ""
=20
+SPL_BINARY =3D "spl/u-boot-spl.${UBOOT_SUFFIX}"
+SPL_SYMLINK =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
+UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
+
 UBOOT_MACHINE =3D "am65x_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf b/meta-ti-b=
sp/conf/machine/am65xx-hs-evm-k3r5.conf
index d6d4b1e3..81b8c75f 100644
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
@@ -9,6 +9,12 @@ SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "hs"
 SYSFW_SYMLINK =3D ""
=20
+SPL_BINARY =3D "spl/u-boot-spl.${UBOOT_SUFFIX}"
+SPL_SYMLINK =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
+UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
+
 UBOOT_MACHINE =3D "am65x_hs_evm_r5_defconfig"
=20
 TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf=
/machine/include/k3r5.inc
index 3cc79061..d000404e 100644
--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
+++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
@@ -16,9 +16,9 @@ PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
=20
 SPL_BINARY =3D ""
 UBOOT_SUFFIX =3D "bin"
-UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
-UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
+UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "u-boot-r5spl-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}=
"
+UBOOT_SYMLINK =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
=20
 PACKAGECONFIG:pn-u-boot-ti-staging =3D ""
 PACKAGECONFIG:pn-u-boot-ti-mainline =3D ""
diff --git a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf b/meta-ti-bsp/c=
onf/machine/j721e-evm-k3r5.conf
index 070bf7aa..9544cdb6 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm-k3r5.conf
@@ -8,4 +8,10 @@ SYSFW_SOC =3D "j721e"
 SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "gp"
=20
+SPL_BINARY =3D "spl/u-boot-spl.${UBOOT_SUFFIX}"
+SPL_SYMLINK =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
+UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
+
 UBOOT_MACHINE =3D "j721e_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf b/meta-ti-bs=
p/conf/machine/j721e-hs-evm-k3r5.conf
index 9c285bae..8e53a5cb 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
@@ -9,6 +9,12 @@ SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "hs"
 SYSFW_SYMLINK =3D ""
=20
+SPL_BINARY =3D "spl/u-boot-spl.${UBOOT_SUFFIX}"
+SPL_SYMLINK =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
+UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
+
 UBOOT_MACHINE =3D "j721e_hs_evm_r5_defconfig"
=20
 TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti.inc
index a82981cc..3696a483 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -56,13 +56,6 @@ SYSROOT_DIRS +=3D "/boot"
 SPL_UART_BINARY =3D "u-boot-spl.bin"
 SPL_UART_BINARY:k3r5 =3D ""
 SPL_UART_BINARY:lego-ev3 =3D ""
-SPL_UART_BINARY:j7200-evm-k3r5 =3D "u-boot-spl.bin"
-SPL_UART_BINARY:j7200-hs-evm-k3r5 =3D "u-boot-spl.bin"
-SPL_UART_BINARY:j721s2-evm-k3r5 =3D "u-boot-spl.bin"
-SPL_UART_BINARY:j721s2-hs-evm-k3r5 =3D "u-boot-spl.bin"
-SPL_UART_BINARY:am64xx-evm-k3r5 =3D "u-boot-spl.bin"
-SPL_UART_BINARY:am64xx-hs-evm-k3r5 =3D "u-boot-spl.bin"
-SPL_UART_BINARY:am62xx-evm-k3r5 =3D "u-boot-spl.bin"
=20
 SPL_UART_IMAGE ?=3D "${SPL_UART_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_UART_SYMLINK ?=3D "${SPL_UART_BINARY}-${MACHINE}"
@@ -100,6 +93,12 @@ UBOOT_HS_2ND_BINARY =3D "u-boot-spl_HS_2ND"
 UBOOT_HS_2ND_IMAGE =3D "u-boot-spl_HS_2ND-${MACHINE}-${PV}-${PR}"
 UBOOT_HS_2ND_SYMLINK =3D "u-boot-spl_HS_2ND-${MACHINE}"
=20
+do_compile:append:k3r5 () {
+	if ! [ -f ${B}/${UBOOT_BINARY} ]; then
+		ln -s spl/${UBOOT_BINARY} ${B}/${UBOOT_BINARY}
+	fi
+}
+
 do_install:append () {
 	if [ -n "${UBOOT_CONFIG}" ]
 	then
@@ -260,42 +259,4 @@ do_deploy:append () {
 	rm ${DEPLOYDIR}/${PN}-initial-env-${MACHINE}-${PV}-${PR} || true
 }
=20
-# j7200 uses combined image for tiboot3.bin that includes u-boot-spl.bin=
 and sysfw
-# along with board PM/RM configs generated by k3-image-gen and comes fro=
m ti-sci-fw
-# hence move the legacy u-boot's tiboot3.bin and u-boot-spl.bin out of t=
he way
-do_deploy:append:j7200-evm-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
-}
-
-do_deploy:append:j7200-hs-evm-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
-}
-
-do_deploy:append:j721s2-evm-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
-}
-
-do_deploy:append:j721s2-hs-evm-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
-}
-
-do_deploy:append:am64xx-evm-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
-}
-
-do_deploy:append:am64xx-hs-evm-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
-}
-
-do_deploy:append:am62xx-evm-k3r5 () {
-	mv ${DEPLOYDIR}/tiboot3.bin ${DEPLOYDIR}/tiboot3-r5spl.bin || true
-	mv ${DEPLOYDIR}/u-boot-spl.bin ${DEPLOYDIR}/u-boot-spl-r5spl.bin || tru=
e
-}
-
 TOOLCHAIN =3D "gcc"
--=20
2.25.1


