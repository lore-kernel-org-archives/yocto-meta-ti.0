Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813A5C44537
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 17:43:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29046.1784655801423679390
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 10:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 564C540CC0;
	Tue, 21 Jul 2026 17:43:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4Mc8twry-6M; Tue, 21 Jul 2026 17:43:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2C91E40CB1;
	Tue, 21 Jul 2026 17:43:19 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id D51911769F1;
	Tue, 21 Jul 2026 13:43:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH 2/3] ti-cgt6x-7: remove
Date: Tue, 21 Jul 2026 13:43:10 -0400
Message-Id: <20260721174311.7581-2-denis@denix.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20260721174311.7581-1-denis@denix.org>
References: <20260721174311.7581-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Jul 2026 17:43:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20173

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

Remove TI Code Generation Tools for C6x DSPs version 7.x. The installer
for version 7.x is not downloadable directly, unlike version 8.x and
later, which still remains.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 .../recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb  | 46 -------------------
 .../recipes-ti/includes/ti-paths.inc          |  2 -
 2 files changed, 48 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.=
bb

diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb b/me=
ta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
deleted file mode 100644
index adf21563..00000000
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt6x-7_7.4.16.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-SUMMARY =3D "TI DSP Code Generation Tools"
-DESCRIPTION =3D "Texas Instrument (TI) Code Generation Tools are custom =
\
-utilities targeted for TI embedded processors. This Digital Signal \
-Processor (DSP) suite contains tools needed to create and debug \
-applications for the C6000 DSP family. This includes tools such as: \
-compiler, linker, assembler, etc. This also includes C runtime \
-libraries and standard header files needed to produce a working DSP appl=
ication."
-
-HOMEPAGE =3D "https://www-a.ti.com/downloads/sds_support/TICodegeneratio=
nTools/download.htm"
-LICENSE =3D "TI-TSPA"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Db6311962635a4f15630e36ec2=
d875eca"
-
-S =3D "${UNPACKDIR}/c6000_7.4.16"
-
-require recipes-ti/includes/ti-paths.inc
-require recipes-ti/includes/ti-unpack.inc
-
-BINFILE =3D "ti_cgt_c6000_7.4.16_linux_installer_x86.bin"
-BINFILE_NAME =3D "cgt6x_7.4.16_x86_installer"
-TI_BIN_UNPK_ARGS =3D "--prefix ${UNPACKDIR} --mode unattended"
-TI_BIN_UNPK_CMDS =3D ""
-
-SRC_URI =3D "http://install.source.dir.local/${BINFILE};name=3D${BINFILE=
_NAME}"
-
-SRC_URI[cgt6x_7.4.16_x86_installer.md5sum] =3D "21ca55c5b1f6b2d8d4fb7570=
d5eb5513"
-SRC_URI[cgt6x_7.4.16_x86_installer.sha256sum] =3D "baa0d1ef20397383f99f4=
5068a6d160963a01419d42fbbb851263b54c91df82f"
-
-# only x86_64 is supported
-COMPATIBLE_HOST =3D "x86_64.*-linux"
-COMPATIBLE_HOST:class-target =3D "null"
-
-do_install() {
-    install -d ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
-    cp -rP --preserve=3Dmode,links,timestamps --no-preserve=3Downership =
${UNPACKDIR}/c6000_7.4.16/. ${D}/${TI_CGT6X_7_INSTALL_DIR_RECIPE}
-}
-
-FILES:${PN} +=3D "${TI_CGT6X_7_INSTALL_DIR_RECIPE}"
-
-INSANE_SKIP:${PN} +=3D "arch staticdev textrel"
-
-INHIBIT_PACKAGE_STRIP =3D "1"
-INHIBIT_SYSROOT_STRIP =3D "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-ti-extras/recipes-ti/includes/ti-paths.inc b/meta-ti-ex=
tras/recipes-ti/includes/ti-paths.inc
index 90bf082a..6600ed05 100644
--- a/meta-ti-extras/recipes-ti/includes/ti-paths.inc
+++ b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
@@ -22,7 +22,6 @@ export PDK_INSTALL_DIR_RECIPE          =3D "${installdi=
r}/ti-pdk-tree"
 export SYSBIOS_INSTALL_DIR_RECIPE      =3D "${installdir}/ti-sysbios-tre=
e"
 export SWTOOLS_INSTALL_DIR_RECIPE      =3D "${installdir}/ti-swtools-tre=
e"
 export TI_CGT_PRU_INSTALL_DIR_RECIPE   =3D "${installdir}/cgt-pru"
-export TI_CGT6X_7_INSTALL_DIR_RECIPE   =3D "${installdir}/cgt6x-7"
 export TI_CGT7X_INSTALL_DIR_RECIPE     =3D "${installdir}/cgt-c7x"
 export VLIB_C66_INSTALL_DIR_RECIPE     =3D "${installdir}/ti-vlib-c66x-t=
ree"
 export XDAIS_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-xdais-tree"
@@ -47,7 +46,6 @@ export PDK_INSTALL_DIR          =3D "${STAGING_DIR_TARG=
ET}${PDK_INSTALL_DIR_RECIPE
 export SWTOOLS_INSTALL_DIR      =3D "${STAGING_DIR_TARGET}${SWTOOLS_INST=
ALL_DIR_RECIPE}"
 export SYSBIOS_INSTALL_DIR      =3D "${STAGING_DIR_TARGET}${SYSBIOS_INST=
ALL_DIR_RECIPE}"
 export TI_CGT_PRU_INSTALL_DIR   =3D "${STAGING_DIR_NATIVE}${TI_CGT_PRU_I=
NSTALL_DIR_RECIPE}"
-export TI_CGT6X_7_INSTALL_DIR   =3D "${STAGING_DIR_NATIVE}${TI_CGT6X_7_I=
NSTALL_DIR_RECIPE}"
 export TI_CGT7X_INSTALL_DIR     =3D "${STAGING_DIR_NATIVE}${TI_CGT7X_INS=
TALL_DIR_RECIPE}"
 export VLIB_C66_INSTALL_DIR     =3D "${STAGING_DIR_TARGET}${VLIB_C66_INS=
TALL_DIR_RECIPE}"
 export XDAIS_INSTALL_DIR        =3D "${STAGING_DIR_TARGET}${XDAIS_INSTAL=
L_DIR_RECIPE}"
--=20
2.35.3


