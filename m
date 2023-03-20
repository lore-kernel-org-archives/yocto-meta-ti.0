Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B768C77B79
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:38:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6393.1679283525892598036
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:38:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AE87B40CC1
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VtSyhev3qmi7 for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:38:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9196F40CC0
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 187101637D8
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:09 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 20/54] conf: machine: k3: Define RD, DTB and DTBO load address for FIT image
Date: Mon, 20 Mar 2023 03:38:06 +0000
Message-Id: <20230320033840.1193963-21-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033840.1193963-1-denis@denix.org>
References: <20230320033840.1193963-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16034

From: Sinthu Raja <sinthu.raja@ti.com>

K3 platforms include the FIT image-based kernel by default. The bootloade=
r
loads the kernel and DTB from the FIT image. The DTB/DTBOs are added to t=
he
FIT image but the load address is not included in the image section of
each DTB/DTBO. This load address is determined by the LOADADDRESS macros
in the kernel-fitmage class.

Hence, define the RD/DTB/DTBOs LOADADDRESS and OFFSET macros in the K3 co=
mmon
include, and remove those macros defined in the K3 board specific config =
files.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
Reviewed-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am65xx-hs-evm.conf | 8 --------
 meta-ti-bsp/conf/machine/include/k3.inc     | 5 +++++
 meta-ti-bsp/conf/machine/j7200-hs-evm.conf  | 8 --------
 meta-ti-bsp/conf/machine/j721e-hs-evm.conf  | 8 --------
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf | 8 --------
 5 files changed, 5 insertions(+), 32 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/am65xx-hs-evm.conf
index ea1f8ff1..2c1256d0 100644
--- a/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/am65xx-hs-evm.conf
@@ -6,14 +6,6 @@ require conf/machine/include/am65xx.inc
=20
 UBOOT_MACHINE =3D "am65x_hs_evm_a53_defconfig"
=20
-UBOOT_ENTRYPOINT =3D       "0x80080000"
-UBOOT_LOADADDRESS =3D      "0x80080000"
-UBOOT_RD_LOADADDRESS =3D   "0x84000000"
-UBOOT_RD_ENTRYPOINT =3D    "0x84000000"
-UBOOT_DTB_LOADADDRESS =3D  "0x83000000"
-UBOOT_DTBO_LOADADDRESS =3D "0x83080000"
-UBOOT_DTBO_OFFSET =3D      "0x00010000"
-
 SPL_BINARY =3D "tispl.bin_HS"
 UBOOT_BINARY =3D "u-boot.img_HS"
 UBOOT_SYMLINK =3D "u-boot.img"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index e4ef2f94..93bcea76 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -21,6 +21,11 @@ KERNEL_CLASSES +=3D "kernel-fitimage"
 UBOOT_ARCH =3D "arm"
 UBOOT_ENTRYPOINT =3D "0x80008000"
 UBOOT_LOADADDRESS =3D "0x80008000"
+UBOOT_RD_LOADADDRESS =3D "0x84000000"
+UBOOT_RD_ENTRYPOINT =3D "0x84000000"
+UBOOT_DTB_LOADADDRESS =3D "0x83000000"
+UBOOT_DTBO_LOADADDRESS =3D "0x83080000"
+UBOOT_DTBO_OFFSET =3D "0x00010000"
=20
 SPL_BINARY =3D "tispl.bin"
 SPL_BINARYNAME =3D "tispl.bin"
diff --git a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf b/meta-ti-bsp/con=
f/machine/j7200-hs-evm.conf
index ef7268b1..dc928974 100644
--- a/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-hs-evm.conf
@@ -6,14 +6,6 @@ require conf/machine/j7200-evm.conf
=20
 UBOOT_MACHINE =3D "j7200_hs_evm_a72_defconfig"
=20
-UBOOT_ENTRYPOINT =3D       "0x80080000"
-UBOOT_LOADADDRESS =3D      "0x80080000"
-UBOOT_RD_LOADADDRESS =3D   "0x84000000"
-UBOOT_RD_ENTRYPOINT =3D    "0x84000000"
-UBOOT_DTB_LOADADDRESS =3D  "0x83000000"
-UBOOT_DTBO_LOADADDRESS =3D "0x83080000"
-UBOOT_DTBO_OFFSET =3D      "0x00010000"
-
 SPL_BINARY =3D "tispl.bin_HS"
 UBOOT_BINARY =3D "u-boot.img_HS"
 UBOOT_SYMLINK =3D "u-boot.img"
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/con=
f/machine/j721e-hs-evm.conf
index acd5ca18..00ec1998 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
@@ -6,14 +6,6 @@ require conf/machine/j721e-evm.conf
=20
 UBOOT_MACHINE =3D "j721e_hs_evm_a72_defconfig"
=20
-UBOOT_ENTRYPOINT =3D       "0x80080000"
-UBOOT_LOADADDRESS =3D      "0x80080000"
-UBOOT_RD_LOADADDRESS =3D   "0x84000000"
-UBOOT_RD_ENTRYPOINT =3D    "0x84000000"
-UBOOT_DTB_LOADADDRESS =3D  "0x83000000"
-UBOOT_DTBO_LOADADDRESS =3D "0x83080000"
-UBOOT_DTBO_OFFSET =3D      "0x00010000"
-
 SPL_BINARY =3D "tispl.bin_HS"
 UBOOT_BINARY =3D "u-boot.img_HS"
 UBOOT_SYMLINK =3D "u-boot.img"
diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/j721s2-hs-evm.conf
index 84db90bb..3d737f44 100644
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
@@ -6,14 +6,6 @@ require conf/machine/j721s2-evm.conf
=20
 UBOOT_MACHINE =3D "j721s2_hs_evm_a72_defconfig"
=20
-UBOOT_ENTRYPOINT =3D       "0x80080000"
-UBOOT_LOADADDRESS =3D      "0x80080000"
-UBOOT_RD_LOADADDRESS =3D   "0x84000000"
-UBOOT_RD_ENTRYPOINT =3D    "0x84000000"
-UBOOT_DTB_LOADADDRESS =3D  "0x83000000"
-UBOOT_DTBO_LOADADDRESS =3D "0x83080000"
-UBOOT_DTBO_OFFSET =3D      "0x00010000"
-
 SPL_BINARY =3D "tispl.bin_HS"
 UBOOT_BINARY =3D "u-boot.img_HS"
 UBOOT_SYMLINK =3D "u-boot.img"
--=20
2.25.1


