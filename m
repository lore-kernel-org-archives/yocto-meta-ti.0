Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B00C4707F
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:51:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.11528.1651503086753504843
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 07:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 204D540B86
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s7GFY45LXzoh for <meta-ti@lists.yoctoproject.org>;
	Mon,  2 May 2022 14:51:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 55D9740C8A
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:23 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 50051174921
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 10:51:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 12/26] ti-graphics: gpu enable and move all platforms
 to ddk 1.15
Date: Mon,  2 May 2022 14:51:06 +0000
Message-Id: <20220502145120.726632-13-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502145120.726632-1-denis@denix.org>
References: <20220502145120.726632-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 14:51:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14664

From: "Etheridge, Darren" <detheridge@ti.com>

Enable the GPU for am62xx and j721s2 and use IMG DDK 1.15

Migrate Imagination DDK 1.13 to DDK 1.15 for J721e

Signed-off-by: Darren Etheridge <detheridge@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am62xx-evm.conf      |  2 ++
 meta-ti-bsp/conf/machine/j721s2-evm.conf      |  2 ++
 ...bb =3D> ti-img-rogue-driver_1.15.6133109.bb} | 20 +++++++++++--------
 ...bb =3D> ti-img-rogue-umlibs_1.15.6133109.bb} | 13 ++++++------
 4 files changed, 23 insertions(+), 14 deletions(-)
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.13=
.5776728.bb =3D> ti-img-rogue-driver_1.15.6133109.bb} (49%)
 rename meta-ti-bsp/recipes-graphics/libgles/{ti-img-rogue-umlibs_1.13.57=
76728.bb =3D> ti-img-rogue-umlibs_1.15.6133109.bb} (84%)

diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/=
machine/am62xx-evm.conf
index 0588d34c..eb1563f8 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -4,6 +4,8 @@
=20
 require conf/machine/include/am62xx.inc
=20
+MACHINE_FEATURES +=3D "gpu"
+
 KERNEL_DEVICETREE =3D " \
     ti/k3-am625-sk.dtb \
 "
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/=
machine/j721s2-evm.conf
index a2c15f74..5d977776 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -4,6 +4,8 @@
=20
 require conf/machine/include/j721s2.inc
=20
+MACHINE_FEATURES +=3D "gpu"
+
 SERIAL_CONSOLES =3D "115200;ttyS10"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
 TFA_K3_USART =3D "0x8"
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_=
1.13.5776728.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-dr=
iver_1.15.6133109.bb
similarity index 49%
rename from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1=
.13.5776728.bb
rename to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.1=
5.6133109.bb
index 6ed3a40b..94b05436 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.13.57=
76728.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.61=
33109.bb
@@ -7,17 +7,17 @@ inherit module features_check
=20
 REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
-MACHINE_KERNEL_PR:append =3D "b"
+MACHINE_KERNEL_PR:append =3D "a"
 PR =3D "${MACHINE_KERNEL_PR}"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE =3D "j7"
+COMPATIBLE_MACHINE =3D "j721e|j721s2|am62xx"
=20
 DEPENDS =3D "virtual/kernel"
=20
 PROVIDES =3D "virtual/gpudriver"
=20
-BRANCH =3D "1.13-5776728/linux-k5.10"
+BRANCH =3D "linuxws/dunfell/k5.10/${PV}"
=20
 SRC_URI =3D " \
     git://git.ti.com/graphics/ti-img-rogue-driver.git;branch=3D${BRANCH}=
 \
@@ -26,15 +26,19 @@ SRC_URI =3D " \
=20
 S =3D "${WORKDIR}/git"
=20
-SRCREV =3D "35a25875ae8738f82c7cabc6b077ef992b0cca84"
+SRCREV =3D "ee0674adccac16f5b2f7cb8d5d05948706080cb5"
=20
-PVR_SOC =3D "j721e_linux"
-PVR_BVNC =3D "22.104.208.318"
+TARGET_PRODUCT:j721e =3D "j721e_linux"
+TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
+TARGET_PRODUCT:am62xx =3D "am62_linux"
+TARGET_BVNC:j721e =3D "22.104.208.318"
+TARGET_BVNC:j721s2 =3D "36.53.104.796"
+TARGET_BVNC:am62xx =3D "33.15.11.3"
 PVR_BUILD =3D "release"
 PVR_WS =3D "wayland"
=20
-EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" RGX_BVNC=3D${PVR_=
BVNC} BUILD=3D${PVR_BUILD} PVR_BUILD_DIR=3D${PVR_SOC} WINDOW_SYSTEM=3D${P=
VR_WS}'
+EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}" RGX_BVNC=3D${TARG=
ET_BVNC} BUILD=3D${PVR_BUILD} PVR_BUILD_DIR=3D${TARGET_PRODUCT} WINDOW_SY=
STEM=3D${PVR_WS}'
=20
 do_install() {
-    make -C ${STAGING_KERNEL_DIR} M=3D${B}/binary_${PVR_SOC}_${PVR_WS}_$=
{PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D}${root_prefix} P=
REFIX=3D${STAGING_DIR_HOST} modules_install
+    make -C ${STAGING_KERNEL_DIR} M=3D${B}/binary_${TARGET_PRODUCT}_${PV=
R_WS}_${PVR_BUILD}/target_aarch64/kbuild INSTALL_MOD_PATH=3D${D}${root_pr=
efix} PREFIX=3D${STAGING_DIR_HOST} modules_install
 }
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.1=
3.5776728.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1=
.15.6133109.bb
similarity index 84%
rename from meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13=
.5776728.bb
rename to meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6=
133109.bb
index 18b36fbb..115344b1 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.13.57767=
28.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.61331=
09.bb
@@ -8,17 +8,18 @@ inherit features_check
 REQUIRED_MACHINE_FEATURES =3D "gpu"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE =3D "j721e"
+COMPATIBLE_MACHINE =3D "j721e|j721s2|am62xx"
=20
-PR =3D "r3"
+PR =3D "r1"
=20
 BRANCH =3D "linuxws/dunfell/k5.10/${PV}"
=20
 SRC_URI =3D "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=3D=
${BRANCH}"
+SRCREV =3D "47c3ffc44f2881397d45c8a2b5dfa7d6c58b79fb"
=20
-SRCREV =3D "5ef38353c38d921a65ea6df75c7b6ce710b66034"
-
-PVR_SOC ?=3D "j721e_linux"
+TARGET_PRODUCT:j721e =3D "j721e_linux"
+TARGET_PRODUCT:j721s2 =3D "j721s2_linux"
+TARGET_PRODUCT:am62xx =3D "am62_linux"
 PVR_BUILD ?=3D "release"
 PVR_WS =3D "wayland"
=20
@@ -50,7 +51,7 @@ RRECOMMENDS:${PN} +=3D "ti-img-rogue-driver"
 S =3D "${WORKDIR}/git"
=20
 do_install () {
-    oe_runmake install DESTDIR=3D${D} TARGET_PRODUCT=3D${PVR_SOC} BUILD=3D=
${PVR_BUILD} WINDOW_SYSTEM=3D${PVR_WS}
+    oe_runmake install DESTDIR=3D${D} TARGET_PRODUCT=3D${TARGET_PRODUCT}=
 BUILD=3D${PVR_BUILD} WINDOW_SYSTEM=3D${PVR_WS}
     chown -R root:root ${D}
 }
=20
--=20
2.25.1


