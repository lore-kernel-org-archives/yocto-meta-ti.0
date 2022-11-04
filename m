Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06957C63713
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.216.1667598059752806934
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E70D240D8C
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SPuERdcRXi-L for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C6B5F40D80
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1A162163680
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 07/47] conf: machine: Move K3 TI_SECURE_DEV_PKG definition to common include
Date: Fri,  4 Nov 2022 21:40:15 +0000
Message-Id: <20221104214055.1221197-8-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214055.1221197-1-denis@denix.org>
References: <20221104214055.1221197-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15234

From: Andrew Davis <afd@ti.com>

The K3 TI_SECURE_DEV_PKG is the same for all devices, move this out
of each machine file and into the common K3 includes. This doesn't
have any effect on the GP machines as they make no use of it.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5.conf | 2 --
 meta-ti-bsp/conf/machine/am64xx-hs-evm.conf      | 2 --
 meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf | 2 --
 meta-ti-bsp/conf/machine/am65xx-hs-evm.conf      | 2 --
 meta-ti-bsp/conf/machine/include/k3.inc          | 2 ++
 meta-ti-bsp/conf/machine/include/k3r5.inc        | 2 ++
 meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf  | 2 --
 meta-ti-bsp/conf/machine/j7200-hs-evm.conf       | 2 --
 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf  | 2 --
 meta-ti-bsp/conf/machine/j721e-hs-evm.conf       | 2 --
 meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf | 2 --
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf      | 2 --
 12 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5.conf b/meta-ti-b=
sp/conf/machine/am64xx-hs-evm-k3r5.conf
index d12c030f..647c8beb 100644
--- a/meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-hs-evm-k3r5.conf
@@ -10,5 +10,3 @@ SYSFW_SUFFIX =3D "hs"
 SYSFW_SYMLINK =3D ""
=20
 UBOOT_MACHINE =3D "am64x_hs_evm_r5_defconfig"
-
-TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/am64xx-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/am64xx-hs-evm.conf
index ebbe2e62..3ab9a49e 100644
--- a/meta-ti-bsp/conf/machine/am64xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-hs-evm.conf
@@ -17,5 +17,3 @@ UBOOT_DTBO_OFFSET =3D      "0x00010000"
 SPL_BINARY =3D "tispl.bin_HS"
 UBOOT_BINARY =3D "u-boot.img_HS"
 UBOOT_SYMLINK =3D "u-boot.img"
-
-TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf b/meta-ti-b=
sp/conf/machine/am65xx-hs-evm-k3r5.conf
index 81b8c75f..d9041c9d 100644
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm-k3r5.conf
@@ -16,5 +16,3 @@ UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${U=
BOOT_SUFFIX}"
 UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
=20
 UBOOT_MACHINE =3D "am65x_hs_evm_r5_defconfig"
-
-TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/am65xx-hs-evm.conf
index de92cacb..ea1f8ff1 100644
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
@@ -17,5 +17,3 @@ UBOOT_DTBO_OFFSET =3D      "0x00010000"
 SPL_BINARY =3D "tispl.bin_HS"
 UBOOT_BINARY =3D "u-boot.img_HS"
 UBOOT_SYMLINK =3D "u-boot.img"
-
-TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index 8a32e0fe..7cefd6c3 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -49,3 +49,5 @@ WKS_FILE ?=3D "sdimage-2part-efi.wks"
 do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
 do_image_wic[mcdepends] +=3D "mc::k3r5:virtual/bootloader:do_deploy mc::=
k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] +=3D "mc::k3r5:virtual/bootloader:do_deploy mc::=
k3r5:ti-sci-fw:do_deploy"
+
+TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/include/k3r5.inc b/meta-ti-bsp/conf=
/machine/include/k3r5.inc
index d000404e..31646f5a 100644
--- a/meta-ti-bsp/conf/machine/include/k3r5.inc
+++ b/meta-ti-bsp/conf/machine/include/k3r5.inc
@@ -22,3 +22,5 @@ UBOOT_SYMLINK =3D "u-boot-r5spl.${UBOOT_SUFFIX}"
=20
 PACKAGECONFIG:pn-u-boot-ti-staging =3D ""
 PACKAGECONFIG:pn-u-boot-ti-mainline =3D ""
+
+TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf b/meta-ti-bs=
p/conf/machine/j7200-hs-evm-k3r5.conf
index 3f134877..3fe06e74 100644
--- a/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j7200-hs-evm-k3r5.conf
@@ -9,5 +9,3 @@ SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "hs"
=20
 UBOOT_MACHINE =3D "j7200_hs_evm_r5_defconfig"
-
-TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf b/meta-ti-bsp/con=
f/machine/j7200-hs-evm.conf
index 8821ffac..ef7268b1 100644
--- a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
@@ -17,5 +17,3 @@ UBOOT_DTBO_OFFSET =3D      "0x00010000"
 SPL_BINARY =3D "tispl.bin_HS"
 UBOOT_BINARY =3D "u-boot.img_HS"
 UBOOT_SYMLINK =3D "u-boot.img"
-
-TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf b/meta-ti-bs=
p/conf/machine/j721e-hs-evm-k3r5.conf
index 8e53a5cb..a0d000b2 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
@@ -16,5 +16,3 @@ UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${U=
BOOT_SUFFIX}"
 UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
=20
 UBOOT_MACHINE =3D "j721e_hs_evm_r5_defconfig"
-
-TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/con=
f/machine/j721e-hs-evm.conf
index 0c493459..9ef7b86a 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
@@ -25,5 +25,3 @@ BBMULTICONFIG +=3D "k3r5-sr1-1"
 IMAGE_BOOT_FILES +=3D "sysfw-j721e-evm.itb"
 do_image_wic[mcdepends] +=3D "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] +=3D "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
-
-TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf b/meta-ti-b=
sp/conf/machine/j721s2-hs-evm-k3r5.conf
index ac4df86e..a4d51904 100644
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
@@ -9,5 +9,3 @@ SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "hs"
=20
 UBOOT_MACHINE =3D "j721s2_hs_evm_r5_defconfig"
-
-TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/j721s2-hs-evm.conf
index 7ffad45a..84db90bb 100644
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
@@ -17,5 +17,3 @@ UBOOT_DTBO_OFFSET =3D      "0x00010000"
 SPL_BINARY =3D "tispl.bin_HS"
 UBOOT_BINARY =3D "u-boot.img_HS"
 UBOOT_SYMLINK =3D "u-boot.img"
-
-TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
--=20
2.25.1


