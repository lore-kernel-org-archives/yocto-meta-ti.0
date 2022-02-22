Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.8969.1645503206489394310
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C395140C52
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P-_w6kwcGyhl for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:13:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C05F640C98
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A98C117476C
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:13:15 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 17/19] dspbios,biosutils: remove remnants of DSP/BIOS, predecessor to SYS/BIOS
Date: Tue, 22 Feb 2022 04:13:12 +0000
Message-Id: <20220222041314.2840028-18-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041314.2840028-1-denis@denix.org>
References: <20220222041314.2840028-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

DSP/BIOS was the name for older versions of TI-RTOS, prior to SYS/BIOS an=
d
used on older deprecated platforms. Remove any remnants.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-ti/bios/ti-biosutils.inc        | 18 ------------------
 recipes-ti/bios/ti-biosutils_1.02.02.bb | 12 ------------
 recipes-ti/bios/ti-dspbios.inc          | 25 -------------------------
 recipes-ti/includes/ti-paths.inc        |  3 ---
 4 files changed, 58 deletions(-)
 delete mode 100644 recipes-ti/bios/ti-biosutils.inc
 delete mode 100644 recipes-ti/bios/ti-biosutils_1.02.02.bb
 delete mode 100644 recipes-ti/bios/ti-dspbios.inc

diff --git a/recipes-ti/bios/ti-biosutils.inc b/recipes-ti/bios/ti-biosut=
ils.inc
deleted file mode 100644
index d562c2dd..00000000
--- a/recipes-ti/bios/ti-biosutils.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION =3D "TI DSP/BIOS Utilities"
-HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targe=
tcontent/Bios_Utils"
-SECTION =3D "devel"
-LICENSE =3D "TI"
-LIC_FILES_CHKSUM =3D "file://packages/ti/bios/utils/Load.c;md5=3De666d58=
5907c3456e82b7e10f7a09a73"
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-
-S =3D "${WORKDIR}/biosutils_${PV}"
-
-SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/Bios_Utils/${PV}${PVsuffix}/exports/biosutils_${PV}.tar.gz;name=3D=
biosutilstarball"
-
-do_install() {
-    install -d ${D}${BIOSUTILS_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${BIOSUTILS_INSTALL_DIR_RECIPE}
-}
-
diff --git a/recipes-ti/bios/ti-biosutils_1.02.02.bb b/recipes-ti/bios/ti=
-biosutils_1.02.02.bb
deleted file mode 100644
index f62b9c2a..00000000
--- a/recipes-ti/bios/ti-biosutils_1.02.02.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ti-biosutils.inc
-
-PV =3D "1_02_02"
-PVsuffix =3D "_02"
-
-SRC_URI[biosutilstarball.md5sum] =3D "0654e9e72b0a6fc7a6575829c0cd90c9"
-SRC_URI[biosutilstarball.sha256sum] =3D "df486500bdc8dbe3800fc7efe4241e6=
fa5b1827ba7c0dc17a71b41d42ef921e1"
-
-INSANE_SKIP:${PN} =3D "installed-vs-shipped"
-
-COMPATIBLE_HOST ?=3D "null"
-COMPATIBLE_HOST:ti-soc =3D "(.*)"
diff --git a/recipes-ti/bios/ti-dspbios.inc b/recipes-ti/bios/ti-dspbios.=
inc
deleted file mode 100644
index 0e3fa62d..00000000
--- a/recipes-ti/bios/ti-dspbios.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION =3D "TI DSP/BIOS v5 Kernel"
-HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targe=
tcontent/bios/dspbios"
-SECTION =3D "devel"
-LICENSE =3D "TI"
-
-# We can't depend on license files to be present, so just use the TI log=
o
-LIC_FILES_CHKSUM =3D "file://docs/tilogo.gif;md5=3Df049a774c576a5cef3fca=
4932d707b39"
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-require ../includes/ti-eula-unpack.inc
-
-TI_BIN_UNPK_WDEXT=3D"/bios_${PV}"
-S =3D "${WORKDIR}${TI_BIN_UNPK_WDEXT}"
-
-SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/bios/dspbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=3Dbiosb=
in"
-
-BINFILE=3D"bios_setuplinux_${PV}.bin"
-TI_BIN_UNPK_CMDS=3D"Y: qY:workdir:Y"
-
-do_install() {
-    install -d ${D}${BIOS_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${BIOS_INSTALL_DIR_RECIPE}
-}
-
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-pa=
ths.inc
index 86689d3c..ea985be7 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -3,9 +3,7 @@ installdir =3D "${datadir}/ti"
 export TOOLCHAIN_PATH ?=3D "${STAGING_DIR_NATIVE}${prefix_native}/bin/${=
TARGET_SYS}"
 # This is where do_install will put it
 export AUDIO_SOC_INSTALL_DIR_RECIPE  =3D "${installdir}/ti-audio-soc-exa=
mple-tree"
-export BIOS_INSTALL_DIR_RECIPE       =3D "${installdir}/ti-dspbios-tree"
 export BIOSPSP_INSTALL_DIR_RECIPE    =3D "${installdir}/ti-biospsp-tree"
-export BIOSUTILS_INSTALL_DIR_RECIPE  =3D "${installdir}/ti-biosutils-tre=
e"
 export C6ACCEL_INSTALL_DIR_RECIPE    =3D "${installdir}/ti-c6accel-tree"
 export C6RUN_INSTALL_DIR_RECIPE      =3D "${installdir}/ti-c6run-tree"
 export CE_INSTALL_DIR_RECIPE         =3D "${installdir}/ti-codec-engine-=
tree"
@@ -60,7 +58,6 @@ export TI_CGT7X_INSTALL_DIR_RECIPE        =3D "${instal=
ldir}/cgt-c7x"
 # This is where the tools will end up in sysroot
 export BIOS_INSTALL_DIR       =3D "${STAGING_DIR_TARGET}${BIOS_INSTALL_D=
IR_RECIPE}"
 export BIOSPSP_INSTALL_DIR    =3D "${STAGING_DIR_TARGET}${BIOSPSP_INSTAL=
L_DIR_RECIPE}"
-export BIOSUTILS_INSTALL_DIR  =3D "${STAGING_DIR_TARGET}${BIOSUTILS_INST=
ALL_DIR_RECIPE}"
 export C6ACCEL_INSTALL_DIR    =3D "${STAGING_DIR_TARGET}${C6ACCEL_INSTAL=
L_DIR_RECIPE}"
 export C6RUN_INSTALL_DIR      =3D "${STAGING_DIR_TARGET}${C6RUN_INSTALL_=
DIR_RECIPE}"
 export CE_INSTALL_DIR         =3D "${STAGING_DIR_TARGET}${CE_INSTALL_DIR=
_RECIPE}"
--=20
2.25.1

