Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B56C6FA8A
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:55:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.845.1663041353652229191
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 205B240D6E
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m7r5uqrrK6BI for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1EA9140D80
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:44 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C72AB1749E6
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 26/65] conf: machine: wic: Fix HS image boot
 partition
Date: Tue, 13 Sep 2022 03:55:02 +0000
Message-Id: <20220913035541.2364351-27-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15087

From: Manorit Chawdhry <m-chawdhry@ti.com>

IMAGE_BOOT_FILES was being overwritten in the HS recipes leading to
incomplete binaries in /boot and the naming of the binaries were not
correct.

Fixes /boot partition for HS devices.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
[afd: Extended fix to all HS platforms]
Signed-off-by: Andrew Davis <afd@ti.com>
Acked-by: Manorit Chawdhry <m-chawdhry@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am64xx-hs-evm.conf | 3 +--
 meta-ti-bsp/conf/machine/am65xx-hs-evm.conf | 3 +--
 meta-ti-bsp/conf/machine/include/k3.inc     | 5 +++--
 meta-ti-bsp/conf/machine/j7200-hs-evm.conf  | 3 +--
 meta-ti-bsp/conf/machine/j721e-hs-evm.conf  | 3 +--
 5 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am64xx-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/am64xx-hs-evm.conf
index 44e81463..ebbe2e62 100644
--- a/meta-ti-bsp/conf/machine/am64xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am64xx-hs-evm.conf
@@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS =3D "0x83080000"
 UBOOT_DTBO_OFFSET =3D      "0x00010000"
=20
 SPL_BINARY =3D "tispl.bin_HS"
-SPL_BINARYNAME =3D "tispl.bin"
 UBOOT_BINARY =3D "u-boot.img_HS"
-IMAGE_BOOT_FILES =3D "${UBOOT_BINARY}"
+UBOOT_SYMLINK =3D "u-boot.img"
=20
 TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/am65xx-hs-evm.conf
index e4eebb6a..de92cacb 100644
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
@@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS =3D "0x83080000"
 UBOOT_DTBO_OFFSET =3D      "0x00010000"
=20
 SPL_BINARY =3D "tispl.bin_HS"
-SPL_BINARYNAME =3D "tispl.bin"
 UBOOT_BINARY =3D "u-boot.img_HS"
-IMAGE_BOOT_FILES =3D "${UBOOT_BINARY}"
+UBOOT_SYMLINK =3D "u-boot.img"
=20
 TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index 911b59bd..5b5fb1b6 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -22,6 +22,7 @@ UBOOT_ENTRYPOINT =3D "0x80008000"
 UBOOT_LOADADDRESS =3D "0x80008000"
=20
 SPL_BINARY =3D "tispl.bin"
+SPL_BINARYNAME =3D "tispl.bin"
 UBOOT_SUFFIX =3D "img"
=20
 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
@@ -38,8 +39,8 @@ MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vf=
at ext2 alsa ethernet pci"
=20
 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
=20
-IMAGE_BOOT_FILES_LEGACY =3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot=
3.bin sysfw.itb"
-IMAGE_BOOT_FILES_MULTI_CERT =3D "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} ti=
boot3.bin"
+IMAGE_BOOT_FILES_LEGACY =3D "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} ti=
boot3.bin sysfw.itb"
+IMAGE_BOOT_FILES_MULTI_CERT =3D "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX=
} tiboot3.bin"
=20
 IMAGE_BOOT_FILES ?=3D "${IMAGE_BOOT_FILES_LEGACY}"
 IMAGE_EFI_BOOT_FILES ?=3D "${IMAGE_BOOT_FILES}"
diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf b/meta-ti-bsp/con=
f/machine/j7200-hs-evm.conf
index a5bd637e..8821ffac 100644
--- a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
@@ -15,8 +15,7 @@ UBOOT_DTBO_LOADADDRESS =3D "0x83080000"
 UBOOT_DTBO_OFFSET =3D      "0x00010000"
=20
 SPL_BINARY =3D "tispl.bin_HS"
-SPL_BINARYNAME =3D "tispl.bin"
 UBOOT_BINARY =3D "u-boot.img_HS"
-IMAGE_BOOT_FILES =3D "${UBOOT_BINARY}"
+UBOOT_SYMLINK =3D "u-boot.img"
=20
 TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/con=
f/machine/j721e-hs-evm.conf
index 433863dd..56eaa64e 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
@@ -15,9 +15,8 @@ UBOOT_DTBO_LOADADDRESS =3D "0x83080000"
 UBOOT_DTBO_OFFSET =3D      "0x00010000"
=20
 SPL_BINARY =3D "tispl.bin_HS"
-SPL_BINARYNAME =3D "tispl.bin"
 UBOOT_BINARY =3D "u-boot.img_HS"
-IMAGE_BOOT_FILES =3D "${UBOOT_BINARY}"
+UBOOT_SYMLINK =3D "u-boot.img"
=20
 BBMULTICONFIG +=3D "k3r5-sr1-1"
=20
--=20
2.25.1


