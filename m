Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8789.1645503196331547168
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:13:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6348C40A28
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zQy_69gXivCP for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 580F740C52
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:13:15 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1A2F017476E
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:13:15 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 03/19] hdvpss: remove DaVinci High-Definition Video Processing Subsystem (HDVPSS)
Date: Tue, 22 Feb 2022 04:12:58 +0000
Message-Id: <20220222041314.2840028-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041314.2840028-1-denis@denix.org>
References: <20220222041314.2840028-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Due to DaVinci family of platforms being deprecated.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-ti/hdvpss/ti-hdvpss.inc            | 20 --------------------
 recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb |  7 -------
 recipes-ti/includes/ti-paths.inc           |  2 --
 3 files changed, 29 deletions(-)
 delete mode 100644 recipes-ti/hdvpss/ti-hdvpss.inc
 delete mode 100644 recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb

diff --git a/recipes-ti/hdvpss/ti-hdvpss.inc b/recipes-ti/hdvpss/ti-hdvps=
s.inc
deleted file mode 100644
index 3c99b792..00000000
--- a/recipes-ti/hdvpss/ti-hdvpss.inc
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION =3D "TI HDVPSS"
-SECTION =3D "devel"
-LICENSE =3D "TI"
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-
-S =3D "${WORKDIR}/REL.HDVPSS_${PV}"
-
-SRC_URI =3D "http://install.source.dir.local/REL.HDVPSS.${PV}.zip"
-
-do_compile() {
-    :
-}
-
-do_install() {
-    install -d ${D}${HDVPSS_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${HDVPSS_INSTALL_DIR_RECIPE}
-}
-
diff --git a/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb b/recipes-ti/hdvp=
ss/ti-hdvpss_01.00.01.27.bb
deleted file mode 100644
index 0428b149..00000000
--- a/recipes-ti/hdvpss/ti-hdvpss_01.00.01.27.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require ti-hdvpss.inc
-
-SRC_URI[md5sum] =3D "6db908bef3b933dc8cea666564d5d4d8"
-SRC_URI[sha256sum] =3D "2caa9c859cfe348197e860f07d174a8ab7048d38d6d3a12e=
c576802122c9e91e"
-
-COMPATIBLE_HOST ?=3D "null"
-COMPATIBLE_HOST:ti-soc =3D "(.*)"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-pa=
ths.inc
index 71180353..a2d6b26e 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -27,7 +27,6 @@ export FC3_INSTALL_DIR_RECIPE        =3D "${installdir}=
/ti-framework-components3-t
 export FC_INSTALL_DIR_RECIPE         =3D "${installdir}/ti-framework-com=
ponents-tree"
 export GFX_SDK_INSTALL_DIR_RECIPE    =3D "${installdir}/ti-gfx-sdk-tree"
 export HDVICP20_INSTALL_DIR_RECIPE   =3D "${installdir}/ti-hdvicp20-tree=
"
-export HDVPSS_INSTALL_DIR_RECIPE     =3D "${installdir}/ti-hdvpss-tree"
 export IMGLIB_C64P_INSTALL_DIR_RECIPE=3D "${installdir}/ti-imglib-tree"
 export IPC_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-ipc-tree"
 export LINK_INSTALL_DIR_RECIPE       =3D "${installdir}/ti-dsplink-tree"
@@ -82,7 +81,6 @@ export FASTMATHLIB_C674P_INSTALL_DIR =3D "${STAGING_DIR=
_TARGET}${FASTMATHLIB_C674P
 export FC3_INSTALL_DIR        =3D "${STAGING_DIR_TARGET}${FC3_INSTALL_DI=
R_RECIPE}"
 export FC_INSTALL_DIR         =3D "${STAGING_DIR_TARGET}${FC_INSTALL_DIR=
_RECIPE}"
 export HDVICP20_INSTALL_DIR   =3D "${STAGING_DIR_TARGET}${HDVICP20_INSTA=
LL_DIR_RECIPE}"
-export HDVPSS_INSTALL_DIR     =3D "${STAGING_DIR_TARGET}${HDVPSS_INSTALL=
_DIR_RECIPE}"
 export IMGLIB_C64P_INSTALL_DIR=3D "${STAGING_DIR_TARGET}${IMGLIB_C64P_IN=
STALL_DIR_RECIPE}"
 export IPC_INSTALL_DIR        =3D "${STAGING_DIR_TARGET}${IPC_INSTALL_DI=
R_RECIPE}"
 export LINK_INSTALL_DIR       =3D "${STAGING_DIR_TARGET}${LINK_INSTALL_D=
IR_RECIPE}"
--=20
2.25.1

