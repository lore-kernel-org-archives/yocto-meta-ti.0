Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C293C433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 17:44:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.236.1651772675529359136
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 May 2022 10:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A38B340C30;
	Thu,  5 May 2022 17:44:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9LyZCNBk3ISD; Thu,  5 May 2022 17:44:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8514D40C16;
	Thu,  5 May 2022 17:44:33 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9668217491F;
	Thu,  5 May 2022 13:44:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 3/5] conf/machine: make default PREFERRED_PROVIDERs
 easy to override
Date: Thu,  5 May 2022 17:44:20 +0000
Message-Id: <20220505174422.334666-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505174422.334666-1-denis@denix.org>
References: <20220505174422.334666-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 May 2022 17:44:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14707

From: Denys Dmytriyenko <denys@konsulko.com>

Use weak assignment for default PREFERRED_PROVIDER values to allow user t=
o
easily overwrite them from local.conf.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/am62xx.inc   | 10 +++++-----
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 10 +++++-----
 meta-ti-bsp/conf/machine/include/j721e.inc    | 10 +++++-----
 meta-ti-bsp/conf/machine/include/j721s2.inc   | 10 +++++-----
 meta-ti-bsp/conf/machine/include/k3.inc       |  4 ++--
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 14 +++++++-------
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 14 +++++++-------
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 14 +++++++-------
 8 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
index ce768895..bcf435f5 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -6,11 +6,11 @@ MACHINE_FEATURES +=3D "screen touchscreen gpu"
 SERIAL_CONSOLES =3D "115200;ttyS2"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
-PREFERRED_PROVIDER_virtual/egl =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/gpudriver =3D "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
 # AM62 supports multi-certificate images, use the same
 IMAGE_BOOT_FILES =3D "${IMAGE_BOOT_FILES_MULTI_CERT}"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/co=
nf/machine/include/am65xx.inc
index b71b4686..d6bd9810 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -6,11 +6,11 @@ MACHINE_FEATURES +=3D "screen touchscreen gpu"
 SERIAL_CONSOLES =3D "115200;ttyS2 115200;ttyS1"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
-PREFERRED_PROVIDER_virtual/egl =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgbm =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/gpudriver =3D "ti-sgx-ddk-km"
+PREFERRED_PROVIDER_virtual/egl ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
=20
 KERNEL_DEVICETREE =3D " \
     ti/k3-am654-base-board.dtb \
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/con=
f/machine/include/j721e.inc
index 85952d32..fe260178 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -3,8 +3,8 @@ SOC_FAMILY:append =3D ":j721e"
=20
 MACHINE_FEATURES +=3D "gpu"
=20
-PREFERRED_PROVIDER_virtual/egl =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/gpudriver =3D "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/co=
nf/machine/include/j721s2.inc
index 65b39118..5cd74683 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -3,8 +3,8 @@ SOC_FAMILY:append =3D ":j721s2"
=20
 MACHINE_FEATURES +=3D "gpu"
=20
-PREFERRED_PROVIDER_virtual/egl =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm =3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/gpudriver =3D "ti-img-rogue-driver"
+PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index a39ddd2a..7b353129 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -11,8 +11,8 @@ BBMULTICONFIG +=3D "k3r5"
 MACHINE_KERNEL_PR =3D "r0"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
+PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
=20
 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_IMAGETYPES =3D "Image vmlinux.gz"
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
index 7cff38dc..8ab614f0 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -8,13 +8,13 @@ require conf/machine/include/arm/armv7a/tune-cortexa15.=
inc
 MACHINE_KERNEL_PR =3D "r7"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_virtual/egl =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgbm =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/gpudriver =3D "ti-sgx-ddk-km"
+PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
+PREFERRED_PROVIDER_virtual/egl ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
=20
 KERNEL_IMAGETYPE =3D "zImage"
 KERNEL_IMAGETYPES =3D "zImage uImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/con=
f/machine/include/ti33x.inc
index 2f493404..06d35f09 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -18,13 +18,13 @@ MACHINE_KERNEL_PR =3D "r22"
=20
 # Default providers, may need to override for specific machines
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_virtual/egl =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgbm =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/gpudriver =3D "ti-sgx-ddk-km"
+PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
+PREFERRED_PROVIDER_virtual/egl ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
=20
 KERNEL_IMAGETYPE =3D "zImage"
=20
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/con=
f/machine/include/ti43x.inc
index 3d69e453..98b374a1 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -21,13 +21,13 @@ MACHINE_KERNEL_PR =3D "r3"
=20
 # Default providers, may need to override for specific machines
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_virtual/egl =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgbm =3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/gpudriver =3D "ti-sgx-ddk-km"
+PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
+PREFERRED_PROVIDER_virtual/egl ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-sgx-ddk-um"
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
=20
 KERNEL_IMAGETYPE =3D "zImage"
=20
--=20
2.25.1


