Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0A9C6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 01:03:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.31803.1676941379394118140
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Feb 2023 17:03:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C321D40C30;
	Tue, 21 Feb 2023 01:02:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xSeD5jp5aWGo; Tue, 21 Feb 2023 01:02:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 99DD740C53;
	Tue, 21 Feb 2023 01:02:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2AAC6163763;
	Mon, 20 Feb 2023 20:02:33 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 3/4] Revert "meta-ti-bsp: machine: Remove all gpu features"
Date: Tue, 21 Feb 2023 01:02:41 +0000
Message-Id: <20230221010242.3690-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221010242.3690-1-denis@denix.org>
References: <20230221010242.3690-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Feb 2023 01:03:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15892

From: Denys Dmytriyenko <denys@konsulko.com>

Merged by accident.

This reverts commit 51bb56b74cd2e7f7e922cce84a023f669291ef00.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   | 2 ++
 meta-ti-bsp/conf/machine/include/am62xx.inc   | 6 +++++-
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 6 +++++-
 meta-ti-bsp/conf/machine/include/j721e.inc    | 6 ++++++
 meta-ti-bsp/conf/machine/include/j721s2.inc   | 6 ++++++
 meta-ti-bsp/conf/machine/include/j784s4.inc   | 6 ++++++
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 6 +++++-
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 6 +++++-
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 6 +++++-
 9 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/co=
nf/machine/am62xx-lp-evm.conf
index ec9ce596..ef8e8692 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -4,6 +4,8 @@
=20
 require conf/machine/include/am62xx.inc
=20
+MACHINE_FEATURES +=3D "gpu"
+
 KERNEL_DEVICETREE =3D " \
     ti/k3-am62x-lp-sk.dtb \
     ti/k3-am625-skeleton.dtb \
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
index 35f3f071..411e5265 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -1,11 +1,15 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":am62xx"
=20
-MACHINE_FEATURES +=3D "screen touchscreen"
+MACHINE_FEATURES +=3D "screen touchscreen gpu"
=20
 SERIAL_CONSOLES =3D "115200;ttyS2"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
+PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
 TFA_BOARD =3D "lite"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/co=
nf/machine/include/am65xx.inc
index 385bb164..424864d3 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -1,11 +1,15 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":am65xx"
=20
-MACHINE_FEATURES +=3D "screen touchscreen"
+MACHINE_FEATURES +=3D "screen touchscreen gpu"
=20
 SERIAL_CONSOLES =3D "115200;ttyS2 115200;ttyS1"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
+PREFERRED_PROVIDER_virtual/egl ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
=20
 KERNEL_DEVICETREE =3D " \
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/con=
f/machine/include/j721e.inc
index 67f5fe0f..eba10d8d 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -1,6 +1,12 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j721e"
=20
+MACHINE_FEATURES +=3D "gpu"
+
+PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
 # On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/co=
nf/machine/include/j721s2.inc
index f33a3aba..fc6493b8 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -1,6 +1,12 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j721s2"
=20
+MACHINE_FEATURES +=3D "gpu"
+
+PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
 TFA_BOARD =3D "generic"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/co=
nf/machine/include/j784s4.inc
index df0faede..d268b810 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -1,6 +1,12 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j784s4"
=20
+MACHINE_FEATURES +=3D "gpu"
+
+PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
 TFA_BOARD =3D "j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
index efa33a10..0843fb28 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -10,6 +10,10 @@ MACHINE_KERNEL_PR =3D "r7"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
+PREFERRED_PROVIDER_virtual/egl ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
=20
 KERNEL_IMAGETYPE =3D "zImage"
@@ -41,7 +45,7 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
 UBI_VOLNAME =3D "rootfs"
=20
 # List common SoC features, may need to add touchscreen for specific mac=
hines
-MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen al=
sa ethernet mmip dsp gc320"
+MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen al=
sa ethernet gpu mmip dsp gc320"
=20
 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
 WKS_FILE ?=3D "sdimage-2part.wks"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/con=
f/machine/include/ti33x.inc
index e2f75359..cfacc30d 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -11,6 +11,10 @@ MACHINE_KERNEL_PR =3D "r22"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
+PREFERRED_PROVIDER_virtual/egl ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
=20
 KERNEL_IMAGETYPE =3D "zImage"
@@ -51,7 +55,7 @@ UBI_VOLNAME =3D "rootfs"
 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
=20
 # List common SoC features, may need to add touchscreen for specific mac=
hines
-MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 alsa ethe=
rnet"
+MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 alsa ethe=
rnet gpu"
=20
 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
 WKS_FILE ?=3D "sdimage-2part.wks"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/con=
f/machine/include/ti43x.inc
index e9999910..74a964db 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -11,6 +11,10 @@ MACHINE_KERNEL_PR =3D "r3"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
+PREFERRED_PROVIDER_virtual/egl ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
=20
 KERNEL_IMAGETYPE =3D "zImage"
@@ -50,7 +54,7 @@ UBI_VOLNAME =3D "rootfs"
 EXTRA_IMAGEDEPENDS +=3D "u-boot"
=20
 # List common SoC features, may need to add touchscreen for specific mac=
hines
-MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen al=
sa ethernet"
+MACHINE_FEATURES =3D "kernel26 apm usbgadget usbhost vfat ext2 screen al=
sa ethernet gpu"
=20
 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
 WKS_FILE ?=3D "sdimage-2part.wks"
--=20
2.25.1


