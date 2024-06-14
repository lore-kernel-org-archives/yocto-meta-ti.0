Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D24C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 19:36:42 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2680.1718393790982280263
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Jun 2024 12:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3881240CC7;
	Fri, 14 Jun 2024 19:36:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gTZkWNKG22cn; Fri, 14 Jun 2024 19:36:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 156FB40C8C;
	Fri, 14 Jun 2024 19:36:28 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 47590163FA0;
	Fri, 14 Jun 2024 15:36:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] meta-ti: remove MACHINE_KERNEL_PR globally
Date: Fri, 14 Jun 2024 15:36:27 -0400
Message-Id: <20240614193627.795075-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Jun 2024 19:36:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17743

From: Denys Dmytriyenko <denys@konsulko.com>

MACHINE_KERNEL_PR is a remnant of the early OE days and hasn't been
needed for quite some time. Let's finally remove it completely.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc                       | 3 ---
 meta-ti-bsp/conf/machine/include/omap-a15.inc                 | 3 ---
 meta-ti-bsp/conf/machine/include/ti33x.inc                    | 3 ---
 meta-ti-bsp/conf/machine/include/ti43x.inc                    | 3 ---
 .../recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb    | 3 ---
 .../powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb       | 3 ---
 .../powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb       | 3 ---
 .../recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb | 3 ---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb     | 4 ----
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb      | 4 ----
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb      | 4 ----
 meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb   | 3 ---
 .../recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb  | 3 ---
 13 files changed, 42 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index 2b82cb82..34991ec9 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -7,9 +7,6 @@ require conf/machine/include/arm/arch-arm64.inc
=20
 BBMULTICONFIG +=3D "k3r5"
=20
-# Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR =3D "r0"
-
 require conf/machine/include/ti-bsp.inc
=20
 KERNEL_IMAGETYPE =3D "Image"
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
index 3637ad0a..be086936 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -4,9 +4,6 @@ SOC_FAMILY:append =3D ":omap-a15"
 DEFAULTTUNE ?=3D "armv7athf-neon"
 require conf/machine/include/arm/armv7a/tune-cortexa15.inc
=20
-# Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR =3D "r7"
-
 require conf/machine/include/ti-bsp.inc
=20
 # Graphics providers and variables
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/con=
f/machine/include/ti33x.inc
index 45934aa0..a8dc2174 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -4,9 +4,6 @@ SOC_FAMILY:append =3D ":ti33x"
 DEFAULTTUNE ?=3D "armv7athf-neon"
 require conf/machine/include/arm/armv7a/tune-cortexa8.inc
=20
-# Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR =3D "r22"
-
 require conf/machine/include/ti-bsp.inc
=20
 # Graphics providers and variables
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/con=
f/machine/include/ti43x.inc
index c6a3c510..6fb87f16 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -4,9 +4,6 @@ SOC_FAMILY:append =3D ":ti43x"
 DEFAULTTUNE ?=3D "armv7athf-neon"
 require conf/machine/include/arm/armv7a/tune-cortexa9.inc
=20
-# Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR =3D "r3"
-
 require conf/machine/include/ti-bsp.inc
=20
 # Graphics providers and variables
diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11=
.p7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.=
bb
index a56810d4..818ed683 100644
--- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -7,9 +7,6 @@ inherit module features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "gc320"
=20
-MACHINE_KERNEL_PR:append =3D "i"
-PR =3D "${MACHINE_KERNEL_PR}"
-
 # Need to branch out with ${PV} var
 BRANCH =3D "ti-${PV}-k5.10"
=20
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_23.3.6512818.bb
index 02ec9fe9..34c22cb2 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.65=
12818.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.65=
12818.bb
@@ -7,9 +7,6 @@ inherit module
=20
 PROVIDES =3D "virtual/gpudriver"
=20
-MACHINE_KERNEL_PR:append =3D "b"
-PR =3D "${MACHINE_KERNEL_PR}"
-
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
24.1.6554834.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_24.1.6554834.bb
index fdb8b51d..6f374f69 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.65=
54834.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.65=
54834.bb
@@ -7,9 +7,6 @@ inherit module
=20
 PROVIDES =3D "virtual/gpudriver"
=20
-MACHINE_KERNEL_PR:append =3D "b"
-PR =3D "${MACHINE_KERNEL_PR}"
-
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 COMPATIBLE_MACHINE =3D "j721e|j721s2|j784s4|am62xx|am62pxx|j722s"
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4=
948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.49=
48957.bb
index ca28ae76..f112c662 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.=
bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.=
bb
@@ -9,9 +9,6 @@ PROVIDES =3D "virtual/gpudriver"
=20
 COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|am65xx"
=20
-MACHINE_KERNEL_PR:append =3D "x"
-PR =3D "${MACHINE_KERNEL_PR}"
-
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 DEPENDS =3D "virtual/kernel"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/=
meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 5c495d46..47b573e1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -18,10 +18,6 @@ S =3D "${WORKDIR}/git"
 SRCREV =3D "ffc253263a1375a65fa6c9f62a893e9767fbebfa"
 PV =3D "6.6+git"
=20
-# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
-MACHINE_KERNEL_PR:append =3D "b"
-PR =3D "${MACHINE_KERNEL_PR}"
-
 KERNEL_GIT_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git"
 KERNEL_GIT_PROTOCOL =3D "https"
 KERNEL_GIT_BRANCH =3D "master"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/m=
eta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 51d0a6a5..2cdfb1b9 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -26,10 +26,6 @@ BRANCH ?=3D "ti-linux-6.1.y"
 SRCREV ?=3D "c1c2f1971fbf6ddad93a8c94314fe8221e7aa6be"
 PV =3D "6.1.83+git"
=20
-# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
-MACHINE_KERNEL_PR:append =3D "b"
-PR =3D "${MACHINE_KERNEL_PR}"
-
 KERNEL_GIT_URI ?=3D "git://git.ti.com/git/ti-linux-kernel/ti-linux-kerne=
l.git"
 KERNEL_GIT_PROTOCOL =3D "https"
 SRC_URI +=3D "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=
=3D${BRANCH} \
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb b/m=
eta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
index cd26a9cd..ab7a497e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.6.bb
@@ -26,10 +26,6 @@ BRANCH ?=3D "ti-linux-6.6.y"
 SRCREV ?=3D "76313798e7121bf56820e7aa7aed82a0f3ffc566"
 PV =3D "6.6.25+git"
=20
-# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
-MACHINE_KERNEL_PR:append =3D "b"
-PR =3D "${MACHINE_KERNEL_PR}"
-
 KERNEL_GIT_URI ?=3D "git://git.ti.com/git/ti-linux-kernel/ti-linux-kerne=
l.git"
 KERNEL_GIT_PROTOCOL =3D "https"
 SRC_URI +=3D "${KERNEL_GIT_URI};protocol=3D${KERNEL_GIT_PROTOCOL};branch=
=3D${BRANCH} \
diff --git a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb =
b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
index 9d85829b..62b4645c 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -2,9 +2,6 @@ DESCRIPTION =3D "Debug Sub-System (DebugSS) driver for Ke=
ystone and DRA7xx devices
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D9d4316fe434ba450dca4da253=
48ca5a3"
=20
-# This package builds a kernel module, use kernel PR as base and append =
a local
-MACHINE_KERNEL_PR:append =3D "d"
-PR =3D "${MACHINE_KERNEL_PR}"
 PV:append =3D "+git"
=20
 S =3D "${WORKDIR}/git/debugss_module/debugss-mod"
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module=
-drv_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-modul=
e-drv_git.bb
index 8bea12f7..d2b5f004 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_gi=
t.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_gi=
t.bb
@@ -2,9 +2,6 @@ DESCRIPTION =3D "Interface for GDB to commincate witha TI=
 C66X DSP"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D75859989545e37968a99b631e=
f42722e"
=20
-# This package builds a kernel module, use kernel PR as base and append =
a local
-MACHINE_KERNEL_PR:append =3D "b"
-PR =3D "${MACHINE_KERNEL_PR}"
 PV:append =3D "+git"
=20
 SRC_URI:append =3D "\
--=20
2.25.1


