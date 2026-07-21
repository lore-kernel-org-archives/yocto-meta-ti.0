Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73746C4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 17:43:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29047.1784655801423992155
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 10:43:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5382340CB6;
	Tue, 21 Jul 2026 17:43:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TThizNyu77w6; Tue, 21 Jul 2026 17:43:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2473C40B88;
	Tue, 21 Jul 2026 17:43:19 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id B6D7E17416B;
	Tue, 21 Jul 2026 13:43:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH 1/3] ti-cgt470: remove
Date: Tue, 21 Jul 2026 13:43:09 -0400
Message-Id: <20260721174311.7581-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Jul 2026 17:43:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20174

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

Remove TI Code Generation Tools for TMS470 MCUs. The recipe hasn't
been updated in 15 years and the installer is not downloadable
directly.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 .../recipes-ti/devtools/ti-cgt470.inc         | 24 -------------------
 .../recipes-ti/devtools/ti-cgt470_4.6.6.bb    |  8 -------
 .../recipes-ti/includes/ti-paths.inc          |  2 --
 3 files changed, 34 deletions(-)
 delete mode 100644 meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
 delete mode 100644 meta-ti-extras/recipes-ti/devtools/ti-cgt470_4.6.6.bb

diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc b/meta-ti-e=
xtras/recipes-ti/devtools/ti-cgt470.inc
deleted file mode 100644
index f32bc0d3..00000000
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt470.inc
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY =3D "TI ARM Code Generation Tools"
-HOMEPAGE =3D "https://www-a.ti.com/downloads/sds_support/CodeGenerationT=
ools.htm"
-SECTION =3D "devel"
-LICENSE =3D "TI"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D62f46f1125a152a2e213b414d=
b7ac600"
-
-require ../includes/ti-paths.inc
-require ../includes/ti-staging.inc
-require ../includes/ti-eula-unpack.inc
-
-S =3D "${UNPACKDIR}/cgt470_${PV}"
-
-SRC_URI =3D "http://install.source.dir.local/ti_cgt_tms470_${PVwithdots}=
_setup_linux_x86.bin;name=3Dcgt470bin"
-
-BINFILE =3D "ti_cgt_tms470_${PVwithdots}_setup_linux_x86.bin"
-TI_BIN_UNPK_CMDS =3D "Y:qY:workdir: : "
-TI_BIN_UNPK_WDEXT =3D "/cgt470_${PV}"
-
-do_install() {
-    install -d ${D}${CODEGEN_ARM_INSTALL_DIR_RECIPE}
-    cp -pPrf ${S}/* ${D}${CODEGEN_ARM_INSTALL_DIR_RECIPE}
-}
-
diff --git a/meta-ti-extras/recipes-ti/devtools/ti-cgt470_4.6.6.bb b/meta=
-ti-extras/recipes-ti/devtools/ti-cgt470_4.6.6.bb
deleted file mode 100644
index 6ff2cc48..00000000
--- a/meta-ti-extras/recipes-ti/devtools/ti-cgt470_4.6.6.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ti-cgt470.inc
-
-PV =3D "4_6_6"
-PVwithdots =3D "4.6.6"
-
-SRC_URI[cgt470bin.md5sum] =3D "29a316dc6b8c8c3a53e0d6c956acb62b"
-SRC_URI[cgt470bin.sha256sum] =3D "a17bc7139f450672503c932ef53b00c4255228=
90e031b4a7c9135fdf90815740"
-
diff --git a/meta-ti-extras/recipes-ti/includes/ti-paths.inc b/meta-ti-ex=
tras/recipes-ti/includes/ti-paths.inc
index ed199dec..90bf082a 100644
--- a/meta-ti-extras/recipes-ti/includes/ti-paths.inc
+++ b/meta-ti-extras/recipes-ti/includes/ti-paths.inc
@@ -4,7 +4,6 @@ export TOOLCHAIN_PATH ?=3D "${STAGING_DIR_NATIVE}${prefix=
_native}/bin/${TARGET_SYS
=20
 # This is where do_install will put it
 export CODEC_INSTALL_DIR_RECIPE        =3D "${installdir}/ti-codecs-tree=
"
-export CODEGEN_ARM_INSTALL_DIR_RECIPE  =3D "${installdir}/ti-cgt470-tree=
"
 export CG_XML_INSTALL_DIR_RECIPE       =3D "${installdir}/ti-cg-xml-tree=
"
 export DSPLIB_C66_INSTALL_DIR_RECIPE   =3D "${installdir}/ti-dsplib-c66x=
-tree"
 export DSPLIB_C674_INSTALL_DIR_RECIPE  =3D "${installdir}/ti-dsplib-c674=
x-tree"
@@ -30,7 +29,6 @@ export XDAIS_INSTALL_DIR_RECIPE        =3D "${installdi=
r}/ti-xdais-tree"
 export XDC_INSTALL_DIR_RECIPE          =3D "${installdir}/ti-xdctools-tr=
ee"
=20
 # This is where the tools will end up in sysroot
-export CODEGEN_ARM_INSTALL_DIR  =3D "${STAGING_DIR_TARGET}${CODEGEN_ARM_=
INSTALL_DIR_RECIPE}"
 export CG_XML_INSTALL_DIR       =3D "${STAGING_DIR_NATIVE}${CG_XML_INSTA=
LL_DIR_RECIPE}"
 export DSPLIB_C66_INSTALL_DIR   =3D "${STAGING_DIR_TARGET}${DSPLIB_C66_I=
NSTALL_DIR_RECIPE}"
 export DSPLIB_C674_INSTALL_DIR  =3D "${STAGING_DIR_TARGET}${DSPLIB_C674_=
INSTALL_DIR_RECIPE}"
--=20
2.35.3


