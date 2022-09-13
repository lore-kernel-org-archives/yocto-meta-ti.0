Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B543C6FA91
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:55:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.840.1663041349510021850
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 80D3340DA8
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8f6mRK2OaSri for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 63AC940DA6
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:45 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 22356174A09
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 61/65] conf: machine: Make multi-certificate
 image the default
Date: Tue, 13 Sep 2022 03:55:37 +0000
Message-Id: <20220913035541.2364351-62-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15077

From: Andrew Davis <afd@ti.com>

Only the first two K3 devices do not support multi-cert boot so
lets make multi-cert the default and only add back sysfw.itb
for these two devices.

Signed-off-by: Andrew Davis <afd@ti.com>
Reviewed-by: lines be preserved?
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/am62xx.inc | 3 ---
 meta-ti-bsp/conf/machine/include/am64xx.inc | 3 ---
 meta-ti-bsp/conf/machine/include/am65xx.inc | 5 ++++-
 meta-ti-bsp/conf/machine/include/k3.inc     | 5 +----
 meta-ti-bsp/conf/machine/j7200-evm.conf     | 3 ---
 meta-ti-bsp/conf/machine/j721e-evm.conf     | 3 +++
 meta-ti-bsp/conf/machine/j721e-hs-evm.conf  | 1 -
 meta-ti-bsp/conf/machine/j721s2-evm.conf    | 3 ---
 8 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
index 80df1844..a5aad994 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -12,9 +12,6 @@ PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-=
umlibs"
 PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
-# AM62 supports multi-certificate images, use the same
-IMAGE_BOOT_FILES =3D "${IMAGE_BOOT_FILES_MULTI_CERT}"
-
 do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
=20
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/co=
nf/machine/include/am64xx.inc
index 87791ef7..297d6007 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -14,9 +14,6 @@ KERNEL_DEVICETREE =3D " \
     ti/k3-am642-evm-nand.dtbo \
 "
=20
-# AM64 supports multi-certificate images, use the same
-IMAGE_BOOT_FILES =3D "${IMAGE_BOOT_FILES_MULTI_CERT}"
-
 do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
=20
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/co=
nf/machine/include/am65xx.inc
index d6bd9810..80aa6d27 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -28,9 +28,12 @@ KERNEL_DEVICETREE =3D " \
=20
 BBMULTICONFIG +=3D "k3r5-sr2"
=20
-# Use default IMAGE_BOOT_FILES_LEGACY files
+# Since J721e does not support multi-cert tiboot3.bin add standalone sys=
fw.itb
+IMAGE_BOOT_FILES +=3D "sysfw.itb"
+
 # Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0
 IMAGE_BOOT_FILES +=3D "sysfw-am65x-evm.itb"
+
 do_image_wic[mcdepends] +=3D "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] +=3D "mc::k3r5-sr2:ti-sci-fw:do_deploy"
=20
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index 5b5fb1b6..8a32e0fe 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -39,10 +39,7 @@ MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost v=
fat ext2 alsa ethernet pci"
=20
 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
=20
-IMAGE_BOOT_FILES_LEGACY =3D "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} ti=
boot3.bin sysfw.itb"
-IMAGE_BOOT_FILES_MULTI_CERT =3D "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX=
} tiboot3.bin"
-
-IMAGE_BOOT_FILES ?=3D "${IMAGE_BOOT_FILES_LEGACY}"
+IMAGE_BOOT_FILES ?=3D "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.=
bin"
 IMAGE_EFI_BOOT_FILES ?=3D "${IMAGE_BOOT_FILES}"
=20
 EFI_PROVIDER ?=3D "grub-efi"
diff --git a/meta-ti-bsp/conf/machine/j7200-evm.conf b/meta-ti-bsp/conf/m=
achine/j7200-evm.conf
index 175d30f8..303ec182 100644
--- a/meta-ti-bsp/conf/machine/j7200-evm.conf
+++ b/meta-ti-bsp/conf/machine/j7200-evm.conf
@@ -13,8 +13,5 @@ KERNEL_DEVICETREE =3D " \
=20
 UBOOT_MACHINE =3D "j7200_evm_a72_config"
=20
-# J7200 supports multi-certificate images, use the same
-IMAGE_BOOT_FILES =3D "${IMAGE_BOOT_FILES_MULTI_CERT}"
-
 do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j721e-evm.conf b/meta-ti-bsp/conf/m=
achine/j721e-evm.conf
index fe28e6f5..d28d16d1 100644
--- a/meta-ti-bsp/conf/machine/j721e-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-evm.conf
@@ -7,6 +7,9 @@ require conf/machine/include/j721e.inc
 SERIAL_CONSOLES =3D "115200;ttyS2 115200;ttyS3"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
+# Since J721e does not support multi-cert tiboot3.bin add standalone sys=
fw.itb
+IMAGE_BOOT_FILES +=3D "sysfw.itb"
+
 KERNEL_DEVICETREE =3D " \
     ti/k3-j721e-common-proc-board.dtb \
     ti/k3-j721e-common-proc-board-infotainment.dtbo \
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/con=
f/machine/j721e-hs-evm.conf
index 56eaa64e..a24a986b 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
@@ -20,7 +20,6 @@ UBOOT_SYMLINK =3D "u-boot.img"
=20
 BBMULTICONFIG +=3D "k3r5-sr1-1"
=20
-# Use default IMAGE_BOOT_FILES_LEGACY files
 # Since default sysfw.itb on J721e is for SR1.1, add a version for SR1.0
 IMAGE_BOOT_FILES +=3D "sysfw-j721e-evm.itb"
 do_image_wic[mcdepends] +=3D "mc::k3r5-sr1-1:ti-sci-fw:do_deploy"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/=
machine/j721s2-evm.conf
index bbe011c0..77fc3e66 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -16,8 +16,5 @@ KERNEL_DEVICETREE =3D " \
=20
 UBOOT_MACHINE =3D "j721s2_evm_a72_defconfig"
=20
-# J721S2 supports multi-certificate images, use the same
-IMAGE_BOOT_FILES =3D "${IMAGE_BOOT_FILES_MULTI_CERT}"
-
 do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
--=20
2.25.1


