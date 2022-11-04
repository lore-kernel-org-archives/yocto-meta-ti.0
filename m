Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0607FC63715
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.204.1667598059719894948
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D26FC40D87
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k9tRwtJR94Ji for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C83F440D81
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1667616367E
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 05/47] ti-sci-fw: Make combined R5 boot the default
Date: Fri,  4 Nov 2022 21:40:13 +0000
Message-Id: <20221104214055.1221197-6-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214055.1221197-1-denis@denix.org>
References: <20221104214055.1221197-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15232

From: Andrew Davis <afd@ti.com>

Going forward, the combined tiboot3.bin is going to be the standard. Only
AM65x and J721e will still use the split boot.

Set DEPENDS and EXTRA_OEMAKE for combined boot and override only for the
two split boot platforms. This makes it easier to add new platforms and
simplifies deployment logic.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/j721e-hs-evm.conf    |  1 +
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 30 +++++++++----------
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/con=
f/machine/j721e-hs-evm.conf
index a24a986b..0c493459 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
@@ -17,6 +17,7 @@ UBOOT_DTBO_OFFSET =3D      "0x00010000"
 SPL_BINARY =3D "tispl.bin_HS"
 UBOOT_BINARY =3D "u-boot.img_HS"
 UBOOT_SYMLINK =3D "u-boot.img"
+SYSFW_SYMLINK =3D ""
=20
 BBMULTICONFIG +=3D "k3r5-sr1-1"
=20
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index dc7cd588..3daf0c68 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,13 +1,12 @@
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
=20
-DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native"
-DEPENDS:append:j7200-evm-k3r5 =3D " virtual/bootloader"
-DEPENDS:append:j7200-hs-evm-k3r5 =3D " virtual/bootloader"
-DEPENDS:append:j721s2-evm-k3r5 =3D " virtual/bootloader"
-DEPENDS:append:j721s2-hs-evm-k3r5 =3D " virtual/bootloader"
-DEPENDS:append:am64xx-evm-k3r5 =3D " virtual/bootloader"
-DEPENDS:append:am64xx-hs-evm-k3r5 =3D " virtual/bootloader"
-DEPENDS:append:am62xx-evm-k3r5 =3D " virtual/bootloader"
+DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native virtual/boo=
tloader"
+DEPENDS:remove:am65xx-evm-k3r5 =3D "virtual/bootloader"
+DEPENDS:remove:am65xx-hs-evm-k3r5 =3D "virtual/bootloader"
+DEPENDS:remove:am65xx-hs-evm-k3r5-sr2 =3D "virtual/bootloader"
+DEPENDS:remove:j721e-evm-k3r5 =3D "virtual/bootloader"
+DEPENDS:remove:j721e-hs-evm-k3r5 =3D "virtual/bootloader"
+DEPENDS:remove:j721e-hs-evm-k3r5-sr1-1 =3D "virtual/bootloader"
=20
 CLEANBROKEN =3D "1"
 PR =3D "${INC_PR}.2"
@@ -54,15 +53,14 @@ do_configure[noexec] =3D "1"
 EXTRA_OEMAKE =3D "\
     CROSS_COMPILE=3D${TARGET_PREFIX} SOC=3D${SYSFW_SOC} SOC_TYPE=3D${SYS=
FW_SUFFIX} \
     CONFIG=3D${SYSFW_CONFIG} SYSFW_DIR=3D"${S}/ti-sysfw" \
+    SBL=3D"${STAGING_DIR_HOST}/boot/u-boot-spl.bin" \
 "
-
-EXTRA_OEMAKE:append:j7200-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boot=
/u-boot-spl.bin""
-EXTRA_OEMAKE:append:j7200-hs-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/b=
oot/u-boot-spl.bin""
-EXTRA_OEMAKE:append:j721s2-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boo=
t/u-boot-spl.bin""
-EXTRA_OEMAKE:append:j721s2-hs-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/=
boot/u-boot-spl.bin""
-EXTRA_OEMAKE:append:am64xx-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boo=
t/u-boot-spl.bin""
-EXTRA_OEMAKE:append:am64xx-hs-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/=
boot/u-boot-spl.bin""
-EXTRA_OEMAKE:append:am62xx-evm-k3r5 =3D " SBL=3D"${STAGING_DIR_HOST}/boo=
t/u-boot-spl.bin""
+EXTRA_OEMAKE:remove:am65xx-evm-k3r5 =3D "SBL=3D"${STAGING_DIR_HOST}/boot=
/u-boot-spl.bin""
+EXTRA_OEMAKE:remove:am65xx-hs-evm-k3r5 =3D "SBL=3D"${STAGING_DIR_HOST}/b=
oot/u-boot-spl.bin""
+EXTRA_OEMAKE:remove:am65xx-hs-evm-k3r5-sr2 =3D "SBL=3D"${STAGING_DIR_HOS=
T}/boot/u-boot-spl.bin""
+EXTRA_OEMAKE:remove:j721e-evm-k3r5 =3D "SBL=3D"${STAGING_DIR_HOST}/boot/=
u-boot-spl.bin""
+EXTRA_OEMAKE:remove:j721e-hs-evm-k3r5 =3D "SBL=3D"${STAGING_DIR_HOST}/bo=
ot/u-boot-spl.bin""
+EXTRA_OEMAKE:remove:j721e-hs-evm-k3r5-sr1-1 =3D "SBL=3D"${STAGING_DIR_HO=
ST}/boot/u-boot-spl.bin""
=20
 do_compile() {
 	cd ${WORKDIR}/imggen/
--=20
2.25.1


