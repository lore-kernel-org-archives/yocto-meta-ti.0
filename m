Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0135DC61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:12:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14467.1677233542515629372
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 02:12:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AC61A40C8E
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wS82j7d6ZfHs for <meta-ti@lists.yoctoproject.org>;
	Fri, 24 Feb 2023 10:12:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 966DB40C06
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:21 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6AA53163766
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 05:11:54 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH v8 3/6] meta-ti-bsp: machine: remove default preferences for egl,gles,gbm
Date: Fri, 24 Feb 2023 10:12:16 +0000
Message-Id: <20230224101219.4130589-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230224101219.4130589-1-denis@denix.org>
References: <20230224101219.4130589-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15946

From: Randolph Sapp <rs@ti.com>

Remove default preferences for virtual/egl, virtual/libgles and virtual/l=
ibgbm
from machine configs to follow the new dependency chains via mesa in oder=
 to
support accelerated and software-rendered graphics, which is selected by
virtual/gpudriver preference.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v8 - leave gpu machine feature intact, update changelog accordingly

 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   | 2 --
 meta-ti-bsp/conf/machine/include/am62xx.inc   | 4 ----
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 4 ----
 meta-ti-bsp/conf/machine/include/j721e.inc    | 4 ----
 meta-ti-bsp/conf/machine/include/j721s2.inc   | 4 ----
 meta-ti-bsp/conf/machine/include/j784s4.inc   | 4 ----
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 4 ----
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 4 ----
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 4 ----
 9 files changed, 34 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/co=
nf/machine/am62xx-lp-evm.conf
index ef8e8692..ec9ce596 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -4,8 +4,6 @@
=20
 require conf/machine/include/am62xx.inc
=20
-MACHINE_FEATURES +=3D "gpu"
-
 KERNEL_DEVICETREE =3D " \
     ti/k3-am62x-lp-sk.dtb \
     ti/k3-am625-skeleton.dtb \
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
index 411e5265..2a06fc0f 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -6,10 +6,6 @@ MACHINE_FEATURES +=3D "screen touchscreen gpu"
 SERIAL_CONSOLES =3D "115200;ttyS2"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
-PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
 TFA_BOARD =3D "lite"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/co=
nf/machine/include/am65xx.inc
index 424864d3..33e6f1ad 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -6,10 +6,6 @@ MACHINE_FEATURES +=3D "screen touchscreen gpu"
 SERIAL_CONSOLES =3D "115200;ttyS2 115200;ttyS1"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
-PREFERRED_PROVIDER_virtual/egl ?=3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
=20
 KERNEL_DEVICETREE =3D " \
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/con=
f/machine/include/j721e.inc
index eba10d8d..74cdc0e7 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -3,10 +3,6 @@ SOC_FAMILY:append =3D ":j721e"
=20
 MACHINE_FEATURES +=3D "gpu"
=20
-PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
 # On J721e the file tiboot3.bin comes from the bootloader not ti-sci-fw
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/co=
nf/machine/include/j721s2.inc
index fc6493b8..b0953c1a 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -3,10 +3,6 @@ SOC_FAMILY:append =3D ":j721s2"
=20
 MACHINE_FEATURES +=3D "gpu"
=20
-PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
 TFA_BOARD =3D "generic"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/co=
nf/machine/include/j784s4.inc
index d268b810..48d20a21 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -3,10 +3,6 @@ SOC_FAMILY:append =3D ":j784s4"
=20
 MACHINE_FEATURES +=3D "gpu"
=20
-PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
-PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
 TFA_BOARD =3D "j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
index 0843fb28..01769bb3 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -10,10 +10,6 @@ MACHINE_KERNEL_PR =3D "r7"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_virtual/egl ?=3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
=20
 KERNEL_IMAGETYPE =3D "zImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/con=
f/machine/include/ti33x.inc
index cfacc30d..24154d06 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -11,10 +11,6 @@ MACHINE_KERNEL_PR =3D "r22"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_virtual/egl ?=3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
=20
 KERNEL_IMAGETYPE =3D "zImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/con=
f/machine/include/ti43x.inc
index 74a964db..96a599ed 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -11,10 +11,6 @@ MACHINE_KERNEL_PR =3D "r3"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
-PREFERRED_PROVIDER_virtual/egl ?=3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-sgx-ddk-um"
-PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-sgx-ddk-um"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
=20
 KERNEL_IMAGETYPE =3D "zImage"
--=20
2.25.1


