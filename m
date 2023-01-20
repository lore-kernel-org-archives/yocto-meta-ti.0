Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC155C678D6
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 01:41:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.64438.1674178855682742049
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 17:40:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F13A240CA5
	for <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PTW4r5zSYIHm for <meta-ti@lists.yoctoproject.org>;
	Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E724B40C98
	for <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:40:53 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id D5D7A163707
	for <meta-ti@lists.yoctoproject.org>; Thu, 19 Jan 2023 20:40:32 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH v2 6/7] conf: machine: Move TFA_BOARD and OPTEEMACHINE to the SoC level
Date: Fri, 20 Jan 2023 01:40:49 +0000
Message-Id: <20230120014050.1988728-6-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120014050.1988728-1-denis@denix.org>
References: <20230120014050.1988728-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Jan 2023 01:41:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15607

From: Andrew Davis <afd@ti.com>

These defines are specific to a SoC, not a SoC family (K3) nor
any specific board. Move these to the SoC level for all boards
to be consistent with boards already doing this correctly.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2 - no changes

 meta-ti-bsp/conf/machine/include/am64xx.inc | 1 +
 meta-ti-bsp/conf/machine/include/am65xx.inc | 2 ++
 meta-ti-bsp/conf/machine/include/j7200.inc  | 2 ++
 meta-ti-bsp/conf/machine/include/j721e.inc  | 6 ++++--
 meta-ti-bsp/conf/machine/include/j721s2.inc | 6 ++++--
 meta-ti-bsp/conf/machine/include/j784s4.inc | 6 ++++--
 meta-ti-bsp/conf/machine/include/k3.inc     | 1 -
 meta-ti-bsp/conf/machine/j721s2-evm.conf    | 1 -
 meta-ti-bsp/conf/machine/j784s4-evm.conf    | 4 ----
 9 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/co=
nf/machine/include/am64xx.inc
index 7c46b630..f1a91991 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -32,4 +32,5 @@ do_image_wic[mcdepends] +=3D "mc::k3r5-sr2-hs-se:ti-sci=
-fw:do_deploy"
 do_image_tar[mcdepends] +=3D "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
=20
 TFA_BOARD =3D "lite"
+
 OPTEEMACHINE =3D "k3-am64x"
diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/co=
nf/machine/include/am65xx.inc
index 14e0d07f..88259717 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -37,4 +37,6 @@ IMAGE_BOOT_FILES +=3D "sysfw-am65x-evm.itb"
 do_image_wic[mcdepends] +=3D "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] +=3D "mc::k3r5-sr2:ti-sci-fw:do_deploy"
=20
+TFA_BOARD =3D "generic"
+
 OPTEEMACHINE =3D "k3-am65x"
diff --git a/meta-ti-bsp/conf/machine/include/j7200.inc b/meta-ti-bsp/con=
f/machine/include/j7200.inc
index 1eaf7806..d21e26cc 100644
--- a/meta-ti-bsp/conf/machine/include/j7200.inc
+++ b/meta-ti-bsp/conf/machine/include/j7200.inc
@@ -1,4 +1,6 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j7200"
=20
+TFA_BOARD =3D "generic"
+
 OPTEEMACHINE =3D "k3-j721e"
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/con=
f/machine/include/j721e.inc
index 34569a01..12ee0c90 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -1,8 +1,6 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j721e"
=20
-OPTEEMACHINE =3D "k3-j721e"
-
 MACHINE_FEATURES +=3D "gpu"
=20
 PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
@@ -10,3 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-u=
mlibs"
 PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
+
+TFA_BOARD =3D "generic"
+
+OPTEEMACHINE =3D "k3-j721e"
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/co=
nf/machine/include/j721s2.inc
index 2a60458e..fc6493b8 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -1,8 +1,6 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j721s2"
=20
-OPTEEMACHINE =3D "k3-j721e"
-
 MACHINE_FEATURES +=3D "gpu"
=20
 PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
@@ -10,3 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-u=
mlibs"
 PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
+
+TFA_BOARD =3D "generic"
+
+OPTEEMACHINE =3D "k3-j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/co=
nf/machine/include/j784s4.inc
index e2f053ac..d268b810 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -1,8 +1,6 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j784s4"
=20
-OPTEEMACHINE =3D "k3-j721e"
-
 MACHINE_FEATURES +=3D "gpu"
=20
 PREFERRED_PROVIDER_virtual/egl ?=3D "ti-img-rogue-umlibs"
@@ -10,3 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?=3D "ti-img-rogue-u=
mlibs"
 PREFERRED_PROVIDER_virtual/libgles2 ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/libgbm ?=3D "ti-img-rogue-umlibs"
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
+
+TFA_BOARD =3D "j784s4"
+
+OPTEEMACHINE =3D "k3-j784s4"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index 84afd2e2..bd71becf 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -29,7 +29,6 @@ UBOOT_SUFFIX =3D "img"
 EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
=20
 TFA_PLATFORM =3D "k3"
-TFA_BOARD =3D "generic"
=20
 # Use the expected value of the ubifs filesystem's volume name in the ke=
rnel
 # and u-boot.
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/=
machine/j721s2-evm.conf
index 37353df4..46d5dbf6 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -7,7 +7,6 @@ require conf/machine/include/j721s2.inc
 SERIAL_CONSOLES =3D "115200;ttyS2"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
 TFA_K3_USART =3D "0x8"
-OPTEEMACHINE =3D "k3-j784s4"
 OPTEE_K3_USART =3D "0x8"
=20
 KERNEL_DEVICETREE =3D " \
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/=
machine/j784s4-evm.conf
index 10d8aad0..f8be7d18 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -7,7 +7,6 @@ require conf/machine/include/j784s4.inc
 SERIAL_CONSOLES =3D "115200;ttyS2"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
 TFA_K3_USART =3D "0x8"
-OPTEEMACHINE =3D "k3-j784s4"
 OPTEE_K3_USART =3D "0x8"
=20
 KERNEL_DEVICETREE =3D " \
@@ -18,6 +17,3 @@ UBOOT_MACHINE =3D "j784s4_evm_a72_defconfig"
=20
 do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
-
-TFA_BOARD =3D "j784s4"
-
--=20
2.25.1


